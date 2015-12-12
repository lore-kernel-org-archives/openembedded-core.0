Return-Path: <matt@madison.systems>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id AB58860616
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 17:02:52 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so96291419lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lBpLJ0q/105o+CZ07kVxWibbACsvfkEmlB39V7bnNZY=;
	b=ZoZglyWvrvX6cvt1oVF6iYoIcA79BBcq3Fcn7l2I9u0NVCjHBdchwtt8YIFyNODe8y
	B0y6MbEEt+jNQxdCgVRjOGys1rb9jLs3z49FbSFnDTZnRIeU0GRE7B3+LGou3lRtMqdr
	OnZWHh9aRkdlHM4R577XdQ+aJEcoSqFRvY8cBXbQMk8Su1B3coV9R30haS5pVbrepl1s
	mLZnLaBUfTa0vnGWazmCZZR9ffI/TXgObPsj5y19fSUkpwkTudRFiG2C1UIddqFS0miO
	Sy0JOGHm8G4A+sfbeLy9iIfHfWqsizL5l/X+pCGUTRjGF71FfSs3yYCur/CmG1iPizAB
	O9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lBpLJ0q/105o+CZ07kVxWibbACsvfkEmlB39V7bnNZY=;
	b=ADwIdcmLdol1H/1hh9u/l0l45SkSMgK+Vbf3invba6iCfn3E6luItCqGABFI4L+bxI
	urrrXteMikD4+6qAlGfXp6ncj6x8YUr8rBtIY7huvthX/wVykMeQnO7fJgR5wpr3b6UL
	WoF72OyfR3xQkO0QJw5v3yrGg9uznbQNpPqSj2cB9sRbcNYMsyatY0hzPfxIgyDr+nft
	ML19zqtOjgJh2XhmfsnDqvoEy41mZDR64YmR9qsvRmmxoNLF9WfZp7+n+PhkFC7rVZGG
	msg7vlLeZj6KISKPNcFUdAj9qhvCPHGtJTthMM1O73V3fRvan/CNDxZHoE5w21LmdY/m
	CKFQ==
X-Gm-Message-State: ALoCoQkZRhMG/BQveM1+y24K0ai/QD7SP3Ca7jgBdV///Sm2upzDCuVJYEQFAPYWdQW1RlbSh6DAOGPNGoDTyRZDRpGG7RFaHA==
MIME-Version: 1.0
X-Received: by 10.25.213.145 with SMTP id m139mr10219782lfg.150.1449939772658; 
	Sat, 12 Dec 2015 09:02:52 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Sat, 12 Dec 2015 09:02:52 -0800 (PST)
In-Reply-To: <CAGgRHJpLm9A+M-APn8n8+ZTVpcBHjJ5W-UHCD_KRoTyOvLCqww@mail.gmail.com>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
	<CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
	<CAGgRHJrZOA8+nGyfXQgFaeZ28M3uuLf7EziN2DK_dM2Hoe5J6A@mail.gmail.com>
	<CAJTo0LYNtGDhyZLJnRum7XveZJ4eG1m6wvgTe8H3Sb9fpburUg@mail.gmail.com>
	<5665A30D.7010306@windriver.com>
	<CAGgRHJpLm9A+M-APn8n8+ZTVpcBHjJ5W-UHCD_KRoTyOvLCqww@mail.gmail.com>
Date: Sat, 12 Dec 2015 09:02:52 -0800
Message-ID: <CAGgRHJqo3KT_P2=fxGs4QUm_ADMn71FThx3mR7DoBuu0ycgfvQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Sat, 12 Dec 2015 17:02:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 7:49 AM, Matt Madison <matt@madison.systems> wrote:
> OK, I'll rework the patch to fix PACKAGE_EXTRA_ARCHS and rebase off
> Martin's changes.

Martin's latest patch series resolved the problem for me with no
additional changes needed.  Thanks, Martin!

>
> -Matt
>
> On Mon, Dec 7, 2015 at 7:17 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 12/7/15 8:01 AM, Burton, Ross wrote:
>>>
>>> On 6 December 2015 at 18:22, Matt Madison <matt@madison.systems
>>> <mailto:matt@madison.systems>> wrote:
>>>
>>>     Close, but not quite, I think.  It doesn't look like it addresses the
>>>     ordering mismatch that occurs due to the -vfp include being processed
>>>     before the -neon include, resulting vfpv4 preceding neon in
>>>     ARMPKGSFX_FPU when both are enabled.
>>>
>>>
>>> Martin's patch is in my ross/mut branch so will be in master soon, can you
>>> rebase these patches please?
>>>
>>> Ross
>>>
>>>
>>
>> I would prefer we fix the package extra arch, and leave the ARMPKGSFX_FPU alone.
>>  I believe that order is correct.
>>
>> --Mark

