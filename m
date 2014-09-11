Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4939C605BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 09:01:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 11 Sep 2014 01:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,504,1406617200"; d="scan'208";a="589735417"
Received: from sdoherty-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.136])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2014 02:00:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Sep 2014 10:00:41 +0100
Message-ID: <88155466.dYiVj6jmJb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <CAJTo0LZjwqEoh9Ce8GF+Aqrb8YPjT7RFV6u0FYFSn=Nrh3qXYQ@mail.gmail.com>
References: <CAJTo0LYNAq45aF8dQKTiufrf-grUnZtJ1K9vDGpSvAUpF0cinQ@mail.gmail.com>
	<CAMKF1sr2YP+L5JWE723k9KynKVfW+AU_TPead1AM_WgJpOMLaA@mail.gmail.com>
	<CAJTo0LZjwqEoh9Ce8GF+Aqrb8YPjT7RFV6u0FYFSn=Nrh3qXYQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchwork cleanup
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
X-List-Received-Date: Thu, 11 Sep 2014 09:01:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 September 2014 22:06:42 Burton, Ross wrote:
> On 10 September 2014 21:21, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Sep 10, 2014 at 12:12 PM, Burton, Ross <ross.burton@intel.com> 
wrote:
> >> I've started running the patchwork post-receive hook manually and
> >> marking as submitted many patches in the queue, but as there's 132
> >> patches of patches still (down from 140-odd!) in an attempt to restore
> >> sanity to the oe-core I think we should just mark as obsolete every
> >> patch that was submitted before a cutoff date, say 1st January 2014.
> >> Any thoughts?  As much as I'd love to ensure we didn't drop an
> >> excellent patch from 2012, I'm not going to manually check all the
> >> patches that the tool can't find automatically...
> > 
> > I think its ok. Thanks for doing it.
> 
> As you have access to the server, do you think you could do this with
> a carefully crafted bit of SQL directly to the database?  The
> alternative would be to find the patch ID that corresponds to "a year
> ago" and edit the state of every ID below that, which might take some
> time...

To be honest I'd rather not be this heavy-handed. I'd like to see what patches 
might have fallen through the cracks; but that shouldn't mean that we have to 
go through and mark them by hand. If you want me to look at writing a script 
to do this I can, but I'd probably need a copy of the database to work with.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

