Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaYNK-0002fT-Gy
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 20:50:54 +0100
Received: by lami14 with SMTP id i14so18921lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 11:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=mDkohJUmIc+DAX92SDOBAkYgflbA4aYpArrXvtA50bY=;
	b=CqSzL4AG9iCZjF//TtsSUvwtxVvawDtT0X/5FXka7o21q1jt2hQLZs9o4SEVtKBxC/
	AO/IunBHroM7oXkhMwngGt/WCRL/wLYhyyL6IsuiFJRaeo7HnmcMUdyY5XU1k8BeGG6/
	JvqSJOXud5OXhh+0j+f0YcDRSweLUOlE5wDe8=
Received: by 10.152.130.232 with SMTP id oh8mr5822975lab.6.1323805438439; Tue,
	13 Dec 2011 11:43:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 13 Dec 2011 11:43:27 -0800 (PST)
In-Reply-To: <1323793193-31090-7-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-7-git-send-email-dbaryshkov@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2011 11:43:27 -0800
Message-ID: <CAMKF1spnEw6tUBv+BYxSC4Wtw6Qi14gYHDRhm61n7NgNJMCmPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] ncurses: drop empty dir to remove QA warning
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
X-List-Received-Date: Tue, 13 Dec 2011 19:50:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2011 at 8:19 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> ncurses doesn't install any files in ${libdir}/terminfo, drop that direct=
ory.
>

its a symlink terminfo -> ../share/terminfo
and in my case

$ ls ../share/terminfo/
.  ..  1  2  3  4  5  6  7  8  9  a  A  b  c  d  e  E  f  g  h  i  j
k  l  L  m  M  n  N  o  p  P  q  Q  r  s  t  u  v  w  x  X  z

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> =C2=A0meta/recipes-core/ncurses/ncurses.inc | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 98f45a4..1449f34 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -171,6 +171,8 @@ do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header curses.h
> +
> + =C2=A0 =C2=A0 =C2=A0 rm ${D}${libdir}/terminfo
> =C2=A0}
>
> =C2=A0python populate_packages_prepend () {
> --
> 1.7.7.3
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


