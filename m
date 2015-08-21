Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0F2A60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 13:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LDfxOG018332; Fri, 21 Aug 2015 14:41:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EL9O2EhNze06; Fri, 21 Aug 2015 14:41:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LDfi9t018317
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 21 Aug 2015 14:41:55 +0100
Message-ID: <1440164504.12105.235.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 14:41:44 +0100
In-Reply-To: <CAJTo0LaUCLZdZZU8R6qo6N=a3h2o2ZYbQB-c2P3DMS4en2+UMg@mail.gmail.com>
References: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
	<CAJTo0LaUCLZdZZU8R6qo6N=a3h2o2ZYbQB-c2P3DMS4en2+UMg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Try to fix qemu freezing due to full socket buffers
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
X-List-Received-Date: Fri, 21 Aug 2015 13:42:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-21 at 14:36 +0100, Burton, Ross wrote:
> 
> On 20 August 2015 at 23:24, Randy Witt <randy.e.witt@linux.intel.com>
> wrote:
>         Randy Witt (3):
>               qemurunner.py: Move some class variables that should
>         only be local
>               qemurunner: Make create_socket() return data and use
>         exceptions
>               qemurunner: Use two serial ports and log console with a
>         thread
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/450/steps/Running%20Sanity%20Tests_2/logs/stdio
> >
> If this was meant to fix the ttyS1 hangs, I'm sorry :(
> 
It was meant to fix the issue where qemu hangs and stops responding to
network requests. Its a useful datapoint that the systemd issues remain
though. Was there a systemd upgrade in mut out of interest (as another
data point)?

Cheers,

Richard



