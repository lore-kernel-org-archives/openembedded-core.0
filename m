Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id D81207BF92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:03:43 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q18so15620108wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Kzi+OWfZcSi0iQ64feBEUx0nOhlT2yQf6NKe5SC2Yfk=;
	b=EjyWf2fHpTOD0l5HQoIt441gfhiKHesqQ8DmLIrCCOrSeM1J6rFUmV31KBjfrYhMun
	yYGDMUoF8VB3u6K5hz2YjSV3vKDGLbMf0Wkb+1JcYoVn2yu9a3qo3OgOxxDWrRuHHAv9
	90aECbJl/fStyAJjhwIB3SDwXwzsJIvJx0CC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Kzi+OWfZcSi0iQ64feBEUx0nOhlT2yQf6NKe5SC2Yfk=;
	b=gQ5ZSu2b8tDBVuwuubOX9oTmWGK+18+MT3Mbtqa2f7x82pcyHJ/pNA06vYhIgwqku+
	y9FK0+DfwzXGKTqiUKYudXGpazAsitVko/GOCHwZE1O8K5LYxaZ7Kt/Ec4tlomUZp9ea
	L949MQqNdkbwORyBE2Hw+Y7aG66IiEQ26bNOSSy6GDQizXqBuz9xdo6+skEcVzUY9yKF
	tgh/cKfcGVgo02WE8hozlC+G9RxsgE0fJsV+vQzoqyr3WSaLrGMOSiwj1zOo9P9lOzA2
	ybUdiF81lFqBGb9SuG300YQUGxXwk0a/w5qmi8Xu5JBIYFlj0HpbyFj3kN/eYubNPqSf
	cNDw==
X-Gm-Message-State: AA+aEWYtEPueKL4YNRN10KPxhiBmhai3/lBNCK3M5JXk76q66NVy6sAJ
	mZag/he///IA3R0pQObuNKhqXafucXdxaQ==
X-Google-Smtp-Source: AFSGD/UMFOv8UO/a4Yd9y5eb2WDL10OugQYYYWKfem53YqV2H4W8vi6+PLrpwynm0WzUp7tuWmUbHw==
X-Received: by 2002:adf:f091:: with SMTP id n17mr5087871wro.292.1545134623806; 
	Tue, 18 Dec 2018 04:03:43 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm1684156wmy.40.2018.12.18.04.03.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:03:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:03:36 +0000
Message-Id: <20181218120337.25019-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
References: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/6] distrodata: Remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2018 12:03:44 -0000
Content-Transfer-Encoding: 8bit

The code in the tasks within this class are old and there are much better
ways to do these things now such as through tinfoil rather than writing csv
files incrementally with start/stop events and lock files.

Existing users of the code (mainly the do_checkpkg task) have been ported
over to tinfoil. Drop the class, any other users should also make use
of the tinfoil functionality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/distrodata.bbclass | 425 --------------------------------
 1 file changed, 425 deletions(-)
 delete mode 100644 meta/classes/distrodata.bbclass

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
deleted file mode 100644
index 7712c8e40d4..00000000000
--- a/meta/classes/distrodata.bbclass
+++ /dev/null
@@ -1,425 +0,0 @@
-include conf/distro/include/distro_alias.inc
-
-addhandler distro_eventhandler
-distro_eventhandler[eventmask] = "bb.event.BuildStarted"
-python distro_eventhandler() {
-    import oe.distro_check as dc
-    import csv
-    logfile = dc.create_log_file(e.data, "distrodata.csv")
-
-    lf = bb.utils.lockfile("%s.lock" % logfile)
-    with open(logfile, "a") as f:
-        writer = csv.writer(f)
-        writer.writerow(['Package', 'Description', 'Owner', 'License', 
-            'VerMatch', 'Version', 'Upstream', 'Reason', 'Recipe Status',
-            'Distro 1', 'Distro 2', 'Distro 3'])
-        f.close()
-    bb.utils.unlockfile(lf)
-
-    return
-}
-
-addtask distrodata_np
-do_distrodata_np[nostamp] = "1"
-python do_distrodata_np() {
-        localdata = bb.data.createCopy(d)
-        pn = d.getVar("PN")
-        bb.note("Package Name: %s" % pn)
-
-        import oe.distro_check as dist_check
-        tmpdir = d.getVar('TMPDIR')
-        distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = localdata.getVar('DATETIME')
-        dist_check.update_distro_data(distro_check_dir, datetime, localdata)
-
-        if pn.find("-native") != -1:
-            pnstripped = pn.split("-native")
-            bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pn.find("-cross") != -1:
-            pnstripped = pn.split("-cross")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pn.find("-crosssdk") != -1:
-            pnstripped = pn.split("-crosssdk")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pn.startswith("nativesdk-"):
-            pnstripped = pn.replace("nativesdk-", "")
-            bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
-
-
-        if pn.find("-initial") != -1:
-            pnstripped = pn.split("-initial")
-            bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        """generate package information from .bb file"""
-        pname = localdata.getVar('PN')
-        pcurver = localdata.getVar('PV')
-        pdesc = localdata.getVar('DESCRIPTION')
-        if pdesc is not None:
-                pdesc = pdesc.replace(',','')
-                pdesc = pdesc.replace('\n','')
-
-        pgrp = localdata.getVar('SECTION')
-        plicense = localdata.getVar('LICENSE').replace(',','_')
-
-        rstatus = localdata.getVar('RECIPE_COLOR')
-        if rstatus is not None:
-                rstatus = rstatus.replace(',','')
-
-        pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION')
-        if pcurver == pupver:
-                vermatch="1"
-        else:
-                vermatch="0"
-        noupdate_reason = localdata.getVar('RECIPE_NO_UPDATE_REASON')
-        if noupdate_reason is None:
-                noupdate="0"
-        else:
-                noupdate="1"
-                noupdate_reason = noupdate_reason.replace(',','')
-
-        maintainer = localdata.getVar('RECIPE_MAINTAINER')
-        rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE')
-        result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
-
-        bb.note("DISTRO: %s,%s,%s,%s,%s,%s,%s,%s,%s\n" % \
-                  (pname, pdesc, maintainer, plicense, vermatch, pcurver, pupver, noupdate_reason, rstatus))
-        line = pn
-        for i in result:
-            line = line + "," + i
-        bb.note("%s\n" % line)
-}
-do_distrodata_np[vardepsexclude] = "DATETIME"
-
-addtask distrodata
-do_distrodata[nostamp] = "1"
-python do_distrodata() {
-        import csv
-        logpath = d.getVar('LOG_DIR')
-        bb.utils.mkdirhier(logpath)
-        logfile = os.path.join(logpath, "distrodata.csv")
-
-        import oe.distro_check as dist_check
-        localdata = bb.data.createCopy(d)
-        tmpdir = d.getVar('TMPDIR')
-        distro_check_dir = os.path.join(tmpdir, "distro_check")
-        datetime = localdata.getVar('DATETIME')
-        dist_check.update_distro_data(distro_check_dir, datetime, localdata)
-
-        pn = d.getVar("PN")
-        bb.note("Package Name: %s" % pn)
-
-        if pn.find("-native") != -1:
-            pnstripped = pn.split("-native")
-            bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pn.startswith("nativesdk-"):
-            pnstripped = pn.replace("nativesdk-", "")
-            bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
-
-        if pn.find("-cross") != -1:
-            pnstripped = pn.split("-cross")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pn.find("-crosssdk") != -1:
-            pnstripped = pn.split("-crosssdk")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pn.find("-initial") != -1:
-            pnstripped = pn.split("-initial")
-            bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        """generate package information from .bb file"""
-        pname = localdata.getVar('PN')
-        pcurver = localdata.getVar('PV')
-        pdesc = localdata.getVar('DESCRIPTION')
-        if pdesc is not None:
-                pdesc = pdesc.replace(',','')
-                pdesc = pdesc.replace('\n','')
-
-        pgrp = localdata.getVar('SECTION')
-        plicense = localdata.getVar('LICENSE').replace(',','_')
-
-        rstatus = localdata.getVar('RECIPE_COLOR')
-        if rstatus is not None:
-                rstatus = rstatus.replace(',','')
-
-        pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION')
-        if pcurver == pupver:
-                vermatch="1"
-        else:
-                vermatch="0"
-
-        noupdate_reason = localdata.getVar('RECIPE_NO_UPDATE_REASON')
-        if noupdate_reason is None:
-                noupdate="0"
-        else:
-                noupdate="1"
-                noupdate_reason = noupdate_reason.replace(',','')
-
-        maintainer = localdata.getVar('RECIPE_MAINTAINER')
-        rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE')
-        # do the comparison
-        result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
-
-        lf = bb.utils.lockfile("%s.lock" % logfile)
-        with open(logfile, "a") as f:
-            row = [pname, pdesc, maintainer, plicense, vermatch, pcurver, pupver, noupdate_reason, rstatus]
-            row.extend(result)
-
-            writer = csv.writer(f)
-            writer.writerow(row)
-            f.close()
-        bb.utils.unlockfile(lf)
-}
-do_distrodata[vardepsexclude] = "DATETIME"
-
-addhandler checkpkg_eventhandler
-checkpkg_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
-python checkpkg_eventhandler() {
-    import csv
-
-    def parse_csv_file(filename):
-        package_dict = {}
-
-        with open(filename, "r") as f:
-            reader = csv.reader(f, delimiter='\t')
-            for row in reader:
-                pn = row[0]
-
-                if reader.line_num == 1:
-                    header = row
-                    continue
-
-                if not pn in package_dict.keys():
-                    package_dict[pn] = row
-            f.close()
-
-        with open(filename, "w") as f:
-            writer = csv.writer(f, delimiter='\t')
-            writer.writerow(header)
-            for pn in package_dict.keys():
-                writer.writerow(package_dict[pn])
-            f.close()
-
-        del package_dict
-
-    if bb.event.getName(e) == "BuildStarted":
-        import oe.distro_check as dc
-        logfile = dc.create_log_file(e.data, "checkpkg.csv")
-
-        lf = bb.utils.lockfile("%s.lock" % logfile)
-        with open(logfile, "a") as f:
-            writer = csv.writer(f, delimiter='\t')
-            headers = ['Package', 'Version', 'Upver', 'License', 'Section',
-                'Home', 'Release', 'Depends', 'BugTracker', 'PE', 'Description',
-                'Status', 'Tracking', 'URI', 'MAINTAINER', 'NoUpReason']
-            writer.writerow(headers)
-            f.close()
-        bb.utils.unlockfile(lf)
-    elif bb.event.getName(e) == "BuildCompleted":
-        import os
-        filename = "tmp/log/checkpkg.csv"
-        if os.path.isfile(filename):
-            lf = bb.utils.lockfile("%s.lock"%filename)
-            parse_csv_file(filename)
-            bb.utils.unlockfile(lf)
-    return
-}
-
-addtask checkpkg
-do_checkpkg[nostamp] = "1"
-python do_checkpkg() {
-        localdata = bb.data.createCopy(d)
-        import csv
-        import re
-        import tempfile
-        import subprocess
-        import oe.recipeutils
-        from bb.utils import vercmp_string
-        from bb.fetch2 import FetchError, NoMethodError, decodeurl
-
-        def get_upstream_version_and_status():
-
-            # set if the upstream check fails reliably, e.g. absent git tags, or weird version format used on our or on upstream side.
-            upstream_version_unknown = localdata.getVar('UPSTREAM_VERSION_UNKNOWN')
-            # set if the upstream check cannot be reliably performed due to transient network failures, or server behaving weirdly. 
-            # This one should be used sparingly, as it completely excludes a recipe from upstream checking.
-            upstream_check_unreliable = localdata.getVar('UPSTREAM_CHECK_UNRELIABLE')
-
-            if upstream_check_unreliable == "1":
-                return "N/A", "CHECK_IS_UNRELIABLE"
-
-            uv = oe.recipeutils.get_recipe_upstream_version(localdata)
-            pupver = uv['version'] if uv['version'] else "N/A"
-            pversion = uv['current_version']
-            revision = uv['revision'] if uv['revision'] else "N/A"
-
-            if pupver == "N/A":
-                pstatus = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
-            else:
-                cmp = vercmp_string(pversion, pupver)
-                if cmp == -1:
-                    pstatus = "UPDATE" if not upstream_version_unknown else "KNOWN_BROKEN"
-                elif cmp == 0:
-                    pstatus = "MATCH" if not upstream_version_unknown else "KNOWN_BROKEN"
-                else:
-                    pstatus = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
-
-            return pversion, pupver, pstatus, revision
-
-
-        """initialize log files."""
-        logpath = d.getVar('LOG_DIR')
-        bb.utils.mkdirhier(logpath)
-        logfile = os.path.join(logpath, "checkpkg.csv")
-
-        """generate package information from .bb file"""
-        pname = d.getVar('PN')
-
-        if pname.find("-native") != -1:
-            if d.getVar('BBCLASSEXTEND'):
-                    return
-            pnstripped = pname.split("-native")
-            bb.note("Native Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pname.startswith("nativesdk-"):
-            if d.getVar('BBCLASSEXTEND'):
-                    return
-            pnstripped = pname.replace("nativesdk-", "")
-            bb.note("NativeSDK Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES'))
-
-        if pname.find("-cross") != -1:
-            pnstripped = pname.split("-cross")
-            bb.note("cross Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        if pname.find("-initial") != -1:
-            pnstripped = pname.split("-initial")
-            bb.note("initial Split: %s" % pnstripped)
-            localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES'))
-
-        pdesc = localdata.getVar('DESCRIPTION')
-        pgrp = localdata.getVar('SECTION')
-        plicense = localdata.getVar('LICENSE')
-        psection = localdata.getVar('SECTION')
-        phome = localdata.getVar('HOMEPAGE')
-        prelease = localdata.getVar('PR')
-        pdepends = localdata.getVar('DEPENDS')
-        pbugtracker = localdata.getVar('BUGTRACKER')
-        ppe = localdata.getVar('PE')
-        psrcuri = localdata.getVar('SRC_URI')
-        maintainer = localdata.getVar('RECIPE_MAINTAINER')
-
-        pversion, pupver, pstatus, prevision = get_upstream_version_and_status()
-
-        if psrcuri:
-            psrcuri = psrcuri.split()[0]
-        else:
-            psrcuri = "none"
-        pdepends = "".join(pdepends.split("\t"))
-        pdesc = "".join(pdesc.split("\t"))
-        no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON')
-        lf = bb.utils.lockfile("%s.lock" % logfile)
-        with open(logfile, "a") as f:
-            writer = csv.writer(f, delimiter='\t')
-            writer.writerow([pname, pversion, pupver, plicense, psection, phome, 
-                prelease, pdepends, pbugtracker, ppe, pdesc, pstatus, prevision,
-                psrcuri, maintainer, no_upgr_reason])
-            f.close()
-        bb.utils.unlockfile(lf)
-}
-
-addhandler distro_check_eventhandler
-distro_check_eventhandler[eventmask] = "bb.event.BuildStarted"
-python distro_check_eventhandler() {
-    """initialize log files."""
-    import oe.distro_check as dc
-    result_file = dc.create_log_file(e.data, "distrocheck.csv")
-    return
-}
-
-addtask distro_check
-do_distro_check[nostamp] = "1"
-do_distro_check[vardepsexclude] += "DATETIME"
-python do_distro_check() {
-    """checks if the package is present in other public Linux distros"""
-    import oe.distro_check as dc
-    import shutil
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk',d):
-        return
-
-    localdata = bb.data.createCopy(d)
-    tmpdir = d.getVar('TMPDIR')
-    distro_check_dir = os.path.join(tmpdir, "distro_check")
-    logpath = d.getVar('LOG_DIR')
-    bb.utils.mkdirhier(logpath)
-    result_file = os.path.join(logpath, "distrocheck.csv")
-    datetime = localdata.getVar('DATETIME')
-    dc.update_distro_data(distro_check_dir, datetime, localdata)
-
-    # do the comparison
-    result = dc.compare_in_distro_packages_list(distro_check_dir, d)
-
-    # save the results
-    dc.save_distro_check_result(result, datetime, result_file, d)
-}
-
-#
-#Check Missing License Text.
-#Use this task to generate the missing license text data for pkg-report system,
-#then we can search those recipes which license text isn't exsit in common-licenses directory
-#
-addhandler checklicense_eventhandler
-checklicense_eventhandler[eventmask] = "bb.event.BuildStarted"
-python checklicense_eventhandler() {
-    """initialize log files."""
-    import csv
-    import oe.distro_check as dc
-    logfile = dc.create_log_file(e.data, "missinglicense.csv")
-    lf = bb.utils.lockfile("%s.lock" % logfile)
-    with open(logfile, "a") as f:
-        writer = csv.writer(f, delimiter='\t')
-        writer.writerow(['Package', 'License', 'MissingLicense'])
-        f.close()
-    bb.utils.unlockfile(lf)
-    return
-}
-
-addtask checklicense
-do_checklicense[nostamp] = "1"
-python do_checklicense() {
-    import csv
-    import shutil
-    logpath = d.getVar('LOG_DIR')
-    bb.utils.mkdirhier(logpath)
-    pn = d.getVar('PN')
-    logfile = os.path.join(logpath, "missinglicense.csv")
-    generic_directory = d.getVar('COMMON_LICENSE_DIR')
-    license_types = d.getVar('LICENSE')
-    for license_type in ((license_types.replace('+', '').replace('|', '&')
-                          .replace('(', '').replace(')', '').replace(';', '')
-                          .replace(',', '').replace(" ", "").split("&"))):
-        if not os.path.isfile(os.path.join(generic_directory, license_type)):
-            lf = bb.utils.lockfile("%s.lock" % logfile)
-            with open(logfile, "a") as f:
-                writer = csv.writer(f, delimiter='\t')
-                writer.writerow([pn, license_types, license_type])
-                f.close()
-            bb.utils.unlockfile(lf)
-    return
-}
-- 
2.19.1


