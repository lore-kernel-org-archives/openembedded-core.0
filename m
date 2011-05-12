Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKK8z-000899-AF
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 02:52:45 +0200
Received: by bwz5 with SMTP id 5so1002016bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Qb3fOJm8iKBac7XJa5krJEZduUdgseXxaKs00JaW4tc=;
	b=RpAAiBpGjzyjVqFT3Mgnmh0MI78YlRC+FVarN7IEu9SvxkcW54odMOUeVWasUCq7kz
	EyEK1gYHf9VDh4TaGWpVJ0U+Qkt2T+hcWrFf6rYvq90Qc9FHngaVgJB+CkgQDO+p+onk
	/aXWE5ym2cjJm3SuybTRr+NQdZahypcqMjBRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=WgDIpUUsQ7pAo1coTm2AB0ChwBdnkuIfjAydB2o89xxSmP4ddPlB0pcUbPiOWYf1ck
	8POadV/T3ML8eQAH6kSBMoOKzQVEeUbC1x75gINVj3H8BLK0mVRsru0r1WZW1jolOFas
	QkCP4s65qPguWi48oW1coIm+dCZx2J5ZyciX8=
MIME-Version: 1.0
Received: by 10.205.33.194 with SMTP id sp2mr1872035bkb.27.1305161395514; Wed,
	11 May 2011 17:49:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Wed, 11 May 2011 17:49:55 -0700 (PDT)
In-Reply-To: <4DCAB609.8030601@linux.intel.com>
References: <4DCAB609.8030601@linux.intel.com>
Date: Wed, 11 May 2011 21:49:55 -0300
X-Google-Sender-Auth: OCBLjcjp6HvMDYW7m371ghpF484
Message-ID: <BANLkTin57YObLPt7fVrutB0zCLANqe_j2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Thu, 12 May 2011 00:52:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 13:15, Darren Hart <dvhart@linux.intel.com> wrote:
> 2) create-pull-request needs to facilitate the use of multiple
> =A0 repositories (Tom Rini)
>
> =A0 Some folks find gitorious or github work best for their use. It is
> =A0 also reasonable to want to use this script with independent layers.
> =A0 Tom proposed a -l option to specify the PULL_URL leaving some
> =A0 boiler-plate text in the cover-letter for the user to populate.
>
> =A0 This dovetails with something I've been considering. Rather than
> =A0 duplicate the generation of a pull request cover letter, I'd like to
> =A0 see us re-use the output of 'git request-pull'. This has the added
> =A0 benefit of sanity checking the URL and commits. It does however
> =A0 remove the concept of the BROWSE_URL. We could add the BROWSE_URL
> =A0 back for recognized locations (git.yoctoproject.org, gitorious, and
> =A0 github I believe).
>
> =A0 Some have expressed a desire for the URL to be automatically
> =A0 discoverable. We could try and extract this information from the
> =A0 current branch and a remote of a specific name, with some URL
> =A0 rewrites to convert ssh access to generic git access. Unfortunately,
> =A0 this approach breaks under several conditions. I would prefer that
> =A0 these scripts not be tied to any particular naming conventions for
> =A0 the git branches or remotes.
>
> =A0 I propose we go with something very similar to Tom's -l PULL_URL
> =A0 proposal and replace the cover letter generation with the output of
> =A0 'git request-pull'. The PULL_URL should also be able to be specified
> =A0 via an environment variable. Now that we are sending patches for
> =A0 review and not just the pull request itself, I feel we can drop the
> =A0 BROWSE_URL.

I'd prefer to have it stored into git config backend and don't need to
retype it for every call.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


