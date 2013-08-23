Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 94A146B91B
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:08:35 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id lb1so902587pab.40
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=MHn/IHVyj1T1yhRCu9g7pU2Ou7R6Be+2hCKdsmBtua0=;
	b=H1nAA8BU/wp50jBHwohVKdZ1BGNXCAJe0x2zVbukqSL9pTfNRgAVH4xwlwATkqUQpS
	K4yvTEpinoOranRa0qveUtTSxfvME1fQaXgbyu1PJQ4IUi+dTIQRIwCsLI/7o0ISvsY1
	10SGyugWDIW4JiySGIPoC4GQI2iUUq49RS3m2ULyDOAZm8VgE+HSYlZmLpntp1qzx+sD
	0jwP6dAmwpZui9+1BGPikVUa4F32+k93vJbiajPTu2KXINjKsDX0IoShT8MFaipayPBd
	T5lyH55udM5lpttuY6fIHmXgrxchj6NS7OaNb4OxFAkdAY+nmuUWkXWmAjHb7HQKmjvz
	A5nw==
X-Received: by 10.68.238.104 with SMTP id vj8mr666593pbc.149.1377277716193;
	Fri, 23 Aug 2013 10:08:36 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id in2sm864537pbc.37.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:08:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130822225302.GN522@jama>
Date: Fri, 23 Aug 2013 10:08:27 -0700
Message-Id: <97E14A4F-C674-4D5A-946F-F09F41F35AB3@gmail.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
	<52168CC1.5050906@linux.intel.com> <20130822225302.GN522@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 17:08:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 22, 2013, at 3:53 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Thu, Aug 22, 2013 at 03:12:17PM -0700, Saul Wold wrote:
>> On 08/22/2013 02:24 PM, Khem Raj wrote:
>>> Hi
>>>=20
>>> In spare cycles my box ran world build for all eglibc/qemus, arm, =
ppc, mips looks all fine however I see errors on mips64,x86 and x86_64
>>> I am looking into the mips64 one.
>>>=20
>>> x86_64
>>> =3D=3D=3D=3D=3D=3D
>>>=20
>>> Summary: 17 tasks failed:
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib=
/libxft_2.3.1.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/ca=
iro_1.12.14.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gst-plugins-base_0.10.36.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/blue=
z/bluez4_4.101.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/curl/curl=
_7.32.0.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/beecrypt/=
beecrypt_4.2.1.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-xse=
rver/xserver-xorg_1.14.0.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/mesa/mes=
a_9.1.6.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-core/glib-network=
ing/glib-networking_2.36.2.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/enchant/e=
nchant_1.6.0.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/neon/neon=
_0.30.0.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-base_1.0.9.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/taglib/ta=
glib_1.8.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-extended/parted/p=
arted_3.1.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-extended/libuser/=
libuser_0.59.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/near=
d/neard_0.10.bb, do_compile
>>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/blue=
z5/bluez5_5.7.bb, do_compile
>>>=20
>> I do regular builds on my local machine of world and qemumips (not=20
>> mips64) with MUT, I wonder what your failures are.  I will do a =
scratch=20
>> build right now.
>>=20
>> What's your exact setup?  any other settings in your local.conf?


Ran fresh from scratch builds and it seems its better, I have posted the =
results at
http://sakrah.homelinux.org/files/world/

It seems x86/x86_64 is same failure that Martin mentioned

x86_64

Summary: 2 tasks failed:
  =
virtual:multilib:lib32:/builds1/angstrom/sources/openembedded-core/meta/re=
cipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-dri=
ver/xf86-video-intel_2.21.13.bb, do_compile

x86

Summary: 1 task failed:
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-dri=
ver/xf86-video-intel_2.21.13.bb, do_compile


mips64

Summary: 1 task failed:
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-devtools/dpkg/dpk=
g_1.17.1.bb, do_configure

other qemus all look green=

