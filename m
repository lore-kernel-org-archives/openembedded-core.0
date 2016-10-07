Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 295E46FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 07:21:03 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id i130so18018445wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2016 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l6cRfN2n4cFndyKDFxOms5O88llaKnBcCxo9xw4oh80=;
	b=GPx4kj8OeJG50vGKIt68dhikmV2oaHBiEwJJgHW7EabPDjwTLaOCZtk7FBesk6Z834
	TVkZdBHFz5jRu0/6bejNRXAiSO14sAyZU2KJtDFcscXKOKf3xMZPh/J/v3DlaeO63Qtb
	wgOdOAAozPqjZAS92nIvnLGuc1nkC6zB065tmKg1N1HzZ/plsFT/RWTX6J0EP1lxF9lu
	RhlqZpYlQp3NeuAbk2XGuC9H3oPAnhK7lmaal4fP/GgIBA9gm6MU53gvpfQc0yWC3frK
	GhDHGRW1JhbePmDecZ0TWa6sG1japexa/B0NbLVrNqaY9dcKvdnDHCaOi2o8ywTS8F6O
	bzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l6cRfN2n4cFndyKDFxOms5O88llaKnBcCxo9xw4oh80=;
	b=gtrB+xYvDjnrKQeZ/NV8mnK4p4UrRNYPB4nbC199ig2L6Yq5bQnVJNzTwzS7XxGwPc
	RIjw1tr56kK4n2TChf7lkxS4eJucFCDdaTo5ALsNzD7a4zks7370sezjvleVkEUEh3uB
	TDhO9x1kXX2NMR4GausaNFsMDq6qEN79EMc01oO52pAqKU61x+40fsIDDIGY4xDjVuLg
	/fidk7pcfpB4gqvbpHReu59gQnGrO4YkzdQT/b01hvPbk5kvL08nEzVRWl9ItHzhCybo
	yxMktMgL+gec4T4CdWhB+5wDOjj9GzbOJWwwFowri52l7Ofxsy1OwTMwfIlEbPAV8DFD
	LeKw==
X-Gm-Message-State: AA6/9RnqrHz0F/zzShMzaMaFXmS70u9lY+4Hmhq4brwj2j5ASrc4lZ2/teWv5RNVsVzdWAWUM36siKE+g2QMRw==
X-Received: by 10.28.224.8 with SMTP id x8mr13731873wmg.59.1475824865077; Fri,
	07 Oct 2016 00:21:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Fri, 7 Oct 2016 00:20:44 -0700 (PDT)
In-Reply-To: <354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
	<1475757767.3146.12.camel@linux.intel.com>
	<354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Fri, 7 Oct 2016 09:20:44 +0200
Message-ID: <CAD4b0_K4r+kUfUVAtcTSf--aJbUnbYttmRfvQdMGCiAikyo10w@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: rpm: Recover RPM4 to OE-core
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
X-List-Received-Date: Fri, 07 Oct 2016 07:21:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 7, 2016 at 5:19 AM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
> Hi Joshua,
>
> Thanks for your info.
>
> Actually, our origin motivation is that we found smartpm is not maintained
> any more. We maintain smartpm for our distro at
> https://github.com/ubinux/smart2
>
> Then we realize smartpm should switch to python3. In order to solve this
> issue, there are four solutions as follows.
>
> [1] smart/RPM5
> [2] smart/RPM4
> [3] dnf/RPM5
> [4] dnf/RPM4
>
> I confirm that RPM5 have some bugs with python3 and I am not familiar with
> RPM. So I think the easy way to solve this issue is [2], recover RPM4 and
> solve the bugs in smartpm.
>
>>
>> It's also worth pointing out that we're strongly considering dropping
>> SMART in the next (2.3) development cycle[4].
>>
> Considering YP would like to drop smart in 2.3, I wonder YP would use
> [3]dnf/RPM5 or [4]dnf/RPM4 ?

BTW. do you recall the rationale behind abandoning zypper in 1.4? I'm
curious about the motivation for using smart given its Python
dependency.

-- 
Maciej Borzecki
RnDity

