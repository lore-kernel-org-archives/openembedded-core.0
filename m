Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A9BAC6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 12:14:03 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id f1so732047igr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qvvg+sWNIUk/VBM58KvSaenE2vOyOhy0vXprTBevrWU=;
	b=sG4lF4OBwAwY6HYfA4XPXfCzhXWtAWEpUMtB/PBArRbykUNb0+a8FTSuhp8BnRg2D4
	QGemMnt7JfbRzSm3/nrdZh/7FcrmzVwYUI7cJptEM7K0xHPsO8QwzXzBIotsX99dRe8J
	Rrkq+MLOcp/JhxPXJnLOUEky86X93ZKxy+Y+wSjdilDUeed1fHQgB9d8SjqefSHPyC3K
	pkd8QzDHabVueK9fpl+u9r60x1o3ErxohtL8BRN0Uadf8bih2GpPfRu+HxRuUWXd1qAJ
	q2/1pnOmnThNw6RA0E6c/aqXJH5HLnaKUVc9vLqVPS/eyXRPrZWM4chit3sd/kunhnDN
	i/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qvvg+sWNIUk/VBM58KvSaenE2vOyOhy0vXprTBevrWU=;
	b=YtnVce+edxacLliW55wolawk7NAk2zBDXrax8gvwP3SXTdBCDDb2UkRjBqyotbYL9m
	GIjYnRr12WOKHAJEdRJP1I2Fm0NoGirjYhAmBmHWbKCHksE1YDvCIMR3bGMbX039WwtM
	0vO3fNA29AlTEzxVjeE4sSyPZ2nRsrQDmzNRr896dpWuH/UvTnj5DRd5Pylbb48YC/se
	+AA89CU4jKcFPXPMJXJTZfJ4GHyoIdz/k0mMUDCmAi/FlF399WvlPTpXm4dBPDCdjBC2
	FevRaMsEKqDdYWmNhFI0zVpk+Z92R0EafRAUVrd6OXumGAgATIPVww63SadcqGHL6XaT
	Gozw==
X-Gm-Message-State: AD7BkJIqXme8popnCpimTA06x9tqGUUKejBHYjNF/T8uw1JA1nwX3DBeWki0HjBm/nW8KU9RrLdCtXbGIarhuoKi
X-Received: by 10.50.221.38 with SMTP id qb6mr3217862igc.54.1459512844161;
	Fri, 01 Apr 2016 05:14:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.201.136 with HTTP; Fri, 1 Apr 2016 05:13:24 -0700 (PDT)
In-Reply-To: <1459504875.2322.70.camel@pbcl.net>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
	<1459504783.2322.69.camel@pbcl.net> <1459504875.2322.70.camel@pbcl.net>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 1 Apr 2016 13:13:24 +0100
Message-ID: <CAPhnLPDKabk-Uy0is+v_oDZVOiMLBNLaJoh+ihGQaKfWpdefTg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 12:14:04 -0000
Content-Type: text/plain; charset=UTF-8

On 1 April 2016 at 11:01, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2016-04-01 at 10:59 +0100, Phil Blundell wrote:
>> On Fri, 2016-04-01 at 10:06 +0100, Ross Burton wrote:
>> > Remove ancient and obsolete architectures from openembedded-core, they've no
>> > real users and are causing complications that can be now removed.
>>
>> It seems a bit harsh, or possibly wishful thinking on Intel's part, to
>> describe most of these as "ancient and obsolete".
>
> Oh, hah, I just realised what the date is.
>
> Removing SPARC still seems like a fine idea though :-)

Date schmate. If we remove all of them ab runs go faster. Besides, we
need to make room for the new Windows 10 with bash builds.

-b

>
> p.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

