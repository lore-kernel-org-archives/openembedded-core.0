Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id EAB8F788E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 14:51:24 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id u5-v6so5097090itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=noqBGClxpK+nKMDJ62I6/eQedktGjGparGG/ErDJGeo=;
	b=T9FAa6sMFhqG/gOqubVBHn62YQLHDMdJ9yHv15NEVDzOMsl4kRqUdgbjWW/nb+u81t
	xOTSqvq43arGXpdZacRUgjaXn5T+B/8Rs0yxDnfOEdR3cCUSoNwkn2v8aMvwaSNykVJB
	JcuV7oy9EqW0NMsN7+m6LL8z3oI8LrwfppPynl+IdXfx11cIU7gROSgYbrXOmOdwKC4U
	vRELmSnCSBatkAAX89oJwEpIP+wm/RZ9VzJPzadUfV9lH7dZSKuqeCRyKCvlpQ/kDe9s
	vKjOEtCL/nMRk+N8MhjAV4sMYS3x8+GSIBs5umehh9BEa87RgW4zlDnHSBHUgqITyTCi
	vYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=noqBGClxpK+nKMDJ62I6/eQedktGjGparGG/ErDJGeo=;
	b=soDdranRAKZ0fn33SMUdEDEMNoC3afLLPGG3YMlqfnywgQhl4M1kxr75Ag7LUn8GWQ
	SiVvBtI7BvWrHifva/GuPOJfnrtPfWpWMyy+olAgDMO6DnRJqQ5QFRaMJzvwhF9lvAri
	ri+yfqVWF7EMorap+kCkedkeEY/JsjtnJo92vJlcoc3/I7Ua8U67rUxfr6GPlX869fU2
	1McWbmGaTyQDJcycKxpY65uTp012D7+B1wYTlvACqOx+S1iHSXrtTlA/Te1ZJgCxGix3
	VI5xXz9MHOyNgl3Fr/XrPRTqsBUjupXbeTbT2iIk6/YvVV27Vc582kDxmnK9qbiclR5v
	qm3A==
X-Gm-Message-State: AElRT7FZSFj16yxQ0tG8Z0IUo6Cq+3JKW8JjIqqFEX57QysJ1hhw8yeG
	i53hZVx+DR4Ski3OFmYZ/MUkBjUA2hVauoUaZz9rVA==
X-Google-Smtp-Source: AG47ELtXOTIdGF+bilhKoTBEOncz0yEwqkmJUytCijpyfPKGSg7DbPzmGzfplSx+pgDBsMJEYPGdKBpYx4rhTFoKG8o=
X-Received: by 2002:a24:2490:: with SMTP id
	f138-v6mr2195534ita.131.1521039086074; 
	Wed, 14 Mar 2018 07:51:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 14 Mar 2018 07:51:05 -0700 (PDT)
In-Reply-To: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
References: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Mar 2018 14:51:05 +0000
Message-ID: <CAJTo0LYc-dw8EUdC7Zcv_o4WfcE82P9JmVjhRUgX_S4m40h6wA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: Add an RPROVIDES for alsa-lib
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
X-List-Received-Date: Wed, 14 Mar 2018 14:51:25 -0000
Content-Type: multipart/alternative; boundary="0000000000006a57f1056760823c"

--0000000000006a57f1056760823c
Content-Type: text/plain; charset="UTF-8"

This sounds very odd.  Can you give an example of this happening?

Ross

On 13 March 2018 at 03:08, Jason Wessel <jason.wessel@windriver.com> wrote:

> There are a number of other recipes outside oe-core that depend on
> alsa-lib and the rpm4 dependencies resolve sometimes to include
> alsa-lib and the packages in the other layers fail to install because
> the dependency cannot be resolved, despite the fact that libasound is
> installed.
>
> The simple is to add an RPROVIDES for alsa-lib to libasound which
> provides all the shared objects for alsa.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> index c5bf107..f7f01e8 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> @@ -25,6 +25,7 @@ FILES_alsa-server = "${bindir}/*"
>  FILES_alsa-conf = "${datadir}/alsa/"
>
>  RDEPENDS_libasound = "alsa-conf"
> +RPROVIDES_libasound = "alsa-lib"
>
>  # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
>  # alsa-lib package doesn't exist. libasound is the real library package.
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006a57f1056760823c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This sounds very odd.=C2=A0 Can you give an example of thi=
s happening?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On 13 March 2018 at 03:08, Jason Wessel <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriver.com" target=3D"_=
blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">There are a number of other recipes outside oe-core that dep=
end on<br>
alsa-lib and the rpm4 dependencies resolve sometimes to include<br>
alsa-lib and the packages in the other layers fail to install because<br>
the dependency cannot be resolved, despite the fact that libasound is<br>
installed.<br>
<br>
The simple is to add an RPROVIDES for alsa-lib to libasound which<br>
provides all the shared objects for alsa.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">a<wbr>lsa-lib_1.1.5.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1=
.1.5.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.5.bb</a> b/meta/=
recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.5.bb" rel=3D"no=
referrer" target=3D"_blank">alsa-lib_1.1.5.bb</a><br>
index c5bf107..f7f01e8 100644<br>
--- a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.5.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.5.bb</a><br>
@@ -25,6 +25,7 @@ FILES_alsa-server =3D &quot;${bindir}/*&quot;<br>
=C2=A0FILES_alsa-conf =3D &quot;${datadir}/alsa/&quot;<br>
<br>
=C2=A0RDEPENDS_libasound =3D &quot;alsa-conf&quot;<br>
+RPROVIDES_libasound =3D &quot;alsa-lib&quot;<br>
<br>
=C2=A0# alsa-lib gets automatically added to alsa-lib-dev dependencies, but=
 the<br>
=C2=A0# alsa-lib package doesn&#39;t exist. libasound is the real library p=
ackage.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000006a57f1056760823c--
