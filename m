Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BDDD177BC5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 11:16:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v44BG2x2014592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 May 2017 12:16:03 +0100
Message-ID: <1493896562.23535.122.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 May 2017 12:16:02 +0100
In-Reply-To: <fe883eb0-51fc-54c3-d863-358d63dbc4eb@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-4-alexander.kanavin@linux.intel.com>
	<1493894978.23535.113.camel@linuxfoundation.org>
	<fe883eb0-51fc-54c3-d863-358d63dbc4eb@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 04 May 2017 12:16:03 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 4/5] recipes-lsb4/perl: remove the recipes
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
X-List-Received-Date: Thu, 04 May 2017 11:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-05-04 at 13:54 +0300, Alexander Kanavin wrote:
> On 05/04/2017 01:49 PM, Richard Purdie wrote:
> > 
> > On Wed, 2017-05-03 at 16:11 +0300, Alexander Kanavin wrote:
> > > 
> > > These were required by LSB 4.1 tests; there's no other reason to
> > > continue
> > > carrying them in oe-core.
> > We did discuss LSB and agreed we'd document which pieces we'd
> > support
> > and not support. Can we add such a text file before we start
> > deleting
> > things please?
> > 
> > [I'm totally in favour of killing off some of these things, but we
> > need
> > to do what we said we'd do]
> I have added a 'docchange: yes' flag to the bug [1], so that Scott
> would 
> document the changes, and assumed this would be sufficient?
> 
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11316

In this case I think we need to do a little more. I think we need a
README.LSB at the top of tree which says something like:

"""
OE-Core aims to be able to provide basic LSB compatible images. There
are some challenges for OE as LSB isn't always 100% relevant to its
target embedded and IoT audiences. 

One challenge is that the LSB spec is no longer being actively
developed [insert link] and has components which are end of life or
significantly dated. OE therefore provides compatibility with the
following caveats:

* Qt4 is provided by the separate meta-qt4 layer. Its noted that Qt4 
  is end of life and this isn't something the core project regularly 
  tests any longer. Users are recommended to group together to support
  maintenance of that layer.
* mailx has been dropped since its no longer being developed upstream 
  and there are better, more modern replacements [add details]
* [details about perl modules]

"""

So when you delete something which LSB needs, we can add it here with
some information about why.

Cheers,

Richard




