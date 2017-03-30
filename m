Return-Path: <spopovyc@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0180277D3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=551; q=dns/txt; s=iport;
	t=1490898649; x=1492108249;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=oUzm2rpdLBTXWUR2wXqOGhawPEjLyaxHprMw1M6fY+c=;
	b=KTMVxJ/bCIYCf6EgPAGXoVkVcy/zYm1Nks08nUBRBAVRuRTeqnbauM87
	nI1jBfdAUzFs+CtB523OsiwaGZT1FYR0H0UT/PUwHfkccHc7Mj3fyWIAk
	HEju6cGraB0DlkgsLL6mdTUsaWiE9QByY7SMWWTIfc95NAxtNr3arikNh 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ArAgAQTt1Y/xbLJq1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBhUKDYooRc5BCH5NBgg+CDoYiAoN3GAECAQEBAQEBAWsohRUBAQE?=
	=?us-ascii?q?BAgEjVhALGAICIwMCAj0JEQYNBgIBAYl6BQiuCoImilUBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBASETeIVDggUIgTiBKodagl8BBJBijAiSUIFkj1OTbR84gQU7IBWFUIFNPTW?=
	=?us-ascii?q?JFAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.36,247,1486425600"; d="scan'208";a="653638251"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 18:30:48 +0000
Received: from tuxracer.local ([10.61.231.243]) (authenticated bits=0)
	by aer-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id v2UIUlrk021771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 30 Mar 2017 18:30:47 GMT
To: "Burton, Ross" <ross.burton@intel.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
	<CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
	<a0db5863-003a-ab83-aa85-c719656ddc62@cisco.com>
	<CAJTo0La9kxbzE4drCC5YP-2sZb+6WeBqwH1jw8yGgzaYLi+EWw@mail.gmail.com>
From: Serhii Popovych <spopovyc@cisco.com>
Message-ID: <b3461cd0-8336-3c15-5a5b-193fb68ed3ad@cisco.com>
Date: Thu, 30 Mar 2017 21:30:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La9kxbzE4drCC5YP-2sZb+6WeBqwH1jw8yGgzaYLi+EWw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: spopovyc
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Thu, 30 Mar 2017 18:30:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


> 
> On 29 March 2017 at 13:51, Serhii Popovych <spopovyc@cisco.com
> <mailto:spopovyc@cisco.com>> wrote:
> 
>     That's great. What the subject of this change in openembedded-core?
>     I wish to test it.
> 
>     Because with current *master* I see problem is still here.
> 
> 
> "    sysroot-relativelinks: also consider links to dirs on the host"
> oe-core c5b522378fff13962a5187d9d09979866f805cb5, now in master.

Tested, works for SDK, but does not work for buildtools-tarball
(e.g. bitbake buildtools-tarball).

> 
> Ross

