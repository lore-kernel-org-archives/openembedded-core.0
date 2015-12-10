Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 854906FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 00:08:02 +0000 (UTC)
Received: by ioir85 with SMTP id r85so78112220ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 16:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=P1JzxlStDBTeCBXPHzqGvV9OjQ5APpMFgTkRaBQBgoE=;
	b=z0xAWr2iE9IAKbZAm//A56oqPNXbhAdmOMTuIU0hgXVlIxBllTWfnQZ5NtlXgWxmvH
	VHvR9wSfcFgWPvlFBWKE645viLRDSKmAutaPS6sr258u0NjzGh5KaefGwJLixj8qmRD1
	cpIhlpM6PrUwpz86BpDnOIKgeViWy7WRhghIc3QDZeYbVLKgbNb5bleJL2wlBFlPmK+j
	w3aDNQ0JQpvdWYM6O/4LVQhWksjgrNMwJNmuOM4Udr4BSxYDfpuhuS/7Hkh11I0fWQ+S
	w4u3sJRAIpOZMEegMoqgUOnLn8wfKTTQcOOtiNEF7RkXKJUemOvc4dcdbMY4vVtkPcka
	cFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=P1JzxlStDBTeCBXPHzqGvV9OjQ5APpMFgTkRaBQBgoE=;
	b=FB5o6qx6uiYeZtoh1MAdOb/HiSksKvU5C5LtISo4lENYjEx8+UhThreAc+RpyBHtvr
	HP4FejQEQxGVVynTf78J3LQnSA94NYXAndOKrTh9e4JVeWNmku2LcyoPtfW+FNXDVG7m
	EHYtAsroVGgcHw8QyH80mhSdSvngE3a1/lEK2bgQgsWpmfiD92S4KqhDH5GIKEfbPQK5
	5nsXldb3Nzh5EP8oqR2IMzH1ALO88a+AKjLhxQRnGN1Wh9bS9oCDjVEIp4+mWVp6lmJp
	jAgTNz4bzIVR52koucxmSPBCLZ08K7VO/xOF+AKY0wQptVEATclNYTVZvC4ad1suHCdP
	fszg==
X-Gm-Message-State: ALoCoQn9efcRKTS29bIZ4+eCRRvtb6cd37n/Lkp/GzaCIhzK3Wi88nW46KyA6HnF4Is70mHpQS+dqHsoJQhm4yxyPRKdsNTJcMbU8kRLvip/wR2hJsN+CNs=
X-Received: by 10.107.3.144 with SMTP id e16mr7985258ioi.99.1449706082804;
	Wed, 09 Dec 2015 16:08:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 9 Dec 2015 16:07:43 -0800 (PST)
In-Reply-To: <1449185505.3199.49.camel@intel.com>
References: <1449183819-236473-1-git-send-email-jianxun.zhang@linux.intel.com>
	<1449185505.3199.49.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Dec 2015 00:07:43 +0000
Message-ID: <CAJTo0LY=YzBomYEzBn4VQeK5cavMBwwrno=ksNFc+KGM-FWLAQ@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Explicitly map ARCH to 32 or 64 bit for Intel machines
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
X-List-Received-Date: Thu, 10 Dec 2015 00:08:03 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40183ef90526800074

--001a113ecf40183ef90526800074
Content-Type: text/plain; charset=UTF-8

On 3 December 2015 at 23:31, Saul Wold <saul.wold@intel.com> wrote:

> Just to be clear about this, it does not change the TUNE_ARCH, the ARCH
> that is set is local to the kernel-arch.bbclass.
>
> This should also be a candidate for backport to Jethro
>

This also appears to be the cause of lttng-modules breaking in my staging
branch:

http://errors.yoctoproject.org/Errors/Details/22254/

Ross

--001a113ecf40183ef90526800074
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2015 at 23:31, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:saul.wold@intel.com" target=3D"_blank">saul.wold@intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D":3ed" class=3D"" style=3D"overflow=
:hidden">Just to be clear about this, it does not change the TUNE_ARCH, the=
 <span class=3D"">ARCH</span><br>
that is set is local to the <span class=3D"">kernel</span>-<span class=3D""=
>arch</span>.bbclass.<br>
<br>
This should also be a candidate for backport to Jethro</div></blockquote></=
div><br>This also appears to be the cause of lttng-modules breaking in my s=
taging branch:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Details/22254/">h=
ttp://errors.yoctoproject.org/Errors/Details/22254/</a><br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf40183ef90526800074--
