Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIKVm-0007OJ-UA
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:24:18 +0200
Received: by wwf10 with SMTP id 10so7403240wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 06:18:18 -0700 (PDT)
Received: by 10.227.59.140 with SMTP id l12mr9268803wbh.27.1319462298460;
	Mon, 24 Oct 2011 06:18:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fi11sm38974811wbb.9.2011.10.24.06.18.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 06:18:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319462069.25011.0.camel@ted>
Date: Mon, 24 Oct 2011 15:18:11 +0200
Message-Id: <884DC19F-D167-41B9-B5E6-62A959BE99CB@dominion.thruhere.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<dfc5efb4c54797a39c2471dfba7b7cbf14fb6476.1319394187.git.sgw@linux.intel.com>
	<1319462069.25011.0.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 26/27] abiword: convert to svn
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 24 Oct 2011 13:24:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 okt. 2011, om 15:14 heeft Richard Purdie het volgende geschreven:

> On Sun, 2011-10-23 at 11:27 -0700, Saul Wold wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> meta-demoapps/recipes-gnome/abiword/abiword.inc    |    4 ++--
>> meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |   10 ----------
>> meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 ++++++++++
>> 3 files changed, 12 insertions(+), 12 deletions(-)
>> delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
>> create mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
>>=20
>> diff --git a/meta-demoapps/recipes-gnome/abiword/abiword.inc =
b/meta-demoapps/recipes-gnome/abiword/abiword.inc
>> index b1b0f67..2b34a7a 100644
>> --- a/meta-demoapps/recipes-gnome/abiword/abiword.inc
>> +++ b/meta-demoapps/recipes-gnome/abiword/abiword.inc
>> @@ -13,8 +13,8 @@ RRECOMMENDS_${PN}    =3D "glibc-gconv-ibm850 =
glibc-gconv-cp1252 \
>> RELURI =3D =
"http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.g=
z"
>> RELSRC =3D "${WORKDIR}/abiword-${PV}/abi"
>>=20
>> -CVSURI =3D =
"cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=3Dabi"
>> -CVSSRC =3D "${WORKDIR}/abi"
>> +SVNURI =3D =
"cvs://svn.abisource.com/abiword/trunk;module=3Dabiword;proto=3Dhttp"
>> +SVNSRC =3D "${WORKDIR}/abi"
>>=20
> Er, its still using cvs:// ?!

The whole abiword section is outdated, it has 2.5.2 which was released =
on 21-Aug-2007, latest is 2.8.6 released on 13-Jun-2010. I have an =
uncommited update in meta-oe to update abiword to 2.8.6, need to clean =
that up.

regards,

Koen




