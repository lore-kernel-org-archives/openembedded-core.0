Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuuLS-0006b1-Tq
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 00:21:07 +0100
Received: by daln34 with SMTP id n34so3208760dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 15:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A3cORDBW9lD548s18OMqsD1gC9hHMjguqvlBA+5i5ss=;
	b=npBFVyvDLZVFdKsYAV8ShJeSLDmYMtVKUDeSHzYBf/VXNW0AzIlSo+oiePXntAk0Bh
	fQTpjV2BT3eXuQEhdADhJr73ud6AaAYVjjLUh5EWltMNeFudocJ+LYqeL6M+XyQ6R8qH
	KXpMLZpIALplq7e0Z+LyZeabC5zj7AxfMD3nQ=
Received: by 10.68.220.162 with SMTP id px2mr61711372pbc.76.1328656383563;
	Tue, 07 Feb 2012 15:13:03 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id t10sm257663pbb.18.2012.02.07.15.13.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 15:13:02 -0800 (PST)
Date: Tue, 7 Feb 2012 15:12:45 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120207231245.GA13160@sakrah.homelinux.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F314A73.8070406@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 07 Feb 2012 23:21:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/02/12 07:59), Saul Wold wrote:
> On 02/07/2012 07:31 AM, Khem Raj wrote:
> >On Tue, Feb 7, 2012 at 12:08 AM, Saul Wold<sgw@linux.intel.com>  wrote:
> >>| /bin/grep: /intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la:
> >>No such file or directory
> >
> >thanks ok I did not catch it with sato image build. which package is
> >failing with this
> >error.
> >
> pixman, gconf, polkit are the 3 I saw doing a world build.

I havent been able to reproduce it with eglibc I tried bitbake gconf
pixman polkit it all liked well. Might be my machine is just nice to me
but that said when I get to the culprit it mostly will be the package
who is using .la in weird way since zlib already ships a .pc file it
should have used that one instead

> 
> Sau!

-- 
-Khem


