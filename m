Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B124B73E86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 22:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t41MxUDC017126; Fri, 1 May 2015 23:59:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0Q6FK85ggLYr; Fri,  1 May 2015 23:59:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t41MxEkp017113
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 1 May 2015 23:59:26 +0100
Message-ID: <1430521154.18360.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 01 May 2015 23:59:14 +0100
In-Reply-To: <cover.1430443583.git.bruce.ashfield@windriver.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 01 May 2015 22:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
> Here is the latest consolidated pull request for the supported linux-yocto
> kernels.
> 
>  - We have a refresh of the 3.14-rt support
>  - bluetooh configuration changes for common-pc/qemux86
>  - braswell BSP features and fixes
>  - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).
> 
> I've built and booted these on my local machines and qemu, and
> everything was sane.
> 
> The -dev kernel obviously isn't something for deployment yet, but
> it builds, and forms the base for follow up config changes, features
> and development work. I built and booted core-image-kernel dev with
> the 4.1 changes in place.

The autobuilder showed up this for an x32 build :/.

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/282/steps/BuildImages/logs/stdio

Cheers,

Richard


