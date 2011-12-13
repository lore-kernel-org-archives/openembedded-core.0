Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rab7A-0003lR-CD
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 23:46:24 +0100
Received: by vbbfc21 with SMTP id fc21so165774vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 14:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ChEm7rpc3UPyky43inSVc3BbOVULRXznenNHh3cjD/U=;
	b=qEWVTgmW9gotljXhUEv3ZNxUEQXTYGJVCGtqzRHn5fgnQKzhU3qSp6B0Aj00z9uHEC
	xKFjaMQYZ5hUU64tOUegSvzeh+hlCqlKDeQ7YN1/Q+LgEcf+RVf+9lI92sos75WQ6AJT
	0lgOWoXLb4gLlv5lQEz4LGLx2lymG5GHYcn1I=
Received: by 10.52.65.101 with SMTP id w5mr2567262vds.27.1323815967621;
	Tue, 13 Dec 2011 14:39:27 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ey9sm475123vdc.19.2011.12.13.14.39.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 14:39:26 -0800 (PST)
Date: Tue, 13 Dec 2011 14:39:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20111213223928.GA15239@sakrah.homelinux.org>
References: <cover.1323807692.git.josh@linux.intel.com>
	<CAMKF1soA84UGCpx12gsTU_aL0uGSYau_=qoLDXkj9fRrhtGLmQ@mail.gmail.com>
	<4EE7B848.3070405@linux.intel.com> <5518182.4uSUpxrDi7@helios>
MIME-Version: 1.0
In-Reply-To: <5518182.4uSUpxrDi7@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] clutter_git: update to 1.8.2 tag
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
X-List-Received-Date: Tue, 13 Dec 2011 22:46:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/12/11 21:20), Paul Eggleton wrote:
> > > you could also use the tag name instead of SHA for SRCREV I think
> > 
> > Indeed we can, however we've seen problems which I can't recall the
> > details of in the past when doing so. Therefore I decided to avoid it
> > this time.
> 
> It does work, it just forces a fetch on every parse which is not really 
> desirable. It's really no hardship to use the SHA1 especially if it's 
> accompanied by a comment with the corresponding tag.

is this some limitation of fetchers ?


