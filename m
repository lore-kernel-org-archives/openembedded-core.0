Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id C90A273779
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 21:03:53 +0000 (UTC)
Received: by oihr66 with SMTP id r66so95509089oih.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 14:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0zLI1YaXbcbxa9qPa14bHm9if3N/6450/J3hSlUw3FI=;
	b=cHWQ0QQLW7XKntT0kF1xZ9knRHJLOO0983gUrKwZDwh4fAYL8PdLS6BJyk6KwtbqIe
	AukFNsf4xrqVKbz44Mxm9jt/G+neX4sc1mpKKdu/xw2s0W3LRiZdkEqtPcq4In2vEOc+
	B7drGiK9URY+S6I3TV5rsZbAOcBeKGFrHo4trRJHLiipu70Y+kSMmbb/qJer3V4YLR60
	S1aM8vitvBJam+ZhxkLMg9SwUYKmTyZF6iiqK17E27LxittM/BC4SByOp/R9QTA70zGK
	nw9f+PY2rr0DBARVjRT6cIXHpXkVgYA99PlRihyRZz/fW/q5+xZfTbLgeD7/dTtxbsAo
	L5Pg==
MIME-Version: 1.0
X-Received: by 10.182.165.71 with SMTP id yw7mr6159525obb.16.1436303033369;
	Tue, 07 Jul 2015 14:03:53 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 7 Jul 2015 14:03:53 -0700 (PDT)
In-Reply-To: <CAJTo0LYLzjMAWYJQH3g0sGzZgdPtPXjthJCAgVuh=ux1mgm5Kw@mail.gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com>
	<20150707053411.GA17548@ad.chargestorm.se>
	<CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
	<559C320F.4020707@gmail.com>
	<CAJTo0LYLzjMAWYJQH3g0sGzZgdPtPXjthJCAgVuh=ux1mgm5Kw@mail.gmail.com>
Date: Tue, 7 Jul 2015 14:03:53 -0700
Message-ID: <CAJ86T=Vb889E6fcJJyN93MRwUfbShLrSa1S-79sQyoSHChYnYg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 21:04:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 1:30 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 July 2015 at 21:09, akuster808 <akuster808@gmail.com> wrote:
>>
>> which recipe? 2.7.1 / 3.1 or both?
>>
>> - armin
>> ( sucks at this licensing stuff)
>
>
> So: 2.7.1 is "LGPL" (v2).
>
> 3.1.1 is GPLv2+ or LGPLv3+.
>
> An "interesting" choice to say the least. Because the v2 bit is not L, I'm
> wondering if we will need to keep both versions.  But a 3.1.1 recipe with
> GPLv2+ *or* LGPLv3+ would be a good start.

I'd vote YES to keeping the LGPLv2 version available.

GPL libraries are normally off limits for closed source apps, so the
new licensing options would be a problem for anyone with a proprietary
application using nettle in a distro which can't use [L]GPLv3. (I'm in
that category...).

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

