Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4338976639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 13:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CDAJvg021255; Fri, 12 Feb 2016 13:10:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 12rCmctSF5lB; Fri, 12 Feb 2016 13:10:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CDAicJ021277
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 12 Feb 2016 13:10:45 GMT
Message-ID: <1455282644.16142.313.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 13:10:44 +0000
In-Reply-To: <1455280112.3546.7.camel@linux.intel.com>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
	<1455280112.3546.7.camel@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 13:10:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-12 at 12:28 +0000, Joshua G Lock wrote:
> On Fri, 2016-02-12 at 14:15 +0200, Dmitry Rozhkov wrote:
> > man 5 os-release states that VERSION_ID is
> > 
> > "
> > a lower-case string (mostly numeric, no spaces or other
> > characters outside of 0-9, a-z, ".", "_" and "-")
> > identifying the operating system version
> > "
> > 
> > This becomes crucial when ClearLinux's software
> > update mechanism is integrated into builds, because
> > its client side ignores VERSION_ID's value if it
> > doesn't conform the definition.
> > 
> > Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
> 
> I think we probably want this change, but we will also need to change
> the default assignment of VERSION_ID to match the rules:
> 
> "Variable assignment values must be enclosed in double or single
> quotes
> if they include spaces, semicolons or other special characters
> outside
> of A-Z, a-z, 0-9."
> 
> By default VERSION_ID is assigned DISTRO_VERSION, which contains
> invalid characters for this field in both OE Core (defaultsetup
> distro
> uses "nodistro.0") and meta-yocto (poky distro uses something like
> "2.0+snapshot-${DATE}" during development and something like "1.8.1"
> on
> a release).
> 
> Thoughts on changing these?

nodistro.0 is ok isn't it?

We should probably manipulate the string when writing this, "+" -> "-"
and "A-Z" -> "a-z"?

Not sure I want to change the high level values just due to this.

Cheers,

Richard

