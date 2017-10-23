Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD4870178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 17:07:46 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id a8so17564643pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D+uY37a6xZCHSkvmppTFR0bBsdw2lYFwHsqBdpGkyX4=;
	b=AwdiXuRPukqDzhjiAx49liGB65z25y3N3svBtzB23ZuX8JM+uo4TO8zc1YXlpjUzov
	eQ+1FP8BnT4YF+GoanY8AcG3B1EAVbnr4Vj9vMxPuOVY7BJmMvOreW85QsAQNUcGT5/c
	savIBOnrqAVMjTleB9PQDST+UAaef2nWGTBlpzGOuvtQIbKNmKHNQRMGvVHewXH3IQD1
	pILzutVrWoYUTimfpNAAUys51AxZKQip9622buLWat4vQZ24qe6jQGPfuLmo1Jikag4C
	JNUXvcqcbmRXUbi04ddKrJXzmkyBQly/hdZ6K7+zdlBEEqeEqM5cwma4PfBhJsBYTQfv
	lcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D+uY37a6xZCHSkvmppTFR0bBsdw2lYFwHsqBdpGkyX4=;
	b=hbZ5Z/5utQCR7b7reU1uC72UG9xattv9rGj6sRFwMz4YdLZv/UX/c8I7BcbgmDtGpl
	uJyreHvASw0UcHYBnnZaqMC/UeVqZg6wPpSQYy4uOWlPVlDXT4AmHBevB2Se4uGfOUYS
	hihFQECApv0pfRApSSSd2T6wMGbkoD1y4juuwfIa0SrLOr3HMwd5HC6uUZOIqv3LWLtm
	zK6D8TXv+6gdH8JnuZNDw0qDmx6gkHPh87t247tlt6I5hq7OaTAvLUxhD63Wcffq2yLy
	FBc92NbnolkF68Bgf6AN4sKoiJz/0ZuGi/9XvXamNv/ZYv2lLyUcZQz4qkVjUI31roSz
	gRnQ==
X-Gm-Message-State: AMCzsaXgyY7Ion4FveyayGgfS86hlpfcftf1AYdsnjqzeUCwJnrVusA9
	CZI3ACYEmxm/NoP9uzXc+11RpTHeEWS6lcpSjNo=
X-Google-Smtp-Source: ABhQp+RskJH/zVUWfRgOC7wjFq8bxWJVeQV0z/XmsKClJoCXw1Iki/gXVjagi2GdDZmBWUcG/iG6sNdlfW/RE1yyT9s=
X-Received: by 10.98.150.149 with SMTP id s21mr13599908pfk.151.1508778467983; 
	Mon, 23 Oct 2017 10:07:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 23 Oct 2017 10:07:17 -0700 (PDT)
In-Reply-To: <CAJTo0LaZTxcaadGhce-CuiLYY7zCVja8LomrvOvyQGurbrDrJw@mail.gmail.com>
References: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
	<CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
	<CAMKF1soAg8N10P-xPpdffvUoqHQjR7__j3ssxsfRik-69=bmXQ@mail.gmail.com>
	<CAJTo0LaZTxcaadGhce-CuiLYY7zCVja8LomrvOvyQGurbrDrJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Oct 2017 10:07:17 -0700
Message-ID: <CAMKF1soKCy+h54T1Q6xH3aJxdgpK3YLMyYHU7fqSOavQvOyyjQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool modify errors on second recipe
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
X-List-Received-Date: Mon, 23 Oct 2017 17:07:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 23, 2017 at 9:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 October 2017 at 17:32, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> ok cool. point me if you can before I find, I will cherry-pick and try
>
>
> "cooker: fix watching directories with Python 3.6+"
>
Thanks, this is https://patchwork.openembedded.org/patch/145092/
and it fixed my usecase.


> Ross

