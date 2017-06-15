Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 006A0783E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:02:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d64so622460wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dTvOxWv2qQaC7DNtXJd6rynV5Pvr2rjjiWCfLIt9j2c=;
	b=LFU7HHcuuglY8NngfuGxuaitln84yDHgkaRLqUYZcXMcCWjm1DUou41EJE1rA4wyF0
	EFWAvfpR2sK0WN0ZZHGv0TDKZgHgeuDCMA7UW035/TqnwoHP7PeFsidGmAM32sZUcupv
	oTVrnfag+b3+doHl8etqsUpvNyuNl+wqvVgd/YLwLTvOfmETt14QHFMiA9s+H1/weZvR
	+Nv9Zh93azzT3LnCYWaKuLM8UTCkEPQd0r1YwEHodPry02QBdtymqs/CXQ0UO135O7ac
	Nec4+ve4vaIRrWKhOez0CDkL0QsPWuO2ER2kwqJ51/ggLxVxJEjcZI4/+iWoW5F63pGr
	CkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dTvOxWv2qQaC7DNtXJd6rynV5Pvr2rjjiWCfLIt9j2c=;
	b=AImKGNA1j6mSwREk0q9Qj7ZB9RCrn5yqdI6Ay85aC/AhwGv0ta+btUQAHoJM6TYijM
	McrtufcdAWxS48/hCvf+OcW9HNzTAWwgHRJWLBBATo15ck1sQQgGAV8CSr5BJ9FVmpoh
	6p/b1oJvstyLurA+irDBaTdwH4ryosaJOcR3aIQdRFpk4flKblojGA2frRKB9QN3vJPq
	IiPhhbOlQ7W/0CZAIDiyWaySJxanoeTx21kzFOJHDmbR9lg4OYgnX/KnDHEO7tlnCB4o
	3F0u1Z5R8ar65106rq+QtLcNF51Z6YneR3CX9EvUU3A29q7KAl3iBjqb+wj9yvuQaoBi
	SRWA==
X-Gm-Message-State: AKS2vOwUwv+9zQzYwszfYQM1YF1x574+sQPm3tj+HLr9HEY+tT3ea6a9
	B4f/4EN6iNWjgBMxyjUoLaRl0bPXew==
X-Received: by 10.80.182.35 with SMTP id b32mr4196780ede.123.1497542573236;
	Thu, 15 Jun 2017 09:02:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Thu, 15 Jun 2017 09:02:22 -0700 (PDT)
In-Reply-To: <225c958a-3bd3-b8b7-8447-53dc8a4d34ec@linux.intel.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
	<1fcd2f1adf3506cc8d22cbbc538ffb7e1eebbf8f.1497453168.git.raj.khem@gmail.com>
	<225c958a-3bd3-b8b7-8447-53dc8a4d34ec@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jun 2017 09:02:22 -0700
Message-ID: <CAMKF1sotA4FHmA3oinKzF95P2+aSr54JbbT4UdCMiATO9Zuj7w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] gobject-introspection: Disable generating static lbraries
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
X-List-Received-Date: Thu, 15 Jun 2017 16:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 15, 2017 at 2:50 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/14/2017 06:23 PM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Why? You need to add an explanation to the commit message.
>
sure, its to avoid linking with .a when using pie

> Alex
>

