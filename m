Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id D5055736C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 18:27:09 +0000 (UTC)
Received: by obbec2 with SMTP id ec2so91915548obb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jxYlYUd/9XzGzCXeF2JNNYW7Q916ECjWn0kBO3EhwuU=;
	b=VwvdkLoAZSMJQ17rphaEE+r18e5u3TrLqavvI0+Ry5OmkEzB0y2BuCSgTuH/CJfWrU
	zxqDsAXCT87lrw9vwApfknu/YhXb+qYHP07sZ3icHMVCpfn+bvOSdGErR6TNmYEM+1Dw
	l7xlG9vRm/m7G4CrStHa71QHjy62semBSZKXy9dteh+7OKLVIRZo4WT3pNMZ589DvhdC
	rwgQ1DXU40fwvs1uRSqD1KKTCCU8lmQxj4d/4Ou5KIotZEafgE4URyptVHuCVL65Xs6b
	kZtpsGghOK/52AHv+fdq2xZQuiqjY16M8/PeL80tQz5x0K3yCkDZmRTvmuHgIZ3+oHvZ
	xt2A==
MIME-Version: 1.0
X-Received: by 10.182.248.161 with SMTP id yn1mr41619839obc.25.1427912830049; 
	Wed, 01 Apr 2015 11:27:10 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Wed, 1 Apr 2015 11:27:10 -0700 (PDT)
In-Reply-To: <1427891538.4690.5.camel@workhorse.madison.systems>
References: <1427891538.4690.5.camel@workhorse.madison.systems>
Date: Wed, 1 Apr 2015 11:27:10 -0700
Message-ID: <CAJ86T=VARtcTTEk79E6ZpA1C08ZrHyafKtqc7m+KUFnbsH4xMQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox issue in latest dizzy
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
X-List-Received-Date: Wed, 01 Apr 2015 18:27:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 5:32 AM, Matt Madison <matt@madison.systems> wrote:
> I updated to the latest on dizzy and ran into an issue with busybox's
> modutils commands failing, complaining about "no gzip/bzip2/xz magic".
> I've tracked it down to this patch committed (cd20b3c) on the 21st:
>
> busybox: libarchive: open_zipped() does not need to check extensions
> Backport from busybox 1_22_stable branch:

Thanks for testing and reporting this.

> I found a thread about this issue on the busybox mailing list archive,
> and applied the patch in this message
>
> http://lists.busybox.net/pipermail/busybox/2014-January/080389.html
>
> which appears to have fixed the issue.  I can submit the patch, if this
> isn't already being worked on.

Rather than take the risk that this might not be the final fix,
perhaps the safest approach is just to revert the offending patch from
dizzy?

> Thanks,
> -Matt
>

