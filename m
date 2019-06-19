Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 088937E9A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:59:49 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m24so38938766ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fuGhdATZvT7oKCY1KvuYlGV9F7Jck5wpcJsPmTLq0aE=;
	b=FQK2v/yA7k1TInsNRF4fNZOpmFlhE6lCJTG1RL2ZSbE9hvDvHMqf+SMjaz08hdyTIY
	hd9TdlOsOL+dxPX3Ci1gVLzk5nEV7mCt2ziajd9XKRq+f0merC7rEkRa79zOeWb23RWl
	5zGI3FN9fdrcsWB31GyvQQ6hHIBqJEUZjrZIIAd/J6utizLTH7n0NXpNLLpT4JZeuJGT
	oIlWQadQpuZyJr3xTIoS6Piq8H7a3/9KEmBID+PfVeBeGCAgs6nls3VCCIjmwqJIiXmh
	RgIJsm7T/SlvJvbINve6kFChmDwgEQLPKC45FFW6X1TGolo5wc2jBsI4j2SUbt3pOEf1
	odIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fuGhdATZvT7oKCY1KvuYlGV9F7Jck5wpcJsPmTLq0aE=;
	b=RzrhFMy2JaDvFOliSfYpTe8GFtIUvEvEwpvsCUv14hQRfx6Y/kTKm4Rr4D0KCswsM+
	EAP2rYCgUzesKrcA4HFkLKHv7iL2pE3SfxQIeK54edvAMmFc4FMEeaixatelfpNo3rUe
	hVTK0mZDsZ5k9kPvz0M9Z/Trvqm93ZEP8AXjXtOkczMN70PI6SD98+cPeSCv9w/2Hqse
	s9fWQtihRMD5iVx2xH0KaGLg+bdgp1bCA3IbYSPRrUehlP9KkOb1C0IBHON1TeLzw4uJ
	87t/0q6+GIEs+kd50m9yWNfnQHWEUbzQRcOBZaJ4yP0hzfoS8AWUHxTTpIydWDn9Opmo
	jNnA==
X-Gm-Message-State: APjAAAWkFZkWJ96GLa+pGFCY6IY5okvij06ivza305qPYzuctiCD0rLL
	KPXDtV9zd7gWRiMkLAeodBKrcNQyV3R/gV1MJOWxHmHl
X-Google-Smtp-Source: APXvYqwVl/ZBISDNSdvF+BhIvfp+OUjYacsP74gM8CU23BADvB2rG54ARDQIhnCnGtU/W1DsCb+rRHYZNAxwNbh63o4=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr353268iod.25.1560956391021;
	Wed, 19 Jun 2019 07:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619135940.18544-2-lemagoup@gmail.com>
In-Reply-To: <20190619135940.18544-2-lemagoup@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jun 2019 15:59:40 +0100
Message-ID: <CAJTo0La_q0KTZrDQrnyiejgOzGCP0YNqF=tS++5ZYaoVCE+xAA@mail.gmail.com>
To: Pierre Le Magourou <lemagoup@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] cve-check: Remove dependency to cve-check-tool-native
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
X-List-Received-Date: Wed, 19 Jun 2019 14:59:50 -0000
Content-Type: text/plain; charset="UTF-8"

Does this mean we can delete the cve-check-tool recipe itself too?

Ross

On Wed, 19 Jun 2019 at 15:03, Pierre Le Magourou <lemagoup@gmail.com> wrote:
>
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
>
> Use the new update-cve-db recipe to update database.
>
> Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> ---
>  meta/classes/cve-check.bbclass | 71 ++++++++++++++++--------------------------
>  1 file changed, 26 insertions(+), 45 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 743bc08a4f..28619c7bd4 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
>  CVE_VERSION ??= "${PV}"
>
>  CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
> -CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
> +CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd-json.db"
>
>  CVE_CHECK_LOG ?= "${T}/cve.log"
>  CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
> @@ -62,7 +62,7 @@ python do_cve_check () {
>  }
>
>  addtask cve_check after do_unpack before do_build
> -do_cve_check[depends] = "cve-check-tool-native:do_populate_sysroot cve-check-tool-native:do_populate_cve_db"
> +do_cve_check[depends] = "cve-update-db:do_populate_cve_db"
>  do_cve_check[nostamp] = "1"
>
>  python cve_check_cleanup () {
> @@ -163,61 +163,40 @@ def get_patches_cves(d):
>
>  def check_cves(d, patched_cves):
>      """
> -    Run cve-check-tool looking for patched and unpatched CVEs.
> +    Connect to the NVD database and find unpatched cves.
>      """
> -
>      import ast, csv, tempfile, subprocess, io
>
> -    cves_patched = []
>      cves_unpatched = []
>      bpn = d.getVar("CVE_PRODUCT")
>      # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
>      if not bpn:
>          return ([], [])
>      pv = d.getVar("CVE_VERSION").split("+git")[0]
> -    cves = " ".join(patched_cves)
> -    cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
>      cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
> -    cve_cmd = "cve-check-tool"
> -    cmd = [cve_cmd, "--no-html", "--skip-update", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
>
>      # If the recipe has been whitlisted we return empty lists
>      if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
>          bb.note("Recipe has been whitelisted, skipping check")
>          return ([], [])
>
> -    try:
> -        # Write the faux CSV file to be used with cve-check-tool
> -        fd, faux = tempfile.mkstemp(prefix="cve-faux-")
> -        with os.fdopen(fd, "w") as f:
> -            for pn in bpn.split():
> -                f.write("%s,%s,%s,\n" % (pn, pv, cves))
> -        cmd.append(faux)
> -
> -        output = subprocess.check_output(cmd).decode("utf-8")
> -        bb.debug(2, "Output of command %s:\n%s" % ("\n".join(cmd), output))
> -    except subprocess.CalledProcessError as e:
> -        bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output))
> -    finally:
> -        os.remove(faux)
> -
> -    for row in csv.reader(io.StringIO(output)):
> -        # Third row has the unpatched CVEs
> -        if row[2]:
> -            for cve in row[2].split():
> -                # Skip if the CVE has been whitlisted for the current version
> -                if pv in cve_whitelist.get(cve,[]):
> -                    bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
> -                else:
> -                    cves_unpatched.append(cve)
> -                    bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
> -        # Fourth row has patched CVEs
> -        if row[3]:
> -            for cve in row[3].split():
> -                cves_patched.append(cve)
> -                bb.debug(2, "%s-%s is patched for %s" % (bpn, pv, cve))
> -
> -    return (cves_patched, cves_unpatched)
> +    import sqlite3
> +    db_file = d.getVar("CVE_CHECK_DB_FILE")
> +    conn = sqlite3.connect(db_file)
> +    c = conn.cursor()
> +    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
> +    for row in c.execute(query % (bpn,pv)):
> +        cve = row[1]
> +        if pv in cve_whitelist.get(cve,[]):
> +            bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
> +        elif cve in patched_cves:
> +            bb.note("%s has been patched" % (cve))
> +        else:
> +            cves_unpatched.append(cve)
> +            bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
> +    conn.close()
> +
> +    return (list(patched_cves), cves_unpatched)
>
>  def get_cve_info(d, cves):
>      """
> @@ -241,9 +220,10 @@ def get_cve_info(d, cves):
>      for row in cur.execute(query, tuple(cves)):
>          cve_data[row[0]] = {}
>          cve_data[row[0]]["summary"] = row[1]
> -        cve_data[row[0]]["score"] = row[2]
> -        cve_data[row[0]]["modified"] = row[3]
> -        cve_data[row[0]]["vector"] = row[4]
> +        cve_data[row[0]]["scorev2"] = row[2]
> +        cve_data[row[0]]["scorev3"] = row[3]
> +        cve_data[row[0]]["modified"] = row[4]
> +        cve_data[row[0]]["vector"] = row[5]
>      conn.close()
>
>      return cve_data
> @@ -270,7 +250,8 @@ def cve_write_data(d, patched, unpatched, cve_data):
>              unpatched_cves.append(cve)
>              write_string += "CVE STATUS: Unpatched\n"
>          write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
> -        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
> +        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
> +        write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
>          write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
>          write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

