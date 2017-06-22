Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 115EA77E7A;
	Thu, 22 Jun 2017 09:21:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5M9LiTH026643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 22 Jun 2017 10:21:45 +0100
Message-ID: <1498123304.24449.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Hudson <sean_hudson@mentor.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>,
	openembedded-architecture@lists.openembedded.org
Date: Thu, 22 Jun 2017 10:21:44 +0100
In-Reply-To: <4358098a-6b7b-c5ae-66b2-da2beb052595@mentor.com>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
	<491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
	<1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>
	<4358098a-6b7b-c5ae-66b2-da2beb052595@mentor.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 22 Jun 2017 10:21:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Thu, 22 Jun 2017 09:21:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-20 at 08:27 -0500, Sean Hudson wrote:
> On 2017-06-20 04:30 AM, Paul Eggleton wrote:
> > 
> > On Monday, 19 June 2017 5:31:10 PM CEST Sean Hudson wrote:
> > > 
> > > On 2017-06-19 09:05 AM, Mark Hatle wrote:
> > > > 
> > > > It would be reasonable to write up a 'best practices' type
> > > > document. 
> > > > Explaining that simply due to the nature of building many of
> > > > these things
> > > > will be 'leaked' and where some of them are leaked
> > > > through.  (Package
> > > > generation, compilation, etc for instance.)
> > > That sounds reasonable, although, TBH, if someone is adding
> > > credentials
> > > to their SRC_URIs, I would expect that a best practice would be
> > > ignored.
> > >  Perhaps adding a detection routine that emitted a warning during
> > > parsing for credentials in the SRC_URI might be
> > > warranted?  Thoughts?
> > This might be useful yes. I think the stumbling block is that at
> > the moment we
> > would have to have it off by default and then the user is almost
> > certainly not
> > going to know to turn it on. Perhaps this is another thing that we
> > might check 
> > in a "production" vs. "development" mode where the user can easily
> > switch to
> > the former to enable a set of more stringent checks.
> I'm not sure I follow.  What would prevent us from turning on a warning
> that detected credentials in a SRC_URI by default?  Even with Richard's
> change to prevent the information from propagating into the .ipk, it
> seems useful to notify the user.  Personally, I'd like to know if one of
> the recipes I'm using has such information in it regardless of whether
> I'm generating a development or a production image.

We can certainly do this, its technically not an issue. My worry is
that if gives false security feelings since you can easily expose
hostnames or other information as well as credentials. Where do we
stop?

We could go as far as to stop bitbake supporting usernames/passwords in
urls. There are some usecases where that is useful though...

Cheers,

Richard







