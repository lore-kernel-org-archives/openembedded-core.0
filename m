Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE0E72369
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:40:54 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id l13so3383614iga.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=qvNmCOtMvDBreGddr8IWYeyETF8SmFI/HnleOWhz9So=;
	b=Zg8C1zpp/uMhKAUboj2kreIPbK5GkxK6AuZnVRzx5f4W10xht7hGzyCJqv0kWvvIzq
	Ap86dgORWVeNnPgs3suqGeNpjoQOIRe8IJNN1ROrJEyDaPLZMJd6uxGfXktFKO1THMHC
	aYNRc87A1YQ8e6xCJ/mgFwMwev0ULCir5XGyC9yjeUZ7vaBtnvKNkgGjJ8+F27Qn2FC6
	PMJxJkgfnylna7OJrTo4CLaSpRxLUmop+2BsqqjUjnWrnuPZu2QDOxb712H4djFl4SHQ
	L1EjWEz3j+zfoG76PVkOI5duna3Ou17jZ+MHfrSbwhX5fplYSXuQ6AVlDSnZHVIxxI1E
	J7tg==
X-Gm-Message-State: ALoCoQmLPOxhEJ7Yxa0gXTiKsIi81AZ63nrxT1Kp4gdtn54sXY4B9pwNl3VXRVm1edMib1eR4RnM
MIME-Version: 1.0
X-Received: by 10.42.169.197 with SMTP id c5mr21022344icz.72.1418499655266;
	Sat, 13 Dec 2014 11:40:55 -0800 (PST)
Received: by 10.107.47.41 with HTTP; Sat, 13 Dec 2014 11:40:55 -0800 (PST)
In-Reply-To: <1418499465-1801-2-git-send-email-mgloff@emacinc.com>
References: <1418499465-1801-1-git-send-email-mgloff@emacinc.com>
	<1418499465-1801-2-git-send-email-mgloff@emacinc.com>
Date: Sat, 13 Dec 2014 13:40:55 -0600
Message-ID: <CALXw4G6wpe5SnHN6ryb4aght3wyvu-kZ+VvP4LLG0Oy+qd1KnA@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] volatiles: Link /media to /run/media
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Dec 2014 19:40:59 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8a5c110a71050a1e30b8

--90e6ba6e8a5c110a71050a1e30b8
Content-Type: text/plain; charset=UTF-8

Backport to dizzy also please since the automount change is already in.

Michael Gloff

On Sat, Dec 13, 2014 at 1:37 PM, Michael Gloff <mgloff@emacinc.com> wrote:
>
> Since the change in automout.sh to mount devices to /run/media,
> we create the /run/media directory on startup and link /media to it.
>
> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> ---
>  meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index 1fc5816..e6f0695 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp
>  d root root 0755 /var/lock/subsys none
>  f root root 0664 /var/log/wtmp none
>  f root root 0664 /var/run/utmp none
> -l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>  f root root 0644 /var/run/resolv.conf none
> +l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>  d root root 1777 /run/media none
>  l root root 1777 /media /run/media
> --
> 2.1.2.374.g63a4513
>
>

--90e6ba6e8a5c110a71050a1e30b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Backport to dizzy also please since the automount cha=
nge is already in.<br><br></div>Michael Gloff<br></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Sat, Dec 13, 2014 at 1:37 PM, Mich=
ael Gloff <span dir=3D"ltr">&lt;<a href=3D"mailto:mgloff@emacinc.com" targe=
t=3D"_blank">mgloff@emacinc.com</a>&gt;</span> wrote:<blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Since the change in automout.sh to mount devices to /run/media,<br=
>
we create the /run/media directory on startup and link /media to it.<br>
<br>
Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@emacinc.com">mglo=
ff@emacinc.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta=
/recipes-core/initscripts/initscripts-1.0/volatiles<br>
index 1fc5816..e6f0695 100644<br>
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
@@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp<br>
=C2=A0d root root 0755 /var/lock/subsys none<br>
=C2=A0f root root 0664 /var/log/wtmp none<br>
=C2=A0f root root 0664 /var/run/utmp none<br>
-l root root 0644 /etc/resolv.conf /var/run/resolv.conf<br>
=C2=A0f root root 0644 /var/run/resolv.conf none<br>
+l root root 0644 /etc/resolv.conf /var/run/resolv.conf<br>
=C2=A0d root root 1777 /run/media none<br>
=C2=A0l root root 1777 /media /run/media<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.2.374.g63a4513<br>
<br>
</font></span></blockquote></div></div>

--90e6ba6e8a5c110a71050a1e30b8--
