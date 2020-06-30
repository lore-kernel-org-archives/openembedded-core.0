Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4732.1593543685307355036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 12:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FrRZ71Il;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3152; q=dns/txt; s=axis-central1;
  t=1593543685; x=1625079685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q+cpWWywzdtTb6ZpG1Eq7CN0cTQlGxztx64RX5+Ak4o=;
  b=FrRZ71IlGs2ipIxcH3D7mOCgCeiAUbptXSXtwhVffN98Ap5uM5/IVa/e
   5mwYYttj7GiInTNNcSoXlWWFiA+CxCOPd4MJSV6PA0YVOpPA8i91vaLXS
   SArxTNciOMfIGi00S2jcTRCalrQa+KG0nCqf3FlFL3YeXmRyWcMcsOe51
   8+ceMghqOU9JPln0xPGxLLejjJDAXdF4JKMdU+HewfYlSRE7c2CBncKkZ
   t+lWHHjdoWKjkZoRXdvovMEaCXZ3obqiQJeW02cW5u+Z3qfmJOJlqiX25
   JTfk4cFA+gcYFRW+gzLDIZsMvs7VyxQtpBhA7PmzoAC/qtyQGlI5BI32y
   Q==;
IronPort-SDR: OisaqswZtt3iEMwu8o/ncc3+parxF4nAyC1rUP5LlxDQos8DYCv3ixRUpzCTuTMmuswK7QviMM
 E8FC2rmnm4MwH6cH8kh46pnIgpcdHsRHS57e/92hZ4JmKsIQHPi62zunoaKzL0GcuGlmIbSD+v
 +CNvWc3Sh+XazraUuX2OYFAgotsZpGSfSGoU70aa0/MeXw9UtJ5tNkXxyuiYxAFSziki4heBxn
 /UO4K59U9uW3tdu9L1fUK4uw3dt6wBf9kDDBnMSoq07dVjx8zfD0FfWRgGP7Qal4spSXlJIGhj
 RNI=
X-IronPort-AV: E=Sophos;i="5.75,298,1589234400"; 
   d="scan'208";a="10061044"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWStlhmROMe50x8EKtBnMpvXTtHajqmKGAgAbxVuw=
Date: Tue, 30 Jun 2020 19:01:23 +0000
Message-ID: <1593543683295.70380@axis.com>
References: <20200625101413.2783-1-fredrigu@axis.com>,<CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
In-Reply-To: <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Ross,=0A=
those 5 seconds will increase to minutes for my use case and we build a lot=
=0A=
hence I hope this will save us a lot of computer power and engineering time=
.=0A=
For example I've sent numbers on building a bigger image (core-image-sato-s=
dk-ptest)=0A=
to Alex and Alex:=0A=
out.apk.1: 1:13.35=0A=
out.apk.2: 1:13.51=0A=
out.apk.3: 1:13.23=0A=
out.apk.4: 1:14.07=0A=
out.apk.5: 1:13.00=0A=
out.deb.1: 3:49.37=0A=
out.deb.2: 3:50.77=0A=
out.deb.3: 3:51.39=0A=
out.deb.4: 3:53.40=0A=
out.deb.5: 3:53.99=0A=
out.ipk.1: 2:38.99=0A=
out.ipk.2: 2:39.07=0A=
out.ipk.3: 2:35.34=0A=
out.ipk.4: 2:36.15=0A=
out.ipk.5: 2:34.55=0A=
out.rpm.1: 1:58.61=0A=
out.rpm.2: 1:59.42=0A=
out.rpm.3: 1:59.70=0A=
out.rpm.4: 1:58.96=0A=
out.rpm.5: 1:58.11=0A=
=0A=
Also consider that if we've a target without python with limited space, rpm=
 is out=0A=
of the question. So the real comparison would be between ipk and apk. Let's=
=0A=
say we can save 80 seconds in each build. Now multiply that with the number=
 of=0A=
builds, and we do a lot (I guess we might approach 100 000 builds/week in t=
he=0A=
next year). Then this will save 92.5 days build time each week.=0A=
=0A=
That's why I'm passionated about this.=0A=
=0A=
/Fredrik=0A=
________________________________________=0A=
From: Ross Burton <ross@burtonini.com>=0A=
Sent: Friday, June 26, 2020 12:52 PM=0A=
To: Fredrik Gustafsson=0A=
Cc: OE-core; tools-cfpbuild-internal; Hugo Cedervall=0A=
Subject: Re: [OE-core] Add package managers as a plugin=0A=
=0A=
On Thu, 25 Jun 2020 at 11:14, Fredrik Gustafsson=0A=
<fredrik.gustafsson@axis.com> wrote:=0A=
> Poky today has three different package managers, the well-known formats d=
eb=0A=
> and rpm is supported as well as ipkg that is good for embedded devices.=
=0A=
>=0A=
> When building and having a good cache hit, a significant amount of time i=
s=0A=
> spent in the phase of generating a rootfs, which is really about the=0A=
> performance of the package manager. ipkg is way slower than deb or rpm. T=
o=0A=
> save build time and also get a package manager that is suitanle for use o=
n=0A=
> targets where flash memory is a concern, support for apk is suggested.=0A=
>=0A=
> However, it might or might not be what's wanted for Poky since it increas=
es=0A=
> the test matrix. Therefore this patch series refactors the package=0A=
> management code so that it's possible to add more package managers in oth=
er=0A=
> own layer. I will send another patch serie that will add apk.=0A=
=0A=
As to the code review I mostly second what Paul said.=0A=
=0A=
However, obviously you actually have strong feelings on this as the=0A=
series represents a fair amount of work.  What are the compelling=0A=
reasons to use apk?  Five seconds on core-image-minimal doesn't really=0A=
sell it to me, I don't think anyone ever claimed that opkg has been=0A=
performance optimised, dpkg isn't really used that much: maybe we=0A=
should re-evaluate what package managers are supported if apk has=0A=
feature parity but is significantly faster or has other advantages.=0A=
=0A=
Ross=0A=
