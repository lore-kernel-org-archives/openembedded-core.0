Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12054C41535
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:05 +0000 (UTC)
Received: from 10.mo583.mail-out.ovh.net (10.mo583.mail-out.ovh.net [46.105.52.148])
 by mx.groups.io with SMTP id smtpd.web11.9571.1698792483284496400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.52.148, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.20.107])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 806C9286F7
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:01 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E0EB81FDBB;
	Tue, 31 Oct 2023 22:48:00 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id SPGDMyCEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:00 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S00234413e1c-b314-4cd8-b65e-721835ba11ca,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [OE-core][RFC v2 01/12] create-spdx-3.0: copy 2.2 class
Date: Tue, 31 Oct 2023 23:47:22 +0100
Message-ID: <20231031224733.367227-2-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9520891091249847631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeiheekleduhefhjedvffehteetfeehhfelteelhffhueejleejtdfhkeefhedtffenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhsphgugidrohhrghdpphgrtghkrghgvggurghtrgdrrhgvrggupdguohgtrdhnrghmvgdpshgsohhmrdhrvggrugdpiihsthgurdhophgvnhenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsth
 epmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189877

Initialize the work on SPDX 3 with a copy of the SPDX 2.2. Change default=
 to
SPDX 3.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/classes/create-spdx-3.0.bbclass | 1158 ++++++++++++++++++++++++++
 1 file changed, 1158 insertions(+)
 create mode 100644 meta/classes/create-spdx-3.0.bbclass

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
new file mode 100644
index 0000000000..b0aef80db1
--- /dev/null
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -0,0 +1,1158 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
+
+# The product name that the CVE database uses.  Defaults to BPN, but may=
 need to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
+CVE_PRODUCT ??=3D "${BPN}"
+CVE_VERSION ??=3D "${PV}"
+
+SPDXDIR ??=3D "${WORKDIR}/spdx"
+SPDXDEPLOY =3D "${SPDXDIR}/deploy"
+SPDXWORK =3D "${SPDXDIR}/work"
+SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
+SPDXSDKWORK =3D "${SPDXDIR}/sdk-work"
+SPDXDEPS =3D "${SPDXDIR}/deps.json"
+
+SPDX_TOOL_NAME ??=3D "oe-spdx-creator"
+SPDX_TOOL_VERSION ??=3D "1.0"
+
+SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
+
+SPDX_INCLUDE_SOURCES ??=3D "0"
+SPDX_ARCHIVE_SOURCES ??=3D "0"
+SPDX_ARCHIVE_PACKAGED ??=3D "0"
+
+SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
+SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdoc"
+SPDX_PRETTY ??=3D "0"
+
+SPDX_LICENSES ??=3D "${COREBASE}/meta/files/spdx-licenses.json"
+
+SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
+
+SPDX_ORG ??=3D "OpenEmbedded ()"
+SPDX_SUPPLIER ??=3D "Organization: ${SPDX_ORG}"
+SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field for SPDX packages=
 created from \
+    this recipe. For SPDX documents create using this class during the b=
uild, this \
+    is the contact information for the person or organization who is doi=
ng the \
+    build."
+
+def extract_licenses(filename):
+    import re
+
+    lic_regex =3D re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d.(=
)+-]+?)(?:\s+\W*)?$', re.MULTILINE)
+
+    try:
+        with open(filename, 'rb') as f:
+            size =3D min(15000, os.stat(filename).st_size)
+            txt =3D f.read(size)
+            licenses =3D re.findall(lic_regex, txt)
+            if licenses:
+                ascii_licenses =3D [lic.decode('ascii') for lic in licen=
ses]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return None
+
+def get_doc_namespace(d, doc):
+    import uuid
+    namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUI=
D_NAMESPACE"))
+    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, st=
r(uuid.uuid5(namespace_uuid, doc.name)))
+
+def create_annotation(d, comment):
+    from datetime import datetime, timezone
+
+    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
+    annotation =3D oe.spdx.SPDXAnnotation()
+    annotation.annotationDate =3D creation_time
+    annotation.annotationType =3D "OTHER"
+    annotation.annotator =3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME=
"), d.getVar("SPDX_TOOL_VERSION"))
+    annotation.comment =3D comment
+    return annotation
+
+def recipe_spdx_is_native(d, recipe):
+    return any(a.annotationType =3D=3D "OTHER" and
+      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), =
d.getVar("SPDX_TOOL_VERSION")) and
+      a.comment =3D=3D "isNative" for a in recipe.annotations)
+
+def is_work_shared_spdx(d):
+    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.ge=
tVar('WORKDIR'))
+
+def get_json_indent(d):
+    if d.getVar("SPDX_PRETTY") =3D=3D "1":
+        return 2
+    return None
+
+python() {
+    import json
+    if d.getVar("SPDX_LICENSE_DATA"):
+        return
+
+    with open(d.getVar("SPDX_LICENSES"), "r") as f:
+        data =3D json.load(f)
+        # Transform the license array to a dictionary
+        data["licenses"] =3D {l["licenseId"]: l for l in data["licenses"=
]}
+        d.setVar("SPDX_LICENSE_DATA", data)
+}
+
+def convert_license_to_spdx(lic, document, d, existing=3D{}):
+    from pathlib import Path
+    import oe.spdx
+
+    license_data =3D d.getVar("SPDX_LICENSE_DATA")
+    extracted =3D {}
+
+    def add_extracted_license(ident, name):
+        nonlocal document
+
+        if name in extracted:
+            return
+
+        extracted_info =3D oe.spdx.SPDXExtractedLicensingInfo()
+        extracted_info.name =3D name
+        extracted_info.licenseId =3D ident
+        extracted_info.extractedText =3D None
+
+        if name =3D=3D "PD":
+            # Special-case this.
+            extracted_info.extractedText =3D "Software released to the p=
ublic domain"
+        else:
+            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PA=
TH
+            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVa=
r('LICENSE_PATH') or '').split():
+                try:
+                    with (Path(directory) / name).open(errors=3D"replace=
") as f:
+                        extracted_info.extractedText =3D f.read()
+                        break
+                except FileNotFoundError:
+                    pass
+            if extracted_info.extractedText is None:
+                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must b=
e set
+                filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
+                if filename:
+                    filename =3D d.expand("${S}/" + filename)
+                    with open(filename, errors=3D"replace") as f:
+                        extracted_info.extractedText =3D f.read()
+                else:
+                    bb.fatal("Cannot find any text for license %s" % nam=
e)
+
+        extracted[name] =3D extracted_info
+        document.hasExtractedLicensingInfos.append(extracted_info)
+
+    def convert(l):
+        if l =3D=3D "(" or l =3D=3D ")":
+            return l
+
+        if l =3D=3D "&":
+            return "AND"
+
+        if l =3D=3D "|":
+            return "OR"
+
+        if l =3D=3D "CLOSED":
+            return "NONE"
+
+        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
+        if spdx_license in license_data["licenses"]:
+            return spdx_license
+
+        try:
+            spdx_license =3D existing[l]
+        except KeyError:
+            spdx_license =3D "LicenseRef-" + l
+            add_extracted_license(spdx_license, l)
+
+        return spdx_license
+
+    lic_split =3D lic.replace("(", " ( ").replace(")", " ) ").replace("|=
", " | ").replace("&", " & ").split()
+
+    return ' '.join(convert(l) for l in lic_split)
+
+def process_sources(d):
+    pn =3D d.getVar('PN')
+    assume_provided =3D (d.getVar("ASSUME_PROVIDED") or "").split()
+    if pn in assume_provided:
+        for p in d.getVar("PROVIDES").split():
+            if p !=3D pn:
+                pn =3D p
+                break
+
+    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been del=
eted,
+    # so avoid archiving source here.
+    if pn.startswith('glibc-locale'):
+        return False
+    if d.getVar('PN') =3D=3D "libtool-cross":
+        return False
+    if d.getVar('PN') =3D=3D "libgcc-initial":
+        return False
+    if d.getVar('PN') =3D=3D "shadow-sysroot":
+        return False
+
+    # We just archive gcc-source for all the gcc related recipes
+    if d.getVar('BPN') in ['gcc', 'libgcc']:
+        bb.debug(1, 'spdx: There is bug in scan of %s is, do nothing' % =
pn)
+        return False
+
+    return True
+
+
+def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *=
, archive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):
+    from pathlib import Path
+    import oe.spdx
+    import hashlib
+
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
+    if source_date_epoch:
+        source_date_epoch =3D int(source_date_epoch)
+
+    sha1s =3D []
+    spdx_files =3D []
+
+    file_counter =3D 1
+    for subdir, dirs, files in os.walk(topdir):
+        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
+        if subdir =3D=3D str(topdir):
+            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_di=
rs]
+
+        for file in files:
+            filepath =3D Path(subdir) / file
+            filename =3D str(filepath.relative_to(topdir))
+
+            if not filepath.is_symlink() and filepath.is_file():
+                spdx_file =3D oe.spdx.SPDXFile()
+                spdx_file.SPDXID =3D get_spdxid(file_counter)
+                for t in get_types(filepath):
+                    spdx_file.fileTypes.append(t)
+                spdx_file.fileName =3D filename
+
+                if archive is not None:
+                    with filepath.open("rb") as f:
+                        info =3D archive.gettarinfo(fileobj=3Df)
+                        info.name =3D filename
+                        info.uid =3D 0
+                        info.gid =3D 0
+                        info.uname =3D "root"
+                        info.gname =3D "root"
+
+                        if source_date_epoch is not None and info.mtime =
> source_date_epoch:
+                            info.mtime =3D source_date_epoch
+
+                        archive.addfile(info, f)
+
+                sha1 =3D bb.utils.sha1_file(filepath)
+                sha1s.append(sha1)
+                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm=3D"SHA1",
+                        checksumValue=3Dsha1,
+                    ))
+                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
+                        algorithm=3D"SHA256",
+                        checksumValue=3Dbb.utils.sha256_file(filepath),
+                    ))
+
+                if "SOURCE" in spdx_file.fileTypes:
+                    extracted_lics =3D extract_licenses(filepath)
+                    if extracted_lics:
+                        spdx_file.licenseInfoInFiles =3D extracted_lics
+
+                doc.files.append(spdx_file)
+                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
+                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
+
+                spdx_files.append(spdx_file)
+
+                file_counter +=3D 1
+
+    sha1s.sort()
+    verifier =3D hashlib.sha1()
+    for v in sha1s:
+        verifier.update(v.encode("utf-8"))
+    spdx_pkg.packageVerificationCode.packageVerificationCodeValue =3D ve=
rifier.hexdigest()
+
+    return spdx_files
+
+
+def add_package_sources_from_debug(d, package_doc, spdx_package, package=
, package_files, sources):
+    from pathlib import Path
+    import hashlib
+    import oe.packagedata
+    import oe.spdx
+
+    debug_search_paths =3D [
+        Path(d.getVar('PKGD')),
+        Path(d.getVar('STAGING_DIR_TARGET')),
+        Path(d.getVar('STAGING_DIR_NATIVE')),
+        Path(d.getVar('STAGING_KERNEL_DIR')),
+    ]
+
+    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
+
+    if pkg_data is None:
+        return
+
+    for file_path, file_data in pkg_data["files_info"].items():
+        if not "debugsrc" in file_data:
+            continue
+
+        for pkg_file in package_files:
+            if file_path.lstrip("/") =3D=3D pkg_file.fileName.lstrip("/"=
):
+                break
+        else:
+            bb.fatal("No package file found for %s in %s; SPDX found: %s=
" % (str(file_path), package,
+                " ".join(p.fileName for p in package_files)))
+            continue
+
+        for debugsrc in file_data["debugsrc"]:
+            ref_id =3D "NOASSERTION"
+            for search in debug_search_paths:
+                if debugsrc.startswith("/usr/src/kernel"):
+                    debugsrc_path =3D search / debugsrc.replace('/usr/sr=
c/kernel/', '')
+                else:
+                    debugsrc_path =3D search / debugsrc.lstrip("/")
+                if not debugsrc_path.exists():
+                    continue
+
+                file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
+
+                if file_sha256 in sources:
+                    source_file =3D sources[file_sha256]
+
+                    doc_ref =3D package_doc.find_external_document_ref(s=
ource_file.doc.documentNamespace)
+                    if doc_ref is None:
+                        doc_ref =3D oe.spdx.SPDXExternalDocumentRef()
+                        doc_ref.externalDocumentId =3D "DocumentRef-depe=
ndency-" + source_file.doc.name
+                        doc_ref.spdxDocument =3D source_file.doc.documen=
tNamespace
+                        doc_ref.checksum.algorithm =3D "SHA1"
+                        doc_ref.checksum.checksumValue =3D source_file.d=
oc_sha1
+                        package_doc.externalDocumentRefs.append(doc_ref)
+
+                    ref_id =3D "%s:%s" % (doc_ref.externalDocumentId, so=
urce_file.file.SPDXID)
+                else:
+                    bb.debug(1, "Debug source %s with SHA256 %s not foun=
d in any dependency" % (str(debugsrc_path), file_sha256))
+                break
+            else:
+                bb.debug(1, "Debug source %s not found" % debugsrc)
+
+            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref=
_id, comment=3Ddebugsrc)
+
+add_package_sources_from_debug[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
+
+def collect_dep_recipes(d, doc, spdx_recipe):
+    import json
+    from pathlib import Path
+    import oe.sbom
+    import oe.spdx
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
+    package_archs =3D d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
+
+    dep_recipes =3D []
+
+    with spdx_deps_file.open("r") as f:
+        deps =3D json.load(f)
+
+    for dep_pn, dep_hashfn in deps:
+        dep_recipe_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, =
package_archs, "recipe-" + dep_pn, dep_hashfn)
+        if not dep_recipe_path:
+            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (de=
p_pn, dep_hashfn))
+
+        spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_recipe_path=
)
+
+        for pkg in spdx_dep_doc.packages:
+            if pkg.name =3D=3D dep_pn:
+                spdx_dep_recipe =3D pkg
+                break
+        else:
+            continue
+
+        dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1=
, spdx_dep_recipe))
+
+        dep_recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
+        dep_recipe_ref.externalDocumentId =3D "DocumentRef-dependency-" =
+ spdx_dep_doc.name
+        dep_recipe_ref.spdxDocument =3D spdx_dep_doc.documentNamespace
+        dep_recipe_ref.checksum.algorithm =3D "SHA1"
+        dep_recipe_ref.checksum.checksumValue =3D spdx_dep_sha1
+
+        doc.externalDocumentRefs.append(dep_recipe_ref)
+
+        doc.add_relationship(
+            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_recip=
e.SPDXID),
+            "BUILD_DEPENDENCY_OF",
+            spdx_recipe
+        )
+
+    return dep_recipes
+
+collect_dep_recipes[vardepsexclude] =3D "SSTATE_ARCHS"
+
+def collect_dep_sources(d, dep_recipes):
+    import oe.sbom
+
+    sources =3D {}
+    for dep in dep_recipes:
+        # Don't collect sources from native recipes as they
+        # match non-native sources also.
+        if recipe_spdx_is_native(d, dep.recipe):
+            continue
+        recipe_files =3D set(dep.recipe.hasFiles)
+
+        for spdx_file in dep.doc.files:
+            if spdx_file.SPDXID not in recipe_files:
+                continue
+
+            if "SOURCE" in spdx_file.fileTypes:
+                for checksum in spdx_file.checksums:
+                    if checksum.algorithm =3D=3D "SHA256":
+                        sources[checksum.checksumValue] =3D oe.sbom.DepS=
ource(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
+                        break
+
+    return sources
+
+def add_download_packages(d, doc, recipe):
+    import os.path
+    from bb.fetch2 import decodeurl, CHECKSUM_LIST
+    import bb.process
+    import oe.spdx
+    import oe.sbom
+
+    for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
+        f =3D bb.fetch2.FetchData(src_uri, d)
+
+        for name in f.names:
+            package =3D oe.spdx.SPDXPackage()
+            package.name =3D "%s-source-%d" % (d.getVar("PN"), download_=
idx + 1)
+            package.SPDXID =3D oe.sbom.get_download_spdxid(d, download_i=
dx + 1)
+
+            if f.type =3D=3D "file":
+                continue
+
+            uri =3D f.type
+            proto =3D getattr(f, "proto", None)
+            if proto is not None:
+                uri =3D uri + "+" + proto
+            uri =3D uri + "://" + f.host + f.path
+
+            if f.method.supports_srcrev():
+                uri =3D uri + "@" + f.revisions[name]
+
+            if f.method.supports_checksum(f):
+                for checksum_id in CHECKSUM_LIST:
+                    if checksum_id.upper() not in oe.spdx.SPDXPackage.AL=
LOWED_CHECKSUMS:
+                        continue
+
+                    expected_checksum =3D getattr(f, "%s_expected" % che=
cksum_id)
+                    if expected_checksum is None:
+                        continue
+
+                    c =3D oe.spdx.SPDXChecksum()
+                    c.algorithm =3D checksum_id.upper()
+                    c.checksumValue =3D expected_checksum
+                    package.checksums.append(c)
+
+            package.downloadLocation =3D uri
+            doc.packages.append(package)
+            doc.add_relationship(doc, "DESCRIBES", package)
+            # In the future, we might be able to do more fancy dependenc=
ies,
+            # but this should be sufficient for now
+            doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
+
+def collect_direct_deps(d, dep_task):
+    current_task =3D "do_" + d.getVar("BB_CURRENTTASK")
+    pn =3D d.getVar("PN")
+
+    taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
+
+    for this_dep in taskdepdata.values():
+        if this_dep[0] =3D=3D pn and this_dep[1] =3D=3D current_task:
+            break
+    else:
+        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdat=
a")
+
+    deps =3D set()
+    for dep_name in this_dep[3]:
+        dep_data =3D taskdepdata[dep_name]
+        if dep_data[1] =3D=3D dep_task and dep_data[0] !=3D pn:
+            deps.add((dep_data[0], dep_data[7]))
+
+    return sorted(deps)
+
+collect_direct_deps[vardepsexclude] +=3D "BB_TASKDEPDATA"
+collect_direct_deps[vardeps] +=3D "DEPENDS"
+
+python do_collect_spdx_deps() {
+    # This task calculates the build time dependencies of the recipe, an=
d is
+    # required because while a task can deptask on itself, those depende=
ncies
+    # do not show up in BB_TASKDEPDATA. To work around that, this task d=
oes the
+    # deptask on do_create_spdx and writes out the dependencies it finds=
, then
+    # do_create_spdx reads in the found dependencies when writing the ac=
tual
+    # SPDX document
+    import json
+    from pathlib import Path
+
+    spdx_deps_file =3D Path(d.getVar("SPDXDEPS"))
+
+    deps =3D collect_direct_deps(d, "do_create_spdx")
+
+    with spdx_deps_file.open("w") as f:
+        json.dump(deps, f)
+}
+# NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
+addtask do_collect_spdx_deps after do_unpack
+do_collect_spdx_deps[depends] +=3D "${PATCHDEPENDENCY}"
+do_collect_spdx_deps[deptask] =3D "do_create_spdx"
+do_collect_spdx_deps[dirs] =3D "${SPDXDIR}"
+
+python do_create_spdx() {
+    from datetime import datetime, timezone
+    import oe.sbom
+    import oe.spdx
+    import uuid
+    from pathlib import Path
+    from contextlib import contextmanager
+    import oe.cve_check
+
+    @contextmanager
+    def optional_tarfile(name, guard, mode=3D"w"):
+        import tarfile
+        import bb.compress.zstd
+
+        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+
+        if guard:
+            name.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
+            with bb.compress.zstd.open(name, mode=3Dmode + "b", num_thre=
ads=3Dnum_threads) as f:
+                with tarfile.open(fileobj=3Df, mode=3Dmode + "|") as tf:
+                    yield tf
+        else:
+            yield None
+
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
+    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
+    archive_sources =3D d.getVar("SPDX_ARCHIVE_SOURCES") =3D=3D "1"
+    archive_packaged =3D d.getVar("SPDX_ARCHIVE_PACKAGED") =3D=3D "1"
+    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+
+    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
+
+    doc =3D oe.spdx.SPDXDocument()
+
+    doc.name =3D "recipe-" + d.getVar("PN")
+    doc.documentNamespace =3D get_doc_namespace(d, doc)
+    doc.creationInfo.created =3D creation_time
+    doc.creationInfo.comment =3D "This document was created by analyzing=
 recipe files during the build."
+    doc.creationInfo.licenseListVersion =3D d.getVar("SPDX_LICENSE_DATA"=
)["licenseListVersion"]
+    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
+    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
+    doc.creationInfo.creators.append("Person: N/A ()")
+
+    recipe =3D oe.spdx.SPDXPackage()
+    recipe.name =3D d.getVar("PN")
+    recipe.versionInfo =3D d.getVar("PV")
+    recipe.SPDXID =3D oe.sbom.get_recipe_spdxid(d)
+    recipe.supplier =3D d.getVar("SPDX_SUPPLIER")
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cr=
oss", d):
+        recipe.annotations.append(create_annotation(d, "isNative"))
+
+    homepage =3D d.getVar("HOMEPAGE")
+    if homepage:
+        recipe.homepage =3D homepage
+
+    license =3D d.getVar("LICENSE")
+    if license:
+        recipe.licenseDeclared =3D convert_license_to_spdx(license, doc,=
 d)
+
+    summary =3D d.getVar("SUMMARY")
+    if summary:
+        recipe.summary =3D summary
+
+    description =3D d.getVar("DESCRIPTION")
+    if description:
+        recipe.description =3D description
+
+    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
+        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
+            recipe.annotations.append(create_annotation(d, var + "=3D" +=
 d.getVar(var)))
+
+    # Some CVEs may be patched during the build process without incremen=
ting the version number,
+    # so querying for CVEs based on the CPE id can lead to false positiv=
es. To account for this,
+    # save the CVEs fixed by patches to source information field in the =
SPDX.
+    patched_cves =3D oe.cve_check.get_patched_cves(d)
+    patched_cves =3D list(patched_cves)
+    patched_cves =3D ' '.join(patched_cves)
+    if patched_cves:
+        recipe.sourceInfo =3D "CVEs fixed: " + patched_cves
+
+    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getV=
ar("CVE_VERSION"))
+    if cpe_ids:
+        for cpe_id in cpe_ids:
+            cpe =3D oe.spdx.SPDXExternalReference()
+            cpe.referenceCategory =3D "SECURITY"
+            cpe.referenceType =3D "http://spdx.org/rdf/references/cpe23T=
ype"
+            cpe.referenceLocator =3D cpe_id
+            recipe.externalRefs.append(cpe)
+
+    doc.packages.append(recipe)
+    doc.add_relationship(doc, "DESCRIBES", recipe)
+
+    add_download_packages(d, doc, recipe)
+
+    if process_sources(d) and include_sources:
+        recipe_archive =3D deploy_dir_spdx / "recipes" / (doc.name + ".t=
ar.zst")
+        with optional_tarfile(recipe_archive, archive_sources) as archiv=
e:
+            spdx_get_src(d)
+
+            add_package_files(
+                d,
+                doc,
+                recipe,
+                spdx_workdir,
+                lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.get=
Var("PN"), file_counter),
+                lambda filepath: ["SOURCE"],
+                ignore_dirs=3D[".git"],
+                ignore_top_level_dirs=3D["temp"],
+                archive=3Darchive,
+            )
+
+            if archive is not None:
+                recipe.packageFileName =3D str(recipe_archive.name)
+
+    dep_recipes =3D collect_dep_recipes(d, doc, recipe)
+
+    doc_sha1 =3D oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=3D=
get_json_indent(d))
+    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
+
+    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
+    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.nam=
e
+    recipe_ref.spdxDocument =3D doc.documentNamespace
+    recipe_ref.checksum.algorithm =3D "SHA1"
+    recipe_ref.checksum.checksumValue =3D doc_sha1
+
+    sources =3D collect_dep_sources(d, dep_recipes)
+    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":"=
 + license.licenseId for license in doc.hasExtractedLicensingInfos}
+
+    if not recipe_spdx_is_native(d, recipe):
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        pkgdest =3D Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            if not oe.packagedata.packaged(package, d):
+                continue
+
+            package_doc =3D oe.spdx.SPDXDocument()
+            pkg_name =3D d.getVar("PKG:%s" % package) or package
+            package_doc.name =3D pkg_name
+            package_doc.documentNamespace =3D get_doc_namespace(d, packa=
ge_doc)
+            package_doc.creationInfo.created =3D creation_time
+            package_doc.creationInfo.comment =3D "This document was crea=
ted by analyzing packages created during the build."
+            package_doc.creationInfo.licenseListVersion =3D d.getVar("SP=
DX_LICENSE_DATA")["licenseListVersion"]
+            package_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
+            package_doc.creationInfo.creators.append("Organization: %s" =
% d.getVar("SPDX_ORG"))
+            package_doc.creationInfo.creators.append("Person: N/A ()")
+            package_doc.externalDocumentRefs.append(recipe_ref)
+
+            package_license =3D d.getVar("LICENSE:%s" % package) or d.ge=
tVar("LICENSE")
+
+            spdx_package =3D oe.spdx.SPDXPackage()
+
+            spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)
+            spdx_package.name =3D pkg_name
+            spdx_package.versionInfo =3D d.getVar("PV")
+            spdx_package.licenseDeclared =3D convert_license_to_spdx(pac=
kage_license, package_doc, d, found_licenses)
+            spdx_package.supplier =3D d.getVar("SPDX_SUPPLIER")
+
+            package_doc.packages.append(spdx_package)
+
+            package_doc.add_relationship(spdx_package, "GENERATED_FROM",=
 "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
+            package_doc.add_relationship(package_doc, "DESCRIBES", spdx_=
package)
+
+            package_archive =3D deploy_dir_spdx / "packages" / (package_=
doc.name + ".tar.zst")
+            with optional_tarfile(package_archive, archive_packaged) as =
archive:
+                package_files =3D add_package_files(
+                    d,
+                    package_doc,
+                    spdx_package,
+                    pkgdest / package,
+                    lambda file_counter: oe.sbom.get_packaged_file_spdxi=
d(pkg_name, file_counter),
+                    lambda filepath: ["BINARY"],
+                    ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
+                    archive=3Darchive,
+                )
+
+                if archive is not None:
+                    spdx_package.packageFileName =3D str(package_archive=
.name)
+
+            add_package_sources_from_debug(d, package_doc, spdx_package,=
 package, package_files, sources)
+
+            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", inde=
nt=3Dget_json_indent(d))
+}
+do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
+# NOTE: depending on do_unpack is a hack that is necessary to get it's d=
ependencies for archive the source
+addtask do_create_spdx after do_package do_packagedata do_unpack do_coll=
ect_spdx_deps before do_populate_sdk do_build do_rm_work
+
+SSTATETASKS +=3D "do_create_spdx"
+do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
+do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
+
+python do_create_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_spdx_setscene
+
+do_create_spdx[dirs] =3D "${SPDXWORK}"
+do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
+do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
+
+def collect_package_providers(d):
+    from pathlib import Path
+    import oe.sbom
+    import oe.spdx
+    import json
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+
+    providers =3D {}
+
+    deps =3D collect_direct_deps(d, "do_create_spdx")
+    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
+
+    for dep_pn, dep_hashfn in deps:
+        localdata =3D d
+        recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, localdata)
+        if not recipe_data:
+            localdata =3D bb.data.createCopy(d)
+            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
+            recipe_data =3D oe.packagedata.read_pkgdata(dep_pn, localdat=
a)
+
+        for pkg in recipe_data.get("PACKAGES", "").split():
+
+            pkg_data =3D oe.packagedata.read_subpkgdata_dict(pkg, locald=
ata)
+            rprovides =3D set(n for n, _ in bb.utils.explode_dep_version=
s2(pkg_data.get("RPROVIDES", "")).items())
+            rprovides.add(pkg)
+
+            if "PKG" in pkg_data:
+                pkg =3D pkg_data["PKG"]
+                rprovides.add(pkg)
+
+            for r in rprovides:
+                providers[r] =3D (pkg, dep_hashfn)
+
+    return providers
+
+collect_package_providers[vardepsexclude] +=3D "BB_TASKDEPDATA"
+
+python do_create_runtime_spdx() {
+    from datetime import datetime, timezone
+    import oe.sbom
+    import oe.spdx
+    import oe.packagedata
+    from pathlib import Path
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_deploy =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherit=
s_class("cross", d)
+
+    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
+
+    providers =3D collect_package_providers(d)
+    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+    package_archs =3D d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
+
+    if not is_native:
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        dep_package_cache =3D {}
+
+        pkgdest =3D Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            localdata =3D bb.data.createCopy(d)
+            pkg_name =3D d.getVar("PKG:%s" % package) or package
+            localdata.setVar("PKG", pkg_name)
+            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) +=
 ":" + package)
+
+            if not oe.packagedata.packaged(package, localdata):
+                continue
+
+            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name=
, pkg_arch, "packages")
+
+            package_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_=
path)
+
+            for p in package_doc.packages:
+                if p.name =3D=3D pkg_name:
+                    spdx_package =3D p
+                    break
+            else:
+                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg=
_spdx_path))
+
+            runtime_doc =3D oe.spdx.SPDXDocument()
+            runtime_doc.name =3D "runtime-" + pkg_name
+            runtime_doc.documentNamespace =3D get_doc_namespace(localdat=
a, runtime_doc)
+            runtime_doc.creationInfo.created =3D creation_time
+            runtime_doc.creationInfo.comment =3D "This document was crea=
ted by analyzing package runtime dependencies."
+            runtime_doc.creationInfo.licenseListVersion =3D d.getVar("SP=
DX_LICENSE_DATA")["licenseListVersion"]
+            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded=
 Core create-spdx.bbclass")
+            runtime_doc.creationInfo.creators.append("Organization: %s" =
% d.getVar("SPDX_ORG"))
+            runtime_doc.creationInfo.creators.append("Person: N/A ()")
+
+            package_ref =3D oe.spdx.SPDXExternalDocumentRef()
+            package_ref.externalDocumentId =3D "DocumentRef-package-" + =
package
+            package_ref.spdxDocument =3D package_doc.documentNamespace
+            package_ref.checksum.algorithm =3D "SHA1"
+            package_ref.checksum.checksumValue =3D package_doc_sha1
+
+            runtime_doc.externalDocumentRefs.append(package_ref)
+
+            runtime_doc.add_relationship(
+                runtime_doc.SPDXID,
+                "AMENDS",
+                "%s:%s" % (package_ref.externalDocumentId, package_doc.S=
PDXID)
+            )
+
+            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RD=
EPENDS") or "")
+            seen_deps =3D set()
+            for dep, _ in deps.items():
+                if dep in seen_deps:
+                    continue
+
+                if dep not in providers:
+                    continue
+
+                (dep, dep_hashfn) =3D providers[dep]
+
+                if not oe.packagedata.packaged(dep, localdata):
+                    continue
+
+                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep=
, d)
+                dep_pkg =3D dep_pkg_data["PKG"]
+
+                if dep in dep_package_cache:
+                    (dep_spdx_package, dep_package_ref) =3D dep_package_=
cache[dep]
+                else:
+                    dep_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_s=
pdx, package_archs, dep_pkg, dep_hashfn)
+                    if not dep_path:
+                        bb.fatal("No SPDX file found for package %s, %s"=
 % (dep_pkg, dep_hashfn))
+
+                    spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep=
_path)
+
+                    for pkg in spdx_dep_doc.packages:
+                        if pkg.name =3D=3D dep_pkg:
+                            dep_spdx_package =3D pkg
+                            break
+                    else:
+                        bb.fatal("Package '%s' not found in %s" % (dep_p=
kg, dep_path))
+
+                    dep_package_ref =3D oe.spdx.SPDXExternalDocumentRef(=
)
+                    dep_package_ref.externalDocumentId =3D "DocumentRef-=
runtime-dependency-" + spdx_dep_doc.name
+                    dep_package_ref.spdxDocument =3D spdx_dep_doc.docume=
ntNamespace
+                    dep_package_ref.checksum.algorithm =3D "SHA1"
+                    dep_package_ref.checksum.checksumValue =3D spdx_dep_=
sha1
+
+                    dep_package_cache[dep] =3D (dep_spdx_package, dep_pa=
ckage_ref)
+
+                runtime_doc.externalDocumentRefs.append(dep_package_ref)
+
+                runtime_doc.add_relationship(
+                    "%s:%s" % (dep_package_ref.externalDocumentId, dep_s=
pdx_package.SPDXID),
+                    "RUNTIME_DEPENDENCY_OF",
+                    "%s:%s" % (package_ref.externalDocumentId, spdx_pack=
age.SPDXID)
+                )
+                seen_deps.add(dep)
+
+            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_=
deploy, indent=3Dget_json_indent(d))
+}
+
+do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES SSTATE_ARCHS"
+
+addtask do_create_runtime_spdx after do_create_spdx before do_build do_r=
m_work
+SSTATETASKS +=3D "do_create_runtime_spdx"
+do_create_runtime_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
+
+python do_create_runtime_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_runtime_spdx_setscene
+
+do_create_runtime_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
+do_create_runtime_spdx[rdeptask] =3D "do_create_spdx"
+
+def spdx_get_src(d):
+    """
+    save patched source of the recipe in SPDX_WORKDIR.
+    """
+    import shutil
+    spdx_workdir =3D d.getVar('SPDXWORK')
+    spdx_sysroot_native =3D d.getVar('STAGING_DIR_NATIVE')
+    pn =3D d.getVar('PN')
+
+    workdir =3D d.getVar("WORKDIR")
+
+    try:
+        # The kernel class functions require it to be on work-shared, so=
 we dont change WORKDIR
+        if not is_work_shared_spdx(d):
+            # Change the WORKDIR to make do_unpack do_patch run in anoth=
er dir.
+            d.setVar('WORKDIR', spdx_workdir)
+            # Restore the original path to recipe's native sysroot (it's=
 relative to WORKDIR).
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+
+            # The changed 'WORKDIR' also caused 'B' changed, create dir =
'B' for the
+            # possibly requiring of the following tasks (such as some re=
cipes's
+            # do_patch required 'B' existed).
+            bb.utils.mkdirhier(d.getVar('B'))
+
+            bb.build.exec_func('do_unpack', d)
+        # Copy source of kernel to spdx_workdir
+        if is_work_shared_spdx(d):
+            share_src =3D d.getVar('WORKDIR')
+            d.setVar('WORKDIR', spdx_workdir)
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+            src_dir =3D spdx_workdir + "/" + d.getVar('PN')+ "-" + d.get=
Var('PV') + "-" + d.getVar('PR')
+            bb.utils.mkdirhier(src_dir)
+            if bb.data.inherits_class('kernel',d):
+                share_src =3D d.getVar('STAGING_KERNEL_DIR')
+            cmd_copy_share =3D "cp -rf " + share_src + "/* " + src_dir +=
 "/"
+            cmd_copy_shared_res =3D os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result =3D " + cmd_copy_shared_res)
+
+            git_path =3D src_dir + "/.git"
+            if os.path.exists(git_path):
+                shutils.rmtree(git_path)
+
+        # Make sure gcc and kernel sources are patched only once
+        if not (d.getVar('SRC_URI') =3D=3D "" or is_work_shared_spdx(d))=
:
+            bb.build.exec_func('do_patch', d)
+
+        # Some userland has no source.
+        if not os.path.exists( spdx_workdir ):
+            bb.utils.mkdirhier(spdx_workdir)
+    finally:
+        d.setVar("WORKDIR", workdir)
+
+spdx_get_src[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
+
+do_rootfs[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx"
+do_rootfs[cleandirs] +=3D "${SPDXIMAGEWORK}"
+
+ROOTFS_POSTUNINSTALL_COMMAND =3D+ "image_combine_spdx"
+
+do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx=
"
+do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host_c=
ombine_spdx"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_targ=
et_combine_spdx"
+
+python image_combine_spdx() {
+    import os
+    import oe.sbom
+    from pathlib import Path
+    from oe.rootfs import image_list_installed_packages
+
+    image_name =3D d.getVar("IMAGE_NAME")
+    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
+    imgdeploydir =3D Path(d.getVar("IMGDEPLOYDIR"))
+    img_spdxid =3D oe.sbom.get_image_spdxid(image_name)
+    packages =3D image_list_installed_packages(d)
+
+    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path=
(d.getVar("SPDXIMAGEWORK")))
+
+    def make_image_link(target_path, suffix):
+        if image_link_name:
+            link =3D imgdeploydir / (image_link_name + suffix)
+            if link !=3D target_path:
+                link.symlink_to(os.path.relpath(target_path, link.parent=
))
+
+    spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
+    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+}
+
+python sdk_host_combine_spdx() {
+    sdk_combine_spdx(d, "host")
+}
+
+python sdk_target_combine_spdx() {
+    sdk_combine_spdx(d, "target")
+}
+
+def sdk_combine_spdx(d, sdk_type):
+    import oe.sbom
+    from pathlib import Path
+    from oe.sdk import sdk_list_installed_packages
+
+    sdk_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
+    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
+    sdk_spdxid =3D oe.sbom.get_sdk_spdxid(sdk_name)
+    sdk_packages =3D sdk_list_installed_packages(d, sdk_type =3D=3D "tar=
get")
+    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, P=
ath(d.getVar('SPDXSDKWORK')))
+
+def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packag=
es, spdx_workdir):
+    import os
+    import oe.spdx
+    import oe.sbom
+    import io
+    import json
+    from datetime import timezone, datetime
+    from pathlib import Path
+    import tarfile
+    import bb.compress.zstd
+
+    providers =3D collect_package_providers(d)
+    package_archs =3D d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
+
+    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%d=
T%H:%M:%SZ")
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
+
+    doc =3D oe.spdx.SPDXDocument()
+    doc.name =3D rootfs_name
+    doc.documentNamespace =3D get_doc_namespace(d, doc)
+    doc.creationInfo.created =3D creation_time
+    doc.creationInfo.comment =3D "This document was created by analyzing=
 the source of the Yocto recipe during the build."
+    doc.creationInfo.licenseListVersion =3D d.getVar("SPDX_LICENSE_DATA"=
)["licenseListVersion"]
+    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
+    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
+    doc.creationInfo.creators.append("Person: N/A ()")
+
+    image =3D oe.spdx.SPDXPackage()
+    image.name =3D d.getVar("PN")
+    image.versionInfo =3D d.getVar("PV")
+    image.SPDXID =3D rootfs_spdxid
+    image.supplier =3D d.getVar("SPDX_SUPPLIER")
+
+    doc.packages.append(image)
+
+    for name in sorted(packages.keys()):
+        if name not in providers:
+            bb.fatal("Unable to find SPDX provider for '%s'" % name)
+
+        pkg_name, pkg_hashfn =3D providers[name]
+
+        pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, pa=
ckage_archs, pkg_name, pkg_hashfn)
+        if not pkg_spdx_path:
+            bb.fatal("No SPDX file found for package %s, %s" % (pkg_name=
, pkg_hashfn))
+
+        pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
+
+        for p in pkg_doc.packages:
+            if p.name =3D=3D name:
+                pkg_ref =3D oe.spdx.SPDXExternalDocumentRef()
+                pkg_ref.externalDocumentId =3D "DocumentRef-%s" % pkg_do=
c.name
+                pkg_ref.spdxDocument =3D pkg_doc.documentNamespace
+                pkg_ref.checksum.algorithm =3D "SHA1"
+                pkg_ref.checksum.checksumValue =3D pkg_doc_sha1
+
+                doc.externalDocumentRefs.append(pkg_ref)
+                doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg_r=
ef.externalDocumentId, p.SPDXID))
+                break
+        else:
+            bb.fatal("Unable to find package with name '%s' in SPDX file=
 %s" % (name, pkg_spdx_path))
+
+        runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx=
, package_archs, "runtime-" + name, pkg_hashfn)
+        if not runtime_spdx_path:
+            bb.fatal("No runtime SPDX document found for %s, %s" % (name=
, pkg_hashfn))
+
+        runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_spdx_=
path)
+
+        runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
+        runtime_ref.externalDocumentId =3D "DocumentRef-%s" % runtime_do=
c.name
+        runtime_ref.spdxDocument =3D runtime_doc.documentNamespace
+        runtime_ref.checksum.algorithm =3D "SHA1"
+        runtime_ref.checksum.checksumValue =3D runtime_doc_sha1
+
+        # "OTHER" isn't ideal here, but I can't find a relationship that=
 makes sense
+        doc.externalDocumentRefs.append(runtime_ref)
+        doc.add_relationship(
+            image,
+            "OTHER",
+            "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXI=
D),
+            comment=3D"Runtime dependencies for %s" % name
+        )
+
+    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
+
+    with image_spdx_path.open("wb") as f:
+        doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_indent(d))
+
+    num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+
+    visited_docs =3D set()
+
+    index =3D {"documents": []}
+
+    spdx_tar_path =3D rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
+    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=3Dnum_thr=
eads) as f:
+        with tarfile.open(fileobj=3Df, mode=3D"w|") as tar:
+            def collect_spdx_document(path):
+                nonlocal tar
+                nonlocal deploy_dir_spdx
+                nonlocal source_date_epoch
+                nonlocal index
+
+                if path in visited_docs:
+                    return
+
+                visited_docs.add(path)
+
+                with path.open("rb") as f:
+                    doc, sha1 =3D oe.sbom.read_doc(f)
+                    f.seek(0)
+
+                    if doc.documentNamespace in visited_docs:
+                        return
+
+                    bb.note("Adding SPDX document %s" % path)
+                    visited_docs.add(doc.documentNamespace)
+                    info =3D tar.gettarinfo(fileobj=3Df)
+
+                    info.name =3D doc.name + ".spdx.json"
+                    info.uid =3D 0
+                    info.gid =3D 0
+                    info.uname =3D "root"
+                    info.gname =3D "root"
+
+                    if source_date_epoch is not None and info.mtime > in=
t(source_date_epoch):
+                        info.mtime =3D int(source_date_epoch)
+
+                    tar.addfile(info, f)
+
+                    index["documents"].append({
+                        "filename": info.name,
+                        "documentNamespace": doc.documentNamespace,
+                        "sha1": sha1,
+                    })
+
+                for ref in doc.externalDocumentRefs:
+                    ref_path =3D oe.sbom.doc_find_by_namespace(deploy_di=
r_spdx, package_archs, ref.spdxDocument)
+                    if not ref_path:
+                        bb.fatal("Cannot find any SPDX file for document=
 %s" % ref.spdxDocument)
+                    collect_spdx_document(ref_path)
+
+            collect_spdx_document(image_spdx_path)
+
+            index["documents"].sort(key=3Dlambda x: x["filename"])
+
+            index_str =3D io.BytesIO(json.dumps(
+                index,
+                sort_keys=3DTrue,
+                indent=3Dget_json_indent(d),
+            ).encode("utf-8"))
+
+            info =3D tarfile.TarInfo()
+            info.name =3D "index.json"
+            info.size =3D len(index_str.getvalue())
+            info.uid =3D 0
+            info.gid =3D 0
+            info.uname =3D "root"
+            info.gname =3D "root"
+
+            tar.addfile(info, fileobj=3Dindex_str)
+
+combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS SSTATE_ARCHS"
--=20
2.42.0


