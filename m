Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 77373615E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:54:32 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so800676pde.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=XLwAglfCJnv4jVTekaAIW24uCDQJkwDwjMgddPzIzHg=;
	b=pHm3lIy+gpZ8R6qZltIQinvBu2whHi7SxBFFTA/ZBGLr+uYkTu7AgLFQ/G99W83vc2
	9ymPIYI7x+XZ4oVzbJl9DzYJWpXgalmKnSDyNilyXWVNFT/vj3vgriExWkn/vvAyMUZq
	Kfky1P1rvOC1bgtY7GzDRvw1o5SU8qcRcrXuP8RiV/wMl4dYK8Ee2tvonUcGN7aPTvR8
	n8vTdnLvQ6SnUgq2Q0bWvTjRel6P9xO//+uArUTMk4t2DJdGkjayMo3EiUor06KIH4+H
	+8+uIHo3nj47kveMgcJlPDdAwOkYFqMb6wP9i84wLYxQ2RZ0Ai37Hks7KhOqd6RVPOL+
	53Dg==
X-Received: by 10.68.189.98 with SMTP id gh2mr174711pbc.181.1379051674292;
	Thu, 12 Sep 2013 22:54:34 -0700 (PDT)
Received: from [192.168.0.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209]) by mx.google.com with ESMTPSA id
	ha10sm9236019pbc.23.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 22:54:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <522690CF.6030707@windriver.com>
Date: Thu, 12 Sep 2013 22:54:40 -0700
Message-Id: <F267F9B9-8FB3-4DD8-938B-054B84882287@gmail.com>
References: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
	<522690CF.6030707@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC search paths in MinGW SDK
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
X-List-Received-Date: Fri, 13 Sep 2013 05:54:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 3, 2013, at 6:45 PM, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 9/3/13 4:13 PM, Francois Retief wrote:
>> Hi all,
>>=20
>> Thanks to Richard's recent improvements in the oe-core tree, I =
finally got my
>> first MinGW build to compile through and generate a SDK tarball.
>>=20
>> Next issue is that on windows GCC is unable to find the crt1.o, =
crti.o and
>> crtbegin.o files. when compiling a small hello world app (see gist
>> =
<https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-20=
13-09-03>
>> [1] for gcc verbose output). I verified that the files are indeed in =
the SDK
>> folders and was correctly unpacked.
>>=20
>> Next, I checked the search path (-L) options and they point to the =
respective
>> directories where the files reside.
>>=20
>> Is it hard coded somewhere GCC should look for these files?  Can =
anyone give me
>> some pointers where to start looking?

are you passing correct --sysroot option to gcc ?

>=20
> Usually GCC can learn the location where it was executed from, and =
then use a relative path from that to the location where the libc and =
other components are located.


are you talking about GCC_EXEC_PREFIX ?
>=20
>> Cheers,
>>   Francois
>>=20
>> ps. I have noticed that there is a relocate_sdk.py file in the root =
of the SDK
>> folder. What is it's purpose and can it have anything to do with the =
GCC search
>> paths?
>=20
> On linux we play with the RPATH and other components to ensure that =
the executables can file the libraries for execution.  I don't believe =
that is a problem on windows as the DLLs are searched automatically.
>=20
> --Mark
>=20
>> [1]
>> =
https://gist.github.com/fgretief/6429416#file-mingw-gcc-verbose-output-201=
3-09-03
>> [2] https://github.com/fgretief/meta-mingw
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


