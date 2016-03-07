Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 014957318D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 16:16:26 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id n190so136696324iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 08:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sBHwuX5ngvfO58t0x64Od04HrjWp0Pak5YzFvnmVZlk=;
	b=eddxvU5z26MxNWopDf5oTp2zxdkVkwqkJsJFaPMnTIdCCdAtrS66LfPh0L8Whx8LPx
	b6ajphg16jFG/mM1969QdTtIFzYTHTd7QIqTqnBY3s53M8ApmMEG3S8edxFgw/LiZEOw
	ENJy5U7apcA11S3NbOeuELFOMg5UEpkTFFm4nfzWGYRTC8El2l+HmZSUyQO7cALS+FcZ
	QBml3bF7TnOQrMEESyNW+gvueQlWU2vgVVrisHiFJv1Wdc9P1dFnsoNTgj6srpYwToxH
	o+LHu96dsP5iw/egSkT4alsHbXGfp95i+4nr5Dzui2PD4DqvShmgCLc5lyU9mF3eNxLf
	Ql3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sBHwuX5ngvfO58t0x64Od04HrjWp0Pak5YzFvnmVZlk=;
	b=b4LmNRUsvZZYlQ4WOCfYs9TL8y9mYcTJQrjy7pBPY7xilzdal7FkHjF/x9oJoIxcVK
	RyOLbQIcGELyrxvMSBqz78fmo/EuOER4pQxcyB9ggxwN3d3IuOiuTBGKN9M4yAIhE3Xf
	2PtlqfH6fpwNBKm11/8XKA+ZJgvpRZMWpt3cIZGtS6c9yOrg5MOUl3OqPHHRPcJlojxO
	c3oguAcCvIEiKSaWxz0hUfAOsGGZswJfXJx2SrNVQCsTq79q5zPk/HbAT+VQYJnVmIOQ
	wUTAo9SAB7TNqQ7oYvNzVqBm9S4NWj3xWGwTJRHV8p299onLV875qI4N1r0DGBZYkMNZ
	oIJA==
X-Gm-Message-State: AD7BkJJ73UbCJibbhoB6BOiCVZREYgmwE0y93VteAFiqSM8qD4SqRXpteUdDwhfG52Ge9hiAE9BNHZu2tRwgC4MM
X-Received: by 10.107.137.92 with SMTP id l89mr24376015iod.133.1457367387371; 
	Mon, 07 Mar 2016 08:16:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 08:16:08 -0800 (PST)
In-Reply-To: <00ce01d1788a$58d10b90$0a7322b0$@neuf.fr>
References: <00ce01d1788a$58d10b90$0a7322b0$@neuf.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 16:16:08 +0000
Message-ID: <CAJTo0LYKDrDuQZTcfR2Smm5q9+PM0SQZ0aQvMLJ-6rpnQ8MtHg@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] systemd: binfmt should be added to SYSTEMD_PACKAGES only if binfmt is enabled
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
X-List-Received-Date: Mon, 07 Mar 2016 16:16:31 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb46e9426052d77c9ea

--001a113ebdb46e9426052d77c9ea
Content-Type: text/plain; charset=UTF-8

Your mailer (Outlook, by the look of it) is corrupting patches (wraps lines
when they shouldn't be wrapped), in the future please don't send patches by
pasting them into an email but use git-send-email if you can, or attach the
patch if you can't.  For a one-liner I could fix up the patch by hand so
you don't need to re-send this one.

Ross

On 7 March 2016 at 15:59, Herve Jourdain <herve.jourdain@neuf.fr> wrote:

> V2
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/recipes-core/systemd/systemd_229.bb | 2 ++--
>  1 file changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_229.bb
> b/meta/recipes-core/systemd/systemd_229.bb
> index 16af0ac..a537dd3 100644
> --- a/meta/recipes-core/systemd/systemd_229.bb
> +++ b/meta/recipes-core/systemd/systemd_229.bb
> @@ -298,7 +298,7 @@ PACKAGES =+ "\
>      ${PN}-extra-utils \
>  "
>
> -SYSTEMD_PACKAGES = "${PN}-binfmt"
> +SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
> '${PN}-binfmt', '', d)}"
>  SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
>
>  USERADD_PACKAGES = "${PN}"
> --
> 1.9.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ebdb46e9426052d77c9ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Your mailer (Outlook, by the look of it) is corrupting pat=
ches (wraps lines when they shouldn&#39;t be wrapped), in the future please=
 don&#39;t send patches by pasting them into an email but use git-send-emai=
l if you can, or attach the patch if you can&#39;t.=C2=A0 For a one-liner I=
 could fix up the patch by hand so you don&#39;t need to re-send this one.<=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 7 March 2016 at 15:59, Herve Jourdain <span dir=3D"ltr=
">&lt;<a href=3D"mailto:herve.jourdain@neuf.fr" target=3D"_blank">herve.jou=
rdain@neuf.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">V2<br=
>
Signed-off-by: Herve Jourdain &lt;<a href=3D"mailto:herve.jourdain@neuf.fr"=
>herve.jourdain@neuf.fr</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_229.bb</a> | 2 ++--<br>
=C2=A01 file changed, 1 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_229.bb</a><br>
b/meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" rel=3D"norefe=
rrer" target=3D"_blank">systemd_229.bb</a><br>
index 16af0ac..a537dd3 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_229.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_229.bb</a><br>
@@ -298,7 +298,7 @@ PACKAGES =3D+ &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-extra-utils \<br>
=C2=A0&quot;<br>
<br>
-SYSTEMD_PACKAGES =3D &quot;${PN}-binfmt&quot;<br>
+SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;binfmt&#39;,<br>
&#39;${PN}-binfmt&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-binfmt =3D &quot;systemd-binfmt.service&quot;<b=
r>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
--<br>
1.9.1<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a113ebdb46e9426052d77c9ea--
