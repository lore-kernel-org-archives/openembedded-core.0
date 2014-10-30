Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3DE371ED6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:06:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9UD6dLD020138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:06:39 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 06:06:39 -0700
Message-ID: <545237DE.9040305@windriver.com>
Date: Thu, 30 Oct 2014 08:06:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1414581527-5448-1-git-send-email-martin@hundeboll.net>	<1414581527-5448-2-git-send-email-martin@hundeboll.net>	<CANyK_8d3=cmQ0aDxwDtzGZcqHvaL1fhasnS2kimBia0WhJgSuw@mail.gmail.com>	<5450E937.7040501@hundeboll.net>
	<CAJTo0Lb0H8X1Ycr0h=KhnT3k=xVGBcG=+sAu0upx9WfizbSTDg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb0H8X1Ycr0h=KhnT3k=xVGBcG=+sAu0upx9WfizbSTDg@mail.gmail.com>
Subject: Re: [RFC 1/2] scripts: use python2 explicitly in shebangs
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
X-List-Received-Date: Thu, 30 Oct 2014 13:06:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/14, 7:39 AM, Burton, Ross wrote:
> On 29 October 2014 13:18, Martin Hundebøll <martin@hundeboll.net
> <mailto:martin@hundeboll.net>> wrote:
>
>         I used to use a virtualenv to temporarily set Python 2 as the default
>         for the shell in which I ran bitbake commands. That was a while ago
>         though, all my current builds are running on Ubuntu 12.04/14.04 server
>         instances which I access via ssh from my Arch Linux box.
>
>
>     Using a compatible distro-install is of course the easiest way to get going.
>     Could also work with a virtual machine.
>
>
> Paul meant the Python tool virtualenv,
> http://virtualenv.readthedocs.org/en/latest/virtualenv.html.  This can be used
> to create an environment where "python" on the search path is python 2, on a
> system where /usr/bin/ is python 3.
>
> I admit that I'm leaning towards thinking that we just say bitbake requires
> "python" to be 2.7+ and if your host distribution uses python 3 by default, use
> virtualenv.  The logic being added to the V2 series to generate symlinks and
> drop them into the bitbake source tree isn't very elegant.
>
> Obviously using virtualenv means you need to use /usr/bin/env in the shebangs,
> so that part of the series is still needed.

Everything should be using the /usr/bin/env python mechanism.  So that is correct.

For Yocto Project's poky, we've already said that python 2.7.3 or newer (and not 
3) is required.  If your system doesn't have this you can download the 
buildtools-tarball 'sdk', install that and source it first.

No need for third party things like virtualenv, we already provide the capabilities!

(And since this is oe-core, the components to build the special 
buildtools-tarball SDK are available in the tree.. just build it on a supported 
python 2.7.x machine and re-use it on a python3 machine.)

--Mark

> Ross
>
>


