Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 417A1731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 20:50:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jun 2016 13:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,435,1459839600"; d="scan'208";a="997238511"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.25.208])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2016 13:50:32 -0700
Message-ID: <1465332631.3458.36.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Jun 2016 21:50:31 +0100
In-Reply-To: <1465318776.13979.79.camel@linuxfoundation.org>
References: <1465311037-17658-1-git-send-email-joshua.g.lock@intel.com>
	<1465318776.13979.79.camel@linuxfoundation.org>
X-Mailer: Evolution 3.20.2 (3.20.2-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH] image: add mechanism to run QA checks on the image once it's built
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
X-List-Received-Date: Tue, 07 Jun 2016 20:50:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-06-07 at 17:59 +0100, Richard Purdie wrote:
> On Tue, 2016-06-07 at 15:50 +0100, Joshua Lock wrote:
> > Add a mechanism to run QA checks on a constructed image once it's
> > complete. All checks will be run with any one failure resulting in
> > a failed build.
> 
> How is that different to the testimage class (which tests images
> after
> they're built)?

The intended purpose of this task is to run checks on the contents of
the image before it's booted.

I implemented a similar task in meta-swupd to run various checks such
as ensuring a generated image doesn't contain dangling symlinks (a sign
of unexpected consequences from alternatives configuration).

Another check one might run is ensuring /etc and /var are empty in a
stateless distro, or checking /bin, /lib and /sbin are links in a
distro with a merged /usr.

When I have a v2 of this which addresses some of Chris' concerns I'll
try and improve the commit message, variable naming, etc to avoid
confusion.

Regards,

Joshua

