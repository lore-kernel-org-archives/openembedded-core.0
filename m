Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5FA788E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:37:13 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id x17so4843319uaj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d9/sK9LUrVHbv2UNAIh5J6xpUKb2KHVZIvidWU6EZdc=;
	b=NlldLNvYAqJjTc9UlqWdCDh7dl7GOtDDpVzJgixLEiKzbNfWfoFA2RtitmMYyKn2c5
	tX2bQt/25061i/C8QFIqoSP9Dh95wLcNljaECG/GFtVUJkCwLNlElKRzTo+CkxOXbOuT
	xn/RgT1P2zqyVTqLvlxyelIfGpAwiPWvILsSdX/BXWUrMrVsShHqCcf7tMgu6Z04tCll
	afCHJYJ6r0M6McEq9/BJueYuakX3uJz5HMSdAYc+JGPWsnV7NGLiFv3F+DOjAbYmKGlh
	fuNYnc6Bg8mXkEzM5JujkMpFs2kQwoVz/KQIQHGOmNVY2Gw2lrChtvwEIjRQ2fpy6al2
	PZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d9/sK9LUrVHbv2UNAIh5J6xpUKb2KHVZIvidWU6EZdc=;
	b=YSN/Z3LVpxThDMaU15wu0H44jKx5lChC00AG+jXrNT/uPTHhoKKDGrKMFyow+B8w3D
	DhKT+izwZWIGJSDdkSI1mmpuKL2NY8oPVwX/+7h1s6/VY+wjzDRLZ8X1KFrunyB+1h2T
	kySK86C2VY4/BArEUg0ASMyDGqwo3NZ1nqWPjpsUjXDhIA0e3RUw+NDoxhQhiw+eR3Gr
	+nBicQYTYu/J7fUJXRPsThjJQwuZbPBNEo8Xq70JI1GwCf/KEkT9gJrX+Kpr8F5GbAWt
	yST/+AEDD2OrOeHRQSK7evQLiOMwH21HHJZ8bJZLWpseAoliFYFm3kwY0kXE3laAvmhr
	/oHw==
X-Gm-Message-State: AElRT7HhLryyDJheRRO+jJYLlFVHpmliPiDECkOh9qGGdxFSEqJjKKZL
	IF2c/2Tcvgx1sgsmr06XpnVqjrk/gI2H6H2yPFM=
X-Google-Smtp-Source: AG47ELvMxew8il4jWZ4jijfur6wGBuKj9lRAq2UWT1DYNnpUfC1LYvEooAH4/H5Rv3L8QWOTrz75v5UPV9EBixe1eaY=
X-Received: by 10.159.59.214 with SMTP id y22mr1016425uah.142.1521477435137;
	Mon, 19 Mar 2018 09:37:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.129.195 with HTTP; Mon, 19 Mar 2018 09:36:44 -0700 (PDT)
In-Reply-To: <c3970d0c-15a4-bb25-3d7c-06f6e4faf780@linux.intel.com>
References: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
	<CAMKF1speHQU8vNbdiXSrbE2zy-keJX1e9evsEBiYcbPq5Jw3vg@mail.gmail.com>
	<64bf3224-8d92-a547-44ba-c7a2f4f0c8dd@linux.intel.com>
	<CAMKF1sryc1yJU=A3vwsrabiPk2dDhSdv34c1+ptiux_0XnkvrQ@mail.gmail.com>
	<c3970d0c-15a4-bb25-3d7c-06f6e4faf780@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 09:36:44 -0700
Message-ID: <CAMKF1spJmNH9UDVZ74m8x-L6NMjS6qTDB4_wGMu4JUB4PxcM=Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix upstream version check
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
X-List-Received-Date: Mon, 19 Mar 2018 16:37:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 9:23 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/19/2018 05:29 PM, Khem Raj wrote:
>>
>>     It lists all tags regardless of branch and picks the highest.
>>
>>
>> I think that does not work effectively for how glibc release works we
>> should probably track the Release branch name and deduce version from there
>
>
> Glibc does tag their releases, so I'm not sure why you want to track branch
> names instead, they contain no additional information.

that works too I guess if we have good enough filters to detect it. It
seems there is more noise in tags than in branches,

>
> Alex

