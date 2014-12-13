Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 01478723FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:59:54 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id l13so3383515iga.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0JjjOsWNaLYKR2OklkCn77/PEkIyl45e2ft9R5WQvDg=;
	b=dw9yv1hvu1u9eRcwa2nqfQ++eO8E7p7W/Sy5nDlRAPaWuhwlniD0iVzJxRcXFKNfVj
	sfNKjCHsDWuCnmAW1IHUCeIHLYBdVppRwya9Bk1OGXT7D8vEQNgunLA/Vf9zrgLuuQSf
	gHRjU+v4lQS6qK/ikw7CoJHDCq/wbMlifp6JoL5njnAGlI4Q1r5v0emUMf6kUCMLTvMn
	Q+PKZ7qEtZ22hb1eoGfLqeXu9rV36tW2r/W4NaH2Fmmq3W0Z5ahu9aVVI58hq1J3Dxtk
	Lpy+t2cWCR53GeiZvBz4h5gXFqtWVTw/FA2ACz23OwLy2aoMuEqXoHTmt4xAW/w8j4aZ
	AUKQ==
X-Gm-Message-State: ALoCoQnq7iXgX22ctED7qMqQT8o8fpnTDz8y1Hs6ktjWggM2VKUiVLQHGxp1JwMrpr/npvQA4BJZ
MIME-Version: 1.0
X-Received: by 10.42.169.197 with SMTP id c5mr21060046icz.72.1418500792806;
	Sat, 13 Dec 2014 11:59:52 -0800 (PST)
Received: by 10.107.47.41 with HTTP; Sat, 13 Dec 2014 11:59:52 -0800 (PST)
In-Reply-To: <1418500650-2156-2-git-send-email-mgloff@emacinc.com>
References: <1418500650-2156-1-git-send-email-mgloff@emacinc.com>
	<1418500650-2156-2-git-send-email-mgloff@emacinc.com>
Date: Sat, 13 Dec 2014 13:59:52 -0600
Message-ID: <CALXw4G7HJCuk4WnRBbfiDgFPZX9oSYTujQhAkQrkyZ79n0JFSQ@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] volatiles: Create /var/run/resolv.conf before linking to it
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
X-List-Received-Date: Sat, 13 Dec 2014 19:59:59 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8a5cde733e050a1e739d

--90e6ba6e8a5cde733e050a1e739d
Content-Type: text/plain; charset=UTF-8

I really messed up the commit messages on the first one, please accept V2.

Michael Gloff

On Sat, Dec 13, 2014 at 1:57 PM, Michael Gloff <mgloff@emacinc.com> wrote:
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

--90e6ba6e8a5cde733e050a1e739d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I really messed up the commit messages on the first o=
ne, please accept V2.<br><br></div>Michael Gloff<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Sat, Dec 13, 2014 at 1:57 PM, M=
ichael Gloff <span dir=3D"ltr">&lt;<a href=3D"mailto:mgloff@emacinc.com" ta=
rget=3D"_blank">mgloff@emacinc.com</a>&gt;</span> wrote:<blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@ema=
cinc.com">mgloff@emacinc.com</a>&gt;<br>
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

--90e6ba6e8a5cde733e050a1e739d--
