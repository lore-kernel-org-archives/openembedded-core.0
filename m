Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id BE9E278A2B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 11:41:58 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o8so2895683wra.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 03:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mdCPPp21uhrGYthxN9+4nJy5BsACBBdoY7uLVmzA6cg=;
	b=Ev8O3lcA9nZXuWDeOLBpJTsW1ol3vUTSGtGMddn4e6BELntbCYTDDxUDWKGTAo5tMF
	R4Dqyh0S4E5ZWNQv4WCJH4xvNbWm8/dO9/mVjUKbb1y91O3D+Ej3jjTWzKlqwBFyUGWt
	ZIjSK6a9WDHb0dygxAjs+/6A7AITmBJ/x/Rysv5HYQLvrL/MfPs+TTudi+Erv8BrzBKx
	F6tA1vhY+1hnhfrbCSc0sttS759jXNlnhjtOSnJU2ZGoQuOxWY0ixeb2lZI8Mrex4c7P
	6xTOkhD2cuq2edeO3qyoTmRqAQwZHY5qmNF0KM17+frmSya6Iziu0Y+haEdzlyQk/ftX
	7YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mdCPPp21uhrGYthxN9+4nJy5BsACBBdoY7uLVmzA6cg=;
	b=KuBDvo45F7WNPA+vVoN3+hxPkbiSp8X+ofd71yQD/gqa7920Qq8LXZNoB/cilIEt9M
	dBfaWgnNjN/nVNxkwmeS3qyc04VHi+typGqNXapoNwgrIPRCKFWHI2ec1bnuOXrkvRSt
	CFcH/nzMD7/JRp6HXFK1oI0euTlPeRErCj64X1nzQrKRX2zNHcamI9jTZ7tMV7/f/qed
	qnieY7BF9setGm9V6ARaMKDIj8rX1BNEDP0EFNw040ySXtXP0Qz5bkZsJUhlhN/0Hgdp
	QHyMep2ziRSfYUAyvqrIsfmySYd2TkA13EB+Gk4kYL0m9fFogTQ1OD69Nyn3ZWzMvV7j
	xrUg==
X-Gm-Message-State: APf1xPDvz8EJybdXQzjqfr/veQL6XfnHNw/Ttpr4YUP1fFLXZ+wT2sMn
	4iTP/fckFvxMGFsNP2+rBt7im0+AgUHDTzg+BwQ=
X-Google-Smtp-Source: AG47ELvlaxQWzx0aGq55CEUOCu/RsegMt0xAEZVlCLoaDwf90dGS/oMYFojqQeaESv+UUkGYMd8XDuci82j9mZ0oz48=
X-Received: by 10.223.147.227 with SMTP id 90mr9759105wrp.230.1520163719299;
	Sun, 04 Mar 2018 03:41:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 03:41:58 -0800 (PST)
In-Reply-To: <20180201122218.4533-1-Martin.Jansa@gmail.com>
References: <20180201122218.4533-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 12:41:58 +0100
Message-ID: <CA+chaQeE=fcYKTnex_rjsqdAL2K6ZiHdsYKJMvXx=01e2GCK2A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Sun, 04 Mar 2018 11:41:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c0df1447d4847056694b289"

--94eb2c0df1447d4847056694b289
Content-Type: text/plain; charset="UTF-8"

ping

On Thu, Feb 1, 2018 at 1:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add tools required by testimage to HOSTTOOLS only when testimage is
> inherited. These tools, as described in the comment, are only required
> by the testimage task. So this change should not have negtive effect.
> This would also solve build error on hosts which miss some tool such as
> scp.
>
> Cherry-picked from rocko 8ca61a5464743ff85b6d26886112750d6ddd13e0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2dac3a1481..f3994fc642 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,7 +469,7 @@ HOSTTOOLS += " \
>  "
>
>  # Tools needed to run testimage runtime image testing
> -HOSTTOOLS += "ip ping ps scp ssh stty"
> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage',
> d)]}"
>
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat
> sudo"
> --
> 2.15.1
>
>

--94eb2c0df1447d4847056694b289
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Feb 1, 2018 at 1:22 PM, Martin Jansa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Ch=
en Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a=
>&gt;<br>
<br>
Add tools required by testimage to HOSTTOOLS only when testimage is<br>
inherited. These tools, as described in the comment, are only required<br>
by the testimage task. So this change should not have negtive effect.<br>
This would also solve build error on hosts which miss some tool such as scp=
.<br>
<br>
Cherry-picked from rocko 8ca61a5464743ff85b6d2688611275<wbr>0d6ddd13e0<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 2dac3a1481..f3994fc642 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -469,7 +469,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Tools needed to run testimage runtime image testing<br>
-HOSTTOOLS +=3D &quot;ip ping ps scp ssh stty&quot;<br>
+HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp ssh stty&#39;][bb=
.data.inherits_class(<wbr>&#39;testimage&#39;, d)]}&quot;<br>
<br>
=C2=A0# Link to these if present<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc=
 sftp socat sudo&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0df1447d4847056694b289--
