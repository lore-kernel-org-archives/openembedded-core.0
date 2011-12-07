Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYPNn-0002qu-Ds
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 22:50:31 +0100
Received: by iadj38 with SMTP id j38so1501650iad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 13:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UEVYZA3LtBTFgVJhSSlzEuUtyZEV+4gtFNkT+f4P72Q=;
	b=GDQp9SCxgVdO9ny0bTdOmPdQjBXn946poV574B6w0hOoNMtV0VT+ZP5v7+pmES+r75
	9M4bqNfetQS84JpozwCwtEXO5D+loufcZx2D9J3qGzrwzg66QC60fVjXOi/szlgNxBfF
	89UaF8MdzR39qo41fT+DxwbNdKc2t4JGj48bk=
Received: by 10.231.8.139 with SMTP id h11mr82473ibh.1.1323294221391;
	Wed, 07 Dec 2011 13:43:41 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id mb4sm5998711igc.1.2011.12.07.13.43.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 13:43:40 -0800 (PST)
Date: Wed, 7 Dec 2011 13:43:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207214317.GC6351@sakrah.homelinux.org>
References: <4EDF2360.7090402@emagii.com>
	<E5CF0974-DCA6-4DAA-859C-ED40990CC11E@dominion.thruhere.net>
	<4EDF788E.60804@emagii.com> <3741284.XQAanrv0Ii@helios>
	<1323270054.30601.26.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1323270054.30601.26.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: ulf@emagii.com
Subject: Re: Possible stale tags in the download directory
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
X-List-Received-Date: Wed, 07 Dec 2011 21:50:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/12/11 15:00), Richard Purdie wrote:
> On Wed, 2011-12-07 at 14:37 +0000, Paul Eggleton wrote:
> > On Wednesday 07 December 2011 15:30:38 Ulf Samuelsson wrote:
> > > Richard says that if the *.done file is there, then the checksum is not
> > > calculated.
> > > Or that is at least how I interpret his comment.
> > > 
> > > If the check is always there, why the tag?
> > 
> > That's not what my reading of the bitbake source says. 
> > bitbake/lib/bb/fetch2/__init__.py contains the only references to .done files 
> > and all it does is make sure the done file gets "touched" whenever a fetch for 
> > the associated file occurs; it does not otherwise check for its existence.
> 
> It does two things, one is an activity marker useful for seeing whether
> files are in active use and the second is for the checksum calculation
> which only ever happens once after download due to the file (see
> verify_checksum() in that file).

when do we create .done files? if I am in middle of download of a tar
file and I cancel it and restart it does not fetch the file again but
tried to use the corrupt file. 

Is it a big build time hit if checksums are verified all the time ?

-- 
-Khem


