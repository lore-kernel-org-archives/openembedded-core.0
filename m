Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7AF06010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 18:18:45 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id l75so1953705qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SjNoKQJlBTZZZkDQbDxIBM+c6zw7odDLUpKEwFZgTAk=;
	b=x5bTrx8zGbJXOHzxH0bq2pfe1zzD2+fqADdoYm/p2GvAe0V2kxDrKtYqUuOhyYGMwu
	dxZO0Wni+VSrvtk597l0ImiM5uSTEs1bNebxZSzqyis7ni3LLih23cjiR7jASEgtcoLE
	Vg7kZ6Nuu/tHu4Xt7t5qeSGmqfaf3KslZ/mMzUJjmrpKdAQHSyaMCb8NFnp9w4r7QQTj
	QPf4KTptSk7vnif8CU1AkZ+s8GSIcKqVX8ph7XDR1CoTelNmLQi8UmyF4z5nygALEs7A
	OlA6D6/1Usbj2uCStjzNCifSNfsrYes7G9FhN+Ip/piXZI9Q9WGIqU70+gngA6cE7+KC
	VEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SjNoKQJlBTZZZkDQbDxIBM+c6zw7odDLUpKEwFZgTAk=;
	b=DAsab47F+RRnU0UER17VNP9H+YwtEFstBw3iz/LOTXFVvQY4oZO9SvTk6pz0mo/Tt6
	Iw7//bq5kH0YK8EOEvaAhBVNNOkQRr5xjo+dyreYn4Q/IvHmBF4jQKEXu5HwuDdeBYfb
	EX8+lg49bt5hc7AyWzhntW5VYQCP7RbyXY7kj4gLr3th9O1uf82FlVhRGDUAAVtQO8Bq
	pCjTx4x4YhavFCFUy1Mck4KU0vc7mXcMPSVz/KeYfOo9clNmasVdPjPBhxBCwU22Zc5Z
	m9BdhE9bmBJUGucykvf/nh9EkgN9TNunBQeXzUBcChUS/EAykwwUoHk3h0l4YCxH8/eM
	dPfg==
X-Gm-Message-State: ALyK8tJukqClvTHGK0Ea7mNsTR+PvtZJkDMMZFqfjDgw9Is+FRFJ2z/ej8xfLHho5O39qzVQ+bByvAMoVErgvQ==
X-Received: by 10.140.217.208 with SMTP id n199mr4963165qhb.31.1464113925521; 
	Tue, 24 May 2016 11:18:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 24 May 2016 11:18:16 -0700 (PDT)
In-Reply-To: <1464101499.9570.59.camel@linuxfoundation.org>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2016 21:18:16 +0300
Message-ID: <CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Tue, 24 May 2016 18:18:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 5:51 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-05-15 at 08:03 +0100, Richard Purdie wrote:
>> On Fri, 2016-05-13 at 09:46 -0700, Khem Raj wrote:
>> > gcc 6.1, glibc 2.24, gdb 7.11
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta/conf/distro/include/tcmode-default.inc | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> I'll merge most of this series however before we can move to gcc6 by
>> default there are some remaining issues:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
>> /b
>> uilds/788/steps/BuildImages/logs/stdio
>>
>> qt4-x11-free fails to compile
>> linux-yocto 4.1 also fails
>
> I just retested gcc6 and the above is still happening and has also been
> joined by a xdg-utils do_compile failure.

This must be new. did someone push xdg-utils upgrades or something ?

>
>> (on qemux86-64, qemux86, qemuppc, qemumips, qemuarm)
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
>> /7
>> 78/steps/BuildImages_1/logs/stdio
>>
>> linux-yocto 4.4 fails on ppc
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/b
>> ui
>> lds/768/steps/BuildImages/logs/stdio
>>
>> non-GPLv3 on elfutils and diffutils
>
> Khem fixed elfutils, thanks! diffutils still breaks though.

I could not reproduce the diffutils failure.

>
> I really can't merge the gcc upgrade until these get fixed one way or
> another...
>
> Cheers,
>
> Richard

