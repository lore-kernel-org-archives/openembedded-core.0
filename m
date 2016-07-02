Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5F26012C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jul 2016 06:56:53 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id j2so177430228qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=txfGcRZ8h8p9FfojlQA2E4B44MCIBHrJTdfoNRdgXB8=;
	b=a+cJm6cKv82prvZ93DwfzqmFiT7kDABCO4cRkIbuEzAKi5qVuqO4eThHDNpkH6U809
	ljSWxWBF/C3mqG3nTJPR+wt+jNby+m0BI/iALw1Ga0kp48NNGlwlTiWT7kIBn9VnZUT8
	A5uTQVbJAxVssivgsARA6DbQvRWie+DJQHb1P3rxBjmikoAraPfkwPxOZlORY6F8Ukza
	B4fDPM8/moGK2LFAO9H+CpkFrUKE4LNM8eOzGZKNUp5VcmbQfwu894O5/8todPA452tN
	Gii32kV2vGvHaqeqKWbrubZcHH6gCJwVvGQadmrX844C1roI+NRgEKrxmGAQWWe6NLe0
	T9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=txfGcRZ8h8p9FfojlQA2E4B44MCIBHrJTdfoNRdgXB8=;
	b=QHu+W8f6pZJPXTQoZhdag5GPXYDCDd3zAdjIlbvtMv4E4LBfPx5Dj98sXIEIYmqVTW
	Vz6f/9Ld+z01YSPyCIw0XDnF8f4Lqfhdkz4svPEkn/6sjRTP+7XVE5C0IHqqg7NeiVV9
	SbMFtmYrbZ8fIPHUcGLtG41mwRZXjmPjmbxCaoAgZVKbc71UvPNocSomegzBV/A997Oe
	VZ4CZiKpQrpGfg21VTsFVqjkrWLeTjIM4RP+HjpaIATiwEi5w9pAZF+dbuJPnAE2Fp2o
	yehq+iD0x6rP2eEgFcMdxJg5ihzZ6GjT81FbO4OScnbuw65rZLXDGJtK41dQAwRTankq
	k22g==
X-Gm-Message-State: ALyK8tLW2ULWP2OaoCZwFOjnZUEGr7RPunUthqPgGPratDOJH0EdN33aecrxZL8hCWTLiSBGu21T+ENblPE2TQ==
X-Received: by 10.55.178.195 with SMTP id b186mr2505467qkf.81.1467442612810;
	Fri, 01 Jul 2016 23:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 23:56:23 -0700 (PDT)
In-Reply-To: <5777601A.8040409@mlbassoc.com>
References: <1467376136-19506-1-git-send-email-ross.burton@intel.com>
	<1467376136-19506-2-git-send-email-ross.burton@intel.com>
	<CAMKF1spyK+oAN03A6FNM-nqjoU53wDDYnQiVr6J4+956xUmsBQ@mail.gmail.com>
	<5777601A.8040409@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 23:56:23 -0700
Message-ID: <CAMKF1srwXZaxpUKw2LN63FTvK3vXdRVMju47hS96E2v=e=coUg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: remove GCC 4.9
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
X-List-Received-Date: Sat, 02 Jul 2016 06:56:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 11:32 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2016-07-01 16:36, Khem Raj wrote:
>>
>> I am ok with this patch. If someone intends to keep using gcc 4.9 with
>> 2.2, please speak up.
>
>
> I am still [very much] using 4.9.  I'm happy to use my own layer to
> support this - what file(s) do I need to have to clone this?

just copy all the files that this patch is deleting and put them in
your own layer


>
>
>>
>> On Fri, Jul 1, 2016 at 5:28 AM, Ross Burton <ross.burton@intel.com> wrote:
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-4.9.inc              |  141 -
>
>   ...
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

