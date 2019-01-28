Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 365147C488
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 14:31:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m1so14222904wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=j1pw09ZprN1RC0pj2nfbWVnIEgXuiLOpq6pHR1HNwwI=;
	b=f6wkpe8DqDvt488Ku7hlGDT09LWcHJP2rMPi+SDosNuJRp6GING3vcCF9CnTo6HqL7
	2jfZ1naZ3u5KyT6kU/B4yBlyfIZiGO/UllO41keRrYzQf/+iS5t0YtOQHRXdK7ILslk6
	wEV9FXibwvrSqJnd8ArkGzFeWcEi7NAoZ25Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=j1pw09ZprN1RC0pj2nfbWVnIEgXuiLOpq6pHR1HNwwI=;
	b=WuFIwGoJYjHPkJgtS60RuTimbORstpbK3jhXFnJ08WTtEAPSJH790TeOBAx4fwBcLP
	QOEreHwRNcnl++/61o92Sguip5ujpSAgaTs/8LqbX7LaI85s703yJKDsNlT9G9vvS2QE
	NTVBt2Kn/ezepUmCFSHXQ1OB2Lpr9lgvlydCIX261ZyECnSw1CzXVTT+sxnsxJhuOEan
	Ya0lswAAtHJ15yoSSycSY6vAp/gOpgMnjKRKuHmk0y46VO105kSwoMLfgvY+sRyI4ztN
	sY1imltAE7rwCRguHUWm/sbBkZGRi40qsCdODkLLSWzihA2XCGzJpC0h/ef3hr305Gfz
	JfVw==
X-Gm-Message-State: AJcUukcQbzByfwV4poTeFlBdTj1RG0S0LF4q47SfvdVh9eCtT5OSLngE
	NZ21m1oALYU0lF+M2lv2yvV3fA==
X-Google-Smtp-Source: ALg8bN7bNVZBU2Tgj39Gfr6qkhIdJUtTa059eEgNznhSKNeTOvOclitPSkDmPDiMyPUub5q4vWJXzw==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr15963981wmj.29.1548685917696; 
	Mon, 28 Jan 2019 06:31:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v6sm118226680wrd.88.2019.01.28.06.31.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 28 Jan 2019 06:31:56 -0800 (PST)
Message-ID: <c386e07d5c75dfb9040e78caa2e5c3089c525873.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonas Bonn <jonas@norrbonn.se>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 14:31:55 +0000
In-Reply-To: <c4b576fc-741a-0fac-efdd-738bf7e9c141@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
	<9649a5c523c4f0809c9f73a9c5326eead5ae12d5.camel@linuxfoundation.org>
	<c4b576fc-741a-0fac-efdd-738bf7e9c141@norrbonn.se>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 0/5] systemd patches
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
X-List-Received-Date: Mon, 28 Jan 2019 14:31:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-28 at 15:26 +0100, Jonas Bonn wrote:
> Hi,
> 
> On 28/01/2019 14:55, Richard Purdie wrote:
> > Unfortunately this series failed in testing:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/226
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/167
> > 
> > so it looks like it may need some tweaks before we can merge it.
> 
> OK.  You'll have to bear with me here as I'm not familiar with
> looking at the buildbot output.  From what I can see, the failure is
> when it attempts to boot the image... is that correct?  In what way
> does it fail... where do I find that?

Yes, these tests are trying to boot images under qemu. You can see the
output from boot process and it looks like it starts an interactive
dialog with the user (or attempts to) for setup. The key piece in the
various logs would appear to be:

 DEBUG: Last 25 lines of text:
|          Starting First Boot Wizard...
|          Starting Rebuild Hardware Database...
|          Starting Apply Kernel Variables...
|          Mounting NFSD configuration filesystem...
| 
| Welcome to your new installation of Poky (Yocto Project Reference
Distro) 2.6+snapshot-20190126 (master)!
| Please configure a few basic system settings:
| 
| -- Press any key to proceed --[[0;32m  OK  [0m] Started Journal
Service.

(from 
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/257192/raw)


> When I build locally this all runs fine.  So what should I be
> building locally in order to see a failure like buildbot sees?

Add INHERIT += "testimage" to local.conf and then

"bitbake core-image-sato -c testimage"

You'll need a tun/tap device setup so that "runqemu <machine>
<imagename>"works.

Cheers,

Richard



