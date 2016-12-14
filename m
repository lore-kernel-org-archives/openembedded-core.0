Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4336871A76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 15:51:16 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id n6so28670892qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JXHjqheQPPaPHRENlGG7dP+gDNgts7TdJao1NBq5eJA=;
	b=A3hBZNdB7RspjhywHrilDEMlTKpaCRGh6LPa103x8b1Ukb0NrgCqv0Wp4S+iO3Qmon
	ZzfP5u9bhH+C0Py52xMcoXc/TuQqYO7Atl+uGwSFxtAXd8BPVwUMNx75tSSSgICCMay+
	p7bk/u0At+KPkYXkyP757XwVU7DB4jZojf8j/1fp9wgelfdTqK/ebXAabD5Kp4TGhp4m
	z+pk80q/8MQysBmw3IjWhcPsRJ3smS/ZDKGyZ9/8oDh/zlL63qz1upF0LUTVIe98YeeG
	yP9MXRsUNy8XrCeJqwlQEfGfUz95ECx5rkAyJecmzeRd1ztn4OAVQMFbBnY2xZidiZHM
	kFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JXHjqheQPPaPHRENlGG7dP+gDNgts7TdJao1NBq5eJA=;
	b=swa4uvoRW78xeEpwWdh/rK8LxBMFaw+eN2wqks56lC/xouNfoVcXToB+Dk2ikvHPBJ
	Tczm3sB6alQaGhoFI+OueVbtFCqvXzYmSzLGb51uY288GXFY6BP1b1gDu+DUgEtua3rY
	5qDwcXx75ucz4niXflTZL29ELniH1l/bXoLvmU2rh+8A9Mq1qllgkpz7BuoDcxnGSF4+
	Hi5w09M0tsI2mEU1nTWmn8FCreZjQUiAr4kyKyonLsVy2kYvdZlBpmASLDOMHiPymYNg
	XqwqJ85i8zFQj97OGAju9uFpuuZioZ0Q9vML4ykye7lY/z8s/1bbtMDaoN5nPLl5/Iyz
	nMIQ==
X-Gm-Message-State: AKaTC02Zl1TQCqilEJO4N+w7Jy8u4WZmyzuY1/n0cZI+hXIA5RqJD0SFeWCxXqDH8YHWGp14cmAFpLZh1mTmIUgc
X-Received: by 10.237.36.154 with SMTP id t26mr85748973qtc.188.1481730678018; 
	Wed, 14 Dec 2016 07:51:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 14 Dec 2016 07:50:57 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612140959100.23059@localhost.localdomain>
References: <alpine.LFD.2.20.1612140959100.23059@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Dec 2016 15:50:57 +0000
Message-ID: <CAJTo0LZred8UvcTc8iv7jufwcvr+3LcW2bvoU9yibH7k_-aFHw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][busybox] Add comments to separate Runit from SELinux content in defconfig
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
X-List-Received-Date: Wed, 14 Dec 2016 15:51:20 -0000
Content-Type: multipart/alternative; boundary=001a1141058eb76ee70543a04e1b

--001a1141058eb76ee70543a04e1b
Content-Type: text/plain; charset=UTF-8

I've fixed it in when merging, but please don't put 'busybox' in square
brackets as git-apply will strip anything in those out when it applies the
patch.

Ross

On 14 December 2016 at 15:01, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
> There is no break in busybox's "defconfig" file to show where Runit
> settings suddenly morph into SELinux settings, so add some comments.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig
> b/meta/recipes-core/busybox/busybox/defconfig
> index cbdb139..773c4f8 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -981,6 +981,10 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
>  # CONFIG_ENVUIDGID is not set
>  # CONFIG_ENVDIR is not set
>  # CONFIG_SOFTLIMIT is not set
> +
> +#
> +#  SELinux utilities
> +#
>  # CONFIG_CHCON is not set
>  # CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
>  # CONFIG_GETENFORCE is not set
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141058eb76ee70543a04e1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve fixed it in when merging, but please don&#39;t pu=
t &#39;busybox&#39; in square brackets as git-apply will strip anything in =
those out when it applies the patch.<div><br></div><div>Ross</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 December 2016 =
at 15:01, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@c=
rashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
There is no break in busybox&#39;s &quot;defconfig&quot; file to show where=
 Runit<br>
settings suddenly morph into SELinux settings, so add some comments.<br>
<br>
Signed-off-by: Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca=
">rpjday@crashcourse.ca</a>&gt;<br>
<br>
---<br>
<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/defconfig b/meta/recipe=
s-core/busybox/<wbr>busybox/defconfig<br>
index cbdb139..773c4f8 100644<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/defconfig<br>
+++ b/meta/recipes-core/busybox/<wbr>busybox/defconfig<br>
@@ -981,6 +981,10 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=3D<wbr>&quot;&quot;<br>
=C2=A0# CONFIG_ENVUIDGID is not set<br>
=C2=A0# CONFIG_ENVDIR is not set<br>
=C2=A0# CONFIG_SOFTLIMIT is not set<br>
+<br>
+#<br>
+#=C2=A0 SELinux utilities<br>
+#<br>
=C2=A0# CONFIG_CHCON is not set<br>
=C2=A0# CONFIG_FEATURE_CHCON_LONG_<wbr>OPTIONS is not set<br>
=C2=A0# CONFIG_GETENFORCE is not set<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
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

--001a1141058eb76ee70543a04e1b--
