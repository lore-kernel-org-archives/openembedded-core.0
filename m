Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 252897EF21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 16:17:11 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id f4so52351562ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pZjfOkJ/um9EEQZ2LH2eipvxYbF0IBY0odNTAdA3v58=;
	b=u8g0vZuy0hQYMojKbvDbe7bsHh2Px0d4t/4G7cs2RsPKCbaDP/mHkkDkRqktaOrLQK
	72KYUa2kQ0b5zjhtWzaGBkdhF53+QCZ8mkJyOkLXMwKhcudnEL1vNdL96S2LXIilD1Lo
	GqnFbrvenG488kwfmYSeZv9Ao4A0EqqqFVHVKSLbVNE+3E6a+K/jfirRtvYveFbEqKbS
	FwEhbz5tY9HbSDakCyLmHdp+u0fWya6UFexFVlIVobo9zvB0VENygDaF/Vhb3E7SB3Wr
	UROJaFJHbyCHVqEsdxtekbUUIe6y2F2sUx+Bhlpvbn2y497CK0TA1D9kBnSfE6QPVa4Z
	KS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pZjfOkJ/um9EEQZ2LH2eipvxYbF0IBY0odNTAdA3v58=;
	b=LmcRdpfayEm21nTfZ9CsxAKdiSMpu1vfyoAkuu7pRWoR/c89XUFJEqimVcNxElE5ND
	PATMmK2FOmj4X4ZWl1kISiOGJjEM9QVlvhQN15GHJM8JuJEVVH2yQyYU5/cqZk3OCg54
	jhM9RwJjyQRoWwnLLqJEuKWJRI4knKP06D/F1yB1M6iitVZ3bg9CJVkzXpx/43VSLpjJ
	NEtswehyQWzWmfsDKQaKND9VtpiTJRXDoGvmalExgajYAM3/6DbTEexID+y9lqPdVRr3
	iuMVwoyI6EoSocxJjWDb2OHYNt1fbdB4RxEBQh8OH88mJk70sHDEvQ/uFeoTMXfwOKMn
	kEiQ==
X-Gm-Message-State: APjAAAU0MJ9j/tWNaBdHhAFuu0i7GEHAH2pIBfG1vBvF7bawbePZdLXu
	7FQNp16y7ZM5kcIDPFQCQZFS8Di1XatNLTW5MyNwhQ==
X-Google-Smtp-Source: APXvYqyNmXOq9PkX+kWnuAbJPJj8aa3k8fMOrfXa3K05W/n0sHy5wIoeihIWlvd8N/GPjaVIxneAUCKr4LTXyFTOz3s=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr41601897iot.200.1563466632882; 
	Thu, 18 Jul 2019 09:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190718124119.991-1-lemagoup@gmail.com>
	<20190718124119.991-2-lemagoup@gmail.com>
	<CAJTo0Lb5PRQ8Z3Vc8OpFB7xRowj+QqK4ojfr_xbCeObZk0hKSg@mail.gmail.com>
	<CAEz4NHpi2kBHYkqYFfqB+SZx1B1_sdVr8+t0Kzp5bNREycXytw@mail.gmail.com>
In-Reply-To: <CAEz4NHpi2kBHYkqYFfqB+SZx1B1_sdVr8+t0Kzp5bNREycXytw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2019 17:17:00 +0100
Message-ID: <CAJTo0LZeopO983av-ZXMSqX_Osx2Dd7iUQEFcpRj3qYj1K6bTA@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 Jul 2019 16:17:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I must have failed to actually post them, and this is now in next.
I'll rebase and send instead!

Ross

On Thu, 18 Jul 2019 at 14:56, Pierre Le Magourou <lemagoup@gmail.com> wrote=
:
>
> Hello Ross,
>
> > Can you rebase this on top of the patches I sent yesterday to change
> > the path construction to use os.path.join() please.
>
> I can't find the patches your are referring to. My patches are rebased
> on the last master, and I don't see a patch from you in master-next.
>
> Pierre
>
> Le jeu. 18 juil. 2019 =C3=A0 15:10, Burton, Ross <ross.burton@intel.com> =
a =C3=A9crit :
> >
>
> >
> > Ross
> >
> > On Thu, 18 Jul 2019 at 13:41, Pierre Le Magourou <lemagoup@gmail.com> w=
rote:
> > >
> > > From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> > >
> > > djb2 hash algorithm was found to do collisions, so the database was
> > > sometime missing data. Remove this hash mechanism, clear and populate
> > > elements from scratch in PRODUCTS table if the current year needs an
> > > update.
> > >
> > > Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics=
.com>
> > > ---
> > >  meta/classes/cve-check.bbclass                 | 12 ++++++------
> > >  meta/recipes-core/meta/cve-update-db-native.bb | 21 +++++++---------=
-----
> > >  2 files changed, 13 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.=
bbclass
> > > index 512d4c7302..c00d2910be 100644
> > > --- a/meta/classes/cve-check.bbclass
> > > +++ b/meta/classes/cve-check.bbclass
> > > @@ -26,7 +26,7 @@ CVE_PRODUCT ??=3D "${BPN}"
> > >  CVE_VERSION ??=3D "${PV}"
> > >
> > >  CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
> > > -CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve.db"
> > > +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
> > >
> > >  CVE_CHECK_LOG ?=3D "${T}/cve.log"
> > >  CVE_CHECK_TMP_FILE ?=3D "${TMPDIR}/cve_check"
> > > @@ -200,11 +200,11 @@ def check_cves(d, patched_cves):
> > >              c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (=
product,))
> > >
> > >          for row in c:
> > > -            cve =3D row[1]
> > > -            version_start =3D row[4]
> > > -            operator_start =3D row[5]
> > > -            version_end =3D row[6]
> > > -            operator_end =3D row[7]
> > > +            cve =3D row[0]
> > > +            version_start =3D row[3]
> > > +            operator_start =3D row[4]
> > > +            version_end =3D row[5]
> > > +            operator_end =3D row[6]
> > >
> > >              if cve in cve_whitelist:
> > >                  bb.note("%s-%s has been whitelisted for %s" % (produ=
ct, pv, cve))
> > > diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/re=
cipes-core/meta/cve-update-db-native.bb
> > > index 72d1f48835..3519beae5f 100644
> > > --- a/meta/recipes-core/meta/cve-update-db-native.bb
> > > +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> > > @@ -30,7 +30,7 @@ python do_populate_cve_db() {
> > >      YEAR_START =3D 2002
> > >
> > >      db_dir =3D d.getVar("DL_DIR") + '/CVE_CHECK'
> > > -    db_file =3D db_dir + '/nvdcve.db'
> > > +    db_file =3D db_dir + '/nvdcve_1.0.db'
> > >      json_tmpfile =3D db_dir + '/nvd.json.gz'
> > >      proxy =3D d.getVar("https_proxy")
> > >      cve_f =3D open(d.getVar("TMPDIR") + '/cve_check', 'a')
> > > @@ -65,6 +65,10 @@ python do_populate_cve_db() {
> > >          c.execute("select DATE from META where YEAR =3D ?", (year,))
> > >          meta =3D c.fetchone()
> > >          if not meta or meta[0] !=3D last_modified:
> > > +            # Clear products table entries corresponding to current =
year
> > > +            cve_year =3D 'CVE-' + str(year) + '%'
> > > +            c.execute("delete from PRODUCTS where ID like ?", (cve_y=
ear,))
> > > +
> > >              # Update db with current year json file
> > >              req =3D urllib.request.Request(json_url)
> > >              if proxy:
> > > @@ -91,27 +95,16 @@ python do_populate_cve_db() {
> > >      conn.close()
> > >  }
> > >
> > > -# DJB2 hash algorithm
> > > -def hash_djb2(s):
> > > -    hash =3D 5381
> > > -    for x in s:
> > > -        hash =3D (( hash << 5) + hash) + ord(x)
> > > -
> > > -    return hash & 0xFFFFFFFF
> > > -
> > >  def initialize_db(c):
> > >      c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE,=
 DATE TEXT)")
> > >      c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMA=
RY TEXT, \
> > >          SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
> > > -    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNI=
QUE, ID TEXT, \
> > > +    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
> > >          VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_STAR=
T TEXT, \
> > >          VERSION_END TEXT, OPERATOR_END TEXT)")
> > >
> > >  def insert_elt(c, db_values):
> > > -    product_str =3D db_values[0] + db_values[1] + db_values[2] + db_=
values[3]
> > > -    hashstr =3D hash_djb2(product_str)
> > > -    db_values.insert(0, hashstr)
> > > -    query =3D "insert or replace into PRODUCTS values (?, ?, ?, ?, ?=
, ?, ?, ?)"
> > > +    query =3D "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
> > >      c.execute(query, db_values)
> > >
> > >  def parse_node_and_insert(c, node, cveId):
> > > --
> > > 2.11.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

