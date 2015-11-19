Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD856010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:50:45 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id jPqk1r0070BmcFC01PqlfJ; Thu, 19 Nov 2015 11:50:45 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=E4sw3vpl c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0Bzu9jTXAAAA:8
	a=-An2I_7KAAAA:8 a=kj9zAlcOel0A:10 a=qtqOOiqGOCEA:10
	a=iAtDTkGOG-695cxW13kA:9 a=CjuIK1q_8ugA:10 a=d-PMUXjYMFIA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1ZzNjg-0001e3-2T; Thu, 19 Nov 2015 11:50:44 +0000
Date: Thu, 19 Nov 2015 11:50:44 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20151119115044.GA5875@mcrowe.com>
References: <1447932037-29676-1-git-send-email-mac@mcrowe.com>
	<1447932227.12500.121.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1447932227.12500.121.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.py: avoid mkdir race when building multiple images
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
X-List-Received-Date: Thu, 19 Nov 2015 11:50:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 19 November 2015 at 11:23:47 +0000, Richard Purdie wrote:
> On Thu, 2015-11-19 at 11:20 +0000, Mike Crowe wrote:
> > The sysroot directory will already exist so let's just try and make the
> > imgdata directory and cope with the exception thrown if it already
> > exists. This stops the race being fatal.
 
> How about using bb.utils.mkdirhier() which already does this?

I wasn't aware of that function. It's much simpler. I've updated the patch.

Thanks.

Mike.

