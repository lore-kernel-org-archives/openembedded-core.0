Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
	[209.85.221.173])
	by mail.openembedded.org (Postfix) with ESMTP id 089537F5E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 20:39:51 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id s21so2420020vkm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HZ4pA3dxFbhV+gt6u6SuK7HORDnjGIE5pOK6KtlfhhY=;
	b=TeMJyLLLR/yshRZFHv6L++ZbUQOLDFsx9Gdl5HIRH/vRAjNWJ1CocG9R1pKZOryRrH
	PXGLsGdSyELn7ZaGWvwqhiPQxXYva6qYowRffppIjj/PIe1pgtzUBysYlBY0Rt1q856j
	ol/7UwrcjfdY1oJNqp/QkbfCM4QUyQjCTiDPoWEATET4MXYaC6RjSq53D7zoD9TXsTbt
	Dy9ou/yaGo+XGE5BnrTgomOgUuHZ3h1g8g0gJnvYb+Zt9FBuvzKrlMyQbMDALj9LhYpK
	AqtcienDRa6taEvauxFZOt4dBuzvSfcibIY7M8NdoUfOhLDU5PC6sY4mqJAAnioMsvw2
	TE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HZ4pA3dxFbhV+gt6u6SuK7HORDnjGIE5pOK6KtlfhhY=;
	b=dXetRu+Y+u8ptQh6vyf98IrUpElulViSRo0ZLOYCmNZtPLYoZAy00lfu8inXIieVV0
	jNb+6iE5tI7sWcmvb56vej3IR+lXGyVHkncKIsHLwwFz21c1EqnrnfE8Y7TIxQq3RMhs
	pVqtVxa2oauZj1QyHrrLaRWNm4Fe7Fwocj2shh+U+ZHXjqUSSXsMiNYcCFvtkbs19nJh
	Vhxuq8CsZA/uygpkpnlZf8ZWVRM6rUAY6wH9IWh1DstUyOB2ZWEskEk3ePo0VuDf5iNN
	bW5L1ZTbi1uB7lnASj/QyDVeYn4IsF6GJks2kuY90fC0wom1uMdv5sR7eHJZuPjodkCQ
	XVmw==
X-Gm-Message-State: APjAAAX5Ah80VGs7bsPZxzXu8Md7wAR7GBC4n2/4N/M9pyRsE+LaRSQV
	jCanw9Aya7ygSWAaKJkWa/L2SYit7kDA/3sDftMDL6pF
X-Google-Smtp-Source: APXvYqxqZuWraF1QzLIV0vp9PalQUOTcDctkR06t0gulMWj9GJBiaBxZYn6CFANUIh0pVV82bUdSIghVosw77npEfC8=
X-Received: by 2002:a1f:b40a:: with SMTP id d10mr9605932vkf.29.1570826392760; 
	Fri, 11 Oct 2019 13:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191011201951.24617-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20191011201951.24617-1-fabio.berton@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2019 22:39:41 +0200
Message-ID: <CANNYZj_6RQk_AMRoXXjx5c-XjtAOwHetUtQXAe_sEhHuGbtH7w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.6 -> 19.2.1
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
X-List-Received-Date: Fri, 11 Oct 2019 20:39:52 -0000
Content-Type: multipart/alternative; boundary="00000000000024f6bb0594a885d0"

--00000000000024f6bb0594a885d0
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Oct 2019 at 22:20, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

>   - Update patches with devtool finish --force-patch-refresh


I'm not sure what you did exactly, but one of the patches below is
incorrectly updated.

Do use 'devtool upgrade', which properly rebases the patches and allows you
to resolve conflicts.


> +@@ -382,6 +382,10 @@ if not with_platform_android or
> get_option('platform-sdk-version') >= 29
> +   pre_args += '-DUSE_ELF_TLS'
>   endif
>
> --pre_args += '-DGLX_USE_TLS'
>  +if get_option('glx-tls')
>  +  pre_args += '-DGLX_USE_TLS'
>  +endif
> ++
>   if with_glx != 'disabled'
>     if not (with_platform_x11 and with_any_opengl)
>       error('Cannot build GLX support without X11 platform support and at
> least one OpenGL API')
>

The fact that 'pre_args += '-DGLX_USE_TLS' is no longer present in the file
should've raised suspicions, and indeed:
"mesa: Rename GLX_USE_TLS to USE_ELF_TLS."
https://gitlab.freedesktop.org/mesa/mesa/commit/9f37c9903b87f86a533bfaffa72f0ecb285b02b2

Alex

--00000000000024f6bb0594a885d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">On Fri, 11 Oct 2019 at 22:20, Fabio Berton &lt;<a href=3D"mailto:=
fabio.berton@ossystems.com.br">fabio.berton@ossystems.com.br</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204,204,204);padding-left:1ex">=C2=A0 - Update patch=
es with devtool finish --force-patch-refresh</blockquote><div><br></div><di=
v>I&#39;m not sure what you did exactly, but one of the patches below is in=
correctly updated.</div><div><br></div><div>Do use &#39;devtool upgrade&#39=
;, which properly rebases the patches and allows you to resolve conflicts.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex">+@@ -382,6 +382,10 @@ if not with_pl=
atform_android or get_option(&#39;platform-sdk-version&#39;) &gt;=3D 29<br>
+=C2=A0 =C2=A0pre_args +=3D &#39;-DUSE_ELF_TLS&#39;<br>
=C2=A0 endif<br>
<br>
--pre_args +=3D &#39;-DGLX_USE_TLS&#39;<br>
=C2=A0+if get_option(&#39;glx-tls&#39;)<br>
=C2=A0+=C2=A0 pre_args +=3D &#39;-DGLX_USE_TLS&#39;<br>
=C2=A0+endif<br>
++<br>
=C2=A0 if with_glx !=3D &#39;disabled&#39;<br>
=C2=A0 =C2=A0 if not (with_platform_x11 and with_any_opengl)<br>
=C2=A0 =C2=A0 =C2=A0 error(&#39;Cannot build GLX support without X11 platfo=
rm support and at least one OpenGL API&#39;)<br></blockquote><div><br></div=
>The fact that &#39;pre_args +=3D &#39;-DGLX_USE_TLS&#39; is no longer pres=
ent in the file should&#39;ve raised suspicions, and indeed:<br>&quot;mesa:=
 Rename GLX_USE_TLS to USE_ELF_TLS.&quot;<br><a href=3D"https://gitlab.free=
desktop.org/mesa/mesa/commit/9f37c9903b87f86a533bfaffa72f0ecb285b02b2">http=
s://gitlab.freedesktop.org/mesa/mesa/commit/9f37c9903b87f86a533bfaffa72f0ec=
b285b02b2</a><div><br></div><div>Alex</div></div></div></div></div></div>

--00000000000024f6bb0594a885d0--
