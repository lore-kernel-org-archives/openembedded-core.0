Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C05D6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12G1JZv013390; Tue, 2 Feb 2016 16:01:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4U2C2HmrCOQe; Tue,  2 Feb 2016 16:01:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12G1EoQ013387
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 2 Feb 2016 16:01:16 GMT
Message-ID: <1454428874.27087.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Tue, 02 Feb 2016 16:01:14 +0000
In-Reply-To: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 02 Feb 2016 16:01:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> bitbake.conf currently contains:
> 
> EXTRA_OEMAKE = "-e MAKEFLAGS="
> 
> Back in November[1] I submitted a patch that allowed this default
> value to be overridden without affecting anything else that was
> appended to it. I received feedback that the default value was no
> longer useful and that it would be good to get rid of it.
> 
> So, this patch series fixes the two recipes that still appear to be
> relying on the previous default and then makes the default
> EXTRA_OEMAKE = "". After these changes core-image-sato builds
> successfully for me (although I have not run it.)
> 
> Mike.
> 
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-No
> vember/112393.html

This is a pretty major change and we likely need a bit more of an idea
of impact.

Which architectures did you test? Often, x86 is a bad choice here and
we'd need something cross (arm/mips/ppc) to ensure it really is doing
the right things. We also need to assess a bit more than just sato. We
can run this up on the autobuilder and see what happens.

A post to the architecture list is probably needed so everyone knows
this is happening (or at least being considered).

I do worry how much of meta-oe may be affected by this. 

Martin: Any opinion on this?

Cheers,

Richard



