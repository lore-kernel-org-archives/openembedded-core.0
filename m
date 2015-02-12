Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB11606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 07:32:53 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl2so4253171igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WXN2hWLtm/KC3v5aRSAy9JJD+i2I9jChlLFOOOAquG8=;
	b=FXRfzid9mU1Uj/Q/zp49vTqbKXPzZB7q2MAOftECzqtmnubUHdeKqdJvYzZH7vgNQm
	tcKBo2LYywXLztajSwyvBMKQJ7DeqRCwItAdpMJhUXGgfyc6j/FVe0WJxUdMTSTJGL9D
	tj3p2M15xRq3rmPTlI49yAVKR3VHlAChSSM54IyJk8XIBOJDYb2Yw2iec3t4LzmWNn0K
	sQ4mLliZaN6Yz9eQNYsL9tjBjjbrIxaz9VT5QXZZ/lDy8T9hZkhyNd15r817IgUDrL+7
	9f1pX8SyO0K3wC22RNHfn3ResvXyAoa7zX0WPwh4VJp9jcgGXY5pLXKvS3aBERNknAdd
	hSwg==
X-Received: by 10.50.43.162 with SMTP id x2mr2223296igl.46.1423726374367; Wed,
	11 Feb 2015 23:32:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Wed, 11 Feb 2015 23:32:24 -0800 (PST)
In-Reply-To: <CAJTo0Lb=GQ+pdDJcTMo7UPSy_mv89yHD=k=UG2F7At1oXSQuHQ@mail.gmail.com>
References: <1422850757-1371-1-git-send-email-raj.khem@gmail.com>
	<1422850757-1371-2-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lb=GQ+pdDJcTMo7UPSy_mv89yHD=k=UG2F7At1oXSQuHQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Feb 2015 15:32:24 +0800
Message-ID: <CAMKF1spcfyc_KzLac__1gPjMbsfirmHNrs7YCOyNg9dV-j9a2Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: Upgrade 216 -> 218
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
X-List-Received-Date: Thu, 12 Feb 2015 07:32:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 9:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 2 February 2015 at 04:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Remove upstreamed patches as well as patches which arent needed anymore
>> since features are dropped from systemd e.g. userspace firmware download
>> Tested on qemux86
>
>
> I just tested this on my NUC and noticed that journalctl isn't reporting any
> logs *at all* (core-image-sato, intel-corei7-64 BSP).  Do you see this too?
>

hmmm, I have refreshed the tree. Please try again. It worked fine for
my mips/x86 cases

> Ross

