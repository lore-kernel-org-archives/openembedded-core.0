Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id C2AFD61037
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 20:21:10 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so10859435obc.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ozP8cGY/NNEdJVl9lTxLwMIqgLOfaC3ZTEem4I/Ubeo=;
	b=uLs6HvU96jfvkb3JlJ7nBowg04TWR5R4phOpjjH786RsBpiPu0iDPNw23ojTRW7GD0
	ZeHRouBXZsyyrIpVqQ6rlJtyxULgnOH4H5mBbhbGpUA2mTKdt+6KYfYzReXOCXAw8OvZ
	x5JJcuM0BWUfnI19RxYJbcRdLLRyfrN6pBJjH+8lFzWl22ROwkIs4tRCrh/UKqTyP5kW
	I1B5VqkUBOUNhwMkXChcr7vNQchyTCwI4CR9bJBuGYgnpkdux4CL7o3X6fgHD7yVgKfu
	HU8jAg8X8a6WuGlpbrOfmI9nU7v/8u1AG4e2ftH6Q0KzhrxKGjIwDOJPvrmR8kfLixbo
	ZGrw==
X-Received: by 10.60.60.5 with SMTP id d5mr6099225oer.0.1376425271134;
	Tue, 13 Aug 2013 13:21:11 -0700 (PDT)
Received: from [172.23.7.190] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id it7sm2331687obb.11.2013.08.13.13.21.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 13:21:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1376424663.1838.26.camel@ted>
Date: Tue, 13 Aug 2013 13:21:07 -0700
Message-Id: <8DBFAB3F-5582-4B00-A679-8C9EB06F82B9@gmail.com>
References: <6741EAAB26B57F4995668065CB62D86B33933627@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKhTFiKC8BwPhtULqmtkuzgYV3MVPOCLn64ibgGYjuaGA@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33933DFC@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKiRwXD8gJhG+7XDSHSGEvZY3YBR5MxBZieVMYPd_sL1g@mail.gmail.com>
	<6741EAAB26B57F4995668065CB62D86B33934034@IRSMSX102.ger.corp.intel.com>
	<CAFpw0gKCKapZsVm-sShNcfN_sE+hQM=1oWPoz-=g-PRMnzwTiw@mail.gmail.com>
	<8B119486-AEBF-46F6-9EB1-BC31C81A80D3@gmail.com>
	<1376424663.1838.26.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org, "Sywula,
	Krzysztof M" <krzysztof.m.sywula@intel.com>
Subject: Re: Yocto toolchain for Windows
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
X-List-Received-Date: Tue, 13 Aug 2013 20:21:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 13, 2013, at 1:11 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2013-08-13 at 09:17 -0700, Khem Raj wrote:
>> On Aug 12, 2013, at 6:34 AM, Francois Retief <fgretief@gmail.com>
>> wrote:
>=20
>>> My understanding is that MinGW is the libc library for Win32
>>> environments. So we need to "replace" eglibc with mingw for all code
>>> that execute on the Win32 platform.  In the case of OpenEmbedded, it
>>> is all packages that start with "nativesdk-" when is
>>> SDKMACHINE=3D"x86_64-mingw32".
>>>=20
>>>=20
>>> Over the weekend I worked on this by disabling the eglibc recipes
>>> and seeing what packages are missing.  The eglibc recipe provides
>>> the "virtual/nativesdk-libc" package. My understanding is that this
>>> virtual package must be implemented by MingGW.  In the process I
>>> also found that pthreads-win32 was needed and added a recipe for
>>> this.
>>=20
>>=20
>> Not really but if you stub eglibc from nativesdk out then make sure
>> the host libc is plugged in correctly at all places where its
>> expected. Its safer to let it
>> build its own nativesdk eglibc. Since we also modify the shared
>> library load paths in dynamic linker to use own nativesdk libraries
>> first if available
>=20
> Think about this for a second Khem - we're building a gcc which will =
run
> on windows. Having a nativesdk-eglibc is therefore not desirable or =
even
> possible, we need the mingw runtime instead.

Yes you are right. however I was thinking somehow mingw could run eglibc =
but now I realize I was
thinking more like cygwin env

>=20
> I looked into this and NLS is enabled for nativesdk so it was trying =
to
> build eglibc for libiconv and libintl.

hmmm ok we have recipes for libiconv and proxy-libintl ( in meta-oe =
right now)
we can add nativesdk variants of them and then use the =
PREFERRED_PROVIDER magic


> I've hacks on my branch to force
> NLS off and use the libs as uclibc does. The takeaway of this is we
> really need to make NLS properly configurable for nativesdk and then
> this becomes much easier to solve.

that too.

>=20
> I pushed some updates onto my branch and meta-toolchain now builds a
> nice looking SDK tarball with ipk packaging, rpm for some reason has
> missing files (some problem with smart). Whether the compiler there
> works or is useful on windows I have no idea.


cool will take a look at your branch

>=20
> I've probably done all I plan to do with this which was really a bit =
of
> fun for me to prove what is/is not possible. I'd be interested if =
anyone
> tries using it though.

I think its a good addition to core. we should give it some soak time =
and pick
the bits may be for 1.6 timeframe.

>=20
> Cheers,
>=20
> Richard
>=20


