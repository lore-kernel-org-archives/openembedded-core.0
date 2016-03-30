Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2886014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 13:05:17 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id cD5E1s0070BmcFC01D5FNe; Wed, 30 Mar 2016 14:05:17 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=7OsogOcEt9IA:10 a=5LxY0qJsEVYeBrQsBm0A:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1alFoA-00008q-9T; Wed, 30 Mar 2016 14:05:14 +0100
Date: Wed, 30 Mar 2016 14:05:14 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <20160330130514.GA510@mcrowe.com>
References: <20160329125626.GA11712@mcrowe.com>
	<1459260670.21672.25.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1459260670.21672.25.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Wed, 30 Mar 2016 13:05:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 29 March 2016 at 15:11:10 +0100, Richard Purdie wrote:
> On Tue, 2016-03-29 at 13:56 +0100, Mike Crowe wrote:
> > Is there a recommended way to ensure that all the sstate cache files
> > are
> > touched, even those that are not actually required to build the image
> > currently due to task optimisation?
 
> generate the "locked-sigs" inc file (bitbake XXX -S none) and then with
> a script touch all the objects listed in that file?

That looks like it might work. There's a bit of messing about required for
the distribution name in the native packages but I can probably deal with
that.

Thanks.

Mike.

