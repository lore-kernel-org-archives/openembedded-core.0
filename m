Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCC978CA6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 22:00:01 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j205-v6so275752oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2018 15:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mvT5QUClfTXBqQcZYcedQZKOQta1/XttwmVDlcFb4h4=;
	b=i5N3YnGwRYQ6IIlVaPDxHtXGrCVxs64Ehsk0FnKIn2cx48Wh2pDgxAa7d5xq3GYpIE
	yoIrdK5nJ244vfZ7VgNYM2kv3ynMFL2WTcX8VeyHOM7GO5TObLl1dsGZrioRysMHSc3n
	iOrWxLJ8UgRPlCzADhUBN6VjtbuF+BuSIfif/2dDrcrGTxNU53mrLe80PQU9BGdGYLmE
	baQAzFLUuwwYt6XnGc0acVkTmP4FdeGvaWJWds73xsRG1J4f6TdEYftsQoJF7xlkAz1d
	erJ9v5V1CnBVItwnlsWrErvMkunCbr7lLIE0vrfcXK/AMvJVQXkCYXTGFaIDNfPyxY6c
	HHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mvT5QUClfTXBqQcZYcedQZKOQta1/XttwmVDlcFb4h4=;
	b=TTEz8ekEjX9CMLW934RQuMeXapOd3NS5ajBji4vnnWLKDL8M+a0qj1NTGn+lYsXnZc
	JTOGDuC44YTSWjnxQ4m7wiYRA/r2DEKlCTdOv9fsqT6+GQgjqD/i9hFe35xTW38aDauZ
	78PZetm4GQyaFD4I/9MpXxKGCFgDgj1/PcAGbDnmKE8n9QLHnA/vcMJ8+XG1BGXMX2OD
	U70V/kCt8V/UwwCS3isjWUX3rz2rFvZGQWKhsS2LCq1kKDPTEa/41sRdNaDG219QpU6f
	PQVi0gN32FB5aueXy8iSQ4Ms61SlG5nRMvDiIBq3Gf4iUYJHF0rADeemuuePMrYPoDzC
	yKrg==
X-Gm-Message-State: AOUpUlHu4s4ysgrwB3Y1QZZzKowRLrELSCfqbP3NnE3O4tPUvZ+Mi+8a
	cy9opmnobhFcdBnzgTVSkBk6B+qmslC3+LvceifDzQ==
X-Google-Smtp-Source: AAOMgpeEzx84LOr4nAmQ3WND4xG6PmHLyX+oznyiF/k5uodNqWgKkDzboOwxMh9qup81PDCMBvM7QaoXwMHTmub3+Ig=
X-Received: by 2002:aca:3e56:: with SMTP id
	l83-v6mr170142oia.170.1533160802342; 
	Wed, 01 Aug 2018 15:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 14:59:41 -0700 (PDT)
In-Reply-To: <20180801115839.GA32094@mbabyjoh-desk.ger.corp.intel.com>
References: <1533046545-18047-1-git-send-email-maxin.john@intel.com>
	<86a14d593b662d9d9f10248343e515d16afdb8b3.camel@linuxfoundation.org>
	<b0fb4501-ba1d-425b-1753-9ba1f1d82091@intel.com>
	<20180801115839.GA32094@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2018 22:59:41 +0100
Message-ID: <CAJTo0LZx7bV=4cNkQoGoRM-jhdotZnf5K6aiWq_yM1W8NN+rbQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] machine: remove kernel-modules from RRECOMMENDS
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
X-List-Received-Date: Wed, 01 Aug 2018 22:00:01 -0000
Content-Type: text/plain; charset="UTF-8"

I believe the rationale for genericx86 is "this BSP should boot on
most hardware, so build and ship all the modules".

Ross

On 1 August 2018 at 12:58, Maxin B. John <maxin.john@intel.com> wrote:
> Hi Anuj,
>
> On Wed, Aug 01, 2018 at 10:43:03AM +0800, Anuj Mittal wrote:
>> On 07/31/2018 11:22 PM, openembedded-core-bounces@lists.openembedded.org
>> wrote:
>> > On Tue, 2018-07-31 at 17:15 +0300, Maxin B. John wrote:
>> >> qemumips,qemumips64 and x86 based machines include kernel-modules by
>> >> default. Remove the kernel modules from RRECOMMENDS to make it
>> >> consistent
>> >> across the machines.
>> >>
>> >> Tested using core-image-sato on qemumips, qemumips64, qemux86 and
>> >> qemux86-64
>> >>
>> >> [YOCTO #12383]
>> >>
>> >> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> >> ---
>> >>  meta/conf/machine/include/x86-base.inc | 2 --
>> >>  meta/conf/machine/qemumips.conf        | 2 --
>> >>  meta/conf/machine/qemumips64.conf      | 2 --
>> >>  3 files changed, 6 deletions(-)
>> >
>> > Looks good, do we need to add this to genericx86 or anything in meta-
>> > intel given its changing x86-base.inc?
>> >
>>
>> meta-intel explicitly includes the modules so no change needed there. I
>> have sent the patch for genericx86 where it should be included now.
>
> Thanks, Just curious why we need to change genericx86. Do we have a list
> of kernel modules which are required there ?
>
>> Thanks,
>> Anuj
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

