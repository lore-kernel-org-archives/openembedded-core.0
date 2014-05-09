Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 69038 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 09:17:04 UTC
Received: from mail-qg0-f44.google.com (unknown [209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2763960167
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 09:17:04 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id i50so4115488qgf.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 02:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AWjs6NrBtIZ1TXIzHNiTZY0Mp7okuJjRWFO9CvT+WsI=;
	b=euo6ZSxBPwW2gHhG1MKfipt+tNdLPjVC/ELq9FTkvTMG9HIJd+c9h2nK6N0r4GymVU
	3WSD3dqOWHELBe5VlYDHIekuTI2GMghWvDd5N/gfQ597hbkuKp0JQhnyjGpCgkYOIYNO
	Kym2jnnDprJ3pOOS/JSWrBcFJTAR+kM8PodF/hEaThlK4SorJxED80R/LHaGwqimhvJR
	cvqyT1YIqlIZOrVDbVUzHXkHWtE9bzVM6vMvwomb/D+NI3Oz8iHF0F97X08neaPXqAnY
	CaXgrUwhtCGS0s4EWe+0Vu46uwaJKKI5aE6zkC0IYxB0ZPmD9IG6UNRJyrwRoBmE5S/l
	iKeA==
X-Gm-Message-State: ALoCoQklCFjkNxkX73wDlPsBCfCZyCTQUmkyCuAN2QA7QsWssM+A05y1sN5zcnDxnd9inh7YbyJo
X-Received: by 10.224.12.74 with SMTP id w10mr12641113qaw.34.1399627025463;
	Fri, 09 May 2014 02:17:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 02:16:45 -0700 (PDT)
In-Reply-To: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 10:16:45 +0100
Message-ID: <CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard directory
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
X-List-Received-Date: Fri, 09 May 2014 09:17:09 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 00:24, Mark Hatle <mark.hatle@windriver.com> wrote:
> The /run/lock directory was being dynamically created during package install,
> but should have been owned by the base-files package.

Doesn't do_install generate the /var/run/lock -> /run/lock symlink, as
/run is always a tmpfs so has to be populated on boot?

Ross

