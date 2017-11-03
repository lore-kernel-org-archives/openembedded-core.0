Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA687824D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 15:48:46 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id f56so2802700otj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HYTpmXVjwDkFU77XEjEOWvsDBAfws6yusxA/TiUoixw=;
	b=TLOa+XLsLrLm7+eA2iOGRir27CAH7mbF0BXBoWg0viR9VljBrYfytiafCXhyMC/8qK
	vcGQsR8Vsve+QEd6ZpL9XoUhz02xuWq9KfBavo1SxoCqkUYuzvXUd1OvavpRcQljctZb
	D4ZTZfesfrlx3z/2eLGUHC4+iPkSLRnNHZsJ8Aqakj2+nXSHHEl3zuAPL68OCTbYno+d
	CORjEgX4/qzX0cuDMKi1Ti1HFE+jO5wRtWtn7dspgzC+kBs35DRcxsAGAGZhbVUYQPmj
	qY3COGuedmHCrAzqwYzUD/qAeTvtilBDx7yNlB9rxTXFNU3ii2JlAx2z5wUCjZr00HrH
	rYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HYTpmXVjwDkFU77XEjEOWvsDBAfws6yusxA/TiUoixw=;
	b=pin0HkFq0QE84uJN6qvsPGqOR/BgIxFo1dtmHzLmF0gZABgBVvd6yO/DFuOLwJeFqW
	XtJjF9J3t3SpMgqgdI6jVQdKUiSJ8lCBDNTs57iW4j0WrX8UoBLVfEUxyOY5iBbRJqU4
	bAIumVZGTGpf0GTTdmsOEMA6BEfEzZHiVcl4MSdN6xbtjSMk5E+FnyoAeSfN9a8pi4U/
	EoojPuT2OpP0E23Uc2ZRStO0UK5Q1psrILrkivLUb1Ukep6P78mQY7cxMQPXrESBH75u
	D4S4DwpMZfm4TnhXmy0WkjRU/9KOXmpcPPlO3rLsFJQF1MXQiKV8tjD0CzwV5GgbI/3p
	RI2Q==
X-Gm-Message-State: AJaThX4tVlF/9DsdVfwvdNqysTW4gSqCTp99/eWkobYgRJImlqO5Lj2Z
	Vy6ji5D6gGcytAUKoc4ia0uJ+gCy
X-Google-Smtp-Source: ABhQp+TCgpWaudss2GgmiLpZinMYpbybUDCrBJuhPd6bds7oHD1CRrBLxJrPuttgnDbcJ0xgzy4P+w==
X-Received: by 10.157.56.144 with SMTP id p16mr4462216otc.224.1509724127641;
	Fri, 03 Nov 2017 08:48:47 -0700 (PDT)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	u14sm2546263oif.46.2017.11.03.08.48.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 08:48:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id h200so2361518oib.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 08:48:46 -0700 (PDT)
X-Received: by 10.202.205.66 with SMTP id d63mr4308605oig.352.1509724125939;
	Fri, 03 Nov 2017 08:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Fri, 3 Nov 2017 08:48:45 -0700 (PDT)
In-Reply-To: <daa2889c-e7cc-a1e8-fb25-7df9bc3d2e3d@linux.intel.com>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<8a2910bb-d958-60e6-a04d-ce7593c4b83b@gmail.com>
	<daa2889c-e7cc-a1e8-fb25-7df9bc3d2e3d@linux.intel.com>
Date: Fri, 3 Nov 2017 13:48:45 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoeC_0iNS1ZutF_veyC4-zRbWM+qTamLYocDWuygEStfw@mail.gmail.com>
Message-ID: <CAP9ODKoeC_0iNS1ZutF_veyC4-zRbWM+qTamLYocDWuygEStfw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Fri, 03 Nov 2017 15:48:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 1:34 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/03/2017 05:08 PM, akuster808 wrote:
>
>> SRCPV causes package versioning havoc. You can not tell what version
>> 1.1.8+git(hash)  or 1.1.8+git(hash) is the latest on a system. Can your
>> package manage figure that out?
>
> I thought the entire point of SRCPV is to provide something that is
> guaranteed to increase over time? It makes sense when taking random
> revisions from git, but when git is used only for tagged releases, it's just
> annoying visual clutter.

Honestly, the recipe name should interfere with this. In fact using
git for a git-based recipe makes more sense to me.

Anyway, as Khem mentioned, musl often points to non-tag revision when
bug fixes are made so I think there is no point in keeping this
discussion going.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

