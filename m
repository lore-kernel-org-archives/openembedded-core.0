Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRzek-0007XH-OS
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:42:22 +0200
Received: by wgbdr1 with SMTP id dr1so5755802wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 22:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7unYfq8StlurWlcEbKMh9fVcDZFOk4Ss9vHQGS1Q2YQ=;
	b=CSQ7kVGUeW0W/C0cFZzTGm/szM5CiBkOP2Paa3GtzrCHrLS1M3irlsAJL65siQkVKC
	h/tP8f+SGqbovvF3KDzCXRvdOdgJwkUOQNCDffIF9FAShMKNSZVHt7vnNQQJVlCrcY8j
	NRbFdKrYfRyCKBdW1o9kn2dJFLOhF3fDazfYauLNaaebVv48cnNcYhOtarW796PGcGdA
	dJHijPPwhr3ROvC3OJbRbl4/meFsRxyAws5aaGagQXswsSSuYzfX/1tgftcbgCCsQQoa
	Te9ioG4LWWQzm8AWzpbq/mWEH0Wbb3voBQfAYIYvTMHlfRMFGdl4wog0SMHxSyj38GVg
	RW9w==
Received: by 10.216.142.226 with SMTP id i76mr4075049wej.28.1336541514277;
	Tue, 08 May 2012 22:31:54 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm34107046wib.6.2012.05.08.22.31.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 22:31:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
Date: Wed, 9 May 2012 07:31:52 +0200
Message-Id: <73C72AB1-C5B4-40D1-BAA3-C349F4957C42@dominion.thruhere.net>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
	<339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmwnJd+LvE0YxuRxh2KXjuiE158mtVXHpU01lBSF0fpr8dzArR7HfmISsZUIbyAjps4uWit
Subject: Re: [PATCH 2/3] kmod: Update to .8 release
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
X-List-Received-Date: Wed, 09 May 2012 05:43:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 00:53 heeft Khem Raj het volgende geschreven:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-kernel/kmod/kmod.inc |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/kmod/kmod.inc =
b/meta/recipes-kernel/kmod/kmod.inc
> index 681e52b..70d376e 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
> LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
> LICENSE_libkmod =3D "LGPL-2.1+"
> SECTION =3D "base"
> -PV =3D "7+git${SRCREV}"
> +PV =3D "8+git${SRCREV}"

Drop the +git$SRCREV, it's a release.=


