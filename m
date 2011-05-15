Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLiyA-0006uK-VY
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 23:35:24 +0200
Received: by pxi6 with SMTP id 6so3049907pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 14:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tvBGT7Id5NQ9tJyvyxiFVUA6soxoKgf7u3Vj/jRwnvs=;
	b=u6ibtCDofGupnJemM1H/aGiEHoDIePe3V+nyhp2VtFKpFk6jbF0D3O1vt6pPbR9mVy
	CJE+AdvlMtofw+1Wpi7ZkEh1OM4+bN+hmMjv7Gls/WsylBAbVcXpb9fBaPcaLWm/0Dhq
	ZIjuIxRfDp221F8x5Mabz8orECs7xQrdvqQJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sIhUEsKUq0njDyrjjFR3wIlU8uIpUoGyeXqdZa3kVb4wLnKkZnRC2ycIXURBJ1DlNM
	qFY2K6YVlw22DzLlIYIb66ByXem+W2x+t9ItlHuVMDYAyLY9uxigsweIhC9tx8y0/9W5
	aFtNBbGSyHJSOXCx398NUTxnhiWJCu0LfjzqM=
Received: by 10.68.51.201 with SMTP id m9mr6157379pbo.135.1305495150355;
	Sun, 15 May 2011 14:32:30 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y5sm2841525pbq.57.2011.05.15.14.32.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 14:32:29 -0700 (PDT)
Date: Sun, 15 May 2011 14:31:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110515213128.GA24670@sakrah.homelinux.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
	<1305107117.30391.325.camel@rex>
	<D098457C-E05A-40F8-A61C-36604A51A2E1@dominion.thruhere.net>
	<1305111264.30391.338.camel@rex>
	<7FB783C6-3AD6-45DD-A957-40E4AA393F58@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <7FB783C6-3AD6-45DD-A957-40E4AA393F58@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Sun, 15 May 2011 21:35:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/05/11 13:45), Koen Kooi wrote:
> 
> Op 11 mei 2011, om 12:54 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-05-11 at 12:13 +0200, Koen Kooi wrote:
> >> Op 11 mei 2011, om 11:45 heeft Richard Purdie het volgende geschreven:
> >>> For the uclibc bits, I'm proposing
> >>> to add:
> >>> 
> >>> +DEPLOY_DIR_append = "-uclibc"
> >>> +STAGING_DIR_TARGET_append = "-uclibc"
> >>> +STAGING_DIR_HOST_append = "-uclibc"
> >>> +SSTATE_MANIFESTS_append = "-uclibc"
> >>> 
> >>> to tclibc-uclibc.inc.
> >> 
> >> Can we use _append_libc-uclibc = "uclibc" or even plain ${TCLIBC} in a
> >> generic include file? That would be a lot more readable and fix glibc
> >> vs eglibc.
> > 
> > Changing uclibc around is ok as its not something that has worked well
> > in with OE-Core for a while. What I'm trying to avoid is having to bump
> > all the versions of the sstate files, the sysroot layout and associated
> > version numbers which is what would have to happen if we change the
> > eglibc layout :(.
> > 
> > Obviously, if angstrom switches layout its pain for you though so I
> > suspect someone loses with this either way :/.
> 
> I would think consistency is best, so either set always append TCLIBC or never. This isn't a lot more pain than the '-' to '_' change in machine names a while ago. And that even had runtime pains!
> 

I would agree we should always append TCLIBC

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


