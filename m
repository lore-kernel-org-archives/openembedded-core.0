Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7F77D6CA90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:14:11 +0000 (UTC)
Received: from [69.196.158.250] (port=38211 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VjrUn-00036j-Ui; Fri, 22 Nov 2013 09:14:10 -0500
Date: Fri, 22 Nov 2013 09:14:07 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZ3ye-nX837bnTh9QiQw6ZvrQBgNNp_dyTqPP5jBi9w2A@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1311220913270.15571@oneiric>
References: <alpine.DEB.2.02.1311220812240.14584@oneiric>
	<CAJTo0LZ3ye-nX837bnTh9QiQw6ZvrQBgNNp_dyTqPP5jBi9w2A@mail.gmail.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there an easy way to see the actual files that went into a package?
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
X-List-Received-Date: Fri, 22 Nov 2013 14:14:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 22 Nov 2013, Burton, Ross wrote:

> On 22 November 2013 13:15, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   if i use "bb show" to examine the files that go into each package
> > (eg, for "zlib" here), what i get is the collection of wildcards that
> > will, of course, still be processed when sequentially creating each
> > package:
>
> "bb contents [packagename]"
>
> (known issue is that it doesn't display empty directories)

  that's it, that's what i was after, thanks. i should spend more time
playing with "bb", it's turning out to be massively useful.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

