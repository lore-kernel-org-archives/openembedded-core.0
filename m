Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 346A46017E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 20:51:40 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id l89so1182916qgf.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 12:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fkb0bZW3l3WwENHgGOrRkKZ3RT9vcvFBfB9e7zmeWDY=;
	b=WhtRKkS/Qu5/7BPgrVGEbtgYkTY3DiJbHokTQxbs7gK/e/ydr1JJZzIvLsz9On6tLp
	KnW6JqK0YmPWd7NgccZCgjSNhwcyXDeKWbeTskMlGt3O/GygjJz++erY7Gu8wceOnOf/
	dgWWv+dLNOJhxBoBsURiwJAdV5bo5zFw9X0KKkU/KrZFZnU1tYu1vbKaXcaBZ+ggBBVT
	RTdFl4hspff9MxEyuuIHT4FV45G6A1DFKP/z7OWxjFBGjWvPxgCrvk9qRYg0KiZx4f7u
	JfcERYFbl1ynPlVlMgFsorPoHYSDUWQQkFqOTnYu1kcrDElNOJD0vL5H6fdIRzfjVH1x
	KjBg==
X-Gm-Message-State: ALoCoQnjF311J0axjmca9iEZEZKDvyT1WL2+iexGee0ll23SfFky82aWKzaH1fFNSxKH/0kJDEaj
X-Received: by 10.229.190.71 with SMTP id dh7mr56345451qcb.5.1418071901230;
	Mon, 08 Dec 2014 12:51:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 12:51:20 -0800 (PST)
In-Reply-To: <32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 20:51:20 +0000
Message-ID: <CAJTo0LZUZLN5BoMcPGhdE4+bzOmcW5U6HEfJC0iM9i=kq4vUOQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] packagegroup-core-tools-profile: remove sysprof for aarch64
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
X-List-Received-Date: Mon, 08 Dec 2014 20:51:48 -0000
Content-Type: multipart/alternative; boundary=001a11336ab6f06c8d0509ba9719

--001a11336ab6f06c8d0509ba9719
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:

> +# sysprof doesn't support aarch64
> +PROFILE_TOOLS_X_aarch64 = ""
>

The rest of the file uses for example SYSPROF and SYSPROF_aarch64, please
match the existing pattern.

Ross

--001a11336ab6f06c8d0509ba9719
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7=
 November 2014 at 08:51, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
ai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3fy" class=3D"a3s"=
 style=3D"overflow:hidden">+# <span class=3D"il">sysprof</span> doesn&#39;t=
 support aarch64<br>
+PROFILE_TOOLS_X_aarch64 =3D &quot;&quot;</div></blockquote></div><br>The r=
est of the file uses for example SYSPROF and SYSPROF_aarch64, please match =
the existing pattern.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11336ab6f06c8d0509ba9719--
