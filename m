Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8A98F72FCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 18:42:22 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 72so23743984uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UNUrk1E2nbSDnku6M/HENtiDpz7upKuxYVJXZ97nwoY=;
	b=hkWYEFkAIG4mKrCVCcfZlTp69dZPW4ppaMIyXKwfniPNBPQsWljrqvvBip9z8T7K0t
	1zh1VVEXc4rmpF6nV9gvxda3xYlbBwsAxYOQIlS6HN5x7D/pv93v5cMBCG5HQPUg0ZX2
	XyCakfDGdk/g1r54KRAfu11ksMHjTOJcWO782X6L1YlI2ir8uAXoJIekTRCdlovRRWDJ
	NlI3tx5JKGVM7uQ/ObTdpL/K+e3IE13ewo7jepjTHht/7fn49aKimxb2wM9tuZv0musS
	mFD8IJXqsDzCVflPOScLvRGqS7uVbadisecH5kXX1lQA9yjpx57j9Qku2ZCTjfQwM02k
	Y+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UNUrk1E2nbSDnku6M/HENtiDpz7upKuxYVJXZ97nwoY=;
	b=bM3CdM7V2hRisNgLMkP/g64bmNDG19A91HI8QbLAI4wY6Bkdz4mEfbWqHsUuPa3Mrb
	dJm4gkoMgsge5Blcaj47b8vgWanKTRncTVvtN/duypg1w0cMr1CDNgUhKyFMv0Zg6X3f
	c4eCF9tq1c3EO9jCO6smjuAfgBBiD3wYlSCgZW04IApE8r6NmCONmckEd5KB6W/8u3Xw
	qJJrACxtNmdIq9ct4mLsW9jwlvAcAS220ZH/GGz79cDKlm9XD5k34PHbZiKxDmmi6+14
	OvZtpjKR2awzy2Mdo0ZDNemLAi1+LG6Kic65MX++WmycNs0uiDHLOgB1/ChEQt3J1tN8
	9KDg==
X-Gm-Message-State: AMke39kOueFfzEpUA3DlcjNz76PzHSpjadXXFTilQ0Fh4XrWviyrrS+hq1dUfrWk4PIkAsgoem8nQxwq0NTMpQ==
X-Received: by 10.31.204.197 with SMTP id c188mr1773818vkg.31.1488307343451;
	Tue, 28 Feb 2017 10:42:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Tue, 28 Feb 2017 10:41:53 -0800 (PST)
In-Reply-To: <92df5897-cca5-bef2-1f97-ae8a967e9354@linux.intel.com>
References: <20170227200707.4566-1-raj.khem@gmail.com>
	<92df5897-cca5-bef2-1f97-ae8a967e9354@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Feb 2017 11:41:53 -0700
Message-ID: <CAMKF1soj+i3P-oDAxdjZz=5BLWSfKAVqcv+WhPpQq8wTaUrjwQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 28 Feb 2017 18:42:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2017 at 1:52 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 02/27/2017 10:07 PM, Khem Raj wrote:
>>
>> * This is converging the recipes for go from
>>   meta-virtualization and oe-meta-go
>
>
> If this does make it into oe-core (I still think it shouldn't), who is the
> assigned maintainer? I don't see a poky patch for that.
>

it will be me.

> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

