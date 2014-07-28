Return-Path: <freesilicon@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id DF91C701BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 12:02:31 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id 29so4738594yhl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 05:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zspy1DGqLUiS4mCKuAGQ1vg89eTgvhJ7zt5BYLtmlDw=;
	b=gXRXn5uLL+GxhhzaUAOXGUtIFPuf27REeJp3h6TCs7NQkvUtRcqSOE7c44QraYmVAr
	jtVBKQKYV6wy+RvHQfIlfaZqRVbWzM0owU8kY2zfny7kORWCO6pXHsV3lcXvoYQnHuiF
	ZDZVabAP3lMOJG+9gm8/hEdqA8THweffe3D1VEKRezWUOoMM3UTz+Xlh0cvnS2nc8AqF
	YdUmt8W0R0F/99aYiyjiCddiwVnxO24+MgBdOaek4dzSe87ZpwQ2qZkJDonWTRUIENid
	Wl2RTrgYfH14wyvWzMiJsOOPL45xPInG1RLihWIxz779glxiIeAowyuUbRrBjiWTAxJf
	SvSA==
MIME-Version: 1.0
X-Received: by 10.236.228.40 with SMTP id e38mr50594364yhq.76.1406548953026;
	Mon, 28 Jul 2014 05:02:33 -0700 (PDT)
Received: by 10.170.123.210 with HTTP; Mon, 28 Jul 2014 05:02:32 -0700 (PDT)
In-Reply-To: <CAKRNOGwGr3BM8FTMoqjNQ+p0tFKUj55RdyL+0wemf_7f1r1UcQ@mail.gmail.com>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
	<1406543035.13346.11.camel@ted>
	<CAKRNOGwGr3BM8FTMoqjNQ+p0tFKUj55RdyL+0wemf_7f1r1UcQ@mail.gmail.com>
Date: Mon, 28 Jul 2014 14:02:32 +0200
Message-ID: <CAKRNOGxP5isqEkHOrZh8BAP9VvgwMyWy8pawpBX5SZrEueFhtA@mail.gmail.com>
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 12:02:34 -0000
Content-Type: text/plain; charset=UTF-8

Sorry, the patch alone was maybe a little harsh, I should have
submitted it as a RFC.
For me, this recipe was needed because I don't use u-boot as the
bootloader for my custom board but barebox. More generically, I know
that the meta-fsl-arm has also a recipe for barebox and since my board
was not based on a Freescale MPU but an Atmel one, I thought that the
work could be shared by the two layers in oe-core or, at least, in
meta-oe instead of being also redeveloped in meta-atmel or another BSP
layer.

Since barebox also supports many architectures like ARM, MIPS,
Blackfin,... and many vendors like Atmel, Freescale, TI,... I think it
provides a good alternative for the 'virtual/bootloader' task. People
who want to use it should not put more effort than what they need to
do for u-boot currently.

I've cc'ed the barebox mailing list for more technical details if needed.

Greetings,

David

2014-07-28 12:23 GMT+02:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Mon, 2014-07-28 at 11:55 +0200, David Vincent wrote:
>> barebox (formerly known as u-boot-v2) is a bootloader that inherits the
>> best of U-Boot and the Linux kernel. This commit adds the possibility to
>> use it as a virtual/bootloader instead of U-Boot.
>>
>> Signed-off-by: David Vincent <freesilicon@gmail.com>
>> ---
>>  meta/recipes-bsp/barebox/barebox.inc          |   73 +++++++++++++++++++++++++
>>  meta/recipes-bsp/barebox/barebox_2014.07.0.bb |   15 +++++
>>  2 files changed, 88 insertions(+)
>>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>>  create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
>
> I have to admit I don't know a lot about this. To make it into OE-Core
> we need some kind of story about why its necessary and commonly used.
> Are there a number of BSPs using this? Can you give some background to
> why this is needed?
>
> Cheers,
>
> Richard
>

