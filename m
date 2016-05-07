Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 48C1060767
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 May 2016 22:08:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p185so15217163pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2016 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fEWChtnLkFFKV5Z1TQ6dI++HmUH2gZ2PMS1DTwYmMuw=;
	b=Kl2XeQKuyAuDwofNYYKIEcHw86kGDz41ZCdn56IzMdhxcf0ZHKNu/RzYUPUcNqrq6N
	VwPSXQUUHiALmnEuHTdOusS+SBAR+fD9Sl7nXx9GOIgMr9BrnQp11UdFv82ft2hV7wbp
	/wg/JGiXeVV5nk6g62MfFUyVS9z00m2Vr1UD+E5Gh0oHoNrMGd3KPztI+vaSS3mJm3yn
	6px8ycX7id4RKzTFn6pSKN7cmKdcNl77+nQZ6DNAe9lU0KVd8v9u4n09AS57GuCqqwMQ
	p1w1fAhHPenvrNq9KFDTKeeTipIlNXXzkUGy0Q+QPZk9wDdQuk7GShpecyHuE5VHOiOY
	LmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fEWChtnLkFFKV5Z1TQ6dI++HmUH2gZ2PMS1DTwYmMuw=;
	b=As/GmT0fjrlo55RIaoNBjBMHoVI/HHGcAszCeX931UoQm+pqUmsTogRDhA+auPxvx7
	rLmMofurOxjdAIKv6xu3BOW9Rxx+D5biQW0jbJxuuIroY0SMOs6UW1r9bPNNYeR45kWG
	RImtnCiGA79baMES5fkZTQs8mHXsj80pLo6FRlckv28DJgjnqoJgppF+JVbAsukuQdfW
	EvKCvD7M6I31Q0VYscFPvnUld069eQ3QYENgZ1DOdPacwkijFbBOuOIk87MIoNHiecAp
	i2bb97JU22d+Pfij0jlfZXa8IkWZQACmFKkgUCMCPDIZKvYXRZW1QjSUjBiKPoRf8nqi
	IKuQ==
X-Gm-Message-State: AOPr4FUqXj6/HOEZBk63X7/ytkV3SfagzWEopOevRPaOBTSd776ARByw/esHWjGofdQu0w==
X-Received: by 10.98.87.220 with SMTP id i89mr38514107pfj.107.1462658928788;
	Sat, 07 May 2016 15:08:48 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:a93b:c15d:e6b7:11e9])
	by smtp.googlemail.com with ESMTPSA id
	s197sm30210173pfs.62.2016.05.07.15.08.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2016 15:08:47 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <572E676E.1070400@gmail.com>
Date: Sat, 7 May 2016 15:08:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11][master][krogoth] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 07 May 2016 22:08:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/4/16 10:53 AM, Bruce Ashfield wrote:
> Hi all,
>
> The following is a consolidated set of changes for the 4.1, 4.4 linux-yocto
> kernel, as well as the kern-tools.
>
> All of these are bug fixes, minor configuration changes or -stable updates.
> I've had most of them queued since before the 2.1 release, but was waiting
> for the dust to settle before sending them out.

I pulled this in to Krogoth for prelim testing. I will wait for them to
hit master before adding to a pull request.

thanks,
armin
>
> These are all appropriate for master and krogoth.
>
> Build (and boot) tested on qemu*, all arches.
>
> Bruce
>
> The following changes since commit f7b520878babbaa7527151f22c031ae160512753:
>
>   poky: Switch to post release name/version (2016-04-29 07:58:46 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (11):
>   linux-yocto/uvesafb: print error message when task timeout occurs
>   linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
>   kern-tools: handle directories with, or without, trailing /
>   kernel-yocto: allow branch auditing to be suspended
>   linux-yocto/4.1: update to v4.1.22
>   linux-yocto/4.1: make ltsi content available
>   linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry
>     backport
>   linux-yocto/4.4: skylake configuration
>   linux-yocto/4.4: broxton enablement and refactoring
>   linux-yocto/4.4: bump to v4.4.8
>   linux-yocto-rt/4.1: update to rt23
>
>  meta/classes/kernel-yocto.bbclass                  | 23 +++++++++++++---------
>  .../kern-tools/kern-tools-native_git.bb            |  2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 +++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 18 ++++++++---------
>  9 files changed, 45 insertions(+), 39 deletions(-)
>


