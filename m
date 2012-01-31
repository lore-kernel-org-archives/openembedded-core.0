Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsMm1-0001rm-Hv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 00:06:01 +0100
Received: by lahc1 with SMTP id c1so338080lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 14:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZWCnbMpInlFaj7G+nxF7kZqmpJOvk4p1UA+o6KTCUys=;
	b=EVB01Rp27LsIf4AUgayuU16bG0UXkWCcUugjqb1bV/oUUxNp6zitrIEZDwty+UO1VZ
	aaH/qNxeqp3+dzfiNc37Ipscxr3ffUjsYtN3lVEMzf5RVVdnML/VRiKz9uGPRr3Xtg1i
	8horUmt25/nBAFLX+Z9lXrUrH6s4q5fUBCwYw=
Received: by 10.152.112.41 with SMTP id in9mr12089896lab.27.1328050687323;
	Tue, 31 Jan 2012 14:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 31 Jan 2012 14:57:37 -0800 (PST)
In-Reply-To: <4F28405A.7090902@linux.intel.com>
References: <4F24F822.1010102@emagii.com>
	<1327974653.1334.0.camel@localhost.localdomain>
	<CAMKF1soXjPuoroZR5kkvzD5vT+QXy-==peaSa+hV2Xore+E_VA@mail.gmail.com>
	<07E1C9D5-7CD1-4A0F-8C0A-0916826E7935@dominion.thruhere.net>
	<CAMKF1sqhkRdWYDuHwq_4tSgdwvskBSLe94o5DTUnK6BzPZG7Cw@mail.gmail.com>
	<4F28405A.7090902@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2012 14:57:37 -0800
Message-ID: <CAMKF1spFCho5aWM6uWMmGrXgbpJX2dwzve6r5WUczQKUzbTVaQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
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
X-List-Received-Date: Tue, 31 Jan 2012 23:06:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 31, 2012 at 11:26 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 01/31/2012 12:58 AM, Khem Raj wrote:
>> On Mon, Jan 30, 2012 at 11:57 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Like the one in meta-oe? http://cgit.openembedded.org/meta-openembedded/commit/?id=2292ac565c220f2112a07abd563c6a9ee34dc662
>>
>> slightly better ;) Since I was intending to replace complete
>> module-init-tools (including cross recipes) with kmod.
>>
>> have a look at top 3 patches on
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc-fixes
>
> Hi Khem,
>
> For kmod-cross and kmod-native, I thought the agreed upon PR bump method
> was something like:

I think kmod-cross will go away. Its still cooking. I have a segfault
in kmod/depmod to resolve

>
> PR := "${@int(INC_PR) + 1}"
>
> Was it not?

that was for PRINC in bbappends in overlays.

>
> kmod.inc does "gtkdocize --docdir....", but I don't see a DEPENDS to
> ensure gtkdocize exists.

yes thats why the || part is there. If it exists then do it
otherwise fallback. Since its WIP thats easier to get it
off ground.

>
> Looking forward to seeing these in oe-core.
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


