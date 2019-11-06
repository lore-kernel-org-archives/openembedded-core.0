Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D34E7E437
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 14:59:27 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id y18so1518294qve.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ezFhOMkB7sTY3L/F0UilMrojiJm2jRxla3zxB0Qoe78=;
	b=UL60GUISHhismkqNnyb3dXYtMzbUTOrj/0A+YgaVxLJUSJOI0GfW5/CwEwmvXSmIIp
	h6wsSia3zJCrLr8jPu5BO44kUIyh3rYlEXUK7JyuyMg+PBvezn78VqI/iAP2pjACU4cT
	zFvTJ5niw7spmZSYGKF1E5riDRIXCem/ROy8nOPkEunWLD8G0eOtE2u9pcX9dHZHHPNb
	JJVZEp4MclleD4kCaxzkYb9qXCSgPZZOo9EXzY4xz/u6zoveie8HCZRAbvpXNikGVwlS
	D8ZKBPyqRGQXiUsXXFLpDztCQMqKwhEi2MuFhuWO8+fIJUuiyritDngYqRSFSpSOmngV
	AcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ezFhOMkB7sTY3L/F0UilMrojiJm2jRxla3zxB0Qoe78=;
	b=pWm9twwAYvqxLRrAs9AZo0iADKwgQKI524IvyKOqEzJiGCmhpdKg6voXum3W1oY7Q8
	Exly/5Sb+Xyl3WPEtQmTdSgZhIJTysfb1TGICtKcu+dweWcCgtX2vBRtKq+o96kz2Uvl
	v4Yh2W+NjBJkKTQnXkUnppQdHyRECAFGokgGSWqIcH73xDeUfdEI5A0QtlRfHl7UlaaO
	B2J4sZHJkBd04cdhbNxV+o+eYv2aNRHUoCyhBL/mfX0Y8Af1451O9Weqrk3sYiRZI+3n
	gju0TLnmWw2irKJNv/8oWx/o07b/MheJqraFOE8CksdhmDhXU1UThsFkuBYRbQptHhs8
	E94g==
X-Gm-Message-State: APjAAAXhManFAUGaA57bPxL7szk7LNETrqxK9P/vm4vJW7cqe+/J9N95
	4Cz2RkxEIpGbnqogbwmXMfjItvvmtWhGUH/CgcRGYw==
X-Google-Smtp-Source: APXvYqzUXT3350BMsSFzg+uPpE1kGNRlGgIgUTjmVIRWq+mvaKZgJDgyG8i9xqSJD8glMMAq9XR3SkvRp7BbiJ8IsFA=
X-Received: by 2002:a0c:b446:: with SMTP id e6mr2622956qvf.159.1573052367867; 
	Wed, 06 Nov 2019 06:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20190925122349.14872-1-ross.burton@intel.com>
In-Reply-To: <20190925122349.14872-1-ross.burton@intel.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 6 Nov 2019 14:59:16 +0000
Message-ID: <CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>, richard.purdie@linuxfoundation.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][thud] cve-check: backport rewrite from master
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
X-List-Received-Date: Wed, 06 Nov 2019 14:59:28 -0000
Content-Type: multipart/alternative; boundary="00000000000099b5590596aecb25"

--00000000000099b5590596aecb25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross/Richard,

I'd like this applied to Sumo also. Should I create a new patch and send it
to the list, or is there a process for requesting this is cherry-picked
across?

Thanks,
Ryan.

On Wed, 25 Sep 2019 at 13:24, Ross Burton <ross.burton@intel.com> wrote:

> As detailed at [1] the XML feeds provided by NIST are being discontinued =
on
> October 9th 2019.  As cve-check-tool uses these feeds, cve-check.bbclass
> will be
> inoperable after this date.
>
> To ensure that cve-check continues working, backport the following commit=
s
> from
> master to move away from the unmaintained cve-check-tool to our own Pytho=
n
> code
> that fetches the JSON:
>
> 546d14135c5 cve-update-db: New recipe to update CVE database
> bc144b028f6 cve-check: Remove dependency to cve-check-tool-native
> 7f62a20b32a cve-check: Manage CVE_PRODUCT with more than one name
> 3bf63bc6084 cve-check: Consider CVE that affects versions with less than
> operator
> c0eabd30d7b cve-update-db: Use std library instead of urllib3
> 27eb839ee65 cve-check: be idiomatic
> 09be21f4d17 cve-update-db: Manage proxy if needed.
> 975793e3825 cve-update-db: do_populate_cve_db depends on do_fetch
> 0325dd72714 cve-update-db: Catch request.urlopen errors.
> 4078da92b49 cve-check: Depends on cve-update-db-native
> f7676e9a38d cve-update-db: Use NVD CPE data to populate PRODUCTS table
> bc0195be1b1 cve-check: Update unpatched CVE matching
> c807c2a6409 cve-update-db-native: Skip recipe when cve-check class is not
> loaded.
> 07bb8b25e17 cve-check: remove redundant readline CVE whitelisting
> 5388ed6d137 cve-check-tool: remove
> 270ac00cb43 cve-check.bbclass: initialize to_append
> e6bf9000987 cve-check: allow comparison of Vendor as well as Product
> 91770338f76 cve-update-db-native: use SQL placeholders instead of format
> strings
> 7069302a4cc cve-check: Replace CVE_CHECK_CVE_WHITELIST by
> CVE_CHECK_WHITELIST
> 78de2cb39d7 cve-update-db-native: Remove hash column from database.
> 4b301030cf9 cve-update-db-native: use os.path.join instead of +
> f0d822fad2a cve-update-db: actually inherit native
> b309840b6aa cve-update-db-native: use executemany() to optimise CPE
> insertion
> bb4e53af33d cve-update-db-native: improve metadata parsing
> 94227459792 cve-update-db-native: clean up JSON fetching
> 95438d52b73 cve-update-db-native: fix https proxy issues
> 1f9a963b9ff glibc: exclude child recipes from CVE scanning
>
> [1] https://nvd.nist.gov/General/News/XML-Vulnerability-Feed-Retirement
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/cve-check.bbclass                | 142 +++++++-----
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  meta/recipes-core/glibc/glibc-locale.inc      |   3 +
>  meta/recipes-core/glibc/glibc-mtrace.inc      |   3 +
>  meta/recipes-core/glibc/glibc-scripts.inc     |   3 +
>  .../recipes-core/meta/cve-update-db-native.bb | 195 ++++++++++++++++
>  .../cve-check-tool/cve-check-tool_5.6.4.bb    |  62 -----
>  ...x-freeing-memory-allocated-by-sqlite.patch |  50 ----
>  ...erriding-default-CA-certificate-file.patch | 215 ------------------
>  ...s-in-percent-when-downloading-CVE-db.patch | 135 -----------
>  ...omputed-vs-expected-sha256-digit-str.patch |  52 -----
>  ...heck-for-malloc_trim-before-using-it.patch |  51 -----
>  12 files changed, 292 insertions(+), 620 deletions(-)
>  create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/
> cve-check-tool_5.6.4.bb
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-alloca=
ted-by-sqlite.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-def=
ault-CA-certificate-file.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-percent=
-when-downloading-CVE-db.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed-v=
s-expected-sha256-digit-str.patch
>  delete mode 100644
> meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-u=
sing-it.patch
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 743bc08a4f9..c00d2910be1 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -26,7 +26,7 @@ CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>
>  CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
> -CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvd.db"
> +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
>
>  CVE_CHECK_LOG ?=3D "${T}/cve.log"
>  CVE_CHECK_TMP_FILE ?=3D "${TMPDIR}/cve_check"
> @@ -37,32 +37,33 @@ CVE_CHECK_COPY_FILES ??=3D "1"
>  CVE_CHECK_CREATE_MANIFEST ??=3D "1"
>
>  # Whitelist for packages (PN)
> -CVE_CHECK_PN_WHITELIST =3D "\
> -    glibc-locale \
> -"
> +CVE_CHECK_PN_WHITELIST ?=3D ""
>
> -# Whitelist for CVE and version of package
> -CVE_CHECK_CVE_WHITELIST =3D "{\
> -    'CVE-2014-2524': ('6.3','5.2',), \
> -}"
> +# Whitelist for CVE. If a CVE is found, then it is considered patched.
> +# The value is a string containing space separated CVE values:
> +#
> +# CVE_CHECK_WHITELIST =3D 'CVE-2014-2524 CVE-2018-1234'
> +#
> +CVE_CHECK_WHITELIST ?=3D ""
>
>  python do_cve_check () {
>      """
>      Check recipe for patched and unpatched CVEs
>      """
>
> -    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
> +    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
>          patched_cves =3D get_patches_cves(d)
>          patched, unpatched =3D check_cves(d, patched_cves)
>          if patched or unpatched:
>              cve_data =3D get_cve_info(d, patched + unpatched)
>              cve_write_data(d, patched, unpatched, cve_data)
>      else:
> -        bb.note("Failed to update CVE database, skipping CVE check")
> +        bb.note("No CVE database found, skipping CVE check")
> +
>  }
>
>  addtask cve_check after do_unpack before do_build
> -do_cve_check[depends] =3D "cve-check-tool-native:do_populate_sysroot
> cve-check-tool-native:do_populate_cve_db"
> +do_cve_check[depends] =3D "cve-update-db-native:do_populate_cve_db"
>  do_cve_check[nostamp] =3D "1"
>
>  python cve_check_cleanup () {
> @@ -163,65 +164,94 @@ def get_patches_cves(d):
>
>  def check_cves(d, patched_cves):
>      """
> -    Run cve-check-tool looking for patched and unpatched CVEs.
> +    Connect to the NVD database and find unpatched cves.
>      """
> -
>      import ast, csv, tempfile, subprocess, io
> +    from distutils.version import LooseVersion
>
> -    cves_patched =3D []
>      cves_unpatched =3D []
> -    bpn =3D d.getVar("CVE_PRODUCT")
> +    # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
> +    products =3D d.getVar("CVE_PRODUCT").split()
>      # If this has been unset then we're not scanning for CVEs here (for
> example, image recipes)
> -    if not bpn:
> +    if not products:
>          return ([], [])
>      pv =3D d.getVar("CVE_VERSION").split("+git")[0]
> -    cves =3D " ".join(patched_cves)
> -    cve_db_dir =3D d.getVar("CVE_CHECK_DB_DIR")
> -    cve_whitelist =3D ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST=
"))
> -    cve_cmd =3D "cve-check-tool"
> -    cmd =3D [cve_cmd, "--no-html", "--skip-update", "--csv",
> "--not-affected", "-t", "faux", "-d", cve_db_dir]
>
>      # If the recipe has been whitlisted we return empty lists
>      if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
>          bb.note("Recipe has been whitelisted, skipping check")
>          return ([], [])
>
> -    try:
> -        # Write the faux CSV file to be used with cve-check-tool
> -        fd, faux =3D tempfile.mkstemp(prefix=3D"cve-faux-")
> -        with os.fdopen(fd, "w") as f:
> -            for pn in bpn.split():
> -                f.write("%s,%s,%s,\n" % (pn, pv, cves))
> -        cmd.append(faux)
> -
> -        output =3D subprocess.check_output(cmd).decode("utf-8")
> -        bb.debug(2, "Output of command %s:\n%s" % ("\n".join(cmd),
> output))
> -    except subprocess.CalledProcessError as e:
> -        bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output=
))
> -    finally:
> -        os.remove(faux)
> -
> -    for row in csv.reader(io.StringIO(output)):
> -        # Third row has the unpatched CVEs
> -        if row[2]:
> -            for cve in row[2].split():
> -                # Skip if the CVE has been whitlisted for the current
> version
> -                if pv in cve_whitelist.get(cve,[]):
> -                    bb.note("%s-%s has been whitelisted for %s" % (bpn,
> pv, cve))
> +    old_cve_whitelist =3D  d.getVar("CVE_CHECK_CVE_WHITELIST")
> +    if old_cve_whitelist:
> +        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use
> CVE_CHECK_WHITELIST.")
> +    cve_whitelist =3D d.getVar("CVE_CHECK_WHITELIST").split()
> +
> +    import sqlite3
> +    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
> +    conn =3D sqlite3.connect(db_file)
> +
> +    for product in products:
> +        c =3D conn.cursor()
> +        if ":" in product:
> +            vendor, product =3D product.split(":", 1)
> +            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ? AND
> VENDOR IS ?", (product, vendor))
> +        else:
> +            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?",
> (product,))
> +
> +        for row in c:
> +            cve =3D row[0]
> +            version_start =3D row[3]
> +            operator_start =3D row[4]
> +            version_end =3D row[5]
> +            operator_end =3D row[6]
> +
> +            if cve in cve_whitelist:
> +                bb.note("%s-%s has been whitelisted for %s" % (product,
> pv, cve))
> +            elif cve in patched_cves:
> +                bb.note("%s has been patched" % (cve))
> +            else:
> +                to_append =3D False
> +                if (operator_start =3D=3D '=3D' and pv =3D=3D version_st=
art):
> +                    cves_unpatched.append(cve)
>                  else:
> +                    if operator_start:
> +                        try:
> +                            to_append_start =3D  (operator_start =3D=3D =
'>=3D'
> and LooseVersion(pv) >=3D LooseVersion(version_start))
> +                            to_append_start |=3D (operator_start =3D=3D =
'>' and
> LooseVersion(pv) > LooseVersion(version_start))
> +                        except:
> +                            bb.note("%s: Failed to compare %s %s %s for
> %s" %
> +                                    (product, pv, operator_start,
> version_start, cve))
> +                            to_append_start =3D False
> +                    else:
> +                        to_append_start =3D False
> +
> +                    if operator_end:
> +                        try:
> +                            to_append_end  =3D (operator_end =3D=3D '<=
=3D' and
> LooseVersion(pv) <=3D LooseVersion(version_end))
> +                            to_append_end |=3D (operator_end =3D=3D '<' =
and
> LooseVersion(pv) < LooseVersion(version_end))
> +                        except:
> +                            bb.note("%s: Failed to compare %s %s %s for
> %s" %
> +                                    (product, pv, operator_end,
> version_end, cve))
> +                            to_append_end =3D False
> +                    else:
> +                        to_append_end =3D False
> +
> +                    if operator_start and operator_end:
> +                        to_append =3D to_append_start and to_append_end
> +                    else:
> +                        to_append =3D to_append_start or to_append_end
> +
> +                if to_append:
>                      cves_unpatched.append(cve)
> -                    bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv=
,
> cve))
> -        # Fourth row has patched CVEs
> -        if row[3]:
> -            for cve in row[3].split():
> -                cves_patched.append(cve)
> -                bb.debug(2, "%s-%s is patched for %s" % (bpn, pv, cve))
> +                bb.debug(2, "%s-%s is not patched for %s" % (product, pv=
,
> cve))
> +    conn.close()
>
> -    return (cves_patched, cves_unpatched)
> +    return (list(patched_cves), cves_unpatched)
>
>  def get_cve_info(d, cves):
>      """
> -    Get CVE information from the database used by cve-check-tool.
> +    Get CVE information from the database.
>
>      Unfortunately the only way to get CVE info is set the output to
>      html (hard to parse) or query directly the database.
> @@ -241,9 +271,10 @@ def get_cve_info(d, cves):
>      for row in cur.execute(query, tuple(cves)):
>          cve_data[row[0]] =3D {}
>          cve_data[row[0]]["summary"] =3D row[1]
> -        cve_data[row[0]]["score"] =3D row[2]
> -        cve_data[row[0]]["modified"] =3D row[3]
> -        cve_data[row[0]]["vector"] =3D row[4]
> +        cve_data[row[0]]["scorev2"] =3D row[2]
> +        cve_data[row[0]]["scorev3"] =3D row[3]
> +        cve_data[row[0]]["modified"] =3D row[4]
> +        cve_data[row[0]]["vector"] =3D row[5]
>      conn.close()
>
>      return cve_data
> @@ -270,7 +301,8 @@ def cve_write_data(d, patched, unpatched, cve_data):
>              unpatched_cves.append(cve)
>              write_string +=3D "CVE STATUS: Unpatched\n"
>          write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
> -        write_string +=3D "CVSS v2 BASE SCORE: %s\n" %
> cve_data[cve]["score"]
> +        write_string +=3D "CVSS v2 BASE SCORE: %s\n" %
> cve_data[cve]["scorev2"]
> +        write_string +=3D "CVSS v3 BASE SCORE: %s\n" %
> cve_data[cve]["scorev3"]
>          write_string +=3D "VECTOR: %s\n" % cve_data[cve]["vector"]
>          write_string +=3D "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 672f0677922..c027901fdf0 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -116,6 +116,7 @@ RECIPE_MAINTAINER_pn-cryptodev-tests =3D "Robert Yang=
 <
> liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-cups =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-curl =3D "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-cve-check-tool =3D "Ross Burton <ross.burton@intel.=
com
> >"
> +RECIPE_MAINTAINER_pn-cve-update-db-native =3D "Ross Burton <
> ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-cwautomacros =3D "Ross Burton <ross.burton@intel.co=
m>"
>  RECIPE_MAINTAINER_pn-db =3D "Mark Hatle <mark.hatle@windriver.com>"
>  RECIPE_MAINTAINER_pn-dbus =3D "Chen Qi <Qi.Chen@windriver.com>"
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc
> b/meta/recipes-core/glibc/glibc-locale.inc
> index 1b676dc26e7..97d83cb856d 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -95,3 +95,6 @@ do_install () {
>  inherit libc-package
>
>  BBCLASSEXTEND =3D "nativesdk"
> +
> +# Don't scan for CVEs as glibc will be scanned
> +CVE_PRODUCT =3D ""
> diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc
> b/meta/recipes-core/glibc/glibc-mtrace.inc
> index d703c14bdc1..ef9d60ec239 100644
> --- a/meta/recipes-core/glibc/glibc-mtrace.inc
> +++ b/meta/recipes-core/glibc/glibc-mtrace.inc
> @@ -11,3 +11,6 @@ do_install() {
>         install -d -m 0755 ${D}${bindir}
>         install -m 0755 ${SRC}/mtrace ${D}${bindir}/
>  }
> +
> +# Don't scan for CVEs as glibc will be scanned
> +CVE_PRODUCT =3D ""
> diff --git a/meta/recipes-core/glibc/glibc-scripts.inc
> b/meta/recipes-core/glibc/glibc-scripts.inc
> index 2a2b41507ed..14a14e45126 100644
> --- a/meta/recipes-core/glibc/glibc-scripts.inc
> +++ b/meta/recipes-core/glibc/glibc-scripts.inc
> @@ -18,3 +18,6 @@ do_install() {
>  # sotruss script requires sotruss-lib.so (given by libsotruss package),
>  # to produce trace of the library calls.
>  RDEPENDS_${PN} +=3D "libsotruss"
> +
> +# Don't scan for CVEs as glibc will be scanned
> +CVE_PRODUCT =3D ""
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> b/meta/recipes-core/meta/cve-update-db-native.bb
> new file mode 100644
> index 00000000000..2c427a5884f
> --- /dev/null
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -0,0 +1,195 @@
> +SUMMARY =3D "Updates the NVD CVE database"
> +LICENSE =3D "MIT"
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +inherit native
> +
> +deltask do_unpack
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +
> +python () {
> +    if not d.getVar("CVE_CHECK_DB_FILE"):
> +        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is
> not loaded.")
> +}
> +
> +python do_populate_cve_db() {
> +    """
> +    Update NVD database with json data feed
> +    """
> +
> +    import sqlite3, urllib, urllib.parse, shutil, gzip
> +    from datetime import date
> +
> +    BASE_URL =3D "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
> +    YEAR_START =3D 2002
> +
> +    db_dir =3D os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
> +    db_file =3D os.path.join(db_dir, 'nvdcve_1.0.db')
> +    json_tmpfile =3D os.path.join(db_dir, 'nvd.json.gz')
> +    proxy =3D d.getVar("https_proxy")
> +
> +    if proxy:
> +        # instantiate an opener but do not install it as the global
> +        # opener unless if we're really sure it's applicable for all
> +        # urllib requests
> +        proxy_handler =3D urllib.request.ProxyHandler({'https': proxy})
> +        proxy_opener =3D urllib.request.build_opener(proxy_handler)
> +    else:
> +        proxy_opener =3D None
> +
> +    cve_f =3D open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
> +
> +    if not os.path.isdir(db_dir):
> +        os.mkdir(db_dir)
> +
> +    # Connect to database
> +    conn =3D sqlite3.connect(db_file)
> +    c =3D conn.cursor()
> +
> +    initialize_db(c)
> +
> +    for year in range(YEAR_START, date.today().year + 1):
> +        year_url =3D BASE_URL + str(year)
> +        meta_url =3D year_url + ".meta"
> +        json_url =3D year_url + ".json.gz"
> +
> +        # Retrieve meta last modified date
> +
> +        response =3D None
> +
> +        if proxy_opener:
> +            response =3D proxy_opener.open(meta_url)
> +        else:
> +            req =3D urllib.request.Request(meta_url)
> +            response =3D urllib.request.urlopen(req)
> +
> +        if response:
> +            for l in response.read().decode("utf-8").splitlines():
> +                key, value =3D l.split(":", 1)
> +                if key =3D=3D "lastModifiedDate":
> +                    last_modified =3D value
> +                    break
> +            else:
> +                bb.warn("Cannot parse CVE metadata, update failed")
> +                return
> +
> +        # Compare with current db last modified date
> +        c.execute("select DATE from META where YEAR =3D ?", (year,))
> +        meta =3D c.fetchone()
> +        if not meta or meta[0] !=3D last_modified:
> +            # Clear products table entries corresponding to current year
> +            c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%=
'
> % year,))
> +
> +            # Update db with current year json file
> +            try:
> +                if proxy_opener:
> +                    response =3D proxy_opener.open(json_url)
> +                else:
> +                    req =3D urllib.request.Request(json_url)
> +                    response =3D urllib.request.urlopen(req)
> +
> +                if response:
> +                    update_db(c,
> gzip.decompress(response.read()).decode('utf-8'))
> +                c.execute("insert or replace into META values (?, ?)",
> [year, last_modified])
> +            except urllib.error.URLError as e:
> +                cve_f.write('Warning: CVE db update error, CVE data is
> outdated.\n\n')
> +                bb.warn("Cannot parse CVE data (%s), update failed" %
> e.reason)
> +                return
> +
> +        # Update success, set the date to cve_check file.
> +        if year =3D=3D date.today().year:
> +            cve_f.write('CVE database update : %s\n\n' % date.today())
> +
> +    cve_f.close()
> +    conn.commit()
> +    conn.close()
> +}
> +
> +def initialize_db(c):
> +    c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DAT=
E
> TEXT)")
> +    c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY
> TEXT, \
> +        SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
> +    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
> +        VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START
> TEXT, \
> +        VERSION_END TEXT, OPERATOR_END TEXT)")
> +
> +def parse_node_and_insert(c, node, cveId):
> +    # Parse children node if needed
> +    for child in node.get('children', ()):
> +        parse_node_and_insert(c, child, cveId)
> +
> +    def cpe_generator():
> +        for cpe in node.get('cpe_match', ()):
> +            if not cpe['vulnerable']:
> +                return
> +            cpe23 =3D cpe['cpe23Uri'].split(':')
> +            vendor =3D cpe23[3]
> +            product =3D cpe23[4]
> +            version =3D cpe23[5]
> +
> +            if version !=3D '*':
> +                # Version is defined, this is a '=3D' match
> +                yield [cveId, vendor, product, version, '=3D', '', '']
> +            else:
> +                # Parse start version, end version and operators
> +                op_start =3D ''
> +                op_end =3D ''
> +                v_start =3D ''
> +                v_end =3D ''
> +
> +                if 'versionStartIncluding' in cpe:
> +                    op_start =3D '>=3D'
> +                    v_start =3D cpe['versionStartIncluding']
> +
> +                if 'versionStartExcluding' in cpe:
> +                    op_start =3D '>'
> +                    v_start =3D cpe['versionStartExcluding']
> +
> +                if 'versionEndIncluding' in cpe:
> +                    op_end =3D '<=3D'
> +                    v_end =3D cpe['versionEndIncluding']
> +
> +                if 'versionEndExcluding' in cpe:
> +                    op_end =3D '<'
> +                    v_end =3D cpe['versionEndExcluding']
> +
> +                yield [cveId, vendor, product, v_start, op_start, v_end,
> op_end]
> +
> +    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)",
> cpe_generator())
> +
> +def update_db(c, jsondata):
> +    import json
> +    root =3D json.loads(jsondata)
> +
> +    for elt in root['CVE_Items']:
> +        if not elt['impact']:
> +            continue
> +
> +        cveId =3D elt['cve']['CVE_data_meta']['ID']
> +        cveDesc =3D
> elt['cve']['description']['description_data'][0]['value']
> +        date =3D elt['lastModifiedDate']
> +        accessVector =3D
> elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> +        cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> +
> +        try:
> +            cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScor=
e']
> +        except:
> +            cvssv3 =3D 0.0
> +
> +        c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)"=
,
> +                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
> +
> +        configurations =3D elt['configurations']['nodes']
> +        for config in configurations:
> +            parse_node_and_insert(c, config, cveId)
> +
> +
> +addtask do_populate_cve_db before do_fetch
> +do_populate_cve_db[nostamp] =3D "1"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> deleted file mode 100644
> index 1c84fb1cf2d..00000000000
> --- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -SUMMARY =3D "cve-check-tool"
> -DESCRIPTION =3D "cve-check-tool is a tool for checking known (public) CV=
Es.\
> -The tool will identify potentially vunlnerable software packages within
> Linux distributions through version matching."
> -HOMEPAGE =3D "https://github.com/ikeydoherty/cve-check-tool"
> -SECTION =3D "Development/Tools"
> -LICENSE =3D "GPL-2.0+"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De8c1458438ead3c34974bc0be3a03=
ed6"
> -
> -SRC_URI =3D "
> https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.=
xz
> \
> -           file://check-for-malloc_trim-before-using-it.patch \
> -
>  file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
> -
>  file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
> -
>  file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
> -           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "c5f4247140fc9be3bf41491d31a34155"
> -SRC_URI[sha256sum] =3D
> "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
> -
> -UPSTREAM_CHECK_URI =3D "
> https://github.com/ikeydoherty/cve-check-tool/releases"
> -
> -DEPENDS =3D "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl
> ca-certificates"
> -
> -RDEPENDS_${PN} =3D "ca-certificates"
> -
> -inherit pkgconfig autotools
> -
> -EXTRA_OECONF =3D "--disable-coverage --enable-relative-plugins"
> -CFLAGS_append =3D " -Wno-error=3Dpedantic"
> -
> -do_populate_cve_db() {
> -    if [ "${BB_NO_NETWORK}" =3D "1" ] ; then
> -        bbwarn "BB_NO_NETWORK is set; Can't update cve-check-tool
> database, new CVEs won't be detected"
> -        return
> -    fi
> -
> -    # In case we don't inherit cve-check class, use default values
> defined in the class.
> -    cve_dir=3D"${CVE_CHECK_DB_DIR}"
> -    cve_file=3D"${CVE_CHECK_TMP_FILE}"
> -
> -    [ -z "${cve_dir}" ] && cve_dir=3D"${DL_DIR}/CVE_CHECK"
> -    [ -z "${cve_file}" ] && cve_file=3D"${TMPDIR}/cve_check"
> -
> -    unused=3D"${@bb.utils.export_proxies(d)}"
> -    bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
> -    # --cacert works around curl-native not finding the CA bundle
> -    if cve-check-update --cacert
> ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
> -        printf "CVE database was updated on %s UTC\n\n" "$(LANG=3DC date
> --utc +'%F %T')" > "$cve_file"
> -    else
> -        bbwarn "Error in executing cve-check-update"
> -        if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}=
"
> -ne 0 ] ; then
> -            bbwarn "Failed to update cve-check-tool database, CVEs won't
> be checked"
> -        fi
> -    fi
> -}
> -
> -addtask populate_cve_db after do_populate_sysroot
> -do_populate_cve_db[depends] =3D "cve-check-tool-native:do_populate_sysro=
ot"
> -do_populate_cve_db[nostamp] =3D "1"
> -do_populate_cve_db[progress] =3D "percent"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allo=
cated-by-sqlite.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allo=
cated-by-sqlite.patch
> deleted file mode 100644
> index 4a82cf2dded..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allo=
cated-by-sqlite.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Thu, 13 Apr 2017 23:09:52 +0200
> -Subject: [PATCH] Fix freeing memory allocated by sqlite
> -
> -Upstream-Status: Backport
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - src/core.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/core.c b/src/core.c
> -index 6263031..6788f16 100644
> ---- a/src/core.c
> -+++ b/src/core.c
> -@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
> -         if (rc !=3D SQLITE_OK) {
> -                 fprintf(stderr, "ensure_table(): %s\n", err);
> --                free(err);
> -+                sqlite3_free(err);
> -                 return false;
> -         }
> -
> -@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
> -         if (rc !=3D SQLITE_OK) {
> -                 fprintf(stderr, "ensure_table(): %s\n", err);
> --                free(err);
> -+                sqlite3_free(err);
> -                 return false;
> -         }
> -
> -@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
> -         rc =3D sqlite3_exec(self->db, query, NULL, NULL, &err);
> -         if (rc !=3D SQLITE_OK) {
> -                 fprintf(stderr, "ensure_table(): %s\n", err);
> --                free(err);
> -+                sqlite3_free(err);
> -                 return false;
> -         }
> -         if (err) {
> --                free(err);
> -+                sqlite3_free(err);
> -         }
> -
> -         return true;
> ---
> -2.1.4
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-d=
efault-CA-certificate-file.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-d=
efault-CA-certificate-file.patch
> deleted file mode 100644
> index 3d8ebd1bd26..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-d=
efault-CA-certificate-file.patch
> +++ /dev/null
> @@ -1,215 +0,0 @@
> -From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Thu, 9 Feb 2017 14:51:28 +0200
> -Subject: [PATCH] curl: allow overriding default CA certificate file
> -
> -Similar to curl, --cacert can now be used in cve-check-tool and
> -cve-check-update to override the default CA certificate file. Useful
> -in cases where the system default is unsuitable (for example,
> -out-dated) or broken (as in OE's current native libcurl, which embeds
> -a path string from one build host and then uses it on another although
> -the right path may have become something different).
> -
> -Upstream-Status: Submitted [
> https://github.com/ikeydoherty/cve-check-tool/pull/45]
> -
> -Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> -
> -
> -Took Patrick Ohlys original patch from meta-security-isafw, rebased
> -on top of other patches.
> -
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - src/library/cve-check-tool.h |  1 +
> - src/library/fetch.c          | 10 +++++++++-
> - src/library/fetch.h          |  3 ++-
> - src/main.c                   |  5 ++++-
> - src/update-main.c            |  4 +++-
> - src/update.c                 | 12 +++++++-----
> - src/update.h                 |  2 +-
> - 7 files changed, 27 insertions(+), 10 deletions(-)
> -
> -diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h
> -index e4bb5b1..f89eade 100644
> ---- a/src/library/cve-check-tool.h
> -+++ b/src/library/cve-check-tool.h
> -@@ -43,6 +43,7 @@ typedef struct CveCheckTool {
> -     bool bugs;                          /**<Whether bug tracking is
> enabled */
> -     GHashTable *mapping;                /**<CVE Mapping */
> -     const char *output_file;            /**<Output file, if any */
> -+    const char *cacert_file;            /**<Non-default SSL certificate
> file, if any */
> - } CveCheckTool;
> -
> - /**
> -diff --git a/src/library/fetch.c b/src/library/fetch.c
> -index 0fe6d76..8f998c3 100644
> ---- a/src/library/fetch.c
> -+++ b/src/library/fetch.c
> -@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t
> dltotal, curl_off_t dlnow
> - }
> -
> - FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> --                      unsigned int start_percent, unsigned int
> end_percent)
> -+                      unsigned int start_percent, unsigned int
> end_percent,
> -+                      const char *cacert_file)
> - {
> -         FetchStatus ret =3D FETCH_STATUS_FAIL;
> -         CURLcode res;
> -@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char
> *target, bool verbose,
> -                 return ret;
> -         }
> -
> -+        if (cacert_file) {
> -+                res =3D curl_easy_setopt(curl, CURLOPT_CAINFO,
> cacert_file);
> -+                if (res !=3D CURLE_OK) {
> -+                        goto bail;
> -+                }
> -+        }
> -+
> -         if (stat(target, &st) =3D=3D 0) {
> -                 res =3D curl_easy_setopt(curl, CURLOPT_TIMECONDITION,
> CURL_TIMECOND_IFMODSINCE);
> -                 if (res !=3D CURLE_OK) {
> -diff --git a/src/library/fetch.h b/src/library/fetch.h
> -index 4cce5d1..836c7d7 100644
> ---- a/src/library/fetch.h
> -+++ b/src/library/fetch.h
> -@@ -29,7 +29,8 @@ typedef enum {
> -  * @return A FetchStatus, indicating the operation taken
> -  */
> - FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> --                      unsigned int this_percent, unsigned int
> next_percent);
> -+                      unsigned int this_percent, unsigned int
> next_percent,
> -+                      const char *cacert_file);
> -
> - /**
> -  * Attempt to extract the given gzipped file
> -diff --git a/src/main.c b/src/main.c
> -index 8e6f158..ae69d47 100644
> ---- a/src/main.c
> -+++ b/src/main.c
> -@@ -280,6 +280,7 @@ static bool csv_mode =3D false;
> - static char *modified_stamp =3D NULL;
> - static gchar *mapping_file =3D NULL;
> - static gchar *output_file =3D NULL;
> -+static gchar *cacert_file =3D NULL;
> -
> - static GOptionEntry _entries[] =3D {
> -         { "not-patched", 'n', 0, G_OPTION_ARG_NONE, &hide_patched, "Hid=
e
> patched/addressed CVEs", NULL },
> -@@ -294,6 +295,7 @@ static GOptionEntry _entries[] =3D {
> -         { "csv", 'c', 0, G_OPTION_ARG_NONE, &csv_mode, "Output CSV
> formatted data only", NULL },
> -         { "mapping", 'M', 0, G_OPTION_ARG_STRING, &mapping_file, "Path
> to a mapping file", NULL},
> -         { "output-file", 'o', 0, G_OPTION_ARG_STRING, &output_file,
> "Path to the output file (output plugin specific)", NULL},
> -+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &cacert_file, "Path to
> the combined SSL certificates file (system default is used if not set)",
> NULL},
> -         { .short_name =3D 0 }
> - };
> -
> -@@ -492,6 +494,7 @@ int main(int argc, char **argv)
> -
> -         quiet =3D csv_mode || !no_html;
> -         self->output_file =3D output_file;
> -+        self->cacert_file =3D cacert_file;
> -
> -         if (!csv_mode && self->output_file) {
> -                 quiet =3D false;
> -@@ -530,7 +533,7 @@ int main(int argc, char **argv)
> -                 if (status) {
> -                         fprintf(stderr, "Update of db forced\n");
> -                         cve_db_unlock();
> --                        if (!update_db(quiet, db_path->str)) {
> -+                        if (!update_db(quiet, db_path->str,
> self->cacert_file)) {
> -                                 fprintf(stderr, "DB update failure\n");
> -                                 goto cleanup;
> -                         }
> -diff --git a/src/update-main.c b/src/update-main.c
> -index 2379cfa..c52d9d0 100644
> ---- a/src/update-main.c
> -+++ b/src/update-main.c
> -@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of th=
e
> License, or\n\
> - static gchar *nvds =3D NULL;
> - static bool _show_version =3D false;
> - static bool _quiet =3D false;
> -+static const char *_cacert_file =3D NULL;
> -
> - static GOptionEntry _entries[] =3D {
> -         { "nvd-dir", 'd', 0, G_OPTION_ARG_STRING, &nvds, "NVD directory
> in filesystem", NULL },
> -         { "version", 'v', 0, G_OPTION_ARG_NONE, &_show_version, "Show
> version", NULL },
> -         { "quiet", 'q', 0, G_OPTION_ARG_NONE, &_quiet, "Run silently",
> NULL },
> -+        { "cacert", 'C', 0, G_OPTION_ARG_STRING, &_cacert_file, "Path t=
o
> the combined SSL certificates file (system default is used if not set)",
> NULL},
> -         { .short_name =3D 0 }
> - };
> -
> -@@ -88,7 +90,7 @@ int main(int argc, char **argv)
> -                 goto end;
> -         }
> -
> --        if (update_db(_quiet, db_path->str)) {
> -+        if (update_db(_quiet, db_path->str, _cacert_file)) {
> -                 ret =3D EXIT_SUCCESS;
> -         } else {
> -                 fprintf(stderr, "Failed to update database\n");
> -diff --git a/src/update.c b/src/update.c
> -index 070560a..8cb4a39 100644
> ---- a/src/update.c
> -+++ b/src/update.c
> -@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char
> *update_fname, bool ok)
> -
> - static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
> -                            bool db_exist, bool verbose,
> --                           unsigned int this_percent, unsigned int
> next_percent)
> -+                           unsigned int this_percent, unsigned int
> next_percent,
> -+                           const char *cacert_file)
> - {
> -         const char nvd_uri[] =3D URI_PREFIX;
> -         autofree(cve_string) *uri_meta =3D NULL;
> -@@ -331,14 +332,14 @@ refetch:
> -         }
> -
> -         /* Fetch NVD META file */
> --        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose,
> this_percent, this_percent);
> -+        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose,
> this_percent, this_percent, cacert_file);
> -         if (st =3D=3D FETCH_STATUS_FAIL) {
> -                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
> -                 return -1;
> -         }
> -
> -         /* Fetch NVD XML file */
> --        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
,
> this_percent, next_percent);
> -+        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
,
> this_percent, next_percent, cacert_file);
> -         switch (st) {
> -         case FETCH_STATUS_FAIL:
> -                 fprintf(stderr, "Failed to fetch %s\n",
> uri_data_gz->str);
> -@@ -391,7 +392,7 @@ refetch:
> -         return 0;
> - }
> -
> --bool update_db(bool quiet, const char *db_file)
> -+bool update_db(bool quiet, const char *db_file, const char *cacert_file=
)
> - {
> -         autofree(char) *db_dir =3D NULL;
> -         autofree(CveDB) *cve_db =3D NULL;
> -@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)
> -                 if (!quiet)
> -                         fprintf(stderr, "completed: %u%%\r",
> start_percent);
> -                 rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !qu=
iet,
> --                                     start_percent, end_percent);
> -+                                     start_percent, end_percent,
> -+                                     cacert_file);
> -                 switch (rc) {
> -                 case 0:
> -                         if (!quiet)
> -diff --git a/src/update.h b/src/update.h
> -index b8e9911..ceea0c3 100644
> ---- a/src/update.h
> -+++ b/src/update.h
> -@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);
> -
> - int update_required(const char *db_file);
> -
> --bool update_db(bool quiet, const char *db_file);
> -+bool update_db(bool quiet, const char *db_file, const char *cacert_file=
);
> -
> -
> - /*
> ---
> -2.1.4
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-perce=
nt-when-downloading-CVE-db.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-perce=
nt-when-downloading-CVE-db.patch
> deleted file mode 100644
> index 8ea6f686e3f..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-perce=
nt-when-downloading-CVE-db.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
> -Date: Mon, 26 Sep 2016 12:12:41 +0100
> -Subject: [PATCH] print progress in percent when downloading CVE db
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Pending
> -Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ----
> - src/library/fetch.c | 28 +++++++++++++++++++++++++++-
> - src/library/fetch.h |  3 ++-
> - src/update.c        | 16 ++++++++++++----
> - 3 files changed, 41 insertions(+), 6 deletions(-)
> -
> -diff --git a/src/library/fetch.c b/src/library/fetch.c
> -index 06d4b30..0fe6d76 100644
> ---- a/src/library/fetch.c
> -+++ b/src/library/fetch.c
> -@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size,
> size_t nmemb, struct fetch_t *f
> -         return fwrite(ptr, size, nmemb, f->f);
> - }
> -
> --FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
)
> -+struct percent_t {
> -+        unsigned int start;
> -+        unsigned int end;
> -+};
> -+
> -+static int progress_callback_new(void *ptr, curl_off_t dltotal,
> curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
> -+{
> -+        (void) ultotal;
> -+        (void) ulnow;
> -+
> -+        struct percent_t *percent =3D (struct percent_t *) ptr;
> -+
> -+        if (dltotal && percent && percent->end >=3D percent->start) {
> -+                unsigned int diff =3D percent->end - percent->start;
> -+                if (diff) {
> -+                        fprintf(stderr,"completed:
> %"CURL_FORMAT_CURL_OFF_T"%%\r", percent->start + (diff * dlnow / dltotal)=
);
> -+                }
> -+        }
> -+
> -+        return 0;
> -+}
> -+
> -+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> -+                      unsigned int start_percent, unsigned int
> end_percent)
> - {
> -         FetchStatus ret =3D FETCH_STATUS_FAIL;
> -         CURLcode res;
> -         struct stat st;
> -         CURL *curl =3D NULL;
> -         struct fetch_t *f =3D NULL;
> -+        struct percent_t percent =3D { .start =3D start_percent, .end =
=3D
> end_percent };
> -
> -         curl =3D curl_easy_init();
> -         if (!curl) {
> -@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char
> *target, bool verbose)
> -         }
> -         if (verbose) {
> -                 (void)curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0L);
> -+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFODATA,
> &percent);
> -+                (void)curl_easy_setopt(curl, CURLOPT_XFERINFOFUNCTION,
> progress_callback_new);
> -         }
> -         res =3D curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,
> (curl_write_callback)write_func);
> -         if (res !=3D CURLE_OK) {
> -diff --git a/src/library/fetch.h b/src/library/fetch.h
> -index 70c3779..4cce5d1 100644
> ---- a/src/library/fetch.h
> -+++ b/src/library/fetch.h
> -@@ -28,7 +28,8 @@ typedef enum {
> -  * @param verbose Whether to be verbose
> -  * @return A FetchStatus, indicating the operation taken
> -  */
> --FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
);
> -+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose=
,
> -+                      unsigned int this_percent, unsigned int
> next_percent);
> -
> - /**
> -  * Attempt to extract the given gzipped file
> -diff --git a/src/update.c b/src/update.c
> -index 30fbe96..eaeeefd 100644
> ---- a/src/update.c
> -+++ b/src/update.c
> -@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char
> *update_fname, bool ok)
> - }
> -
> - static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,
> --                           bool db_exist, bool verbose)
> -+                           bool db_exist, bool verbose,
> -+                           unsigned int this_percent, unsigned int
> next_percent)
> - {
> -         const char nvd_uri[] =3D URI_PREFIX;
> -         autofree(cve_string) *uri_meta =3D NULL;
> -@@ -330,14 +331,14 @@ refetch:
> -         }
> -
> -         /* Fetch NVD META file */
> --        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose);
> -+        st =3D fetch_uri(uri_meta->str, nvdcve_meta->str, verbose,
> this_percent, this_percent);
> -         if (st =3D=3D FETCH_STATUS_FAIL) {
> -                 fprintf(stderr, "Failed to fetch %s\n", uri_meta->str);
> -                 return -1;
> -         }
> -
> -         /* Fetch NVD XML file */
> --        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
);
> -+        st =3D fetch_uri(uri_data_gz->str, nvdcve_data_gz->str, verbose=
,
> this_percent, next_percent);
> -         switch (st) {
> -         case FETCH_STATUS_FAIL:
> -                 fprintf(stderr, "Failed to fetch %s\n",
> uri_data_gz->str);
> -@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)
> -         for (int i =3D YEAR_START; i <=3D year+1; i++) {
> -                 int y =3D i > year ? -1 : i;
> -                 int rc;
> -+                unsigned int start_percent =3D ((i+0 - YEAR_START) * 10=
0)
> / (year+2 - YEAR_START);
> -+                unsigned int end_percent =3D ((i+1 - YEAR_START) * 100)=
 /
> (year+2 - YEAR_START);
> -
> --                rc =3D do_fetch_update(y, db_dir, cve_db, db_exist,
> !quiet);
> -+                if (!quiet)
> -+                        fprintf(stderr, "completed: %u%%\r",
> start_percent);
> -+                rc =3D do_fetch_update(y, db_dir, cve_db, db_exist, !qu=
iet,
> -+                                     start_percent, end_percent);
> -                 switch (rc) {
> -                 case 0:
> -+                        if (!quiet)
> -+                                fprintf(stderr,"completed: %u%%\r",
> end_percent);
> -                         continue;
> -                 case ENOMEM:
> -                         goto oom;
> ---
> -2.9.3
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed=
-vs-expected-sha256-digit-str.patch
> b/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed=
-vs-expected-sha256-digit-str.patch
> deleted file mode 100644
> index 458c0cc84e5..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-computed=
-vs-expected-sha256-digit-str.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001
> -From: Sergey Popovich <popovich_sergei@mail.ua>
> -Date: Fri, 21 Apr 2017 07:32:23 -0700
> -Subject: [PATCH] update: Compare computed vs expected sha256 digit strin=
g
> - ignoring case
> -
> -We produce sha256 digest string using %x snprintf()
> -qualifier for each byte of digest which uses alphabetic
> -characters from "a" to "f" in lower case to represent
> -integer values from 10 to 15.
> -
> -Previously all of the NVD META files supply sha256
> -digest string for corresponding XML file in lower case.
> -
> -However due to some reason this changed recently to
> -provide digest digits in upper case causing fetched
> -data consistency checks to fail. This prevents database
> -from being updated periodically.
> -
> -While commit c4f6e94 (update: Do not treat sha256 failure
> -as fatal if requested) adds useful option to skip
> -digest validation at all and thus provides workaround for
> -this situation, it might be unacceptable for some
> -deployments where we need to ensure that downloaded
> -data is consistent before start parsing it and update
> -SQLite database.
> -
> -Use strcasecmp() to compare two digest strings case
> -insensitively and addressing this case.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Sergey Popovich <popovich_sergei@mail.ua>
> ----
> - src/update.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/update.c b/src/update.c
> -index 8588f38..3cc6b67 100644
> ---- a/src/update.c
> -+++ b/src/update.c
> -@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const
> char *data)
> -                 snprintf(&csum_data[idx], len, "%02hhx", digest[i]);
> -         }
> -
> --        ret =3D streq(csum_meta, csum_data);
> -+        ret =3D !strcasecmp(csum_meta, csum_data);
> -
> - err_unmap:
> -         munmap(buffer, length);
> ---
> -2.11.0
> -
> diff --git
> a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before=
-using-it.patch
> b/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before=
-using-it.patch
> deleted file mode 100644
> index 0774ad946a4..00000000000
> ---
> a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before=
-using-it.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 22 Aug 2016 22:54:24 -0700
> -Subject: [PATCH] Check for malloc_trim before using it
> -
> -malloc_trim is gnu specific and not all libc
> -implement it, threfore write a configure check
> -to poke for it first and use the define to
> -guard its use.
> -
> -Helps in compiling on musl based systems
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted [
> https://github.com/ikeydoherty/cve-check-tool/pull/48]
> - configure.ac | 2 ++
> - src/core.c   | 4 ++--
> - 2 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index d3b66ce..79c3542 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])
> - m4_define([openssl_required_version],[1.0.0])
> - # TODO: Set minimum sqlite
> -
> -+AC_CHECK_FUNCS_ONCE(malloc_trim)
> -+
> - PKG_CHECK_MODULES(CVE_CHECK_TOOL,
> -                  [
> -                   glib-2.0 >=3D glib_required_version,
> -diff --git a/src/core.c b/src/core.c
> -index 6263031..0d5df29 100644
> ---- a/src/core.c
> -+++ b/src/core.c
> -@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)
> -         }
> -
> -         b =3D true;
> --
> -+#ifdef HAVE_MALLOC_TRIM
> -         malloc_trim(0);
> --
> -+#endif
> -         xmlFreeTextReader(r);
> -         if (fd) {
> -                 close(fd);
> ---
> -2.9.3
> -
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000099b5590596aecb25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross/Richard,</div><div><br></div><div>I&#39;d lik=
e this applied to Sumo also. Should I create a new patch and send it to the=
 list, or is there a process for requesting this is cherry-picked across?</=
div><div><br></div><div>Thanks,</div><div>Ryan.</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 25 Sep 2019 at 13:24=
, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@inte=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">As detailed at [1] the XML feeds provided by NIST are being discontinu=
ed on<br>
October 9th 2019.=C2=A0 As cve-check-tool uses these feeds, cve-check.bbcla=
ss will be<br>
inoperable after this date.<br>
<br>
To ensure that cve-check continues working, backport the following commits =
from<br>
master to move away from the unmaintained cve-check-tool to our own Python =
code<br>
that fetches the JSON:<br>
<br>
546d14135c5 cve-update-db: New recipe to update CVE database<br>
bc144b028f6 cve-check: Remove dependency to cve-check-tool-native<br>
7f62a20b32a cve-check: Manage CVE_PRODUCT with more than one name<br>
3bf63bc6084 cve-check: Consider CVE that affects versions with less than op=
erator<br>
c0eabd30d7b cve-update-db: Use std library instead of urllib3<br>
27eb839ee65 cve-check: be idiomatic<br>
09be21f4d17 cve-update-db: Manage proxy if needed.<br>
975793e3825 cve-update-db: do_populate_cve_db depends on do_fetch<br>
0325dd72714 cve-update-db: Catch request.urlopen errors.<br>
4078da92b49 cve-check: Depends on cve-update-db-native<br>
f7676e9a38d cve-update-db: Use NVD CPE data to populate PRODUCTS table<br>
bc0195be1b1 cve-check: Update unpatched CVE matching<br>
c807c2a6409 cve-update-db-native: Skip recipe when cve-check class is not l=
oaded.<br>
07bb8b25e17 cve-check: remove redundant readline CVE whitelisting<br>
5388ed6d137 cve-check-tool: remove<br>
270ac00cb43 cve-check.bbclass: initialize to_append<br>
e6bf9000987 cve-check: allow comparison of Vendor as well as Product<br>
91770338f76 cve-update-db-native: use SQL placeholders instead of format st=
rings<br>
7069302a4cc cve-check: Replace CVE_CHECK_CVE_WHITELIST by CVE_CHECK_WHITELI=
ST<br>
78de2cb39d7 cve-update-db-native: Remove hash column from database.<br>
4b301030cf9 cve-update-db-native: use os.path.join instead of +<br>
f0d822fad2a cve-update-db: actually inherit native<br>
b309840b6aa cve-update-db-native: use executemany() to optimise CPE inserti=
on<br>
bb4e53af33d cve-update-db-native: improve metadata parsing<br>
94227459792 cve-update-db-native: clean up JSON fetching<br>
95438d52b73 cve-update-db-native: fix https proxy issues<br>
1f9a963b9ff glibc: exclude child recipes from CVE scanning<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/General/News/XML-Vulnerability-Feed-Ret=
irement" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/General/=
News/XML-Vulnerability-Feed-Retirement</a><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 142 +++++++-----<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0meta/recipes-core/glibc/glibc-locale.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
=C2=A0meta/recipes-core/glibc/glibc-mtrace.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
=C2=A0meta/recipes-core/glibc/glibc-scripts.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0.../recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> | 195 +++++++=
+++++++++<br>
=C2=A0.../cve-check-tool/<a href=3D"http://cve-check-tool_5.6.4.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-check-tool_5.6.4.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 62 -----<br>
=C2=A0...x-freeing-memory-allocated-by-sqlite.patch |=C2=A0 50 ----<br>
=C2=A0...erriding-default-CA-certificate-file.patch | 215 -----------------=
-<br>
=C2=A0...s-in-percent-when-downloading-CVE-db.patch | 135 -----------<br>
=C2=A0...omputed-vs-expected-sha256-digit-str.patch |=C2=A0 52 -----<br>
=C2=A0...heck-for-malloc_trim-before-using-it.patch |=C2=A0 51 -----<br>
=C2=A012 files changed, 292 insertions(+), 620 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/meta/<a href=3D"http://cve-updat=
e-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.b=
b</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/<a href=3D"ht=
tp://cve-check-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-chec=
k-tool_5.6.4.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fi=
x-freeing-memory-allocated-by-sqlite.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-cu=
rl-allow-overriding-default-CA-certificate-file.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-pr=
int-progress-in-percent-when-downloading-CVE-db.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-up=
date-Compare-computed-vs-expected-sha256-digit-str.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-f=
or-malloc_trim-before-using-it.patch<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 743bc08a4f9..c00d2910be1 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -26,7 +26,7 @@ CVE_PRODUCT ??=3D &quot;${BPN}&quot;<br>
=C2=A0CVE_VERSION ??=3D &quot;${PV}&quot;<br>
<br>
=C2=A0CVE_CHECK_DB_DIR ?=3D &quot;${DL_DIR}/CVE_CHECK&quot;<br>
-CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/nvd.db&quot;<br>
+CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/nvdcve_1.0.db&quot;<br>
<br>
=C2=A0CVE_CHECK_LOG ?=3D &quot;${T}/cve.log&quot;<br>
=C2=A0CVE_CHECK_TMP_FILE ?=3D &quot;${TMPDIR}/cve_check&quot;<br>
@@ -37,32 +37,33 @@ CVE_CHECK_COPY_FILES ??=3D &quot;1&quot;<br>
=C2=A0CVE_CHECK_CREATE_MANIFEST ??=3D &quot;1&quot;<br>
<br>
=C2=A0# Whitelist for packages (PN)<br>
-CVE_CHECK_PN_WHITELIST =3D &quot;\<br>
-=C2=A0 =C2=A0 glibc-locale \<br>
-&quot;<br>
+CVE_CHECK_PN_WHITELIST ?=3D &quot;&quot;<br>
<br>
-# Whitelist for CVE and version of package<br>
-CVE_CHECK_CVE_WHITELIST =3D &quot;{\<br>
-=C2=A0 =C2=A0 &#39;CVE-2014-2524&#39;: (&#39;6.3&#39;,&#39;5.2&#39;,), \<b=
r>
-}&quot;<br>
+# Whitelist for CVE. If a CVE is found, then it is considered patched.<br>
+# The value is a string containing space separated CVE values:<br>
+# <br>
+# CVE_CHECK_WHITELIST =3D &#39;CVE-2014-2524 CVE-2018-1234&#39;<br>
+# <br>
+CVE_CHECK_WHITELIST ?=3D &quot;&quot;<br>
<br>
=C2=A0python do_cve_check () {<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Check recipe for patched and unpatched CVEs<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_CHECK_TMP_FILE&quot;)):=
<br>
+=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_CHECK_DB_FILE&quot;)):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patched_cves =3D get_patches_cves(d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patched, unpatched =3D check_cves(d, patc=
hed_cves)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if patched or unpatched:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_data =3D get_cve_info(d=
, patched + unpatched)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_write_data(d, patched, =
unpatched, cve_data)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Failed to update CVE database, s=
kipping CVE check&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;No CVE database found, skipping =
CVE check&quot;)<br>
+<br>
=C2=A0}<br>
<br>
=C2=A0addtask cve_check after do_unpack before do_build<br>
-do_cve_check[depends] =3D &quot;cve-check-tool-native:do_populate_sysroot =
cve-check-tool-native:do_populate_cve_db&quot;<br>
+do_cve_check[depends] =3D &quot;cve-update-db-native:do_populate_cve_db&qu=
ot;<br>
=C2=A0do_cve_check[nostamp] =3D &quot;1&quot;<br>
<br>
=C2=A0python cve_check_cleanup () {<br>
@@ -163,65 +164,94 @@ def get_patches_cves(d):<br>
<br>
=C2=A0def check_cves(d, patched_cves):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Run cve-check-tool looking for patched and unpatched CVEs.<b=
r>
+=C2=A0 =C2=A0 Connect to the NVD database and find unpatched cves.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0import ast, csv, tempfile, subprocess, io<br>
+=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
<br>
-=C2=A0 =C2=A0 cves_patched =3D []<br>
=C2=A0 =C2=A0 =C2=A0cves_unpatched =3D []<br>
-=C2=A0 =C2=A0 bpn =3D d.getVar(&quot;CVE_PRODUCT&quot;)<br>
+=C2=A0 =C2=A0 # CVE_PRODUCT can contain more than one product (eg. curl/li=
bcurl)<br>
+=C2=A0 =C2=A0 products =3D d.getVar(&quot;CVE_PRODUCT&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0# If this has been unset then we&#39;re not scanning fo=
r CVEs here (for example, image recipes)<br>
-=C2=A0 =C2=A0 if not bpn:<br>
+=C2=A0 =C2=A0 if not products:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ([], [])<br>
=C2=A0 =C2=A0 =C2=A0pv =3D d.getVar(&quot;CVE_VERSION&quot;).split(&quot;+g=
it&quot;)[0]<br>
-=C2=A0 =C2=A0 cves =3D &quot; &quot;.join(patched_cves)<br>
-=C2=A0 =C2=A0 cve_db_dir =3D d.getVar(&quot;CVE_CHECK_DB_DIR&quot;)<br>
-=C2=A0 =C2=A0 cve_whitelist =3D ast.literal_eval(d.getVar(&quot;CVE_CHECK_=
CVE_WHITELIST&quot;))<br>
-=C2=A0 =C2=A0 cve_cmd =3D &quot;cve-check-tool&quot;<br>
-=C2=A0 =C2=A0 cmd =3D [cve_cmd, &quot;--no-html&quot;, &quot;--skip-update=
&quot;, &quot;--csv&quot;, &quot;--not-affected&quot;, &quot;-t&quot;, &quo=
t;faux&quot;, &quot;-d&quot;, cve_db_dir]<br>
<br>
=C2=A0 =C2=A0 =C2=A0# If the recipe has been whitlisted we return empty lis=
ts<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;PN&quot;) in d.getVar(&quot;CVE_CHECK=
_PN_WHITELIST&quot;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Recipe has been whitelisted=
, skipping check&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ([], [])<br>
<br>
-=C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Write the faux CSV file to be used with cve-=
check-tool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd, faux =3D tempfile.mkstemp(prefix=3D&quot;c=
ve-faux-&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with os.fdopen(fd, &quot;w&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for pn in bpn.split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s,%=
s,%s,\n&quot; % (pn, pv, cves))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.append(faux)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output(cmd).decode=
(&quot;utf-8&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Output of command %s:\n%s&qu=
ot; % (&quot;\n&quot;.join(cmd), output))<br>
-=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Couldn&#39;t check for CVEs: %s =
(output %s)&quot; % (e, e.output))<br>
-=C2=A0 =C2=A0 finally:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(faux)<br>
-<br>
-=C2=A0 =C2=A0 for row in csv.reader(io.StringIO(output)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Third row has the unpatched CVEs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if row[2]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in row[2].split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip if the CVE =
has been whitlisted for the current version<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pv in cve_white=
list.get(cve,[]):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.n=
ote(&quot;%s-%s has been whitelisted for %s&quot; % (bpn, pv, cve))<br>
+=C2=A0 =C2=A0 old_cve_whitelist =3D=C2=A0 d.getVar(&quot;CVE_CHECK_CVE_WHI=
TELIST&quot;)<br>
+=C2=A0 =C2=A0 if old_cve_whitelist:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;CVE_CHECK_CVE_WHITELIST is depre=
cated, please use CVE_CHECK_WHITELIST.&quot;)<br>
+=C2=A0 =C2=A0 cve_whitelist =3D d.getVar(&quot;CVE_CHECK_WHITELIST&quot;).=
split()<br>
+<br>
+=C2=A0 =C2=A0 import sqlite3<br>
+=C2=A0 =C2=A0 db_file =3D d.getVar(&quot;CVE_CHECK_DB_FILE&quot;)<br>
+=C2=A0 =C2=A0 conn =3D sqlite3.connect(db_file)<br>
+<br>
+=C2=A0 =C2=A0 for product in products:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D conn.cursor()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;:&quot; in product:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor, product =3D product.spli=
t(&quot;:&quot;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.execute(&quot;SELECT * FROM PR=
ODUCTS WHERE PRODUCT IS ? AND VENDOR IS ?&quot;, (product, vendor))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.execute(&quot;SELECT * FROM PR=
ODUCTS WHERE PRODUCT IS ?&quot;, (product,))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for row in c:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve =3D row[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version_start =3D row[3]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 operator_start =3D row[4]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version_end =3D row[5]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 operator_end =3D row[6]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve in cve_whitelist:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s-%=
s has been whitelisted for %s&quot; % (product, pv, cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cve in patched_cves:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s h=
as been patched&quot; % (cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_append =3D Fals=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (operator_start=
 =3D=3D &#39;=3D&#39; and pv =3D=3D version_start):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves=
_unpatched.append(cve)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if o=
perator_start:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_append_start =3D=C2=A0 (operator_start =3D=3D &=
#39;&gt;=3D&#39; and LooseVersion(pv) &gt;=3D LooseVersion(version_start))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_append_start |=3D (operator_start =3D=3D &#39;&=
gt;&#39; and LooseVersion(pv) &gt; LooseVersion(version_start))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s: Failed to compare %s %s %s for %=
s&quot; %<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (product, pv, operator=
_start, version_start, cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_append_start =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 to_append_start =3D False<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if o=
perator_end:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_append_end=C2=A0 =3D (operator_end =3D=3D &#39;=
&lt;=3D&#39; and LooseVersion(pv) &lt;=3D LooseVersion(version_end))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_append_end |=3D (operator_end =3D=3D &#39;&lt;&=
#39; and LooseVersion(pv) &lt; LooseVersion(version_end))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s: Failed to compare %s %s %s for %=
s&quot; %<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (product, pv, operator=
_end, version_end, cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to_append_end =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 to_append_end =3D False<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if o=
perator_start and operator_end:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 to_append =3D to_append_start and to_append_end<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 to_append =3D to_append_start or to_append_end<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if to_append:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cves_unpatched.append(cve)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.d=
ebug(2, &quot;%s-%s is not patched for %s&quot; % (bpn, pv, cve))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fourth row has patched CVEs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if row[3]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in row[3].split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves_patched.appen=
d(cve)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;=
%s-%s is patched for %s&quot; % (bpn, pv, cve))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;=
%s-%s is not patched for %s&quot; % (product, pv, cve))<br>
+=C2=A0 =C2=A0 conn.close()<br>
<br>
-=C2=A0 =C2=A0 return (cves_patched, cves_unpatched)<br>
+=C2=A0 =C2=A0 return (list(patched_cves), cves_unpatched)<br>
<br>
=C2=A0def get_cve_info(d, cves):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Get CVE information from the database used by cve-check-tool=
.<br>
+=C2=A0 =C2=A0 Get CVE information from the database.<br>
<br>
=C2=A0 =C2=A0 =C2=A0Unfortunately the only way to get CVE info is set the o=
utput to<br>
=C2=A0 =C2=A0 =C2=A0html (hard to parse) or query directly the database.<br=
>
@@ -241,9 +271,10 @@ def get_cve_info(d, cves):<br>
=C2=A0 =C2=A0 =C2=A0for row in cur.execute(query, tuple(cves)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_data[row[0]] =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_data[row[0]][&quot;summary&quot;] =3D=
 row[1]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;score&quot;] =3D row[2]=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;modified&quot;] =3D row=
[3]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;vector&quot;] =3D row[4=
]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;scorev2&quot;] =3D row[=
2]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;scorev3&quot;] =3D row[=
3]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;modified&quot;] =3D row=
[4]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[row[0]][&quot;vector&quot;] =3D row[5=
]<br>
=C2=A0 =C2=A0 =C2=A0conn.close()<br>
<br>
=C2=A0 =C2=A0 =C2=A0return cve_data<br>
@@ -270,7 +301,8 @@ def cve_write_data(d, patched, unpatched, cve_data):<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unpatched_cves.append(cve)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_string +=3D &quot;CVE=
 STATUS: Unpatched\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_string +=3D &quot;CVE SUMMARY: %s\n=
&quot; % cve_data[cve][&quot;summary&quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVSS v2 BASE SCORE: %s=
\n&quot; % cve_data[cve][&quot;score&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVSS v2 BASE SCORE: %s=
\n&quot; % cve_data[cve][&quot;scorev2&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVSS v3 BASE SCORE: %s=
\n&quot; % cve_data[cve][&quot;scorev3&quot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_string +=3D &quot;VECTOR: %s\n&quot=
; % cve_data[cve][&quot;vector&quot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_string +=3D &quot;MORE INFORMATION:=
 %s%s\n\n&quot; % (nvd_link, cve)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 672f0677922..c027901fdf0 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -116,6 +116,7 @@ RECIPE_MAINTAINER_pn-cryptodev-tests =3D &quot;Robert Y=
ang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liez=
hi.yang@windriver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-cups =3D &quot;Chen Qi &lt;<a href=3D"mailto:Qi.=
Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;&quot;<b=
r>
=C2=A0RECIPE_MAINTAINER_pn-curl =3D &quot;Armin Kuster &lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;&quot=
;<br>
=C2=A0RECIPE_MAINTAINER_pn-cve-check-tool =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-cve-update-db-native =3D &quot;Ross Burton &lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-cwautomacros =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-db =3D &quot;Mark Hatle &lt;<a href=3D"mailto:ma=
rk.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;&=
quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-dbus =3D &quot;Chen Qi &lt;<a href=3D"mailto:Qi.=
Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;&quot;<b=
r>
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/g=
libc/glibc-locale.inc<br>
index 1b676dc26e7..97d83cb856d 100644<br>
--- a/meta/recipes-core/glibc/glibc-locale.inc<br>
+++ b/meta/recipes-core/glibc/glibc-locale.inc<br>
@@ -95,3 +95,6 @@ do_install () {<br>
=C2=A0inherit libc-package<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+<br>
+# Don&#39;t scan for CVEs as glibc will be scanned<br>
+CVE_PRODUCT =3D &quot;&quot;<br>
diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/g=
libc/glibc-mtrace.inc<br>
index d703c14bdc1..ef9d60ec239 100644<br>
--- a/meta/recipes-core/glibc/glibc-mtrace.inc<br>
+++ b/meta/recipes-core/glibc/glibc-mtrace.inc<br>
@@ -11,3 +11,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d -m 0755 ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${SRC}/mtrace ${D}${bindir}/<br=
>
=C2=A0}<br>
+<br>
+# Don&#39;t scan for CVEs as glibc will be scanned<br>
+CVE_PRODUCT =3D &quot;&quot;<br>
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/=
glibc/glibc-scripts.inc<br>
index 2a2b41507ed..14a14e45126 100644<br>
--- a/meta/recipes-core/glibc/glibc-scripts.inc<br>
+++ b/meta/recipes-core/glibc/glibc-scripts.inc<br>
@@ -18,3 +18,6 @@ do_install() {<br>
=C2=A0# sotruss script requires sotruss-lib.so (given by libsotruss package=
), <br>
=C2=A0# to produce trace of the library calls.<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;libsotruss&quot;<br>
+<br>
+# Don&#39;t scan for CVEs as glibc will be scanned<br>
+CVE_PRODUCT =3D &quot;&quot;<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> b/meta=
/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=3D"norefe=
rrer" target=3D"_blank">cve-update-db-native.bb</a><br>
new file mode 100644<br>
index 00000000000..2c427a5884f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
@@ -0,0 +1,195 @@<br>
+SUMMARY =3D &quot;Updates the NVD CVE database&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+inherit native<br>
+<br>
+deltask do_unpack<br>
+deltask do_patch<br>
+deltask do_configure<br>
+deltask do_compile<br>
+deltask do_install<br>
+deltask do_populate_sysroot<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if not d.getVar(&quot;CVE_CHECK_DB_FILE&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Skip recipe wh=
en cve-check class is not loaded.&quot;)<br>
+}<br>
+<br>
+python do_populate_cve_db() {<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Update NVD database with json data feed<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 import sqlite3, urllib, urllib.parse, shutil, gzip<br>
+=C2=A0 =C2=A0 from datetime import date<br>
+<br>
+=C2=A0 =C2=A0 BASE_URL =3D &quot;<a href=3D"https://nvd.nist.gov/feeds/jso=
n/cve/1.0/nvdcve-1.0-" rel=3D"noreferrer" target=3D"_blank">https://nvd.nis=
t.gov/feeds/json/cve/1.0/nvdcve-1.0-</a>&quot;<br>
+=C2=A0 =C2=A0 YEAR_START =3D 2002<br>
+<br>
+=C2=A0 =C2=A0 db_dir =3D os.path.join(d.getVar(&quot;DL_DIR&quot;), &#39;C=
VE_CHECK&#39;)<br>
+=C2=A0 =C2=A0 db_file =3D os.path.join(db_dir, &#39;nvdcve_1.0.db&#39;)<br=
>
+=C2=A0 =C2=A0 json_tmpfile =3D os.path.join(db_dir, &#39;nvd.json.gz&#39;)=
<br>
+=C2=A0 =C2=A0 proxy =3D d.getVar(&quot;https_proxy&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if proxy:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # instantiate an opener but do not install it =
as the global<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # opener unless if we&#39;re really sure it&#3=
9;s applicable for all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # urllib requests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_handler =3D urllib.request.ProxyHandler(=
{&#39;https&#39;: proxy})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_opener =3D urllib.request.build_opener(p=
roxy_handler)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 proxy_opener =3D None<br>
+<br>
+=C2=A0 =C2=A0 cve_f =3D open(os.path.join(d.getVar(&quot;TMPDIR&quot;), &#=
39;cve_check&#39;), &#39;a&#39;)<br>
+<br>
+=C2=A0 =C2=A0 if not os.path.isdir(db_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(db_dir)<br>
+<br>
+=C2=A0 =C2=A0 # Connect to database<br>
+=C2=A0 =C2=A0 conn =3D sqlite3.connect(db_file)<br>
+=C2=A0 =C2=A0 c =3D conn.cursor()<br>
+<br>
+=C2=A0 =C2=A0 initialize_db(c)<br>
+<br>
+=C2=A0 =C2=A0 for year in range(YEAR_START, date.today().year + 1):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 year_url =3D BASE_URL + str(year)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_url =3D year_url + &quot;.meta&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 json_url =3D year_url + &quot;.json.gz&quot;<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Retrieve meta last modified date<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 response =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if proxy_opener:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response =3D proxy_opener.open(m=
eta_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D urllib.request.Request(m=
eta_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response =3D urllib.request.urlo=
pen(req)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if response:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in response.read().decode(=
&quot;utf-8&quot;).splitlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key, value =3D l.s=
plit(&quot;:&quot;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if key =3D=3D &quo=
t;lastModifiedDate&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last=
_modified =3D value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Cann=
ot parse CVE metadata, update failed&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Compare with current db last modified date<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c.execute(&quot;select DATE from META where YE=
AR =3D ?&quot;, (year,))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta =3D c.fetchone()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not meta or meta[0] !=3D last_modified:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clear products table entries c=
orresponding to current year<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.execute(&quot;delete from PROD=
UCTS where ID like ?&quot;, (&#39;CVE-%d%%&#39; % year,))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update db with current year js=
on file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if proxy_opener:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp=
onse =3D proxy_opener.open(json_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req =
=3D urllib.request.Request(json_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp=
onse =3D urllib.request.urlopen(req)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if response:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upda=
te_db(c, gzip.decompress(response.read()).decode(&#39;utf-8&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.execute(&quot;in=
sert or replace into META values (?, ?)&quot;, [year, last_modified])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except urllib.error.URLError as =
e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_f.write(&#39;W=
arning: CVE db update error, CVE data is outdated.\n\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Cann=
ot parse CVE data (%s), update failed&quot; % e.reason)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update success, set the date to cve_check fi=
le.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if year =3D=3D date.today().year:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_f.write(&#39;CVE database up=
date : %s\n\n&#39; % date.today())<br>
+<br>
+=C2=A0 =C2=A0 cve_f.close()<br>
+=C2=A0 =C2=A0 conn.commit()<br>
+=C2=A0 =C2=A0 conn.close()<br>
+}<br>
+<br>
+def initialize_db(c):<br>
+=C2=A0 =C2=A0 c.execute(&quot;CREATE TABLE IF NOT EXISTS META (YEAR INTEGE=
R UNIQUE, DATE TEXT)&quot;)<br>
+=C2=A0 =C2=A0 c.execute(&quot;CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQ=
UE, SUMMARY TEXT, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, =
VECTOR TEXT)&quot;)<br>
+=C2=A0 =C2=A0 c.execute(&quot;CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT=
, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT,=
 OPERATOR_START TEXT, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VERSION_END TEXT, OPERATOR_END TEXT)&quot;)<br=
>
+<br>
+def parse_node_and_insert(c, node, cveId):<br>
+=C2=A0 =C2=A0 # Parse children node if needed<br>
+=C2=A0 =C2=A0 for child in node.get(&#39;children&#39;, ()):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_insert(c, child, cveId)<br>
+<br>
+=C2=A0 =C2=A0 def cpe_generator():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cpe in node.get(&#39;cpe_match&#39;, ()):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cpe[&#39;vulnerable&#39;]=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpe23 =3D cpe[&#39;cpe23Uri&#39;=
].split(&#39;:&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendor =3D cpe23[3]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 product =3D cpe23[4]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D cpe23[5]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if version !=3D &#39;*&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Version is defin=
ed, this is a &#39;=3D&#39; match<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield [cveId, vend=
or, product, version, &#39;=3D&#39;, &#39;&#39;, &#39;&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Parse start vers=
ion, end version and operators<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op_start =3D &#39;=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op_end =3D &#39;&#=
39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v_start =3D &#39;&=
#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v_end =3D &#39;&#3=
9;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;versionSta=
rtIncluding&#39; in cpe:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op_s=
tart =3D &#39;&gt;=3D&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v_st=
art =3D cpe[&#39;versionStartIncluding&#39;]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;versionSta=
rtExcluding&#39; in cpe:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op_s=
tart =3D &#39;&gt;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v_st=
art =3D cpe[&#39;versionStartExcluding&#39;]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;versionEnd=
Including&#39; in cpe:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op_e=
nd =3D &#39;&lt;=3D&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v_en=
d =3D cpe[&#39;versionEndIncluding&#39;]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;versionEnd=
Excluding&#39; in cpe:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op_e=
nd =3D &#39;&lt;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v_en=
d =3D cpe[&#39;versionEndExcluding&#39;]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield [cveId, vend=
or, product, v_start, op_start, v_end, op_end]<br>
+<br>
+=C2=A0 =C2=A0 c.executemany(&quot;insert into PRODUCTS values (?, ?, ?, ?,=
 ?, ?, ?)&quot;, cpe_generator())<br>
+<br>
+def update_db(c, jsondata):<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 root =3D json.loads(jsondata)<br>
+<br>
+=C2=A0 =C2=A0 for elt in root[&#39;CVE_Items&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not elt[&#39;impact&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cveId =3D elt[&#39;cve&#39;][&#39;CVE_data_met=
a&#39;][&#39;ID&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cveDesc =3D elt[&#39;cve&#39;][&#39;descriptio=
n&#39;][&#39;description_data&#39;][0][&#39;value&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 date =3D elt[&#39;lastModifiedDate&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;impact&#39;][&#39;ba=
seMetricV2&#39;][&#39;cvssV2&#39;][&#39;accessVector&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D elt[&#39;impact&#39;][&#39;baseMetr=
icV2&#39;][&#39;cvssV2&#39;][&#39;baseScore&#39;]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D elt[&#39;impact&#39;]=
[&#39;baseMetricV3&#39;][&#39;cvssV3&#39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D 0.0<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c.execute(&quot;insert or replace into NVD val=
ues (?, ?, ?, ?, ?, ?)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [cveId, cveDesc, c=
vssv2, cvssv3, date, accessVector])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 configurations =3D elt[&#39;configurations&#39=
;][&#39;nodes&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in configurations:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_node_and_insert(c, config,=
 cveId)<br>
+<br>
+<br>
+addtask do_populate_cve_db before do_fetch<br>
+do_populate_cve_db[nostamp] =3D &quot;1&quot;<br>
+<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
diff --git a/meta/recipes-devtools/cve-check-tool/<a href=3D"http://cve-che=
ck-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.4=
.bb</a> b/meta/recipes-devtools/cve-check-tool/<a href=3D"http://cve-check-=
tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.4.bb=
</a><br>
deleted file mode 100644<br>
index 1c84fb1cf2d..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/<a href=3D"http://cve-check-tool=
_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-tool_5.6.4.bb</a>=
<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-SUMMARY =3D &quot;cve-check-tool&quot;<br>
-DESCRIPTION =3D &quot;cve-check-tool is a tool for checking known (public)=
 CVEs.\<br>
-The tool will identify potentially vunlnerable software packages within Li=
nux distributions through version matching.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/ikeydoherty/cve-check-too=
l" rel=3D"noreferrer" target=3D"_blank">https://github.com/ikeydoherty/cve-=
check-tool</a>&quot;<br>
-SECTION =3D &quot;Development/Tools&quot;<br>
-LICENSE =3D &quot;GPL-2.0+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De8c1458438ead3c34974bc0be3=
a03ed6&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/ikeydoherty/$%7BBPN%7D/rel=
eases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.=
tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-for-malloc_trim-befo=
re-using-it.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-print-progress-in-per=
cent-when-downloading-CVE-db.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-curl-allow-overriding=
-default-CA-certificate-file.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-update-Compare-comput=
ed-vs-expected-sha256-digit-str.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-freeing-memory-al=
located-by-sqlite.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;c5f4247140fc9be3bf41491d31a34155&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b8f283be718af8d31232ac1bfc10a0378fb958aaaa49a=
f39168f8acf501e6a5b&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/ikeydoherty/cve=
-check-tool/releases" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/ikeydoherty/cve-check-tool/releases</a>&quot;<br>
-<br>
-DEPENDS =3D &quot;libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl=
 ca-certificates&quot;<br>
-<br>
-RDEPENDS_${PN} =3D &quot;ca-certificates&quot;<br>
-<br>
-inherit pkgconfig autotools<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-coverage --enable-relative-plugins&quot;<=
br>
-CFLAGS_append =3D &quot; -Wno-error=3Dpedantic&quot;<br>
-<br>
-do_populate_cve_db() {<br>
-=C2=A0 =C2=A0 if [ &quot;${BB_NO_NETWORK}&quot; =3D &quot;1&quot; ] ; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;BB_NO_NETWORK is set; Can&#39;t u=
pdate cve-check-tool database, new CVEs won&#39;t be detected&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 # In case we don&#39;t inherit cve-check class, use default =
values defined in the class.<br>
-=C2=A0 =C2=A0 cve_dir=3D&quot;${CVE_CHECK_DB_DIR}&quot;<br>
-=C2=A0 =C2=A0 cve_file=3D&quot;${CVE_CHECK_TMP_FILE}&quot;<br>
-<br>
-=C2=A0 =C2=A0 [ -z &quot;${cve_dir}&quot; ] &amp;&amp; cve_dir=3D&quot;${D=
L_DIR}/CVE_CHECK&quot;<br>
-=C2=A0 =C2=A0 [ -z &quot;${cve_file}&quot; ] &amp;&amp; cve_file=3D&quot;$=
{TMPDIR}/cve_check&quot;<br>
-<br>
-=C2=A0 =C2=A0 unused=3D&quot;${@bb.utils.export_proxies(d)}&quot;<br>
-=C2=A0 =C2=A0 bbdebug 2 &quot;Updating cve-check-tool database located in =
$cve_dir&quot;<br>
-=C2=A0 =C2=A0 # --cacert works around curl-native not finding the CA bundl=
e<br>
-=C2=A0 =C2=A0 if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-cert=
ificates.crt -d &quot;$cve_dir&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;CVE database was updated on %s UT=
C\n\n&quot; &quot;$(LANG=3DC date --utc +&#39;%F %T&#39;)&quot; &gt; &quot;=
$cve_file&quot;<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Error in executing cve-check-upda=
te&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${@&#39;1&#39; if bb.data.inherits_=
class(&#39;cve-check&#39;, d) else &#39;0&#39;}&quot; -ne 0 ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Failed to update cv=
e-check-tool database, CVEs won&#39;t be checked&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-}<br>
-<br>
-addtask populate_cve_db after do_populate_sysroot<br>
-do_populate_cve_db[depends] =3D &quot;cve-check-tool-native:do_populate_sy=
sroot&quot;<br>
-do_populate_cve_db[nostamp] =3D &quot;1&quot;<br>
-do_populate_cve_db[progress] =3D &quot;percent&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-me=
mory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/files=
/0001-Fix-freeing-memory-allocated-by-sqlite.patch<br>
deleted file mode 100644<br>
index 4a82cf2dded..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-al=
located-by-sqlite.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001<br>
-From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D=
"_blank">peter.marko@siemens.com</a>&gt;<br>
-Date: Thu, 13 Apr 2017 23:09:52 +0200<br>
-Subject: [PATCH] Fix freeing memory allocated by sqlite<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
----<br>
- src/core.c | 8 ++++----<br>
- 1 file changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/core.c b/src/core.c<br>
-index 6263031..6788f16 100644<br>
---- a/src/core.c<br>
-+++ b/src/core.c<br>
-@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sqlite3_exec(self-&gt;db, query, =
NULL, NULL, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D SQLITE_OK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;ensure_table(): %s\n&quot;, err);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
-@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sqlite3_exec(self-&gt;db, query, =
NULL, NULL, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D SQLITE_OK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;ensure_table(): %s\n&quot;, err);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sqlite3_exec(self-&gt;db, query, =
NULL, NULL, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D SQLITE_OK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;ensure_table(): %s\n&quot;, err);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(err);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_free(err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
--- <br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-ove=
rriding-default-CA-certificate-file.patch b/meta/recipes-devtools/cve-check=
-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch<br=
>
deleted file mode 100644<br>
index 3d8ebd1bd26..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding=
-default-CA-certificate-file.patch<br>
+++ /dev/null<br>
@@ -1,215 +0,0 @@<br>
-From 825a9969dea052b02ba868bdf39e676349f10dce Mon Sep 17 00:00:00 2001<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targe=
t=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
-Date: Thu, 9 Feb 2017 14:51:28 +0200<br>
-Subject: [PATCH] curl: allow overriding default CA certificate file<br>
-<br>
-Similar to curl, --cacert can now be used in cve-check-tool and<br>
-cve-check-update to override the default CA certificate file. Useful<br>
-in cases where the system default is unsuitable (for example,<br>
-out-dated) or broken (as in OE&#39;s current native libcurl, which embeds<=
br>
-a path string from one build host and then uses it on another although<br>
-the right path may have become something different).<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/ikeydoherty/cve-=
check-tool/pull/45" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/ikeydoherty/cve-check-tool/pull/45</a>]<br>
-<br>
-Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com" =
target=3D"_blank">patrick.ohly@intel.com</a>&gt;<br>
-<br>
-<br>
-Took Patrick Ohlys original patch from meta-security-isafw, rebased<br>
-on top of other patches.<br>
-<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
----<br>
- src/library/cve-check-tool.h |=C2=A0 1 +<br>
- src/library/fetch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++++++-<br>
- src/library/fetch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
- src/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 5 ++++-<br>
- src/update-main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-=
<br>
- src/update.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 12 +++++++-----<br>
- src/update.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
- 7 files changed, 27 insertions(+), 10 deletions(-)<br>
-<br>
-diff --git a/src/library/cve-check-tool.h b/src/library/cve-check-tool.h<b=
r>
-index e4bb5b1..f89eade 100644<br>
---- a/src/library/cve-check-tool.h<br>
-+++ b/src/library/cve-check-tool.h<br>
-@@ -43,6 +43,7 @@ typedef struct CveCheckTool {<br>
-=C2=A0 =C2=A0 =C2=A0bool bugs;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /**&lt;Whether bug trackin=
g is enabled */<br>
-=C2=A0 =C2=A0 =C2=A0GHashTable *mapping;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /**&lt;CVE Mapping */<br>
-=C2=A0 =C2=A0 =C2=A0const char *output_file;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /**&lt;Output file, if any */<br>
-+=C2=A0 =C2=A0 const char *cacert_file;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /**&lt;Non-default SSL certificate file, if any */<br>
- } CveCheckTool;<br>
- <br>
- /**<br>
-diff --git a/src/library/fetch.c b/src/library/fetch.c<br>
-index 0fe6d76..8f998c3 100644<br>
---- a/src/library/fetch.c<br>
-+++ b/src/library/fetch.c<br>
-@@ -60,7 +60,8 @@ static int progress_callback_new(void *ptr, curl_off_t d=
ltotal, curl_off_t dlnow<br>
- }<br>
- <br>
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int start_percent, unsigned int end_percent)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int start_percent, unsigned int end_percent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *cacert_file)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FetchStatus ret =3D FETCH_STATUS_FAIL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CURLcode res;<br>
-@@ -74,6 +75,13 @@ FetchStatus fetch_uri(const char *uri, const char *targ=
et, bool verbose,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cacert_file) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D curl_easy=
_setopt(curl, CURLOPT_CAINFO, cacert_file);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res !=3D CURL=
E_OK) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto bail;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (stat(target, &amp;st) =3D=3D 0) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D curl=
_easy_setopt(curl, CURLOPT_TIMECONDITION, CURL_TIMECOND_IFMODSINCE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res !=3D=
 CURLE_OK) {<br>
-diff --git a/src/library/fetch.h b/src/library/fetch.h<br>
-index 4cce5d1..836c7d7 100644<br>
---- a/src/library/fetch.h<br>
-+++ b/src/library/fetch.h<br>
-@@ -29,7 +29,8 @@ typedef enum {<br>
-=C2=A0 * @return A FetchStatus, indicating the operation taken<br>
-=C2=A0 */<br>
- FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int this_percent, unsigned int next_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int this_percent, unsigned int next_percent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *cacert_file);<br>
- <br>
- /**<br>
-=C2=A0 * Attempt to extract the given gzipped file<br>
-diff --git a/src/main.c b/src/main.c<br>
-index 8e6f158..ae69d47 100644<br>
---- a/src/main.c<br>
-+++ b/src/main.c<br>
-@@ -280,6 +280,7 @@ static bool csv_mode =3D false;<br>
- static char *modified_stamp =3D NULL;<br>
- static gchar *mapping_file =3D NULL;<br>
- static gchar *output_file =3D NULL;<br>
-+static gchar *cacert_file =3D NULL;<br>
- <br>
- static GOptionEntry _entries[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;not-patched&quot;, &#39;n&#39;, =
0, G_OPTION_ARG_NONE, &amp;hide_patched, &quot;Hide patched/addressed CVEs&=
quot;, NULL },<br>
-@@ -294,6 +295,7 @@ static GOptionEntry _entries[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;csv&quot;, &#39;c&#39;, 0, G_OPT=
ION_ARG_NONE, &amp;csv_mode, &quot;Output CSV formatted data only&quot;, NU=
LL },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;mapping&quot;, &#39;M&#39;, 0, G=
_OPTION_ARG_STRING, &amp;mapping_file, &quot;Path to a mapping file&quot;, =
NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;output-file&quot;, &#39;o&#39;, =
0, G_OPTION_ARG_STRING, &amp;output_file, &quot;Path to the output file (ou=
tput plugin specific)&quot;, NULL},<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;cacert&quot;, &#39;C&#39;, 0, G_OPTIO=
N_ARG_STRING, &amp;cacert_file, &quot;Path to the combined SSL certificates=
 file (system default is used if not set)&quot;, NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .short_name =3D 0 }<br>
- };<br>
- <br>
-@@ -492,6 +494,7 @@ int main(int argc, char **argv)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quiet =3D csv_mode || !no_html;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;output_file =3D output_file;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;cacert_file =3D cacert_file;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!csv_mode &amp;&amp; self-&gt;output=
_file) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quiet =3D fa=
lse;<br>
-@@ -530,7 +533,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Update of db forced\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cve_db_unlock();<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!update_db(quiet, db_path-&gt;str)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!update_db(quiet, db_path-&gt;str, self-&gt;cacert_file)) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;DB updat=
e failure\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
-diff --git a/src/update-main.c b/src/update-main.c<br>
-index 2379cfa..c52d9d0 100644<br>
---- a/src/update-main.c<br>
-+++ b/src/update-main.c<br>
-@@ -43,11 +43,13 @@ the Free Software Foundation; either version 2 of the =
License, or\n\<br>
- static gchar *nvds =3D NULL;<br>
- static bool _show_version =3D false;<br>
- static bool _quiet =3D false;<br>
-+static const char *_cacert_file =3D NULL;<br>
- <br>
- static GOptionEntry _entries[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;nvd-dir&quot;, &#39;d&#39;, 0, G=
_OPTION_ARG_STRING, &amp;nvds, &quot;NVD directory in filesystem&quot;, NUL=
L },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;version&quot;, &#39;v&#39;, 0, G=
_OPTION_ARG_NONE, &amp;_show_version, &quot;Show version&quot;, NULL },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;quiet&quot;, &#39;q&#39;, 0, G_O=
PTION_ARG_NONE, &amp;_quiet, &quot;Run silently&quot;, NULL },<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;cacert&quot;, &#39;C&#39;, 0, G_OPTIO=
N_ARG_STRING, &amp;_cacert_file, &quot;Path to the combined SSL certificate=
s file (system default is used if not set)&quot;, NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .short_name =3D 0 }<br>
- };<br>
- <br>
-@@ -88,7 +90,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto end;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (update_db(_quiet, db_path-&gt;str)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (update_db(_quiet, db_path-&gt;str, _cacer=
t_file)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D EXIT=
_SUCCESS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to update database\n&quot;);<br>
-diff --git a/src/update.c b/src/update.c<br>
-index 070560a..8cb4a39 100644<br>
---- a/src/update.c<br>
-+++ b/src/update.c<br>
-@@ -267,7 +267,8 @@ static inline void update_end(int fd, const char *upda=
te_fname, bool ok)<br>
- <br>
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool db_exist, bool verbose,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int this_percent, unsigned int next_percen=
t)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int this_percent, unsigned int next_percen=
t,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *cacert_file)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char nvd_uri[] =3D URI_PREFIX;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(cve_string) *uri_meta =3D NULL;=
<br>
-@@ -331,14 +332,14 @@ refetch:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD META file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose, this_percent, this_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose, this_percent, this_percent, cacert_file);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st =3D=3D FETCH_STATUS_FAIL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_meta-&gt;str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD XML file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose, this_percent, next_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose, this_percent, next_percent, cacert_file);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (st) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FETCH_STATUS_FAIL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_data_gz-&gt;str);<br>
-@@ -391,7 +392,7 @@ refetch:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
--bool update_db(bool quiet, const char *db_file)<br>
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file)<=
br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(char) *db_dir =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(CveDB) *cve_db =3D NULL;<br>
-@@ -466,7 +467,8 @@ bool update_db(bool quiet, const char *db_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!quiet)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;completed: %u%%\r&quot;, start_perce=
nt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D do_fe=
tch_update(y, db_dir, cve_db, db_exist, !quiet,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_percent, e=
nd_percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_percent, e=
nd_percent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cacert_file);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rc) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (!quiet)<br>
-diff --git a/src/update.h b/src/update.h<br>
-index b8e9911..ceea0c3 100644<br>
---- a/src/update.h<br>
-+++ b/src/update.h<br>
-@@ -15,7 +15,7 @@ cve_string *get_db_path(const char *path);<br>
- <br>
- int update_required(const char *db_file);<br>
- <br>
--bool update_db(bool quiet, const char *db_file);<br>
-+bool update_db(bool quiet, const char *db_file, const char *cacert_file);=
<br>
- <br>
- <br>
- /*<br>
--- <br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress=
-in-percent-when-downloading-CVE-db.patch b/meta/recipes-devtools/cve-check=
-tool/files/0001-print-progress-in-percent-when-downloading-CVE-db.patch<br=
>
deleted file mode 100644<br>
index 8ea6f686e3f..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-print-progress-in-per=
cent-when-downloading-CVE-db.patch<br>
+++ /dev/null<br>
@@ -1,135 +0,0 @@<br>
-From e9ed26cde63f8ca7607a010a518329339f8c02d3 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D &lt;<a href=3D"mailto:git=
@andred.net" target=3D"_blank">git@andred.net</a>&gt;<br>
-Date: Mon, 26 Sep 2016 12:12:41 +0100<br>
-Subject: [PATCH] print progress in percent when downloading CVE db<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net" ta=
rget=3D"_blank">git@andred.net</a>&gt;<br>
----<br>
- src/library/fetch.c | 28 +++++++++++++++++++++++++++-<br>
- src/library/fetch.h |=C2=A0 3 ++-<br>
- src/update.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++----<br>
- 3 files changed, 41 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/src/library/fetch.c b/src/library/fetch.c<br>
-index 06d4b30..0fe6d76 100644<br>
---- a/src/library/fetch.c<br>
-+++ b/src/library/fetch.c<br>
-@@ -37,13 +37,37 @@ static size_t write_func(void *ptr, size_t size, size_=
t nmemb, struct fetch_t *f<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fwrite(ptr, size, nmemb, f-&gt;f)=
;<br>
- }<br>
- <br>
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose)<=
br>
-+struct percent_t {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int start;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int end;<br>
-+};<br>
-+<br>
-+static int progress_callback_new(void *ptr, curl_off_t dltotal, curl_off_=
t dlnow, curl_off_t ultotal, curl_off_t ulnow)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ultotal;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ulnow;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct percent_t *percent =3D (struct percent=
_t *) ptr;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dltotal &amp;&amp; percent &amp;&amp; per=
cent-&gt;end &gt;=3D percent-&gt;start) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int diff=
 =3D percent-&gt;end - percent-&gt;start;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (diff) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr,&quot;completed: %&quot;CURL_FORMAT_CURL_OFF_T&qu=
ot;%%\r&quot;, percent-&gt;start + (diff * dlnow / dltotal));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int start_percent, unsigned int end_percent)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FetchStatus ret =3D FETCH_STATUS_FAIL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CURLcode res;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat st;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CURL *curl =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct fetch_t *f =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct percent_t percent =3D { .start =3D sta=
rt_percent, .end =3D end_percent };<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl =3D curl_easy_init();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!curl) {<br>
-@@ -67,6 +91,8 @@ FetchStatus fetch_uri(const char *uri, const char *targe=
t, bool verbose)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (verbose) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)curl_e=
asy_setopt(curl, CURLOPT_NOPROGRESS, 0L);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)curl_easy_s=
etopt(curl, CURLOPT_XFERINFODATA, &amp;percent);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)curl_easy_s=
etopt(curl, CURLOPT_XFERINFOFUNCTION, progress_callback_new);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D curl_easy_setopt(curl, CURLOPT_W=
RITEFUNCTION, (curl_write_callback)write_func);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res !=3D CURLE_OK) {<br>
-diff --git a/src/library/fetch.h b/src/library/fetch.h<br>
-index 70c3779..4cce5d1 100644<br>
---- a/src/library/fetch.h<br>
-+++ b/src/library/fetch.h<br>
-@@ -28,7 +28,8 @@ typedef enum {<br>
-=C2=A0 * @param verbose Whether to be verbose<br>
-=C2=A0 * @return A FetchStatus, indicating the operation taken<br>
-=C2=A0 */<br>
--FetchStatus fetch_uri(const char *uri, const char *target, bool verbose);=
<br>
-+FetchStatus fetch_uri(const char *uri, const char *target, bool verbose,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int this_percent, unsigned int next_percent);<br>
- <br>
- /**<br>
-=C2=A0 * Attempt to extract the given gzipped file<br>
-diff --git a/src/update.c b/src/update.c<br>
-index 30fbe96..eaeeefd 100644<br>
---- a/src/update.c<br>
-+++ b/src/update.c<br>
-@@ -266,7 +266,8 @@ static inline void update_end(int fd, const char *upda=
te_fname, bool ok)<br>
- }<br>
- <br>
- static int do_fetch_update(int year, const char *db_dir, CveDB *cve_db,<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool db_exist, bool verbose)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool db_exist, bool verbose,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int this_percent, unsigned int next_percen=
t)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char nvd_uri[] =3D URI_PREFIX;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autofree(cve_string) *uri_meta =3D NULL;=
<br>
-@@ -330,14 +331,14 @@ refetch:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD META file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_meta-&gt;str, nvdcve_met=
a-&gt;str, verbose, this_percent, this_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st =3D=3D FETCH_STATUS_FAIL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_meta-&gt;str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fetch NVD XML file */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D fetch_uri(uri_data_gz-&gt;str, nvdcve_=
data_gz-&gt;str, verbose, this_percent, next_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (st) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FETCH_STATUS_FAIL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stde=
rr, &quot;Failed to fetch %s\n&quot;, uri_data_gz-&gt;str);<br>
-@@ -459,10 +460,17 @@ bool update_db(bool quiet, const char *db_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D YEAR_START; i &lt;=3D yea=
r+1; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int y =3D i =
&gt; year ? -1 : i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int star=
t_percent =3D ((i+0 - YEAR_START) * 100) / (year+2 - YEAR_START);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int end_=
percent =3D ((i+1 - YEAR_START) * 100) / (year+2 - YEAR_START);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D do_fetch_u=
pdate(y, db_dir, cve_db, db_exist, !quiet);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!quiet)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;completed: %u%%\r&quot;, start_percent);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D do_fetch_u=
pdate(y, db_dir, cve_db, db_exist, !quiet,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_percent, e=
nd_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rc) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!quiet)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,&quot;completed: %u%%=
\r&quot;, end_percent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case ENOMEM:=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto oom;<br>
--- <br>
-2.9.3<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare=
-computed-vs-expected-sha256-digit-str.patch b/meta/recipes-devtools/cve-ch=
eck-tool/files/0001-update-Compare-computed-vs-expected-sha256-digit-str.pa=
tch<br>
deleted file mode 100644<br>
index 458c0cc84e5..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/0001-update-Compare-comput=
ed-vs-expected-sha256-digit-str.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From b0426e63c9ac61657e029f689bcb8dd051e752c6 Mon Sep 17 00:00:00 2001<br>
-From: Sergey Popovich &lt;<a href=3D"mailto:popovich_sergei@mail.ua" targe=
t=3D"_blank">popovich_sergei@mail.ua</a>&gt;<br>
-Date: Fri, 21 Apr 2017 07:32:23 -0700<br>
-Subject: [PATCH] update: Compare computed vs expected sha256 digit string<=
br>
- ignoring case<br>
-<br>
-We produce sha256 digest string using %x snprintf()<br>
-qualifier for each byte of digest which uses alphabetic<br>
-characters from &quot;a&quot; to &quot;f&quot; in lower case to represent<=
br>
-integer values from 10 to 15.<br>
-<br>
-Previously all of the NVD META files supply sha256<br>
-digest string for corresponding XML file in lower case.<br>
-<br>
-However due to some reason this changed recently to<br>
-provide digest digits in upper case causing fetched<br>
-data consistency checks to fail. This prevents database<br>
-from being updated periodically.<br>
-<br>
-While commit c4f6e94 (update: Do not treat sha256 failure<br>
-as fatal if requested) adds useful option to skip<br>
-digest validation at all and thus provides workaround for<br>
-this situation, it might be unacceptable for some<br>
-deployments where we need to ensure that downloaded<br>
-data is consistent before start parsing it and update<br>
-SQLite database.<br>
-<br>
-Use strcasecmp() to compare two digest strings case<br>
-insensitively and addressing this case.<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Sergey Popovich &lt;<a href=3D"mailto:popovich_sergei@mail.=
ua" target=3D"_blank">popovich_sergei@mail.ua</a>&gt;<br>
----<br>
- src/update.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/update.c b/src/update.c<br>
-index 8588f38..3cc6b67 100644<br>
---- a/src/update.c<br>
-+++ b/src/update.c<br>
-@@ -187,7 +187,7 @@ static bool nvdcve_data_ok(const char *meta, const cha=
r *data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(&am=
p;csum_data[idx], len, &quot;%02hhx&quot;, digest[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D streq(csum_meta, csum_data);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D !strcasecmp(csum_meta, csum_data);<br=
>
- <br>
- err_unmap:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(buffer, length);<br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_tr=
im-before-using-it.patch b/meta/recipes-devtools/cve-check-tool/files/check=
-for-malloc_trim-before-using-it.patch<br>
deleted file mode 100644<br>
index 0774ad946a4..00000000000<br>
--- a/meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-befo=
re-using-it.patch<br>
+++ /dev/null<br>
@@ -1,51 +0,0 @@<br>
-From ce64633b9733e962b8d8482244301f614d8b5845 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 22 Aug 2016 22:54:24 -0700<br>
-Subject: [PATCH] Check for malloc_trim before using it<br>
-<br>
-malloc_trim is gnu specific and not all libc<br>
-implement it, threfore write a configure check<br>
-to poke for it first and use the define to<br>
-guard its use.<br>
-<br>
-Helps in compiling on musl based systems<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/ikeydoherty/cve-=
check-tool/pull/48" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/ikeydoherty/cve-check-tool/pull/48</a>]<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 ++<br>
- src/core.c=C2=A0 =C2=A0| 4 ++--<br>
- 2 files changed, 4 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index d3b66ce..79c3542 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -19,6 +19,8 @@ m4_define([json_required_version], [0.16.0])<br>
- m4_define([openssl_required_version],[1.0.0])<br>
- # TODO: Set minimum sqlite<br>
- <br>
-+AC_CHECK_FUNCS_ONCE(malloc_trim)<br>
-+<br>
- PKG_CHECK_MODULES(CVE_CHECK_TOOL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glib-=
2.0 &gt;=3D glib_required_version,<br>
-diff --git a/src/core.c b/src/core.c<br>
-index 6263031..0d5df29 100644<br>
---- a/src/core.c<br>
-+++ b/src/core.c<br>
-@@ -498,9 +498,9 @@ bool cve_db_load(CveDB *self, const char *fname)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D true;<br>
--<br>
-+#ifdef HAVE_MALLOC_TRIM<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0malloc_trim(0);<br>
--<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFreeTextReader(r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<b=
r>
--- <br>
-2.9.3<br>
-<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000099b5590596aecb25--
