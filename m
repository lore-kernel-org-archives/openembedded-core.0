Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 11A2D7EF47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:10:20 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id e20so20963342iob.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m7hqRklL8sZU02QLw6TgU/Gjp9qv8T8qQuMFF7rVrQk=;
	b=ZZ2bUT1wNyUPpDwrA3YIhuHjsriifM9HH4NuHH87QPQ7s747rmpyGKdseA4r9tDua1
	rbOC8z0b/FaJHx3qZjfjk1N9rOexGdDnGCgOgg9Bssb5hMfZtmBdPqOoYYE/dUovAqfU
	NowkeVdNgknaWlK9eKFO8Mu+/aEeoCi606nhGPNvEUn4BEn6BtONOEyv0THUQRb055Sa
	Xs+frnPeuC46O7grydfhJV1NyoCi3PYyU8L+VCJ++CWBN3dxQSczkQoYxUoNrgLQxtkM
	w2/1cNKbUT4yg8unoz6CDVhfznx7HTtw88coGhTs9dPbPwRMIJ5XV6Mj/BqXxM4zhckX
	Dw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m7hqRklL8sZU02QLw6TgU/Gjp9qv8T8qQuMFF7rVrQk=;
	b=nSIIIEvXxakEihSxs1lh/3guWQxSRTPJtwX+48xivICJ2rq0nA42EGiQI98rsQLfzI
	kVzfgBCFGir8D8bo+ZAQv9zBw2DP9LMmIO785FRVD1OiHLsv//sCx4/zPUQ6yWvzNRSB
	jDNgAVaKw9/6KHK/keUTJloJSoSsaeQSYWKt38B9XlbgBIT4cQxKNNUH/piSFro4yv88
	/Kt3NaYyxnRxVTOFQtAl0KAqMrR/RKcP9AsP6iJVp3SA4skuq5H6HM0VE5jIG1rbt19Z
	wXrjkRnCHTwGmosWW+qIRidRdyefntpOuf2SNsKS1RICkpggv7o1xkrVbiP87Gm+OhDH
	ptyQ==
X-Gm-Message-State: APjAAAWIXHSR3J5Z7zI6vZu24mH7koRwDARVeJcW1oNfq/BAvkp9dWm1
	ORZwKY6yGdymZohmxlj+xlO+V1nYVZzqnbf71s8YiQ==
X-Google-Smtp-Source: APXvYqxbXOZ2e/yI8qdZ7UpVkLHBIwBriVT/z9s2grHdswHXKkLY2UpfePUSh4SZG/Ss8RZfLStH4Pt4NamJ0iLRSHw=
X-Received: by 2002:a5e:c744:: with SMTP id g4mr41308234iop.187.1563455421895; 
	Thu, 18 Jul 2019 06:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190718124119.991-1-lemagoup@gmail.com>
	<20190718124119.991-2-lemagoup@gmail.com>
In-Reply-To: <20190718124119.991-2-lemagoup@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2019 14:10:10 +0100
Message-ID: <CAJTo0Lb5PRQ8Z3Vc8OpFB7xRowj+QqK4ojfr_xbCeObZk0hKSg@mail.gmail.com>
To: Pierre Le Magourou <lemagoup@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cve-update-db-native: Remove hash column from database.
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
X-List-Received-Date: Thu, 18 Jul 2019 13:10:21 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase this on top of the patches I sent yesterday to change
the path construction to use os.path.join() please.

Ross

On Thu, 18 Jul 2019 at 13:41, Pierre Le Magourou <lemagoup@gmail.com> wrote:
>
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
>
> djb2 hash algorithm was found to do collisions, so the database was
> sometime missing data. Remove this hash mechanism, clear and populate
> elements from scratch in PRODUCTS table if the current year needs an
> update.
>
> Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> ---
>  meta/classes/cve-check.bbclass                 | 12 ++++++------
>  meta/recipes-core/meta/cve-update-db-native.bb | 21 +++++++--------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 512d4c7302..c00d2910be 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
>  CVE_VERSION ??= "${PV}"
>
>  CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
> -CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve.db"
> +CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
>
>  CVE_CHECK_LOG ?= "${T}/cve.log"
>  CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
> @@ -200,11 +200,11 @@ def check_cves(d, patched_cves):
>              c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
>
>          for row in c:
> -            cve = row[1]
> -            version_start = row[4]
> -            operator_start = row[5]
> -            version_end = row[6]
> -            operator_end = row[7]
> +            cve = row[0]
> +            version_start = row[3]
> +            operator_start = row[4]
> +            version_end = row[5]
> +            operator_end = row[6]
>
>              if cve in cve_whitelist:
>                  bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index 72d1f48835..3519beae5f 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -30,7 +30,7 @@ python do_populate_cve_db() {
>      YEAR_START = 2002
>
>      db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
> -    db_file = db_dir + '/nvdcve.db'
> +    db_file = db_dir + '/nvdcve_1.0.db'
>      json_tmpfile = db_dir + '/nvd.json.gz'
>      proxy = d.getVar("https_proxy")
>      cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
> @@ -65,6 +65,10 @@ python do_populate_cve_db() {
>          c.execute("select DATE from META where YEAR = ?", (year,))
>          meta = c.fetchone()
>          if not meta or meta[0] != last_modified:
> +            # Clear products table entries corresponding to current year
> +            cve_year = 'CVE-' + str(year) + '%'
> +            c.execute("delete from PRODUCTS where ID like ?", (cve_year,))
> +
>              # Update db with current year json file
>              req = urllib.request.Request(json_url)
>              if proxy:
> @@ -91,27 +95,16 @@ python do_populate_cve_db() {
>      conn.close()
>  }
>
> -# DJB2 hash algorithm
> -def hash_djb2(s):
> -    hash = 5381
> -    for x in s:
> -        hash = (( hash << 5) + hash) + ord(x)
> -
> -    return hash & 0xFFFFFFFF
> -
>  def initialize_db(c):
>      c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
>      c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
>          SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
> -    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
> +    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
>          VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
>          VERSION_END TEXT, OPERATOR_END TEXT)")
>
>  def insert_elt(c, db_values):
> -    product_str = db_values[0] + db_values[1] + db_values[2] + db_values[3]
> -    hashstr = hash_djb2(product_str)
> -    db_values.insert(0, hashstr)
> -    query = "insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?, ?, ?)"
> +    query = "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
>      c.execute(query, db_values)
>
>  def parse_node_and_insert(c, node, cveId):
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

