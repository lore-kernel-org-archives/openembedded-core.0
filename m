Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 43485780F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:47:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5NEllrK018055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 23 Jun 2017 15:47:48 +0100
Message-ID: <1498229267.24449.132.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 15:47:47 +0100
In-Reply-To: <1497448981-8637-1-git-send-email-sgw@linux.intel.com>
References: <1497448981-8637-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 23 Jun 2017 15:47:48 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] pkg-config: allow kernel to be build with esdk
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
X-List-Received-Date: Fri, 23 Jun 2017 14:47:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-14 at 07:03 -0700, Saul Wold wrote:
> When the kernel's menuconfig target is called while using the esdk or
> an esdk-based container, the pkg-config info that is found is not
> correct.
> The pkg-config info is for the target, but we need the eSDK's
> information in order to build the host based menuconfig.
> 
> The new pkg-config script checks both that it's in SDK and being
> called from the check-lxdialog script in order to limit the scope of
> when the pkg-config automagically switches to pkg-config-native.
> 
> This script also replaces the default pkg-config-native script.
> 
> [YOCTO #11155]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---

To be honest, I'm scared of adding this kind of complexity to the
system. I appreciate the problem you're trying to solve but I worry
adding this kind of change is complex, invasive and introduces too much
risk.

I have some specific worries with this implementation too, in
particular that it changes on target pkg-config, it really should only
change nativesdk-pkgconfig? If we have risk, we want to minimise that
risk and adding this wrapper everywhere doesn't seem to do that...

Cheers,

Richard



