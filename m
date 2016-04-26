Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEFC7001D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:42:20 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id zm5so9396011pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=k7iaEyqL5TooEF+9XLELt8pdgnN4xMKa7FRieG46fxQ=;
	b=Orjg/8yNDOaaov9mpvTPcXl8t8x8MQ6EFr/+/Ym6dBOvOLm6ePHjjaPC3pxxref3BG
	NjIGgiO5sbxeggbx/rhRzs7WguyUlg2FunkJtuFhvA+DVNnnL0J+KNlYQL+/Ws8PK2pE
	0bUWAezuTNSOSG5kWePzE5rgdzRtev1tmkOLFf4UDGrTg+AVowdfpnsZzVjGiIeRIDmK
	x1jSuuRAa+HkHYH0d61/IZVZ49bfj8SwMxxirldoumloBi1p9rJEiUn4xupBrhR9TnTz
	tctyMYShU/S6yInGQ+FlFe4KPLBv4d8jsuiEoxVAqyuZER7BjoV1rRspqJetmrE1CmHM
	cIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=k7iaEyqL5TooEF+9XLELt8pdgnN4xMKa7FRieG46fxQ=;
	b=j7NzOyfiecs3Tne2sG0Zr8GmCVW7e0T2JAPd5rh/GrFIsWhUJwySAhvpdbWzygLbu4
	Tt2gXZCHb8W+z2zLvNCwnp8ZucAXhhIMfhiMZGGyBxMHc+ua8+ExXnbNbt7S2AT6NlZh
	eOmOEcHqW9aWk8fEorlcSHSCL8Jb+krjaq6/2Ot7iboKlt2ALwajUQv7LZRgrNFgOqWQ
	EB+0A+dG/ojrce2sfQgpycpreprFyx3JZ8X96Gh02DC4SRzLlqBWN/h+nTwDuuRomUbo
	YKF/yx8tuFo4+B2HvEB5PLnh6PwxYeMdN30JVxzSml2Aog7d4q4A+EQzrL8PGG402KhS
	ewPA==
X-Gm-Message-State: AOPr4FVX/W4tIuGMGRtcAwT1aiI9milLNRO4OHLs4cBwM9K/Q8ccV15uCG5p4YnHWgW6IA==
X-Received: by 10.66.193.202 with SMTP id hq10mr4975948pac.6.1461688941460;
	Tue, 26 Apr 2016 09:42:21 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:b93e:176b:d03b:ac8e?
	([2601:646:8800:5a9a:b93e:176b:d03b:ac8e])
	by smtp.gmail.com with ESMTPSA id
	h88sm6500064pfd.10.2016.04.26.09.42.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:42:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160426143425.GF31113@denix.org>
Date: Tue, 26 Apr 2016 09:42:19 -0700
Message-Id: <EB8A7A83-DED7-4406-8EE2-829D71970499@gmail.com>
References: <cover.1461650616.git.liezhi.yang@windriver.com>
	<c53c41d6a33a354b8030e5a4b325aeb2753e9258.1461650616.git.liezhi.yang@windriver.com>
	<20160426143425.GF31113@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: fix for native and nativesdk
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
X-List-Received-Date: Tue, 26 Apr 2016 16:42:23 -0000
X-Groupsio-MsgNum: 81273
Content-Type: multipart/signed;
	boundary="Apple-Mail=_99503B89-11C8-432A-9305-9D0F42F6A324";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_99503B89-11C8-432A-9305-9D0F42F6A324
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 26, 2016, at 7:34 AM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> On Mon, Apr 25, 2016 at 11:04:37PM -0700, Robert Yang wrote:
>> From: Dengke Du <dengke.du@windriver.com>
>>=20
>> The do_install_append is used for moving/renaming for ALTERNATIVE, =
but
>> it breaks native, for example there is no ln, but ln.coreutils, that
>> makes coreutils-native don't work. This patch fixes the problem.
>>=20
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> meta/recipes-core/coreutils/coreutils_8.25.bb | 10 +++++-----
>> 1 file changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb =
b/meta/recipes-core/coreutils/coreutils_8.25.bb
>> index 419a693..77b3862 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
>> @@ -70,6 +70,11 @@ do_compile_prepend () {
>> }
>>=20
>> do_install_append() {
>> +	if [ "${CLASSOVERRIDE}" =3D "class-native" ]; then
>> +		rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
>> +		return
>> +	fi
>=20
> Would that skip the rest of do_install_append() for class-native due =
to the
> return call? Is it expected?

it would ignore anything below it yes. Can this be done via override =
instead

do_something_class-native () { =E2=80=A6. }
>=20
>=20
>> 	for i in df mktemp base64; do mv ${D}${bindir}/$i =
${D}${bindir}/$i.${BPN}; done
>>=20
>> 	install -d ${D}${base_bindir}
>> @@ -91,11 +96,6 @@ do_install_append() {
>> 	cp -a ${D}${mandir}/man1/test.1 =
${D}${mandir}/man1/lbracket.1.${BPN}
>> }
>>=20
>> -do_install_append_class-native(){
>> -	# remove groups to fix conflict with shadow-native
>> -	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
>> -}
>> -
>> inherit update-alternatives
>>=20
>> ALTERNATIVE_PRIORITY =3D "100"
>> --
>> 2.7.4
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_99503B89-11C8-432A-9305-9D0F42F6A324
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcfmmsACgkQuwUzVZGdMxSxIgCgha+5mHuXW8ZP2j9JkvbIsJc3
JAYAniLWvc/jKLKdpzYKSgl7tU8tAxNu
=BWT0
-----END PGP SIGNATURE-----

--Apple-Mail=_99503B89-11C8-432A-9305-9D0F42F6A324--
