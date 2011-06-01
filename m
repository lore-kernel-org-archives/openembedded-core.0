Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <640e9920@gmail.com>) id 1QRaNq-0002mM-5w
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 03:38:06 +0200
Received: by pzk36 with SMTP id 36so2434295pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PRACDW0zDmbzsmuNuFe6pF9pfgWxwSzC2cD8/0Ncw2o=;
	b=nh6MRigoPqCxdP8kQhw7a79Lr0Ak5wIWepb9GyoGp9BdWxKxuV8sFSJCxxCSKe9wux
	AAsLqSlVlaXcI0XYshEfOHYvy3h+AkFh4XgB4YNOKWh7U6QGZ//Q/6N0d53QArxGr9ZI
	5/zHwHOD3lqDr7bUdzni6beGF9IHEcQVXsz+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:subject:message-id:reply-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=g26hwseAxI6yhRkaaiUfPZJA3PVIOrTOybD2ke615C43YzPtpsmF4kTpe4CVWHtsTT
	4GP2EIACg/UwuhW/gjj7RyzF+Z331t7qG3LcY9ZUDam+pxSzt/8f5Hc/nnQL0piumQ0H
	PZYEDIGTTuZoPLhac0kFz+Njchxa7rkWVgk/g=
Received: by 10.68.31.197 with SMTP id c5mr2805640pbi.247.1306892095278;
	Tue, 31 May 2011 18:34:55 -0700 (PDT)
Received: from localhost (c-24-22-115-171.hsd1.or.comcast.net [24.22.115.171])
	by mx.google.com with ESMTPS id y2sm539780pbg.56.2011.05.31.18.34.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 18:34:54 -0700 (PDT)
Sender: mgross <640e9920@gmail.com>
Date: Tue, 31 May 2011 18:34:52 -0700
From: mark gross <markgross@thegnar.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110601013452.GA12171@gvim.org>
References: <4DE56B0D.4020209@intel.com>
MIME-Version: 1.0
In-Reply-To: <4DE56B0D.4020209@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Tell me your build error message annoyances!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: markgross@thegnar.org,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 01 Jun 2011 01:38:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 31, 2011 at 03:26:21PM -0700, Scott Garman wrote:
> Hey folks,
> 
> I'd like to collect some feedback on error messages while building
> that you find confusing/annoying/unhelpful. I'm going to be working
> on trying to improve the situation and would like to hear from you
> about what could be more helpful.


You can make SkipPackage print out what recipes is getting skipped!  I
blew a bunch of time trying to build qemu64 minimal target before I
found that you need the meta-intel layer such that grub 2 would be
provided.  Recipes-bsp has grub 0.97 but, it raises a SkipPackage
exception if the target is not 32 bit.

bitbake -DDD grub would report NoProvider: grub  Yet show the
grub_0.97.bb was indeed getting processed.

--mark



> 
> I'm starting to track some of these situations with the following bugs:
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=542
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1127
> 
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1128
> 
> I can't promise to fix everything you come up with, but I'd like to
> try to make a dent in some of these issues and improve the usability
> of our build system.
> 
> Thanks,
> 
> Scott
> 
> -- 
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


