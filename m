Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UN77u-0001y9-UH
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 21:44:15 +0200
Received: by mail-da0-f50.google.com with SMTP id t1so321691dae.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=3LKEH7uUzXCEsbKt1K8rdOvAv4yi1Zthafkfv41kPbg=;
	b=BZTilDB+Ejyn1NfJA8ECcinHBMhWP5ydvn9smdUbCtX3e4+D5/YTwK/d1GdWnmL1e5
	Bi/SzvYh5pHJszI5tkd0ttP96OAQV+jHhIURgj+MaIOUV4S5wA4JgIBdj4Wa4mz791k7
	infVAWn6EUdBZoXShjKENlTrk1JX3RSOzd2y6RRYChETIlK5HGDKKwMpIZyJTj2JdfvC
	JsYMOMLcbqtCPaMUhio+o7S1ngwcNhW4/Ix5i5jxwW24A8LkQL2lt/aWVgNLjoUIUx96
	YjoIbFA3C7ge5N57KODiZP3Jr4gLPc2lOcTq5DiDcQiZh0LHM7c2Onrrod1wB/i1P74I
	X/dA==
X-Received: by 10.68.75.109 with SMTP id b13mr26345776pbw.25.1364930823857;
	Tue, 02 Apr 2013 12:27:03 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id li15sm3533908pab.2.2013.04.02.12.27.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 12:27:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364921183.6526.10.camel@ted>
Date: Tue, 2 Apr 2013 12:27:07 -0700
Message-Id: <0194B3E3-E469-45E4-AAB4-4ED15EF93DA6@gmail.com>
References: <1364872704-14812-1-git-send-email-raj.khem@gmail.com>
	<1364921183.6526.10.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Let eglibc-extra-nss-dev exist as empty package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 19:44:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 2, 2013, at 9:46 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2013-04-01 at 20:18 -0700, Khem Raj wrote:
>> eglibc-extra-nss-dev is a dependency for libc6-dev but
>> the package is empty and is not created as a result target
>> install of libc6-dev fails. This will create an empty package
>>=20
>> [Yocto Bug #4168]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-core/eglibc/eglibc-package.inc |    4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-core/eglibc/eglibc-package.inc
>> index 88a00a4..ca0cc4c 100644
>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>> @@ -17,7 +17,9 @@ python __anonymous () {
>> # Set this to zero if you don't want ldconfig in the output package
>> USE_LDCONFIG ?=3D "1"
>>=20
>> -PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils =
eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault =
${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev =
${PN}-staticdev ${PN}-doc"
>> +PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils =
eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault =
${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev =
${PN}-staticdev ${PN}-doc eglibc-extra-nss-dev"
>> +
>> +ALLOW_EMPTY_eglibc-extra-nss-dev  =3D "1"
>=20
> As discussed in the bug, I think this is an issue with smart erroring =
on
> recommends which it shouldn't do. More investigation/discussion
> therefore needed as this patch just fixes one issue and there will be
> others.
>=20

I agree. If its smart issue lets fix smart instead.

> Cheers,
>=20
> Richard
>=20



