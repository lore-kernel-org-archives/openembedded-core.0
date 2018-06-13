Return-Path: <jpuhlman@mvista.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id C735875048
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:28:53 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 6-v6so1627072plb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 13:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lkFwnnBtvaE0u06CeUQPKErndM6hel4OtWkav1vUHcY=;
	b=jGS8QMiXh3S07tchsmd6tPZRMIrNk//iF8wdzhqq9qrH/OpSG3QNEKntwk5TyCK1AA
	v6uYycumCw4bZRC2jB8liWbYayYT6BCOaCjPkKjeVS1qgdpynZfXjTRajCWByytuO2tA
	Pac8CjlNHOSz24LgOr/oXdDOV9R6vjIST3IpSN48lFPbstU8Pff42OXLY12JnJhnSbIV
	n0oImDmvS8+mB7wh+Y9oXzUPNDVN4D2kxJT+SRBgx8B++yOt+M+aMya2fOgQ5R7eQYJ+
	bB5kmiD6PsBMro9JlVYemW1VawabuwtuhJ62F1B9uGXC3NrHirDt8S92s/6GUUDIkA+S
	LXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lkFwnnBtvaE0u06CeUQPKErndM6hel4OtWkav1vUHcY=;
	b=LcJNgnyAnxrf/gorqw9Fo1gwIC6ZcxYPUOZIWVnMaD1k4koo7TI+xW5KIww2rmMnD4
	QzfxmXhRXD7KhSSbZNNL1EBvVCDuvBdP+rZ38JsS1vzdEuLgxlpqP5iEXaZUFjX2gzFp
	f5y2J2m7JCfQH+aEOeTa32y0OMGiXJDKj+k6gOL5Rfrw/uFhNq+adoJ1dF0CH3S1zHrE
	DiTBAYD3K5Cmu8n8dTrj+EPiBgKf/1Mn0IL+h/LDkgEKGX0clmuEm6cYaQ6dT7txulTw
	R0J8NesuL8+dNCVze/pszMxP1etHrdlvuiLIxpd86lZ3ewo8N65MsVI2IwKmUbWmDc63
	jFew==
X-Gm-Message-State: APt69E0X4b+5IxaIyPBQpp19851GjfcmVc2XfOtfbo/e3tsPLvDQQyai
	kpD/TgJ5//9JXfp5EwkMTbRpqe/vdW10uR7Mm3EjGA==
X-Google-Smtp-Source: ADUXVKKBDU6viUOAlcqcJiuG2cRE3dUH5a+mGXeGU/gMPbPh5De8g53BoXTcf4ph2IaAKFYmnlyxbRH6YH/JVH/2PzM=
X-Received: by 2002:a17:902:d697:: with SMTP id
	v23-v6mr6610336ply.193.1528921734820; 
	Wed, 13 Jun 2018 13:28:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:ac18:0:0:0:0 with HTTP; Wed, 13 Jun 2018 13:28:54
	-0700 (PDT)
In-Reply-To: <20180425211827.23866-1-jpuhlman@mvista.com>
References: <20180425211827.23866-1-jpuhlman@mvista.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
Date: Wed, 13 Jun 2018 13:28:54 -0700
Message-ID: <CADe5tdM01H2d9q3CevCUynBtiQ=Fh5uODR78_BcZWabTCKsF8A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Only add uninative and checksum if inherited uninative class
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
X-List-Received-Date: Wed, 13 Jun 2018 20:28:53 -0000
Content-Type: multipart/alternative; boundary="000000000000e4c95a056e8bd4a7"

--000000000000e4c95a056e8bd4a7
Content-Type: text/plain; charset="UTF-8"

Any issue with this patch?

On Wed, Apr 25, 2018 at 2:18 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> The checksum value is only calculated if the uninative class is
> inherited, so check for inherit before adding it to local.conf
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass
> index e1bba49eaf..8dfb8df52e 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -325,8 +325,9 @@ python copy_buildsystem () {
>              f.write('TCLIBCAPPEND = ""\n')
>              f.write('DL_DIR = "${TOPDIR}/downloads"\n')
>
> -            f.write('INHERIT += "%s"\n' % 'uninative')
> -            f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' %
> (d.getVar('BUILD_ARCH'), uninative_checksum))
> +            if bb.data.inherits_class('uninative', d):
> +               f.write('INHERIT += "%s"\n' % 'uninative')
> +               f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' %
> (d.getVar('BUILD_ARCH'), uninative_checksum))
>              f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION',
> False))
>
>              # Some classes are not suitable for SDK, remove them from
> INHERIT
> --
> 2.11.1
>
>


-- 
Jeremy Puhlman
Montavista Software, LLC.

--000000000000e4c95a056e8bd4a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any issue with this patch?</div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Wed, Apr 25, 2018 at 2:18 PM, Jeremy Puh=
lman <span dir=3D"ltr">&lt;<a href=3D"mailto:jpuhlman@mvista.com" target=3D=
"_blank">jpuhlman@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">The checksum value is only calculated if the uninative class is<b=
r>
inherited, so check for inherit before adding it to local.conf<br>
<br>
Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com">jp=
uhlman@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/populate_sdk_ext.<wbr>bbclass | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/populate_sdk_<wbr>ext.bbclass b/meta/classes/popu=
late_sdk_<wbr>ext.bbclass<br>
index e1bba49eaf..8dfb8df52e 100644<br>
--- a/meta/classes/populate_sdk_<wbr>ext.bbclass<br>
+++ b/meta/classes/populate_sdk_<wbr>ext.bbclass<br>
@@ -325,8 +325,9 @@ python copy_buildsystem () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;TCLIBCAPPEND =
=3D &quot;&quot;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;DL_DIR =3D &qu=
ot;${TOPDIR}/downloads&quot;\n&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;INHERIT +=3D &quot;=
%s&quot;\n&#39; % &#39;uninative&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;UNINATIVE_CHECKSUM[=
%<wbr>s] =3D &quot;%s&quot;\n\n&#39; % (d.getVar(&#39;BUILD_ARCH&#39;), uni=
native_checksum))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&#39;<=
wbr>uninative&#39;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;INHERI=
T +=3D &quot;%s&quot;\n&#39; % &#39;uninative&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;UNINAT=
IVE_CHECKSUM[%<wbr>s] =3D &quot;%s&quot;\n\n&#39; % (d.getVar(&#39;BUILD_AR=
CH&#39;), uninative_checksum))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;CONF_VERSION =
=3D &quot;%s&quot;\n\n&#39; % d.getVar(&#39;CONF_VERSION&#39;, False))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Some classes are not suit=
able for SDK, remove them from INHERIT<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Jeremy =
Puhlman<br>Montavista Software, LLC.</div>
</div>

--000000000000e4c95a056e8bd4a7--
