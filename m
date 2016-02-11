Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5C87318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 14:59:36 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id H2zb1s0030BmcFC012zcNw; Thu, 11 Feb 2016 14:59:36 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=j2zaV1Xxb_IL2lTBodIA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aTsiU-0002fD-Ef; Thu, 11 Feb 2016 14:59:34 +0000
Date: Thu, 11 Feb 2016 14:59:34 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160211145934.GA10092@mcrowe.com>
References: <1455192761.16142.257.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1455192761.16142.257.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mike Crowe <mac@mcrowe.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cdrtools-native: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Thu, 11 Feb 2016 14:59:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 11 February 2016 at 12:12:41 +0000, Richard Purdie wrote:
> This recipe currently relies on EXTRA_OEMAKE having been set to
> "-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
> explicit so that the default in bitbake.conf can be change

Minor typo at the end of the log message.

Good catch. It appears that such -native packages aren't included in world
so my testing didn't find it. :(

I've not found anything more over the last few days of test builds.

Thanks.

Mike.

