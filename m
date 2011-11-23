Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTKfu-0002UH-NW
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 22:48:14 +0100
Received: by ywb20 with SMTP id 20so1748708ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 13:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bhWaX9/qMZV0tfmqDM1kR8eJ3isoZKW7vbX9P9Y+6sM=;
	b=DbJMOuWy/EyO7XHjjmJUmol7nJlVJ2ikrBxTacijzFkSdQLxCfRqF3+z4lIrHITPSp
	J1qtUWoOJNDS/YEkjRUg7f9wbIE95eW5LDX8l9UpcbLJ3bIxMpoJUu2nILL8P1ouHISU
	lI9ykLcubB/HqXNVUA1b/uYNEh6oAG2mCkQd0=
Received: by 10.152.104.236 with SMTP id gh12mr15993989lab.49.1322084501093;
	Wed, 23 Nov 2011 13:41:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 13:41:10 -0800 (PST)
In-Reply-To: <e963c0ceb70813edb2eb8527506acac3549155ec.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
	<e963c0ceb70813edb2eb8527506acac3549155ec.1321244755.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 13:41:10 -0800
Message-ID: <CAMKF1sprogbrZzTT0mZQvT2BjEp9U-osSydR+RjxFLi=de2LSA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 18/21] gnu-config: update to git HEAD
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
X-List-Received-Date: Wed, 23 Nov 2011 21:48:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2011 at 8:28 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Licence has update timestamp and Copyright year.
> This change needs a coresponding change to ASSUME_PROVIDED
> to add git-native
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =C2=A0.../gnu-config/config-guess-uclibc.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0145 +++++++++-----------
> =C2=A0.../{gnu-config_20080123.bb =3D> gnu-config_git.bb} =C2=A0| =C2=A0 =
15 +-
> =C2=A02 files changed, 75 insertions(+), 85 deletions(-)
> =C2=A0rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb =3D=
> gnu-config_git.bb} (73%)
>
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-ucl=
ibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc=
.patch
> index f862c83..dc15d91 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.pat=
ch
> +++ b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.pat=
ch
> @@ -4,12 +4,14 @@ Patch courtesy gentoo-portage/sys-devel/gnuconfig/files=
/automake-1.8.5-config-gu
>
> =C2=A0updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
> =C2=A0updated to 20080123 by Nitin A Kamble (by hand)
> +updated to 20111001 by Saul Wold (by hand)
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

the OE patch is based of an old gentoo patch. I would suggest to look
into latest version of this patch from gentoo here
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-devel/gnuconfig=
/files/99999999/0001-add-uClibc-guess-support.patch?revision=3D1.6&view=3Dm=
arkup


