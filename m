Return-Path: <lemagoup@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 824127EECE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:56:24 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id z28so27506860ljn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RZjY16h48mUD6TmUW3PHm1hXyrqN+BjweFtXF0tGX9U=;
	b=XRBWcm6GlMObJzp+73a5bmg0J4PvAiTCLeJe3lZimDeLU9dwrPuNG1POVJR7FcbV75
	3ev+OD8Y+FDCEbFO7VGnbMCULAkVS03lb5hXrjieIDiZUE4KCwDc5V6lX/lx7a4DtsLY
	3tH2DJT+XBBz9Qh4Ft1K+GcA8qLIeUIOCQ82eXH+0I5ybdczMkyCMG3DEzIRODaMCsFQ
	YyT0fTkEVjc6gbPcQpGT7Mioa6nhZaR+D6Zvdiv5FWxddAHlvXFzlif/TxfHOyObqP6B
	6LCw/gsWEjyuHPqJS7ZxuMpE2883kKJSHGszjsBbF7rFfWM+q+szcznEOlie5welWtnc
	k3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RZjY16h48mUD6TmUW3PHm1hXyrqN+BjweFtXF0tGX9U=;
	b=iJBGTxfg6PqY/XYcS+eA5v8aRVpkRPLEUkHCcfVMumBqJsqM8mrVJ0PFn1vPbQCC6X
	Gaw6owddwhSp3YxrWd7DFCQ7HO18VpKWn3AAhuAOEGRVIoQ6AwTwKKpM79wFNQy2ONSQ
	q1nkzkKo+nXHZGbBlLfC9SjiPds4DHMtekXxUZ03c72uEEcAMFsYIWHESdpD0mTYwmEh
	ShnhNbsBajBnbMHLqXsSHwHRDPFwqz1CA1Uj9JRdUao228lRwESeohZidUn478uB8F63
	z2xl00VlurPFFnsZqFKDrutEaTot1k6xexJiT+pKHV8TC+9MfirQeTJl3X7ze/1sOSle
	kJDw==
X-Gm-Message-State: APjAAAWpozaF4nxdQrPt5PShubKIXzDmef6GKj/s+G+ccfSbM39xnxgD
	69ErxBVtk4Ll6AQ3RyX5k2vXFAU7f4Jjmzy7jzM=
X-Google-Smtp-Source: APXvYqwvXx96FUTY9dYe+APK610l4aUssn4JPdAKWamqYYd6Geja9uJnoFuFz2Q05/j2vyVE4d6RpMjLOi39UEzM2Ys=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr23784048lji.103.1563458185045;
	Thu, 18 Jul 2019 06:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190718124119.991-1-lemagoup@gmail.com>
	<20190718124119.991-2-lemagoup@gmail.com>
	<CAJTo0Lb5PRQ8Z3Vc8OpFB7xRowj+QqK4ojfr_xbCeObZk0hKSg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb5PRQ8Z3Vc8OpFB7xRowj+QqK4ojfr_xbCeObZk0hKSg@mail.gmail.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Thu, 18 Jul 2019 15:56:13 +0200
Message-ID: <CAEz4NHpi2kBHYkqYFfqB+SZx1B1_sdVr8+t0Kzp5bNREycXytw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 18 Jul 2019 13:56:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ross,

> Can you rebase this on top of the patches I sent yesterday to change
> the path construction to use os.path.join() please.

I can't find the patches your are referring to. My patches are rebased
on the last master, and I don't see a patch from you in master-next.

Pierre

Le jeu. 18 juil. 2019 =C3=A0 15:10, Burton, Ross <ross.burton@intel.com> a =
=C3=A9crit :
>

>
> Ross
>
> On Thu, 18 Jul 2019 at 13:41, Pierre Le Magourou <lemagoup@gmail.com> wro=
te:
> >
> > From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> >
> > djb2 hash algorithm was found to do collisions, so the database was
> > sometime missing data. Remove this hash mechanism, clear and populate
> > elements from scratch in PRODUCTS table if the current year needs an
> > update.
> >
> > Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.c=
om>
> > ---
> >  meta/classes/cve-check.bbclass                 | 12 ++++++------
> >  meta/recipes-core/meta/cve-update-db-native.bb | 21 +++++++-----------=
---
> >  2 files changed, 13 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bb=
class
> > index 512d4c7302..c00d2910be 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -26,7 +26,7 @@ CVE_PRODUCT ??=3D "${BPN}"
> >  CVE_VERSION ??=3D "${PV}"
> >
> >  CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
> > -CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve.db"
> > +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
> >
> >  CVE_CHECK_LOG ?=3D "${T}/cve.log"
> >  CVE_CHECK_TMP_FILE ?=3D "${TMPDIR}/cve_check"
> > @@ -200,11 +200,11 @@ def check_cves(d, patched_cves):
> >              c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (pr=
oduct,))
> >
> >          for row in c:
> > -            cve =3D row[1]
> > -            version_start =3D row[4]
> > -            operator_start =3D row[5]
> > -            version_end =3D row[6]
> > -            operator_end =3D row[7]
> > +            cve =3D row[0]
> > +            version_start =3D row[3]
> > +            operator_start =3D row[4]
> > +            version_end =3D row[5]
> > +            operator_end =3D row[6]
> >
> >              if cve in cve_whitelist:
> >                  bb.note("%s-%s has been whitelisted for %s" % (product=
, pv, cve))
> > diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/reci=
pes-core/meta/cve-update-db-native.bb
> > index 72d1f48835..3519beae5f 100644
> > --- a/meta/recipes-core/meta/cve-update-db-native.bb
> > +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> > @@ -30,7 +30,7 @@ python do_populate_cve_db() {
> >      YEAR_START =3D 2002
> >
> >      db_dir =3D d.getVar("DL_DIR") + '/CVE_CHECK'
> > -    db_file =3D db_dir + '/nvdcve.db'
> > +    db_file =3D db_dir + '/nvdcve_1.0.db'
> >      json_tmpfile =3D db_dir + '/nvd.json.gz'
> >      proxy =3D d.getVar("https_proxy")
> >      cve_f =3D open(d.getVar("TMPDIR") + '/cve_check', 'a')
> > @@ -65,6 +65,10 @@ python do_populate_cve_db() {
> >          c.execute("select DATE from META where YEAR =3D ?", (year,))
> >          meta =3D c.fetchone()
> >          if not meta or meta[0] !=3D last_modified:
> > +            # Clear products table entries corresponding to current ye=
ar
> > +            cve_year =3D 'CVE-' + str(year) + '%'
> > +            c.execute("delete from PRODUCTS where ID like ?", (cve_yea=
r,))
> > +
> >              # Update db with current year json file
> >              req =3D urllib.request.Request(json_url)
> >              if proxy:
> > @@ -91,27 +95,16 @@ python do_populate_cve_db() {
> >      conn.close()
> >  }
> >
> > -# DJB2 hash algorithm
> > -def hash_djb2(s):
> > -    hash =3D 5381
> > -    for x in s:
> > -        hash =3D (( hash << 5) + hash) + ord(x)
> > -
> > -    return hash & 0xFFFFFFFF
> > -
> >  def initialize_db(c):
> >      c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, D=
ATE TEXT)")
> >      c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY=
 TEXT, \
> >          SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
> > -    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQU=
E, ID TEXT, \
> > +    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
> >          VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START =
TEXT, \
> >          VERSION_END TEXT, OPERATOR_END TEXT)")
> >
> >  def insert_elt(c, db_values):
> > -    product_str =3D db_values[0] + db_values[1] + db_values[2] + db_va=
lues[3]
> > -    hashstr =3D hash_djb2(product_str)
> > -    db_values.insert(0, hashstr)
> > -    query =3D "insert or replace into PRODUCTS values (?, ?, ?, ?, ?, =
?, ?, ?)"
> > +    query =3D "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
> >      c.execute(query, db_values)
> >
> >  def parse_node_and_insert(c, node, cveId):
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

