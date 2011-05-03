Received: from mail-px0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHJkE-0001eZ-M8
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 19:50:46 +0200
Received: by pxi9 with SMTP id 9so184343pxi.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lFgWnS2u6bBn9sdfghJ6gPG/TEhjYk2GXC97/QR7I4c=;
	b=hlM3mhBPmp2p0kUsacVkH3qGJHFukon6Rc6arN1pcJgodBJXSRwt8F+kv5WyHn0ZwV
	8HPvTFy8TQplPvLNDx6FpnA3tz1s4dvasvCj2RnCgqtF/IrNCyE//k1/BsnORViGKIYx
	7EsPeG+p1Tt4q9WvEwd5OZSphwUd7U9TYt28M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MlbdRfn/9nlc/Sn6Uu4keWmIZrzCpSmOGIeS+y+4xmuMgQZYGz8jb5aKWadmII3GPD
	UbKiMlyMOm3yk9Baer6s90eA7h3913T81gWiJV6Y18NHO8xNX2c60LkuO6JK7TfdvAmA
	BA8vo3XEQRS1K6C4jF0ZjwpNlj4q2BXBHv2AA=
Received: by 10.68.27.37 with SMTP id q5mr146845pbg.257.1304444887382;
	Tue, 03 May 2011 10:48:07 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j2sm169536pbg.60.2011.05.03.10.48.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 10:48:05 -0700 (PDT)
Date: Tue, 3 May 2011 10:47:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110503174732.GA5436@sakrah.homelinux.org>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
	<4DBF4F26.90404@intel.com>
	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
	<4DC03C43.8080507@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4DC03C43.8080507@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Tue, 03 May 2011 17:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/05/11 12:32), Mark Hatle wrote:
> >> I can't figure out one case that nfs root works and ext3 image doesn't...
> 
> Good question, I don't know.  In my experience both NFS and ext3 root crashes
> with the nvidia drivers.  I have a patch to the version of QEMU I use that
> disables all of GL to work around the problem.

just pass "<-nographic>" to the script

> 
> I believe it's mhatle/qemu on poky-contrib... but it hasn't been updated for a
> while now.


