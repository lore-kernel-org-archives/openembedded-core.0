Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2892D601F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 20:59:18 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id a108so506358qge.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 13:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IcdIPCgfOB5NOVAk/AHZdkBWoY1I9Kw/EjZuZQmyNo8=;
	b=bav8Of1TIY11lMtzYP00yLmiaBbPVifvqji/ecSNWEKwXPqHlkfCylRYJhrlgAdaWQ
	8IzriHA7p5iHgXkbjZpTWyqeT8oW557b7wcmEXB+pW+IFSenkdPd4zRO+JXJFxvMn6MF
	qhv2aiE9sgwG1wbL4lvmd5pDN2soGwLBmKNofwX8GSA5lHHpITEpESZYTcAYC1Gyo5J9
	S6v/7fHcSPQjoynR7yq1xt8r+oB8Jb/xHNcyTiL5HJZREfIpWEgGXdEvj+ajXWmMc3OR
	BIZuqNXsuqAm8rPYrvR/WoQO/P4ce96YLoKKB3EYs3vqUlwvTyenYr9VgNa5kcEHymio
	tIvQ==
X-Gm-Message-State: ALoCoQktrBF4UDuWPZZ+8V8tEKIZ5uooQ2HEQF7dLn3K2Ykj/Cz/ewxt1r6oRP613/V+jAKMD9CV
X-Received: by 10.224.160.83 with SMTP id m19mr8616071qax.17.1414357158849;
	Sun, 26 Oct 2014 13:59:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Sun, 26 Oct 2014 13:58:58 -0700 (PDT)
In-Reply-To: <5449B8C7.3050304@windriver.com>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
	<CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
	<5449B8C7.3050304@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 26 Oct 2014 20:58:58 +0000
Message-ID: <CAJTo0LZxhxM4bjdoH0CtYPHcX94KN0c_rieShgq3a2mjLKq4pg@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Sun, 26 Oct 2014 20:59:24 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa0a051b050659b03e

--047d7bacb2aa0a051b050659b03e
Content-Type: text/plain; charset=UTF-8

On 24 October 2014 03:26, Chong Lu <Chong.Lu@windriver.com> wrote:

> IMAGE_INSTALL = "gconf lib32-gconf"
>
> So multiple copies of gconf to be installed.
>

Yeah, don't do that.  Would you test installing apache and lib32-apache?

Ross

--047d7bacb2aa0a051b050659b03e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 October 2014 03:26, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6fs" class=3D"a3s=
" style=3D"overflow:hidden">IMAGE_INSTALL =3D &quot;gconf lib32-gconf&quot;=
<br>
<br>
So multiple copies of gconf to be installed.<br></div></blockquote></div><b=
r>Yeah, don&#39;t do that.=C2=A0 Would you test installing apache and lib32=
-apache?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--047d7bacb2aa0a051b050659b03e--
