Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id AB7F673223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 08:38:45 +0000 (UTC)
Received: by obew15 with SMTP id w15so27499162obe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jrgYDlTsxeEuCqvKdbN9DxGuDHI1suHyrtn+/zmdDp8=;
	b=btDlgeF2QXPy+yz56Jba4ChK8JPk+f4S4hjwW25xHIH79MK4Oub9tKwOAqSVrU2BPE
	S8XUv2cIbjnMfXjP1cCV27SBdTrzLgT/7UxeSvKz25Of6sxN61j3jrGgUKAJ2Udzwbrs
	PGeu5Pj2Lrzpj9/Lt5adI4oXFw6Ktf/6nYyPHTBe7IBhz49LoVwu9kHZVuyQkkhAtuP3
	ZqBhOb83GHEFWAxrKSKIrBzMuTR5v7S6FiFq6WFK8iftANdXihEWClMZRzlZEHAhipAJ
	6MYq8JqI8O7Ds7mIKpyYi4FQEd1fOteUxiYzCbjEf0+avSCtkWWS7NKYFdJCzD71l4Eg
	WcsA==
X-Gm-Message-State: ALoCoQleAu78y3sKRTwYErlB3CKxIxoG0bQYbKFjzU8aq3QQ/My41d743yWSXetGTLHXAUeTI08I
X-Received: by 10.182.130.135 with SMTP id oe7mr1472712obb.78.1432802326370;
	Thu, 28 May 2015 01:38:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Thu, 28 May 2015 01:38:16 -0700 (PDT)
In-Reply-To: <5566CF50.8090503@windriver.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
	<274a045e16a1d3a0fad66f8727de7a04cc86e614.1432775689.git.kai.kang@windriver.com>
	<CAHiDW_HYEW8+SYsLhbTLWpk1=z0XNvwYaGkBsEaSGi0Zk5Y4Ng@mail.gmail.com>
	<5566CF50.8090503@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 28 May 2015 11:38:16 +0300
Message-ID: <CAHiDW_HHeHS1XOQuzaMGo-vXQ13wzAgg_zoEpsY8MmVfXpFw8g@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libav: upgrade to 9.18
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
X-List-Received-Date: Thu, 28 May 2015 08:38:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 May 2015 at 11:18, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2015=E5=B9=B405=E6=9C=8828=E6=97=A5 15:14, Jussi Kukkonen wrote:
>>
>> On 28 May 2015 at 04:26, Kai Kang <kai.kang@windriver.com> wrote:
>>>
>>> Upgrade libav from version 9.16 to 9.18. Remove unused var INC_PR and
>>> backport patch to fix CVE-2014-9676.
>>
>> I'm sorry I didn't ask this in the original discussion but... Is there
>> a good reason for keeping 9.x in oe-core if we're bringing in 11.x
>> (instead of either dropping 9.x or moving it to meta-oe)?
>>
>> I haven't found the API changes between 9 and 11 to be so large that
>> they would warrant keeping two versions. Admittedly I'm not working
>> with libav on daily basis so I might have missed things.
>
>
> The original thought is just in case someone may want libav 9. According =
to
> release log, series 11
> is
>
> "Libav 11 is API-, but not ABI-compatible with the previous major
> release."

For full disclosure, libav 10 is not API-compatible with 9: the
differences aren't big but will certainly require changes in some
applications. Still, I haven't seen anything that would necessitate
keeping two versions.

 - Jussi

> So it is ok for us to use libav 11 as default. libav 9 recipe could be
> removed if no one opposes.

