Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ubtxv-0006Ia-Ki
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 16:43:05 +0200
Received: by mail-ve0-f173.google.com with SMTP id cy12so2332984veb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 07:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=F0ZB1MBHOqEG8MnenNOwnuQgF9KRoDM1stxywLh6Mt0=;
	b=GJpWHjp8O2NWLrcXo6Zi+kLCLXSIV/iY4FysGbqtVow9agmbZNDE0TSVwgWZeghcou
	l6YJ/mBffs9IvMF0q9vROs8+syLmVUugDl+0K+0YwX9s80oCClDsBymoi7rUiZeJCtP1
	1ho/cPaNsEJ/4F7z+lcH71H82Vm+9ce2x4u0zV3mws1gcRZZJ5dhuHdECQUjrJTht/C0
	pMUembX3YGunMfgbMueKXZNJzq85RmtAbL8Zfnf8rowjAY9ilaDCCBVn160Ns3DBPdxn
	1pZE6gUytnrGUbLQcNa4ynJ55stBLppeqCeLnwE1hgRgMZOsjaDPj1/jt/j7n6RZX7LP
	b6QA==
X-Received: by 10.52.174.41 with SMTP id bp9mr15762185vdc.4.1368455089952;
	Mon, 13 May 2013 07:24:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 07:24:29 -0700 (PDT)
In-Reply-To: <5190CF63.2030303@r-finger.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 15:24:29 +0100
Message-ID: <CAJTo0LZ9WO0to_gs2tJvTbqxfkYAAO6jQw_7g2Ev8DS5BNttSA@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQlbX83VqVd7mlB5ZvwfX2MX9bfJeq9gN2VMhaIBwa6n/Ynfmss52G0Y7jFSFeBb3qXza0YG
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 14:43:09 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 12:32, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> On 13/05/13 12:06, Burton, Ross wrote:
>> The problem with bbappends is that they break every time the package
>> in oe-core changes version.
>
> I see this as a good thing; if I maintain a bbappend, I want to know
> when the base package changes its a version, and I get an immediate
> error due to bbappend to a non-existent file.

The counter-argument is that meta-fsl-arm and meta-fsm-ppc for example
have a number of .bbappends, and it seems to be a regular occurrence
for the autobuilder to break because oe-core upgraded but the BSP
didn't follow in sync.

Allowing non-versioned appends would mean the developer can pick what
their preference is, which seems like a good idea.

Ross


