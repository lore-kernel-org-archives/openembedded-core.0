Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8542C6D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:49:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,730,1378854000"; d="scan'208";a="45228574"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Nov 2013 17:49:45 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1VipQm-0003tY-M8; Tue, 19 Nov 2013 17:49:44 +0000
Date: Tue, 19 Nov 2013 17:49:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20131119174944.GB13018@mcrowe.com>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
	<1384882665-26840-2-git-send-email-mac@mcrowe.com>
	<CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Call make with correct variables in kernelscripts_sstate_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 17:49:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 19 November 2013 at 12:41:40 -0500, Bruce Ashfield wrote:
> On Tue, Nov 19, 2013 at 12:37 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > Ensure that the environment variable and command line arguments that are
> > used when calling make in kernel_do_compile are used in
> > kernelscripts_sstate_postinst.
> 
> What issue was this causing for you ? The scripts are native, and hence
> should just be using the build machines compiler, linker and don't need
> the kernel args.
> 
> So I'm not convinced that we need this patch, without seeing a tangible
> issue that was triggered.

Well, for us v2.6.39 appears to be using the target compiler for
something. At least, I get a lot of:

 DEBUG: Executing shell function kernelscripts_sstate_postinst
 NOTE: make scripts
 /bin/sh: mipsel-oe-linux-gcc: command not found
 /bin/sh: mipsel-oe-linux-gcc: command not found
 /bin/sh: mipsel-oe-linux-gcc: command not found
 /bin/sh: mipsel-oe-linux-gcc: command not found
 make: mipsel-oe-linux-gcc: Command not found
 /bin/sh: mipsel-oe-linux-gcc: command not found
 /bin/sh: mipsel-oe-linux-gcc: command not found

which led me to the previous patch to ensure that the compiler is
available.

Thanks.

Mike.

