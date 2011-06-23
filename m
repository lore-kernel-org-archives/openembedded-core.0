Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZpiL-0005Yw-S1
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 21:37:22 +0200
Received: by pwi1 with SMTP id 1so1533313pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 12:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=UirJkJJ67Wx4hN//gQOHx4wvFSzx+P8v5ggHTMldIpw=;
	b=pO4M9xnibZ/QtZj+8CmyrgoMpehThrx0yA7gOrpgXug51zD1DsPb0TNIF/hKD2o4dn
	UBRFlN4yOp/7brG0t35LNffT7bahS/4hCWrt0LBkPPzE5HdWRUz+m6ftiquz5Vhh3Hve
	Diyz02PDzFOSuFKYy07xUnDSdTNkOAueaS8mE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FtOHVlS+KLNd5JkXm6rSMsohQ9BCD3dfInsY+QMibgiPEURLsr6WjpoK6x9pFa4w+r
	p2HHlp5oJEXvbcVhD0SWXahERDPwc2mwYG7/Ex5FlSVZoLxjhAQhlk2u3f/wItK+yqj2
	khPcGrrR88oWmp23UZtI5+BbcZKZ8rciOeh7c=
Received: by 10.68.39.72 with SMTP id n8mr1479291pbk.93.1308857625107; Thu, 23
	Jun 2011 12:33:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Thu, 23 Jun 2011 12:33:15 -0700 (PDT)
In-Reply-To: <BC4DC62A-53A4-4496-AC31-EE777658237E@dominion.thruhere.net>
References: <cover.1308852888.git.mark.hatle@windriver.com>
	<9ed3e2720577e745d39712ed901b39bfe1aed6c2.1308852888.git.mark.hatle@windriver.com>
	<BC4DC62A-53A4-4496-AC31-EE777658237E@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jun 2011 12:33:15 -0700
Message-ID: <BANLkTimRjB6r7X-7tS2MM9Vgp9cZ-yC0Eg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] libtirpc: Fix owner/group of /etc/netconfig
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
X-List-Received-Date: Thu, 23 Jun 2011 19:37:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2011 at 11:10 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 23 jun 2011, om 20:19 heeft Mark Hatle het volgende geschreven:
>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>> meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb | =C2=A0 =C2=A06 +++++-
>
> Not related to this patch, but 0.2.2 is out and we'll need some more upda=
tes
> for (e)glibc 2.14
>

yes I already have 0.2.2 lined up.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


