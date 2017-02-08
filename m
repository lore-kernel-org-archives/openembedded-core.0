Return-Path: <matt@madison.systems>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 90B066079E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 12:46:49 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id z134so81249773lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Twjxb/uy050dzUz0J3tIcsYKcOpQMY1XbKNqVIMPtg=;
	b=gO3hJ8gQ/0b03IqCeA5K7F+66VSZ5/h9kIknJOrTxJjyPjolBwjblbKYjaCWsQsSii
	9YZPrcsohERkMjOpZTf6OLo4K0FM0aPbTgSLVk5X215nbVYo3VVmsbbRFMNclG/pIlkY
	RDObchN+S+HpCUpnfQpglclvU6BgbaaDGCquNJPQOLH98o9wLDtZvglpmQRZofBBRe47
	j5/RrTgSXqk4RA1cDKk2e7LtaQVTXWF32HAQaDIdiWSiGZJsYfgrJiIK+feR27SBgYH+
	fhmEN++sF/qd31BJurIfUVZzZDZ1A+QCnykWFetPk9ntF1kk8nN0wd2Gu7EUYV8wm+K6
	P+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Twjxb/uy050dzUz0J3tIcsYKcOpQMY1XbKNqVIMPtg=;
	b=qoFiAoJPxGj0a+gmQwfWPRUvw4Vgva0/BlK4UpYUv/wNlDOab9CGSgXx7Gt3hg+4Fp
	ptnaXsM+TaLwBu+agtWQbofTjMXIWiWnNVpBmpCxYHlyV7yn9v+RQpjX4c0ivPap9Xlw
	KDsVXdmqPlewWJjZw18LPHURWQcxumiISLNwyEiLHVylEmJtSEqNB3MbnUr86DELbL7q
	VWSaTR15MP7MRWvPuOfUlzXENqzFbGQfmYfy7cYTu3skNvwg2TtW8Z47gtE+1SJn3OFW
	7WQs0jmJJXiJo5x4N1Z1V81iO4uA/MY7mlYJoj3iHiXeZE68Ioz9ZWb60ZKecOaLKNV3
	SKaA==
X-Gm-Message-State: AIkVDXKxV34Mjb1+l6h60yYtGwzrAPpG13nIygkVDsl08E00/Mk2uSEaxYxllKXDX2n9lKHhAfP8HBpUhKdvvw==
X-Received: by 10.25.228.91 with SMTP id b88mr7936065lfh.177.1486558009856;
	Wed, 08 Feb 2017 04:46:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.19.213 with HTTP; Wed, 8 Feb 2017 04:46:49 -0800 (PST)
In-Reply-To: <2301139.i2tsUjesZx@peggleto-mobl.ger.corp.intel.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<CAMKF1sqJSgjLMOPo7pkpfNDUOWLu4R0F9BNzbPFzWYgha5gwHw@mail.gmail.com>
	<2301139.i2tsUjesZx@peggleto-mobl.ger.corp.intel.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 8 Feb 2017 04:46:49 -0800
Message-ID: <CAGgRHJrTic6tYH5cZN3FGbtZMGs2L=GuHrb9FdTThna-ou6Ctw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 12:46:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2017 at 12:17 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday, 7 February 2017 9:44:46 AM NZDT Khem Raj wrote:
>> On Tue, Feb 7, 2017 at 9:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
>> >> This is converging the recipes for go from
>> >> meta-virtualization and oe-meta-go
>> >
>> > I'm still of the opinion that this should be in meta-go, not oe-core...
>>
>> I think we have to make multiple layers agree on using one layer
>> I find atleast 3 which carry go recipes along with, if its in OE-Core
>> either these layers become redundant or layers which are housing go
>> recipes for
>> different purpose like meta-virtualization can then drop the compiler
>> recipes it will be easier from consolidation point of view.
>>
>> if we dont want to take it into OE-Core, we should create a new layer
>> meta-golang on yp git and then help request community to converge to
>> it, it still can be ignored by layers.
>
> Have we tried asking all of the various people involved if they'd mind working
> together? If not, I have my doubts as to whether putting it in OE-Core is
> going to entirely resolve the situation.

As the meta-golang maintainer, I'd be happy to help with converging, whether
it's a separate layer or pulled into OE-Core.

-Matt

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

