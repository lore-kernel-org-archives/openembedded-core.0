Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyEjk-00045H-OU
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 03:39:24 +0100
Received: by yxn22 with SMTP id 22so1443915yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2011 18:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=/Cs/iPpYVuJd14OE0kMrPCGvKkZUvQOqBycg0/t6Yzg=;
	b=HoUhIJY6PdUyfofBtamvg+gJUGN3fVWgx63cy8Vhp2QS9EUx/ltNf0VVowTxsxyXkE
	oES8yXfbYH+vmOfyPWXycoMkphFyDofKTDSgX5TipRAo+/AfCXmmAe1bQMJVH/VvdIGh
	7kElRqRz36SFTWUjRsKanh92iTnNgJvKFEyqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=nXK44m5lrZzNu5v3ihbKZedFSEfXE2n3PkuhOTq9GJkvE7rOt1CXIT+XBF7hDhYgKw
	a63UMGPZgawdEjze21gU0aQK+yph7TEhyTEoJVRQQmHFVIpWaXMvEFWVvT5NHrUUK1+Z
	pz68tm23bGXJ1ONpbi8QwJ2DSvC3pjfOUCpbI=
Received: by 10.150.75.4 with SMTP id x4mr958577yba.410.1299897080707;
	Fri, 11 Mar 2011 18:31:20 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q18sm86933ybk.11.2011.03.11.18.31.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 18:31:19 -0800 (PST)
Date: Fri, 11 Mar 2011 18:31:40 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20110312023140.GA4829@sakrah.homelinux.org>
Mail-Followup-To: Saul Wold <sgw@linux.intel.com>, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
References: <cover.1299891748.git.sgw@linux.intel.com>
	<4D7ACD9C.3010002@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4D7ACD9C.3010002@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/1] gnu-config make sure we use perl-native
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
X-List-Received-Date: Sat, 12 Mar 2011 02:39:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/03/11 17:34), Saul Wold wrote:
> On 03/11/2011 05:15 PM, Saul Wold wrote:
> >From: Saul Wold<sgw@linux.intel.com>
> >
> >During a world build I was getting a perl version mismatch between
> >the perl-native and the host perl. This change ensures that
> >perl-native is used always.
> >
> 
> Never mind this patch, Saul's brain is not functioning well today,
> I completely missed the comment!

I discarded my reply :)
> 
> Back to the drawing board on why the miss-match is occuring in
> Config.pm then.

somewhere there is /usr/bin/perl referred may be a cross recipe ?

> 
> Sau!
> >Pull URL: git://git.pokylinux.org/poky-contrib.git
> >   Branch: sgw/gnu-config
> >   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgw/gnu-config
> >
> >Thanks,
> >     Saul Wold<sgw@linux.intel.com>
> >---
> >
> >
> >Saul Wold (1):
> >   gnu-config: Ensure that we use perl-native to avoid version
> >     mis-matches
> >
> >  .../gnu-config/gnu-config_20080123.bb              |    4 +---
> >  1 files changed, 1 insertions(+), 3 deletions(-)
> >
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky

-- 
-Khem


