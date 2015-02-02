Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id EF887605F1;
	Mon,  2 Feb 2015 10:53:56 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id l13so16185414iga.1;
	Mon, 02 Feb 2015 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oD0GB+EKJseNotxg5QhfyRyWLlVheG0ec78iMeCBGSM=;
	b=J1R7R+9c4YPNZ7YK4kfp/1THBJujM1UPZsqZxLAZkU4dkMbsj+P7L4+D0TmhZgqLDG
	+euX6tHDN2CdB8r1p2tJmmn0chZO9b4MxSAESrCkqzGm79vgJuUlxAkovCRGJ+hXLc+U
	qdK8756Ey09k2z0V3El77TZDPDw+yyku4PlQUlR58hkDqMcD9Nd9YLEsO8oLwtRt9ZJS
	iHXM/7vsK1fO5NkeO7csObSveLrZGN8zkuTT1DIu0VX/trvre2aibCMbi9zMU18vWely
	lUgWjhcth1K5VadnCQqJP9woKRkTImX3qMEe2vgbtmqvvEYI/dcFvcsvmjCHd2uikkye
	mVZQ==
X-Received: by 10.50.29.68 with SMTP id i4mr11009020igh.4.1422874437924; Mon,
	02 Feb 2015 02:53:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 2 Feb 2015 02:53:27 -0800 (PST)
In-Reply-To: <CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Feb 2015 02:53:27 -0800
Message-ID: <CAMKF1sqb5dCMmMfN1rh5jBPoFVAXAdiwqW8tvgXr4S4yODjdZA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 10:54:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi Ross

Please repull. I did not push from right machine first time. Now it
should be good.
Thanks for quick turnaround

Thanks
-Khem

On Mon, Feb 2, 2015 at 2:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Khem,
>
> On 2 February 2015 at 10:02, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I have put together upgrade to gcc 4.9.2 as well as glibc 2.21 (
>> upcoming ) on  a contrib branch ( top 2 patches) its has not got much
>> testing besides x86 qemu thus far.
>
>
> I'm seeing these failures when cherry-picking the top two commits to current
> poky/master.
>
> gcc-cross-initial:
>
> | /data/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:
> In function 'void expand_builtin_init_dwarf_reg_sizes(tree)':
> |
> /data/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:334:27:
> error: 'struct gcc_target' has no member named 'dwarf_frame_reg_mode'
>
> cross-localdef-native:
>
> | In file included from glibc/locale/programs/locarchive.c:696:0:
> | glibc/locale/programs/../../intl/l10nflist.c: In function
> '_nl_normalize_codeset':
> | glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing binary
> operator before token "("
> | glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
> '_nl_C_locobj_ptr' undeclared (first use in this function)
> | glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undeclared
> identifier is reported only once for each function it appears in
>
> Ross

