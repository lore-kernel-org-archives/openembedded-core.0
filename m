Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 895516EC83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:03:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2014 04:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,669,1389772800"; d="scan'208";a="474047202"
Received: from mcorkery-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.96])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2014 04:03:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Mar 2014 11:03:06 +0000
Message-ID: <4118819.bWkrsFYPBI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1395052685.3808.27.camel@ted>
References: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
	<1395048338-25754-1-git-send-email-Martin.Jansa@gmail.com>
	<1395052685.3808.27.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCHv2] report-error: Allow to upload reports automatically
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
X-List-Received-Date: Mon, 17 Mar 2014 11:03:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 17 March 2014 10:38:05 Richard Purdie wrote:
> On Mon, 2014-03-17 at 10:25 +0100, Martin Jansa wrote:
> > * useful when distro wants to collect build statistics from
> > 
> >   all users/developers without any manual interaction from them
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > 
> >  meta/classes/report-error.bbclass    | 103
> >  ++++++++++++++++++++++++++++++++++- meta/conf/local.conf.sample.extended
> >  |  20 +++++++
> >  2 files changed, 121 insertions(+), 2 deletions(-)
> 
> I get worried about this as people could (rightly) be very nervous about
> the system sharing information with a remote server without their
> knowledge. Adding in this functionality makes it look as if that is the
> intent of the system.
> 
> This is why there was a two step process, first to save out the data and
> second to have the user upload it (once they'd looked at what it was
> sharing).
> 
> Does anyone else have thoughts on this?

I have the same concerns. It's fine if people enable this in their own build 
server's local.conf / auto.conf; but if someone were to put this into their 
distro config which is downloaded and used by someone to do their own builds 
with configuration or additional components that they do not wish to share, 
there's the potential for that person to be unaware that their build failures 
will be uploaded and shared automatically.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

