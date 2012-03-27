Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCgAA-0002yy-Dv
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 01:50:54 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCg1R-0004Cy-PV for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 19:41:53 -0400
Date: Tue, 27 Mar 2012 19:41:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1332890367.28414.187.camel@ted>
Message-ID: <alpine.DEB.2.02.1203271939500.8711@oneiric>
References: <alpine.DEB.2.02.1203271734090.7770@oneiric>
	<1332890367.28414.187.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: how much can bitbake tell me about my upcoming build?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 23:50:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 28 Mar 2012, Richard Purdie wrote:

> Well, there are:
>
> bitbake -g (and look at task-depends.dot)
> bitbake -g -u depexp
> bitbake core-image-sato -n (dry run)
>
> which will give some interesting info.

  yup, i'd already run across those and made a note of them.

> > p.s.  one thing i'd like is to be able to ask how much source i would
> > need to download for a given build before i start.  is there any way
> > to do that?
>
> Not that I'm aware of since the SRC_URIs don't say how big a
> download is, nor are they ever likely to.

  sorry, i phrased that badly, i didn't expect there would be any way
to get the *amount* of source, i was just wondering about getting a
list of the source that would need to be fetched, but i guess doing a
fetchall/dryrun would tell me that.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


