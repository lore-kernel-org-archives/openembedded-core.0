Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 52B746FF0E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 20:59:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v42so3236498wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ngMSnlXbFh0ZM5fl88vDJ1vl363XkN5u839Fu/Osj28=;
	b=bGcPMiInod9iZD1VpRsareVUUQRYKrzdox6nXoVUt3TqfLf0v9dmR+q0ODMTvQfm28
	p3pg3LkKzBtOTOiYNka1hJOwggwRIdacEQoVFNXTuZAkErmbIu5sXeF8Z861u9s4wcPx
	EitUm20c2tQmC6M0KcVAaAg0QtYXKLegAjGAhNgnTNDjHLIjM2CISxq0PFVcYSGvpKRV
	wnmKVkTo2GB5VPH767gN2t6UmBpe0rFbp8dmeTZK9ZM6PUKWaQgcB937R+YlhHQkLU7J
	aWKWNp/Z40Tfb3HwTek6rqkg3czYnmSKHsSFmh4FXmEvTP1TvscdW79Miiq80Cucw85B
	NV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ngMSnlXbFh0ZM5fl88vDJ1vl363XkN5u839Fu/Osj28=;
	b=K5+nzGCYn2qawao9Wa6keT9fxrd5wKiU8DEMs7VjJWI4ZLOwF0xb+Ztr8tcXXfwXkR
	vtrrrhbpS/oC1tXFLSJACaKEvUIUu+j5/ZevC/LchK/oD2Eg7xAebEUMudc7yAmxXSyD
	I5av0LgpX8GKZ+szNd/aHPPchmtq3jEtlVPNElLAyeVxpoAgHkB8yoiCk7odh1yGC6BV
	G0kz/YtczG+H070O9pkjG9RE9BqcUQ47mVpx2bq7k/hrhSsPKJFPSeryKf0+wCGSGnIb
	550x2HeltuAfJkCM4ZoQ5FV3RB1QrqxAox3I+N7mcQLb0mc8j77NkznQ+7X5Ol6gBmsl
	o9qQ==
X-Gm-Message-State: AODbwcBEj2PLGARj3BPlkIna6774r2URD1iVUonZlBWIMEVHHbiP5iXe
	ooghANvdhGU6GDLhoma52pcCzRqsdw==
X-Received: by 10.80.178.228 with SMTP id p91mr1541657edd.131.1494363586949;
	Tue, 09 May 2017 13:59:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 9 May 2017 13:59:16 -0700 (PDT)
In-Reply-To: <cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
	<CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
	<cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2017 13:59:16 -0700
Message-ID: <CAMKF1spwdqSfKFc+YwbvFDmBeRuwk++t7YT_Wu6TNjsmhdHtCw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 20:59:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 9, 2017 at 1:39 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 05/09/2017 11:19 PM, Khem Raj wrote:
>>
>> I think we should always intend to align the reference stack with
>> whats commonly used in
>> userbases we target to address with project, we will not be serving
>> the project goals and its username if we
>> trim down to packages which are just used for reference, if majority of
>> the
>> community we intend to address uses QT or any other stack for that matter
>> then we should align our requirements accordingly which will be mutually
>> beneficial IMO
>
>
> I strongly disagree. Oe-core is not a Greatest Embedded Hits collection or
> any kind of 'reference stack', and decisions on what goes into it should not
> be based on how popular it is. If you do this, you risk overextending the
> layer, and ending up not doing a particularly good job on any of the things
> it tries to do. It's best to allow other layers to flourish, let the domain
> specialists do their job and decide for themselves how they want to do
> things, and have a curated list of layers that are known to be high quality
> and approved by Yocto Project.
>
> If you want qt5, use meta-qt5 and meta-b2qt, both made by people who
> actually develop the Qt stack itself. End of story.

Don't get bogged down with QT5, its not at all about QT5 or no qt5,see
it from a users point of view and you will probably understand what I
am trying to say. Relevance of what you include in core is very
essential. Look at
any infra typical example is android, they ensure what consists of the core
pieces and keep them aligned and add/remove major pieces with newer
releases. We need to always evaluate coverage of core and make amends
if we dont then integration efforts become more over releases and at
some point a distro can decide its not worth using OE-Core and fork.
So evaluating
the sub-systems should always be done and we should not be afraid of
shuffling the cards if that aligns well with what the users are needing at
a certain point in time.

