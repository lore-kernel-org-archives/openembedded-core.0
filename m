Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id AB4D3758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:14:49 +0000 (UTC)
Received: by qkfm62 with SMTP id m62so40957235qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 09:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LCNjA6ILSS5mFEdMj5TJ0vr9JVtgrsVtkD3va+4rF3k=;
	b=Eh2ybBKvuxK5STsjsMUSfNppqm+9I9e3NFVOAkWeCe4hrVz6SMaBpmQCUN3+vs7e4B
	kX5arH5bHoU9oWhgi3uUBer42HqPuaqQnVKJTf2sosq/yAxW06poCRBG8AuioqAy6UB0
	3NAjk9Ebo09dlhTR65aYVZRNBItK4uvP5UnDoyA/uVoRx18PttZ67tGLSbjtEo1QJ/kr
	TgnzZO2mQbe8GVlrBIp0oX5zTRTWGhedJ1r6H3QVmOI3VOXqzRF2zSYlcWYQ2cNdM1AU
	F960ihBqhc6zCA+CwRmT5hF5RPJSEzcyn6YtvjJiIIJC1xjVK8e+ZBM2Cd0Jm7FhZUgP
	IKcQ==
X-Gm-Message-State: ALoCoQnAEJNV+TFzIn7uxTTL7sQ1U1JIcqXc6Zh/t/s90RjXK+1EpMlE2MR4K+4D0jdP0yJC19QV
X-Received: by 10.140.109.74 with SMTP id k68mr12459885qgf.77.1445444089790;
	Wed, 21 Oct 2015 09:14:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 21 Oct 2015 09:14:30 -0700 (PDT)
In-Reply-To: <1a1ce45ceedb4a185b9cb03e36a56c5cd2485773.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
	<1a1ce45ceedb4a185b9cb03e36a56c5cd2485773.1445334356.git.joshua.lock@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Oct 2015 17:14:30 +0100
Message-ID: <CAJTo0LbZ3_uwkerqAU3TbHSNPCg+8C3Z_U-Wu-XbMCA68pF+xA@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/7] weston: add PACKAGECONFIG to build with systemd-login support
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
X-List-Received-Date: Wed, 21 Oct 2015 16:14:54 -0000
Content-Type: multipart/alternative; boundary=001a1139af248410b505229fad23

--001a1139af248410b505229fad23
Content-Type: text/plain; charset=UTF-8

On 20 October 2015 at 10:47, Joshua Lock <joshua.lock@collabora.co.uk>
wrote:

> +# Weston with systemd-login support
> +PACKAGECONFIG[systemd] = ",,systemd dbus"
>

This means it is impossible to have a distro with systemd present but have
the systemd feature disabled which isn't ideal.  Adding configure options
would be awesome.

Ross

--001a1139af248410b505229fad23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2015 at 10:47, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@collabora.=
co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6=
3m" class=3D"a3s" style=3D"overflow:hidden">+# Weston with systemd-login su=
pport<br>
+PACKAGECONFIG[systemd] =3D &quot;,,systemd dbus&quot;<br></div></blockquot=
e></div><br>This means it is impossible to have a distro with systemd prese=
nt but have the systemd feature disabled which isn&#39;t ideal.=C2=A0 Addin=
g configure options would be awesome.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1139af248410b505229fad23--
