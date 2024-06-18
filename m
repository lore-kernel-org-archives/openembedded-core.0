Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFC4C2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 14:48:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.88304.1718722127945170739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 07:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eDgLM1DH;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4c7b022f8so48649115ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718722127; x=1719326927; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jhugp6CQFnKZ1+0C3lZn4IVHeQSgdWxnnNbSj4TahM=;
        b=eDgLM1DH0El2nqSmHd4tDl/RmSZwXX/Gat4GIN0T0FPyD3oUSEfOkGM3MG1LxNbpXA
         j9g8fUpoeBKMv5EE3eDwXwj2bgUS/Z2aNfKWyl9oG1NKn/OsymLTQuNLep5zXffoWlNt
         n9KtTt9cruahr241dZem9HkDEYjNrueu9xRr6RWuZuu+hELhQCmlL0Jrrwkl7ePrA4j2
         NTw2nj0bFm+LY2FXsnALm3/fSBYD3b06fVmr/NaDU9unbxjflErpKSX16Cb1y6UtIGEy
         LvLF6fBSxk3uIThQGPlDCOZRfmh3orII1nNUgbGeNHNZkefxiDSC+++4znpuCvWMEyya
         /u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722127; x=1719326927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Jhugp6CQFnKZ1+0C3lZn4IVHeQSgdWxnnNbSj4TahM=;
        b=Y6DyU+qnDelTtO7tIYzgQ1tLDwA/pgVMY8g83LCXm2r3C4MN50fvJp1GlAXi3Rn8qz
         whyMUxZNSmPaS+rtFWfhxl4WlPRmM0v/1SujHJu5eIBlCvwYfc0HH8WWzAOsRJ2ATY84
         Au21W5w8CWNLDH8odcVFXibDENPnYPkSsse1pFMWD4b0KIQUATNrgPYFldKWgI5uluXG
         AmRDBjFM8J5niHIfspPlHq4RmGNOlISHF8Crn6fCAZ5/4W0RLLnH0WDzrAIZwcsH6Kad
         oy/H2t1Cw0MCoxS97didSyrEmi/ijcET6GC2Q5knNKQd4pTuuWHFP0xgHJkaIhVCehax
         sveg==
X-Gm-Message-State: AOJu0YyUR4jhngcR1gZzOhp3BStjNB9B5uJBWtOvtTcw7e1fx0/tmOKi
	+dG6paJjhfJsEdVAmLhcaST6/MzuzOrOwCXS27pGDXeU/okgGTKwl/KBDJFw1+dQfvqEXZlpZSP
	27KHBV1PjVaWqa80Gjwa/RHb9Q14=
X-Google-Smtp-Source: AGHT+IFKT42F8PgXP8+n1Uipt3BHAjFkzfv95c60DAQrNH+9HWZFdERQwE6TnZaqjdTDKsGkcSNUF3YoMnB3sgSlOmw=
X-Received: by 2002:a17:902:7883:b0:1f7:35e0:5af4 with SMTP id
 d9443c01a7336-1f8627e18bcmr97984525ad.30.1718722127216; Tue, 18 Jun 2024
 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240610214456.2757397-1-JPEWhacker@gmail.com> <20240610214456.2757397-6-JPEWhacker@gmail.com>
In-Reply-To: <20240610214456.2757397-6-JPEWhacker@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Jun 2024 16:48:34 +0200
Message-ID: <CAApg2=Q+wfucou_Bu7wR8rMYricHmGFK0=4xihO5HNNonSxJfw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 5/6] classes/create-spdx-3.0: Add class
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dc56a0061b2b2db7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 14:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200874

--000000000000dc56a0061b2b2db7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
This is my first round of the review, before applying the code.

On Mon, Jun 10, 2024 at 11:45=E2=80=AFPM Joshua Watt via lists.openembedded=
.org
<JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:

| +SPDX_PROFILES ?=3D "core build software simpleLicensing security"

I would like to discuss this choice by default. People who do security
won't need the 'build' profile (and this likely adds
much data). On the other hand, people who do licensing won't need the
'security' profile.

It would be really nice to generate a basic SPDX without doing the build...


> +
> +SPDX_HASH_ALGORITHMS ?=3D "sha256 sha1"
>

Any reason to still use sha1? It is obsolete. We could use sha3 instead if
we want to have multiple ones.



>
> +
> +
> +python do_create_spdx() {
> +    import oe.sbom30
> +    import oe.spdx30
> +    from pathlib import Path
> +    from contextlib import contextmanager
> +    import oe.cve_check
> +    from datetime import datetime
> +
> +
> +    def set_var_field(var, obj, name, package=3DNone):
> +        val =3D None
> +        if package:
> +            val =3D d.getVar("%s:%s" % (var, package))
> +
> +        if not val:
> +            val =3D d.getVar(var)
> +
> +        if val:
> +            setattr(obj, name, val)
> +
> +    deploydir =3D Path(d.getVar("SPDXDEPLOY"))
> +    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
> +    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
> +    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
> +    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
> +    is_native =3D bb.data.inherits_class("native", d) or
> bb.data.inherits_class("cross", d)
> +
> +    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
> +
> +    build =3D build_objset.new_sub_build("recipe", "recipe")
> +    build_objset.doc.rootElement.append(build)
> +
> +    build_objset.set_is_native(is_native)
> +
> +    for var in (d.getVar('SPDX_CUSTOM_ANNOTATION_VARS') or "").split():
> +        new_annotation(
> +            d,
> +            build_objset,
> +            build,
> +            "%s=3D%s" % (var, d.getVar(var)),
> +            oe.spdx30.AnnotationType.other
> +        )
> +
> +    build_inputs =3D set()
> +
> +    # Add CVEs
> +    cve_by_status =3D {}
> +    cve_by_status["Patched"] =3D {cve: build_objset.new_cve_vuln(cve) fo=
r
> cve in oe.cve_check.get_patched_cves(d)}
> +
> +    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> +        status, _, _ =3D oe.cve_check.decode_cve_status(d, cve)
> +        # Already added above
> +        if status =3D=3D "Patched":
> +            continue
> +
> +        cve_by_status.setdefault(status, {})[cve] =3D
> build_objset.new_cve_vuln(cve)
> +
> +    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"),
> d.getVar("CVE_VERSION"))
>

This will be adding only those from patches and everything with CVE_STATUS.
In some cases (extra-exclusions) vulnerabilities
that have no real link with the given package. Also, the list isn't
complete, does not contain most of the unpatched ones.

+do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
> +# NOTE: depending on do_unpack is a hack that is necessary to get it's
> dependencies for archive the source
> +addtask do_create_spdx after do_populate_sysroot do_package
> do_packagedata do_unpack do_collect_spdx_deps do_package_write_ipk
> do_pacakge_write_deb do_package_write_rpm before do_populate_sdk do_build
> do_rm_work
> +
>

This is really late... I fear that if we get that in, it will be too hard
to make the generation mode modulable and output
certain profiles at a different place than the whole build. With the same
problem for the world build as we have today
with 2.2.

+def spdxid_hash(*items):
> +    h =3D hashlib.md5()
> +    for i in items:
> +        if isinstance(i, oe.spdx30.Element):
> +            h.update(i._id.encode("utf-8"))
> +        else:
> +            h.update(i.encode("utf-8"))
> +    return h.hexdigest()
> +
>

Can we avoid MD5?

> +    def new_cve_vuln(self, cve):
> +        v =3D oe.spdx30.security_Vulnerability()
> +        v._id =3D self.new_spdxid("vulnerability", cve)
> +        v.creationInfo =3D self.doc.creationInfo
> +
> +        v.externalIdentifier.append(
> +            oe.spdx30.ExternalIdentifier(
> +
> externalIdentifierType=3Doe.spdx30.ExternalIdentifierType.cve,
> +                identifier=3Dcve,
> +                identifierLocator=3D[
> +                    f"
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D{cve}",
> +                    f"https://www.cve.org/CVERecord?id=3D{cve}",
> +                ],
>

Better to link to the JSON format https://cveawg.mitre.org/api/cve/{cve}


> +            )
> +        )
> +        return self.add(v)
> +
> +    def new_vex_patched_relationship(self, from_, to):
> +        self.add(
> +            oe.spdx30.security_VexFixedVulnAssessmentRelationship(
> +                _id=3Dself.new_spdxid("vex-fixed", spdxid_hash(from_, *t=
o)),
> +                creationInfo=3Dself.doc.creationInfo,
> +                from_=3Dfrom_,
> +                relationshipType=3Doe.spdx30.RelationshipType.fixedIn,
> +                to=3Dto,
> +                security_vexVersion=3DVEX_VERSION,
> +            )
> +        )
>

For machine-readable entries, this should be linking to a proof of a fix,
for example in
a relationship to the fix file.


> +
> +    def new_vex_unpatched_relationship(self, from_, to):
> +        self.add(
> +            oe.spdx30.security_VexAffectedVulnAssessmentRelationship(
> +                _id=3Dself.new_spdxid("vex-affected", spdxid_hash(from_,
> *to)),
> +                creationInfo=3Dself.doc.creationInfo,
> +                from_=3Dfrom_,
> +                relationshipType=3Doe.spdx30.RelationshipType.affects,
> +                to=3Dto,
> +                security_vexVersion=3DVEX_VERSION,
> +            )
> +        )
> +
> +    def new_vex_ignored_relationship(self, from_, to, *,
> impact_statement):
> +        self.add(
> +            oe.spdx30.security_VexNotAffectedVulnAssessmentRelationship(
> +                _id=3Dself.new_spdxid(
> +                    "vex-not-affected", spdxid_hash(impact_statement,
> from_, *to)
> +                ),
> +                creationInfo=3Dself.doc.creationInfo,
> +                from_=3Dfrom_,
> +                relationshipType=3Doe.spdx30.RelationshipType.doesNotAff=
ect,
> +                to=3Dto,
> +                security_vexVersion=3DVEX_VERSION,
> +                security_impactStatement=3Dimpact_statement,
> +            )
> +        )
>

Missing conversion of 'Ignored' to 'justificationType' which is necessary
to allow machine processing of VEX statements. With 'impactStatement' only,
which is freeform text, this is human readable only.

That's it in the first pass. There will be more when I can have a look in
the output.

Regards,
Marta

--000000000000dc56a0061b2b2db7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>This is my first round of the review=
, before applying the code.<br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jun 10, 2024 at 11:45=E2=80=AFPM Jos=
hua Watt via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;JPEWhacker=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:</div><div dir=3D"ltr" clas=
s=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">| +SPDX_PR=
OFILES ?=3D &quot;core build software simpleLicensing security&quot;</div><=
div dir=3D"ltr" class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">I =
would like to discuss this choice by default. People who do security won&#3=
9;t need the &#39;build&#39; profile (and this likely adds</div><div class=
=3D"gmail_attr">much data). On the other hand, people who do licensing won&=
#39;t need the &#39;security&#39; profile.</div><div class=3D"gmail_attr"><=
br></div><div class=3D"gmail_attr">It would be really nice to generate a ba=
sic SPDX without doing the build...<br></div><div dir=3D"ltr" class=3D"gmai=
l_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
+<br>
+SPDX_HASH_ALGORITHMS ?=3D &quot;sha256 sha1&quot;<br></blockquote><div><br=
></div><div>Any reason to still use sha1? It is obsolete. We could use sha3=
 instead if we want to have multiple ones.<br></div><div><br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
+<br>
+<br>
+python do_create_spdx() {<br>
+=C2=A0 =C2=A0 import oe.sbom30<br>
+=C2=A0 =C2=A0 import oe.spdx30<br>
+=C2=A0 =C2=A0 from pathlib import Path<br>
+=C2=A0 =C2=A0 from contextlib import contextmanager<br>
+=C2=A0 =C2=A0 import oe.cve_check<br>
+=C2=A0 =C2=A0 from datetime import datetime<br>
+<br>
+<br>
+=C2=A0 =C2=A0 def set_var_field(var, obj, name, package=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if package:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D d.getVar(&quot;%s:%s&quo=
t; % (var, package))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not val:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D d.getVar(var)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if val:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setattr(obj, name, val)<br>
+<br>
+=C2=A0 =C2=A0 deploydir =3D Path(d.getVar(&quot;SPDXDEPLOY&quot;))<br>
+=C2=A0 =C2=A0 deploy_dir_spdx =3D Path(d.getVar(&quot;DEPLOY_DIR_SPDX&quot=
;))<br>
+=C2=A0 =C2=A0 spdx_workdir =3D Path(d.getVar(&quot;SPDXWORK&quot;))<br>
+=C2=A0 =C2=A0 include_sources =3D d.getVar(&quot;SPDX_INCLUDE_SOURCES&quot=
;) =3D=3D &quot;1&quot;<br>
+=C2=A0 =C2=A0 pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quot;)<br>
+=C2=A0 =C2=A0 is_native =3D bb.data.inherits_class(&quot;native&quot;, d) =
or bb.data.inherits_class(&quot;cross&quot;, d)<br>
+<br>
+=C2=A0 =C2=A0 build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar(=
&quot;PN&quot;))<br>
+<br>
+=C2=A0 =C2=A0 build =3D build_objset.new_sub_build(&quot;recipe&quot;, &qu=
ot;recipe&quot;)<br>
+=C2=A0 =C2=A0 build_objset.doc.rootElement.append(build)<br>
+<br>
+=C2=A0 =C2=A0 build_objset.set_is_native(is_native)<br>
+<br>
+=C2=A0 =C2=A0 for var in (d.getVar(&#39;SPDX_CUSTOM_ANNOTATION_VARS&#39;) =
or &quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_annotation(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_objset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s=3D%s&quot; % (var, d.ge=
tVar(var)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.AnnotationType.other<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 build_inputs =3D set()<br>
+<br>
+=C2=A0 =C2=A0 # Add CVEs<br>
+=C2=A0 =C2=A0 cve_by_status =3D {}<br>
+=C2=A0 =C2=A0 cve_by_status[&quot;Patched&quot;] =3D {cve: build_objset.ne=
w_cve_vuln(cve) for cve in oe.cve_check.get_patched_cves(d)}<br>
+<br>
+=C2=A0 =C2=A0 for cve in (d.getVarFlags(&quot;CVE_STATUS&quot;) or {}):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, _, _ =3D oe.cve_check.decode_cve_statu=
s(d, cve)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Already added above<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if status =3D=3D &quot;Patched&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_by_status.setdefault(status, {})[cve] =3D =
build_objset.new_cve_vuln(cve)<br>
+<br>
+=C2=A0 =C2=A0 cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar(&quot;CVE_PROD=
UCT&quot;), d.getVar(&quot;CVE_VERSION&quot;))<br></blockquote><div><br></d=
iv><div>This will be adding only those from patches and everything with CVE=
_STATUS. In some cases (extra-exclusions) vulnerabilities</div><div>that ha=
ve no real link with the given package. Also, the list isn&#39;t complete, =
does not contain most of the unpatched ones.<br></div><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+do_create_spdx[vardepsexclude] +=3D &quot;BB_NUMBER_THREADS&quot;<br>
+# NOTE: depending on do_unpack is a hack that is necessary to get it&#39;s=
 dependencies for archive the source<br>
+addtask do_create_spdx after do_populate_sysroot do_package do_packagedata=
 do_unpack do_collect_spdx_deps do_package_write_ipk do_pacakge_write_deb d=
o_package_write_rpm before do_populate_sdk do_build do_rm_work<br>
+<br></blockquote><div><br></div><div>This is really late... I fear that if=
 we get that in, it will be too hard to make the generation mode modulable =
and output</div><div>certain profiles at a different place than the whole b=
uild. With the same problem for the world build as we have today</div><div>=
with 2.2.<br></div><br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+def spdxid_hash(*items):<br>
+=C2=A0 =C2=A0 h =3D hashlib.md5()<br>
+=C2=A0 =C2=A0 for i in items:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(i, oe.spdx30.Element):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h.update(i._id.encode(&quot;utf-=
8&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h.update(i.encode(&quot;utf-8&qu=
ot;))<br>
+=C2=A0 =C2=A0 return h.hexdigest()<br>
+<br></blockquote><div><br></div><div>Can we avoid MD5?</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 def new_cve_vuln(self, cve):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D oe.spdx30.security_Vulnerability()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v._id =3D self.new_spdxid(&quot;vulnerability&=
quot;, cve)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v.creationInfo =3D self.doc.creationInfo<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v.externalIdentifier.append(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.ExternalIdentifier(<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 externalIdentifier=
Type=3Doe.spdx30.ExternalIdentifierType.cve,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 identifier=3Dcve,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 identifierLocator=
=3D[<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&qu=
ot;<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D%7Bcve%7D" r=
el=3D"noreferrer" target=3D"_blank">https://cve.mitre.org/cgi-bin/cvename.c=
gi?name=3D{cve}</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&qu=
ot;<a href=3D"https://www.cve.org/CVERecord?id=3D%7Bcve%7D" rel=3D"noreferr=
er" target=3D"_blank">https://www.cve.org/CVERecord?id=3D{cve}</a>&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br></blockquote=
><div><br></div><div>Better to link to the JSON format <a href=3D"https://c=
veawg.mitre.org/api/cve/{cve}">https://cveawg.mitre.org/api/cve/{cve}</a></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.add(v)<br>
+<br>
+=C2=A0 =C2=A0 def new_vex_patched_relationship(self, from_, to):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.security_VexFixedVulnA=
ssessmentRelationship(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _id=3Dself.new_spd=
xid(&quot;vex-fixed&quot;, spdxid_hash(from_, *to)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 creationInfo=3Dsel=
f.doc.creationInfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from_=3Dfrom_,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 relationshipType=
=3Doe.spdx30.RelationshipType.fixedIn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to=3Dto,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 security_vexVersio=
n=3DVEX_VERSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br></blockquote><div><br></div><div>For mach=
ine-readable entries, this should be linking to a proof of a fix, for examp=
le in</div><div>a relationship to the fix file.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 def new_vex_unpatched_relationship(self, from_, to):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.security_VexAffectedVu=
lnAssessmentRelationship(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _id=3Dself.new_spd=
xid(&quot;vex-affected&quot;, spdxid_hash(from_, *to)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 creationInfo=3Dsel=
f.doc.creationInfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from_=3Dfrom_,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 relationshipType=
=3Doe.spdx30.RelationshipType.affects,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to=3Dto,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 security_vexVersio=
n=3DVEX_VERSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 def new_vex_ignored_relationship(self, from_, to, *, impact_=
statement):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.security_VexNotAffecte=
dVulnAssessmentRelationship(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _id=3Dself.new_spd=
xid(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;vex-not-affected&quot;, spdxid_hash(impact_statement, from_, *to)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 creationInfo=3Dsel=
f.doc.creationInfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from_=3Dfrom_,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 relationshipType=
=3Doe.spdx30.RelationshipType.doesNotAffect,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to=3Dto,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 security_vexVersio=
n=3DVEX_VERSION,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 security_impactSta=
tement=3Dimpact_statement,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br></blockquote><div><br></div><div>Missing =
conversion of &#39;Ignored&#39; to &#39;justificationType&#39; which is nec=
essary to allow machine processing of VEX statements. With &#39;impactState=
ment&#39; only, which is freeform text, this is human readable only.<br></d=
iv></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Th=
at&#39;s it in the first pass. There will be more when I can have a look in=
 the output.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">Regards,</div><div class=3D"gmail_quote">Marta<br></div></div>

--000000000000dc56a0061b2b2db7--

