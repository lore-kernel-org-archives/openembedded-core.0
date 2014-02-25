Return-Path: <saul.wold@intel.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC006F33D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 06:15:18 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so7395282pde.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 22:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2zySrclFTgCmeHVQe7jU4qNK8vp+KH4vifio+FkMUGY=;
	b=BkSCbeFt8DBUJBlhxJQgW2V3cH2fDJSeKUkXqyXo+5uLfimwm+udLhiUZVaNktb2xm
	56YYCvuzasP0XkwFNkYDRtMA95pswO45Y20O+dvFreid+upaCrH9T88dlmMmhyoHyNgY
	bYBwd1fKThwSI2z7fQjJWlVkuBokzZgRie0P6iklebmyN92itVHJj1ibnf75SqVEmiaX
	IXV74fBzGaXFcKOxU4MpHM9nWleTypTrYO/2W1dbfjFoUGcjyxFbmRG5+4Sl82AI4DS7
	JDA2n5KtiDsmHThpI0iyU+I0gEU166zBdRa4kYP2MUYnyr5AiBdO3NfZNY5b3K2w6PsH
	OHzw==
X-Gm-Message-State: ALoCoQk56/iEUEWiplUE0o34mQjc36C/llXQYNzjeme2hHdgQAMS9rkvWCPvf3glG6kgFXEZNspA
X-Received: by 10.68.237.228 with SMTP id vf4mr4411068pbc.131.1393308919256;
	Mon, 24 Feb 2014 22:15:19 -0800 (PST)
Received: from [192.168.1.105] ([80.97.15.150])
	by mx.google.com with ESMTPSA id hc4sm6482639pbc.29.2014.02.24.22.15.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 22:15:18 -0800 (PST)
Message-ID: <530C34F2.70404@intel.com>
Date: Tue, 25 Feb 2014 08:15:14 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com> <5014991.yOqVctVWSl@helios>
	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
	<CAMKF1spJLrQw1iT3MyNRCeW7VX34urjEW=xeNTHiK_w=cX1odg@mail.gmail.com>
In-Reply-To: <CAMKF1spJLrQw1iT3MyNRCeW7VX34urjEW=xeNTHiK_w=cX1odg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Tue, 25 Feb 2014 06:15:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2014 07:53 AM, Khem Raj wrote:
> On Mon, Feb 24, 2014 at 8:38 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> So, has anyone got any better ideas for the name of core-image-basic and
>> packagegroup-core-basic?
>>
>
> baselinux maybe
>
Longer, but baselinux-cmdline, not to be confused with lsb.

Sau!

