Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0376F815
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 17:40:14 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id j15so1354649qaq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Hgy9F0dfkdyVssEPzaVdifRq/oyF9HvCIvJzUuRyHts=;
	b=EwxqDZB5OaoWJQ2yZ667QQk490BPM1KOvJqxOT8SImVY0L0MTeffNw0lxaDe3GUsEv
	sJJX9ADAPeiaSuDQs58zzg1lEQubRHHHYGkV/RuqUmYKudIGQ6fphqDmGs2HUOf053Mn
	obprhKJqAdZqJ+BL6EJD7E322p7P5DKChYdNIJKwPOQwqrXp4Y38EGz8+eHpyg8CGNzb
	uX6VRp/iz1abhFjtckTgWk5W62bm5qjknV42qPtYLEha6RrKXNV2Z+LjZS4C9RXNQqps
	20o0cq7nCMYkyErxIKe/0DHilpozI2DrEjGYLBtKimJgKp+7RewlXBloh7vQyceZxlwF
	F2Zg==
X-Gm-Message-State: ALoCoQl4tv7azqC2foGQz29J29MzhOKzWirTUmZCvK4yZ/Jpn+3MNbYIZDMqTgVamGicMZRtBcHh
X-Received: by 10.224.127.129 with SMTP id g1mr4110327qas.22.1394732415322;
	Thu, 13 Mar 2014 10:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Mar 2014 10:39:55 -0700 (PDT)
In-Reply-To: <7337ad5ac0c8f13c3b23160f2a2ea6e9dc383f64.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<7337ad5ac0c8f13c3b23160f2a2ea6e9dc383f64.1394555880.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Mar 2014 17:39:55 +0000
Message-ID: <CAJTo0LYPyrTpEN6w4g5KcmsXMB6=GvaKxcshObb1Co6Lh3A8VA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] package_rpm.bbclass: archive the source to srpm package
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
X-List-Received-Date: Thu, 13 Mar 2014 17:40:17 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
> -        # Remove the source (SOURCE0, SOURCE1 ...)
> -        cmd = cmd + " --rmsource "

You probably want to keep this as otherwise
deploy/sources/MACHINE/RECIPE/ contains both the .src.rpm and the
separate sources.

Ross

