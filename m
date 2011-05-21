Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QNw5h-0002nm-Gi
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 02:00:17 +0200
Received: by pwj9 with SMTP id 9so2262468pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 16:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=5d1adNiWfYyVMlaSfP9Nz/AxTgTgr1uE9YIl+DAPJyg=;
	b=IWd7bcE+s/Ix/MOgT9Y1MhnaTW+vqolOUHHM/7PgHd46jUiA4xkMVlnlxDpYAsAu3n
	PzCU/NI1yGMgjzpBrT2siiKavnbrXkxe1y2udZaOnCxcmO0HscdetaPsOi5uyEKAd14e
	BXGTmCveEKH4ND3sAvZq1wFBT3AsuzslIuZWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sBeA06z4QJNXtztTYxwtkhnZBFSTLOZ9m8SFTZS1Blk8/LHXksLE/jpNLoFFrvZ+kt
	7caXp3B5S9xBz3/2EbqzdMsirE+o4rgqXQc0FSSuQT++edmnx8O2MBps/tbFC5KIWmFy
	KdwL5CcJHg3a0EzHmwPFN9kGijK+CMmLcMex0=
MIME-Version: 1.0
Received: by 10.68.25.166 with SMTP id d6mr1542308pbg.136.1306022236955; Sat,
	21 May 2011 16:57:16 -0700 (PDT)
Received: by 10.68.59.9 with HTTP; Sat, 21 May 2011 16:57:16 -0700 (PDT)
In-Reply-To: <674a00cdafa9b97a66d1139ce2279c3b8f660299.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<674a00cdafa9b97a66d1139ce2279c3b8f660299.1305580484.git.sgw@linux.intel.com>
Date: Sun, 22 May 2011 01:57:16 +0200
Message-ID: <BANLkTimLuL1MRqK_xx+bsjrQZf0MDJO=1w@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] perl-native: create_wrapper on perl${PV} too
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
X-List-Received-Date: Sun, 22 May 2011 00:00:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 16, 2011 at 11:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Tom Rini <tom_rini@mentor.com>
>
> perl${PV} becomes hostperl when building for the target so we need a wrap=
per
> on that too.
>
> This is 1e255fbd296e95ff178d66c4a1fe4875a988d7e1 in OE.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =A0meta/recipes-devtools/perl/perl-native_5.12.3.bb | =A0 =A01 +
> =A0 =A0 =A0 =A0create_wrapper ${D}${bindir}/perl PERL5LIB=3D'$PERL5LIB:${=
STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
> + =A0 =A0 =A0 create_wrapper ${D}${bindir}/perl${PV} PERL5LIB=3D'$PERL5LI=
B:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
> =A0}
> --

Heads up:

Andreas Mueller today reported that this commit breaks his perl build.

See http://article.gmane.org/gmane.comp.handhelds.openembedded/45640

Regards,
--=20
Leon


