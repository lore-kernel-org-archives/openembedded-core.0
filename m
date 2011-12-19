Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RcV3J-00069a-TQ
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 05:42:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Dec 2011 20:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103659574"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2011 20:35:05 -0800
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 19 Dec 2011 12:34:49 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 19 Dec 2011 12:34:49 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Mon, 19 Dec 2011 12:34:47 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 12:34:47 +0800
Thread-Topic: [OE-core] [CONSOLIDATED PULL 15/17] wget: enable https and
	openssl
Thread-Index: Acy+BIW9DY0O1trYQkKg5v2Q0PhHhgAAuhnA
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E0F23@shsmsx502.ccr.corp.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
	<94eb40ea45e45387d28fc04e3929f1044188b589.1323333676.git.sgw@linux.intel.com>
	<CAMKF1sru2cSoejrGD6OEDxvYeoD7XzrrkzhApZJqWWjukjL6fA@mail.gmail.com>
	<CAGDS+nmVUgF6sEdqH519gRbLAJwA2-RvbZB5X8kGXBcGB=kNUQ@mail.gmail.com>
In-Reply-To: <CAGDS+nmVUgF6sEdqH519gRbLAJwA2-RvbZB5X8kGXBcGB=kNUQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 15/17] wget: enable https and	openssl
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
X-List-Received-Date: Mon, 19 Dec 2011 04:42:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Steve Sakoman wrote on 2011-12-19:
> On Fri, Dec 9, 2011 at 12:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Dec 8, 2011 at 12:44 AM, Saul Wold <sgw@linux.intel.com>
> wrote:
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>> =A0meta/recipes-extended/wget/wget.inc | =A0 =A06 +++---
>>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-extended/wget/wget.inc
>>> b/meta/recipes-extended/wget/wget.inc index 91400cc..7083569 100644
>>> --- a/meta/recipes-extended/wget/wget.inc +++
>>> b/meta/recipes-extended/wget/wget.inc @@ -2,13 +2,13 @@ DESCRIPTION =3D
>>> "A console URL download utility featuring HTTP, FTP, and more."
>>> =A0SECTION =3D "console/network" =A0LICENSE =3D "GPL" =A0LIC_FILES_CHKS=
UM =3D
>>> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504" +DEPENDS =3D
>>> "openssl"
>>>=20
>>> -INC_PR =3D "r11"
>>> +INC_PR =3D "r12"
>>>=20
>>> =A0inherit autotools gettext update-alternatives
>>>=20
>>> -# Disable checking for SSL since that searches the system paths
>>> -EXTRA_OECONF =3D "--with-libc --enable-ipv6 --without-ssl"
>>> +EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-ssl=3Dopenssl"
>>=20
>> this deserves to be a configurable thing IMO
>=20
> Agreed.  Also, this seems to break the wget build for non x86 processors.
>=20
> For example, on arm builds the config phase fails:
>=20
> configure:30042: checking for libssl
> configure:30072: ccache arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a
> -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp
> -mfpu=3Dneon -mtune=3Dcortex-a8
> --sysroot=3D/media/Work/yocto-tmp/sysroots/omap3-multi -o conftest -O2
> -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed conftest.c -ldl -lz  -lssl -lcrypto /usr/lib/libz.so
>> &5
> /usr/lib/libz.so: could not read symbols: File in wrong format
Hi, Steve,
I found this issue, too.
I've made a patch for this and will send it out soon.

Thanks,
-- Dexuan




