Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Qp6pa-0007QW-8D
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:55:58 +0200
Received: by yxi19 with SMTP id 19so1439961yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 15:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YbYrt0iKTXP9ut9SzwjpDKJlTorpIoDxbREJSfL0D0k=;
	b=dp80dnxJpmWtznQE8DkDvcaylrHgoro4y+Xo1Iw2qgpA2jGbG+H9jWtFhZ7/rzxsMO
	04Wo6mLqvwXMVAHzdIJkOQuwQwUJqnmYNhbj0PsXxQXh4JQg1YzqktSQAHGlrUTAvBvP
	pUsH2ALwIwrWF6aUOaI4HXDuLE8ERN181tN/U=
MIME-Version: 1.0
Received: by 10.42.168.66 with SMTP id v2mr1252448icy.104.1312498293581; Thu,
	04 Aug 2011 15:51:33 -0700 (PDT)
Received: by 10.42.228.73 with HTTP; Thu, 4 Aug 2011 15:51:33 -0700 (PDT)
In-Reply-To: <e1221aaa052c50fad49df099d2c2979f3664e4ba.1312469790.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<e1221aaa052c50fad49df099d2c2979f3664e4ba.1312469790.git.nitin.a.kamble@intel.com>
Date: Thu, 4 Aug 2011 15:51:33 -0700
Message-ID: <CA+M6bXnei8wro6jEV9b2N0H5mKxpFQEaktSPG944Qua_XeXwkg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] siteinfo.bbclass: add entries for new x86_64 ABI targets
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
X-List-Received-Date: Thu, 04 Aug 2011 22:55:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 8:01 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =A0meta/classes/siteinfo.bbclass | =A0 14 +++++++++++++-
> =A01 files changed, 13 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclas=
s
> index 9dacd58..daa7946 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -42,12 +42,15 @@ def siteinfo_data(d):
> =A0 =A0 =A0 =A0 "sh4": "endian-little bit-32 sh-common",
> =A0 =A0 =A0 =A0 "sparc": "endian-big bit-32",
> =A0 =A0 =A0 =A0 "viac3": "endian-little bit-32 ix86-common",
> - =A0 =A0 =A0 =A0"x86_64": "endian-little bit-64",
> + =A0 =A0 =A0 =A0"x86_64": "endian-little", # bitinfo specified in target=
info
> =A0 =A0 }
> =A0 =A0 osinfo =3D {
> =A0 =A0 =A0 =A0 "darwin": "common-darwin",
> =A0 =A0 =A0 =A0 "darwin9": "common-darwin",
> =A0 =A0 =A0 =A0 "linux": "common-linux common-glibc",
> + =A0 =A0 =A0 =A0"linux-gnu32": "common-linux common-glibc",
> + =A0 =A0 =A0 =A0"linux-gnux32": "common-linux common-glibc",
> + =A0 =A0 =A0 =A0"linux-gnu64": "common-linux common-glibc",
> =A0 =A0 =A0 =A0 "linux-gnueabi": "common-linux common-glibc",
> =A0 =A0 =A0 =A0 "linux-gnuspe": "common-linux common-glibc",
> =A0 =A0 =A0 =A0 "linux-uclibc": "common-linux common-uclibc",
> @@ -68,6 +71,15 @@ def siteinfo_data(d):
> =A0 =A0 =A0 =A0 "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux=
 powerpc-linux-uclibc",
> =A0 =A0 =A0 =A0 "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux"=
,
> =A0 =A0 =A0 =A0 "powerpc64-linux": "powerpc-linux",
> + =A0 =A0 =A0 =A0"x86_64-cygwin": "bit-64",
> + =A0 =A0 =A0 =A0"x86_64-darvin": "bit-64",
> + =A0 =A0 =A0 =A0"x86_64-darvin9": "bit-64",

You still haven't fixed this typo. It's darWin not darVin.

--=20
Tom


