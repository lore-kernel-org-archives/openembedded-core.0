Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B32B65CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:17:31 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id s198-v6so27183472oih.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 04:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5z4FOG78jmeSVGDOW88z7WsnYXJfVJp8BR3VBstyKJs=;
	b=MEaEAwqK8299DW0yvZtLvpQ2S3kvORg2M/6lYp1aJSpQ8J387tfivEdNGWct3v0lr2
	8MjiWimDCg8swqp0lCSrakMDRoKVOfHEpzpooKjC5pGNZ9uK0LfN1nGAwPXR7m2txRnJ
	1Wq0Iwf24zg8cewpcvImrcfg2jz8CUzIW3R58iVi0QPxZI2WkdbfAukAWd7B1l/0poLW
	gfKDtHuUYY8URx82YyOcbiGx3uxk6Y9Xo8NJbR4ibg2LpYls1w3mjxGGM20z9wlrnE8u
	0bui9Yv7u7MAo2YPUu5b4ijwG6iPS6RVMbKoEHmlBb+YXnVJrhN0QhVXa95G4lkwl7wO
	4X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5z4FOG78jmeSVGDOW88z7WsnYXJfVJp8BR3VBstyKJs=;
	b=XIYlYMFzm1EqFs40iN2ZeEOmUvoSuK3xY0sk3pnfW52tFPttQV+ijKie5eNt4JSY0Z
	o4/qopkBf1065DAJYPlhm1H+YrN9VS5cPOJx9KdS/Qe66ax3aOS+PRh1CwWLrFWFkWTc
	TmiiXgRUxDpBnxH8d4vdeNRY4CFIRnn45koR4FWcz9nLLXjGoiJnpxrsYuGR+bb5QhKL
	vXMfYnqVRTZ53RIbYW94CwLw9nmoT/vZVL6mdake+foZtQMfpVKxejrMQeeIgv/4dKXc
	qmaqX+0jqAO9XJA8Zfa4rg0t3r7kS4qOJCmVakOIz4SKtYxMCjwjN6p9n3g1H7zBG2j6
	/dVg==
X-Gm-Message-State: AOUpUlHtDIsRl+oYDoUmSysO/o3IvSIf5qIBz9sGa/CseOkv6RS3Onu1
	IYoLm9Sp+U2wtyI1jI7B8qJpXWNdHGf1EWFeeozIxizD
X-Google-Smtp-Source: AAOMgpfBUzB8AKA7RdAU/PQh5Hfq8NWR9YdRjDKgwhjf9iX4hVxeBT/ztjdUJ+RVpU5Z+3GMgE7sBXTNC+tYDV3kXoo=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr23429611oia.170.1533035852278; 
	Tue, 31 Jul 2018 04:17:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 04:17:11
	-0700 (PDT)
In-Reply-To: <1533034411-26881-2-git-send-email-maxin.john@intel.com>
References: <1533034411-26881-1-git-send-email-maxin.john@intel.com>
	<1533034411-26881-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jul 2018 12:17:11 +0100
Message-ID: <CAJTo0LZ7OLpo=Sm_Kobr5D730O1wTSmyQsqN=_CSrxCcqkunSQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] vulkan-demos: upgrade to latest commit
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
X-List-Received-Date: Tue, 31 Jul 2018 11:17:31 -0000
Content-Type: text/plain; charset="UTF-8"

On 31 July 2018 at 11:53, Maxin B. John <maxin.john@intel.com> wrote:
> Update subcomponents gli and glm based on the new structure of
> repository.

If they're submodules then the gitsm: fetcher should get those for you.

Ross

