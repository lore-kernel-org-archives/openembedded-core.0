Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nate.ewest@gmail.com>) id 1StRAk-0006FJ-EM
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 00:32:14 +0200
Received: by weyr6 with SMTP id r6so4350425wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 15:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
	bh=61DJ1Jd/pNRxVcBFGHo+LlIBcYZRazyVesCxndLQi/c=;
	b=qNdw108AHdTV6X6rHq5v8b8f6j6pChKiRyg2JSW0q9Nm/bhe2sTxB7UhiLpGC8ApR2
	oVyDcV3tHLM67oodLFCoGhv8NeNmwG+OWHsfnP+jWXNAU/wCRgHcLn5rH9z1dU+EiRSz
	rJUOwCnKtCx9CZ/MqmvGNXzQkOg1G1FGCvoHUSkz/diOueZNhtSPv99eubaOU7Uoxj9c
	xYqeuFaUYffck7VxO02NkLopuPFT0FPa4WJKwq8HKt5ntBUwEDpAWnTuS82QEUdF/Mse
	2pi92A2rbxZ3vwYymWaX6D3lBYp8r7OVjNREHbeZ+FNnywjJ9YFmDde0T5bf98Ob1BkE
	KCBA==
MIME-Version: 1.0
Received: by 10.180.90.207 with SMTP id by15mr1175076wib.22.1343082046653;
	Mon, 23 Jul 2012 15:20:46 -0700 (PDT)
Received: by 10.194.47.42 with HTTP; Mon, 23 Jul 2012 15:20:46 -0700 (PDT)
Date: Mon, 23 Jul 2012 18:20:46 -0400
Message-ID: <CACFtY+LaGOXzAcGbtm+8YPNJnAvfut-ukcyqJO9xthJ3qQEYhg@mail.gmail.com>
From: Nathan West <nate.ewest@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RPATH errors in postgresql
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: nateewest@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 22:32:14 -0000
Content-Type: multipart/alternative; boundary=f46d043c80464b82cb04c586a8e7

--f46d043c80464b82cb04c586a8e7
Content-Type: text/plain; charset=ISO-8859-1

I get the following list of errors while building postgresql:

I added an EXTRA_OECONF of --disable-rpath based on this fix:
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/17183

I'm not entirely sure what this does, but it does seem to fix the build. My
initial guess is it removes the INSANE checking for RPATHs. Is this the
correct fix? If not can someone guide me to the correct fix?


ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/dropdb
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/clusterdb
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/pg_restore
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/pg_dump
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/psql
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/createdb
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/droplang
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/vacuumdb
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/reindexdb
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/pg_dumpall
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/dropuser
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/createuser
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql-client:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/usr/bin/createlang
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: libecpg-compat:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-compat/usr/lib/libecpg_compat.so.3
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: libecpg-compat:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-compat/usr/lib/libecpg_compat.so.3.1
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: libecpg:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg/usr/lib/libecpg.so.6
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: libecpg:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg/usr/lib/libecpg.so.6.1
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: non -staticdev package contains static .a library:
libecpg-dev path
'/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-dev/usr/lib/libecpg.a'
ERROR: QA Issue: non -staticdev package contains static .a library:
libecpg-dev path
'/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-dev/usr/lib/libecpg_compat.a'
ERROR: QA Issue: non -staticdev package contains static .a library:
libecpg-dev path
'/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-dev/usr/lib/libpgtypes.a'
ERROR: QA Issue: libpq:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpq/usr/lib/libpq.so.5
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: libpq:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpq/usr/lib/libpq.so.5.2
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: non -staticdev package contains static .a library:
libpq-dev path
'/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpq-dev/usr/lib/libpq.a'
ERROR: QA Issue: non -staticdev package contains static .a library:
libpq-dev path
'/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpq-dev/usr/lib/libpgport.a'
ERROR: QA Issue: libpgtypes:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpgtypes/usr/lib/libpgtypes.so.3.1
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: libpgtypes:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpgtypes/usr/lib/libpgtypes.so.3
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/initdb
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/pg_resetxlog
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/pg_config
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/postmaster
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/pg_ctl
contains probably-redundant RPATH /usr/lib
ERROR: QA Issue: postgresql:
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/ecpg
contains probably-redundant RPATH /usr/lib


Thanks!
-Nathan

--f46d043c80464b82cb04c586a8e7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I get the following list of errors while building postgresql:<div><br></div=
><div>I added an EXTRA_OECONF of --disable-rpath based on this fix:=A0<a hr=
ef=3D"http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/1718=
3">http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/17183</=
a></div>
<div><br></div><div>I&#39;m not entirely sure what this does, but it does s=
eem to fix the build. My initial guess is it removes the INSANE checking fo=
r RPATHs. Is this the correct fix? If not can someone guide me to the corre=
ct fix?</div>
<div><br></div><div><br></div><div><div>ERROR: QA Issue: postgresql-client:=
 /work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-cli=
ent/usr/bin/dropdb contains probably-redundant RPATH /usr/lib</div><div>
ERROR: QA Issue: postgresql-client: /work/core2-poky-linux/postgresql-8.4.7=
-r6.0/packages-split/postgresql-client/usr/bin/clusterdb contains probably-=
redundant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql-client: /wor=
k/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-client/u=
sr/bin/pg_restore contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql-client: /work/core2-poky-linux/postgresql-=
8.4.7-r6.0/packages-split/postgresql-client/usr/bin/pg_dump contains probab=
ly-redundant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql-client: /=
work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-clien=
t/usr/bin/psql contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql-client: /work/core2-poky-linux/postgresql-=
8.4.7-r6.0/packages-split/postgresql-client/usr/bin/createdb contains proba=
bly-redundant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql-client: =
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-clie=
nt/usr/bin/droplang contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql-client: /work/core2-poky-linux/postgresql-=
8.4.7-r6.0/packages-split/postgresql-client/usr/bin/vacuumdb contains proba=
bly-redundant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql-client: =
/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-clie=
nt/usr/bin/reindexdb contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql-client: /work/core2-poky-linux/postgresql-=
8.4.7-r6.0/packages-split/postgresql-client/usr/bin/pg_dumpall contains pro=
bably-redundant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql-client=
: /work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-cl=
ient/usr/bin/dropuser contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql-client: /work/core2-poky-linux/postgresql-=
8.4.7-r6.0/packages-split/postgresql-client/usr/bin/createuser contains pro=
bably-redundant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql-client=
: /work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql-cl=
ient/usr/bin/createlang contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: libecpg-compat: /work/core2-poky-linux/postgresql-8.4=
.7-r6.0/packages-split/libecpg-compat/usr/lib/libecpg_compat.so.3 contains =
probably-redundant RPATH /usr/lib</div><div>ERROR: QA Issue: libecpg-compat=
: /work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-compa=
t/usr/lib/libecpg_compat.so.3.1 contains probably-redundant RPATH /usr/lib<=
/div>
<div>ERROR: QA Issue: libecpg: /work/core2-poky-linux/postgresql-8.4.7-r6.0=
/packages-split/libecpg/usr/lib/libecpg.so.6 contains probably-redundant RP=
ATH /usr/lib</div><div>ERROR: QA Issue: libecpg: /work/core2-poky-linux/pos=
tgresql-8.4.7-r6.0/packages-split/libecpg/usr/lib/libecpg.so.6.1 contains p=
robably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: non -staticdev package contains static .a library: li=
becpg-dev path &#39;/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-s=
plit/libecpg-dev/usr/lib/libecpg.a&#39;</div><div>ERROR: QA Issue: non -sta=
ticdev package contains static .a library: libecpg-dev path &#39;/work/core=
2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libecpg-dev/usr/lib/libec=
pg_compat.a&#39;</div>
<div>ERROR: QA Issue: non -staticdev package contains static .a library: li=
becpg-dev path &#39;/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-s=
plit/libecpg-dev/usr/lib/libpgtypes.a&#39;</div><div>ERROR: QA Issue: libpq=
: /work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpq/usr/lib=
/libpq.so.5 contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: libpq: /work/core2-poky-linux/postgresql-8.4.7-r6.0/p=
ackages-split/libpq/usr/lib/libpq.so.5.2 contains probably-redundant RPATH =
/usr/lib</div><div>ERROR: QA Issue: non -staticdev package contains static =
.a library: libpq-dev path &#39;/work/core2-poky-linux/postgresql-8.4.7-r6.=
0/packages-split/libpq-dev/usr/lib/libpq.a&#39;</div>
<div>ERROR: QA Issue: non -staticdev package contains static .a library: li=
bpq-dev path &#39;/work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-spl=
it/libpq-dev/usr/lib/libpgport.a&#39;</div><div>ERROR: QA Issue: libpgtypes=
: /work/core2-poky-linux/postgresql-8.4.7-r6.0/packages-split/libpgtypes/us=
r/lib/libpgtypes.so.3.1 contains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: libpgtypes: /work/core2-poky-linux/postgresql-8.4.7-r=
6.0/packages-split/libpgtypes/usr/lib/libpgtypes.so.3 contains probably-red=
undant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql: /work/core2-po=
ky-linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/initdb con=
tains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql: /work/core2-poky-linux/postgresql-8.4.7-r=
6.0/packages-split/postgresql/usr/bin/pg_resetxlog contains probably-redund=
ant RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql: /work/core2-poky-=
linux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/pg_config con=
tains probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql: /work/core2-poky-linux/postgresql-8.4.7-r=
6.0/packages-split/postgresql/usr/bin/postmaster contains probably-redundan=
t RPATH /usr/lib</div><div>ERROR: QA Issue: postgresql: /work/core2-poky-li=
nux/postgresql-8.4.7-r6.0/packages-split/postgresql/usr/bin/pg_ctl contains=
 probably-redundant RPATH /usr/lib</div>
<div>ERROR: QA Issue: postgresql: /work/core2-poky-linux/postgresql-8.4.7-r=
6.0/packages-split/postgresql/usr/bin/ecpg contains probably-redundant RPAT=
H /usr/lib</div><div><br></div></div><div><br></div><div>Thanks!</div><div>
-Nathan</div>

--f46d043c80464b82cb04c586a8e7--
