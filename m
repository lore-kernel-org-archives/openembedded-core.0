Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4541A77CE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 17:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BHmJcK014469; 
	Tue, 11 Apr 2017 18:48:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AURlYHXTglQ3; Tue, 11 Apr 2017 18:48:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BHJ3JR011754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 18:19:04 +0100
Message-ID: <1491931143.12091.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 18:19:03 +0100
In-Reply-To: <97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
	<97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 17:48:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 10:16 -0500, Mark Hatle wrote:
> On 4/11/17 9:56 AM, Patrick Ohly wrote:
> > 
> > gdb-cross used to be specific to the tune flags, but isn't
> > anymore. Therefore it is enough to use TARGET_SYS instead of
> > TUNE_PKGARCH to create a unique path.
> Are you sure about this.  On non-intel architectures, it used to be
> VERY common
> that the specific instruction set for a process was programmed into
> gdb.
> 
> Sometimes the user could (after loading gdb) change the instructions,
> but this
> was an aweful user experience.
> 
> Good example of this would be Power, e500, etc.  The instruction sets
> are not
> actually compatible with each other, so GDB needs to know the
> specific
> instruction in order to work.

This may or may not be an issue with gdb however I'd note that we only
build one gdb-cross regardless, we don't configure it with any target
tune specifics and the gdb we build for the sdk is built similarly. So
if it is an issue, its not one we've had reported to us and we don't
configure gdb in any target specific way so this patch should be
safe...

Cheers,

Richard

