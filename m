Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1A165CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMXoX5022678; Mon, 28 Mar 2016 23:33:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TNZNpzUpysL7; Mon, 28 Mar 2016 23:33:50 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMXntC022675
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Mar 2016 23:33:50 +0100
Message-ID: <1459204429.21672.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 23:33:49 +0100
In-Reply-To: <1459188436-13411-1-git-send-email-sgw@linux.intel.com>
References: <1459188436-13411-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] xf86-video-intel: Add UXA PACKAGECONFIG and 20-intel.conf
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
X-List-Received-Date: Mon, 28 Mar 2016 22:33:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 11:07 -0700, Saul Wold wrote:
> This patch adds the UXA Packageconfig option to handle older Intel
> Graphics
> the uxa code when enabled needs a patch from upstream due to a change
> in the
> API of the Xserver.
> 
> Also added a generic 20-intel.conf with a commented line to enable
> the uxa
> AccelMethod option.
> 
> The Packageconfig only needs to be enabled in genericx86-64 since
> other
> MACHINE configs (such as meta-intel) include the VAAPI acceleration
> that
> handle the graphics hardware corretly.

This doesn't really look right to me. It makes the driver MACHINE
specific which is generally bad and will fail various tests. You likely
need to detect this at runtime on the relevant hardward and enable
if/as/when needed.

Is there some way that X can correctly autodetect what its running on
and do the right thing without requiring manual config? The fact we're
having to do that seems to fly in the face of the "configurationless"
goals X has had more recently...

Cheers,

Richard

