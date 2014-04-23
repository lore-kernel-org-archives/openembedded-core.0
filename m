Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C800609B1;
	Wed, 23 Apr 2014 04:21:11 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so420361iec.35
	for <multiple recipients>; Tue, 22 Apr 2014 21:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=xiXD8a4M0QWZeFXR6lxWdElv6p+2/0Aqkf+ccqeRMxg=;
	b=yr8BdAG+8dD2+Fw7wiUkv6BUoHf1FKiAIz/9gXwcBbUDESy4ls4hvnjyBgKqrv7qEG
	4/dou5Fx0TXRX3ep0CQj2d5Jn0sqC06BaA+X+qIkOXBXyGXOrMke4/e7tpAm+YSy+XiZ
	s5NYrsRlQ5kn6QT89b6LJ6/rJhWajW92mraqbq9VYEPxhMSDF0HEh/TVaGjDBHvMA70q
	gWrjYKkCoVzk5DmbMonGRtdDDcR3WauT1vOfCnOldxwEXiNIVR5gSc//SdYREfX9fKDz
	mFQRHePjNAsK4+XedqQwlujh8z6liNCNjsteYi503lrvDxlPYOpOhyhH6AbSNkUesfYI
	P0Kg==
X-Received: by 10.43.140.144 with SMTP id ja16mr42074131icc.46.1398226872113; 
	Tue, 22 Apr 2014 21:21:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 22 Apr 2014 21:20:42 -0700 (PDT)
In-Reply-To: <E7466334-BD13-4847-948A-0885F4B4F987@gmail.com>
References: <E7466334-BD13-4847-948A-0885F4B4F987@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Apr 2014 21:20:42 -0700
Message-ID: <CAMKF1spn=3YxzzJcYQs5RXya=eKJkMa=dPyU92awEPtmdRTvMQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>
Subject: Re: [RFT] gcc 4.9
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
X-List-Received-Date: Wed, 23 Apr 2014 04:21:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 23, 2014 at 1:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> gcc 4.9 release is coming in summer therefore I have put together the recipes here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-4.9
>
> So far my testing has been booting angstrom/systemd-image on all supported
> qemu machines (except qemumips64 where there is a know kernel issue) both eglibc/uclibc
> images
>
> we would like to target them for 1.7 release so if you have cycles to test out
> your image/machine combos please do so I would be interested in feedback and would accumulate fixes in this branch
>
> If you run into some issues with some packages then its recommended to go through
>
> http://gcc.gnu.org/gcc-4.9/changes.html
>
> and especially http://gcc.gnu.org/gcc-4.9/porting_to.html
>
> Which could help in cooking patches
>

Hi All

As you might have noticed gcc 4.9.0 was released today

changed are here http://gcc.gnu.org/gcc-4.9/changes.html

I have updated my contrib tree to use the release tar balls. Please
test the branch out. If you are using OE-Core
standalone you don't need to do anything once you apply the patches
from contrib branch it should select 4.9
I have left 4.8 still there since we want to phase it out only when we
are sure that complete ecosystem is working
fine with 4.9

Thanks
-Khem

