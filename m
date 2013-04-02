Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1UN2Mq-0001Fz-U2; Tue, 02 Apr 2013 16:39:22 +0200
Received: by mail-pd0-f177.google.com with SMTP id u11so267390pdi.36
	for <multiple recipients>; Tue, 02 Apr 2013 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=riqMsEqyhSlzpr4ywHXAvcV9RKiFvxVhQjOHlu30O3E=;
	b=BEq8aNmya/1+psxJmvmBLvIo3T5I1xv8v5Hy3F+wm4VY3LGdf4gqp3GGDpCqzRQ9g8
	evGXbCsaHxG3U+Y9fX2A2nL166N7ipDo9Btvm6ibVsMxwrizQAt2JJ4SknIBzXXgG7/B
	YCyroDOB10QsBMEa49za3wAje+K9TGRIgZf1fWWm8irR52pv4br9So8lB6mU9JPBRxHL
	YphosMYRINRdVJOQjc8xlEi4aqyKKApAJX632WvMWZw8Ka0OrQ3wi+2Dyth8dmeiBTKg
	802H9nPmUXTmyFHNoaOH1m2sZZdBJonI4mFMPAHPep3S1VxMflJOGT1H4Z+RYHhtk4o4
	41+g==
X-Received: by 10.66.27.136 with SMTP id t8mr24998942pag.209.1364912530142;
	Tue, 02 Apr 2013 07:22:10 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id tf8sm1887492pbc.42.2013.04.02.07.22.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 07:22:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130401095202.GP11120@jama>
Date: Tue, 2 Apr 2013 07:22:13 -0700
Message-Id: <4669BF70-0FA8-441D-9A60-325FA8DFA54B@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<20130329145514.GH11120@jama> <20130330090319.GM11120@jama>
	<20130401095202.GP11120@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Tue, 02 Apr 2013 14:39:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Thanks Martin, elfutils test case is now reduced and reported others I =
will take a look.

On Apr 1, 2013, at 2:52 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Sat, Mar 30, 2013 at 10:03:19AM +0100, Martin Jansa wrote:
>> And now the rest of qemuarm gcc-4.8 world failure
>>=20
>> openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.148.bb, =
do_compile
>> ICE as reported before
>>=20
>> openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
>> gcc-4.8.0/libatomic/config/linux/arm/store_n.c:46:0: fatal error:
>> opening dependency file .deps/store_1_.lo.Ppo: No such file or =
directory
>> |  #include "../../../store_n.c"
>>=20
>> =
openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.b=
b, do_compile
>> xf86Crtc.c:391:5: error: implicit declaration of function =
'xf86InputRotationNotify' [-Werror=3Dimplicit-function-declaration]
>>=20
>> openembedded-core/meta/recipes-graphics/xorg-app/xmodmap_1.0.7.bb, =
do_compile
>> xmodmap.c:289:5: error: implicit declaration of function 'asprintf' =
[-Werror=3Dimplicit-function-declaration]
>>=20
>> meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, =
do_compile
>> glib-2.0/glib/gmacros.h:162:53: error: typedef =
'_GStaticAssertCompileTimeAssertion_0' locally defined but not used =
[-Werror=3Dunused-local-typedefs]
>>=20
>> =
meta-openembedded/meta-oe/recipes-connectivity/networkmanager/modemmanager=
_0.6.0.0.bb, do_compile
>> glib-2.0/glib/gmacros.h:162:53: error: typedef =
'_GStaticAssertCompileTimeAssertion_0' locally defined but not used
>>=20
>> =
meta-openembedded/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb=
, do_compile
>> ipsec_doi.c:1321:24: error: argument to 'sizeof' in 'memset' call is =
the same expression as the destination; did you mean to dereference it? =
[-Werror=3Dsizeof-pointer-memaccess]
>> |   memset(pair, 0, sizeof(pair));
>>=20
>> And couple of old failures, which are not caused by gcc upgrade for =
sure.
>>=20
>> Complete log:
>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130329_124637.log/
>=20
> And logs from qemux86:
> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130330_090402.log/
>=20
> qemux86-64
> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130331_084823.log/
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



