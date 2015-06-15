Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id DB86574115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 13:36:00 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so53608702qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FFf2MCrzkPROJv+k1M7zWfv6QpU9b0VESAJaN9DnVUk=;
	b=jn3IAZYRRQv6vWSGuL5UCITRRKPTtw23VvSDHgfXqX2/6w5UaoFefsd4suxY8YQtEU
	pG1JT5e/YaByqWzdHDDT3TZj8VYmevBmjy53vaWPlWPSbxml4+WpqR2V55VMUcg38eiO
	JG+x7YTM9DglENWs6CBkJJdrrDJx59LAAUMVOkm+3Ypn2yei5z/RCYYA6Y5zIZm5XuyK
	X79Y90/A3rLmbUEuf38EGVj6aVWNIF+1TQoaTHf9gC7qPqDhvTQvthfsI4m4EIxzUsQB
	FgL7DIvqboPceAF28O1dbsS1neae6fjnPrulbTzKkxiRkbB2hZc9CyqhR7JuhjEvm+eW
	5zUg==
X-Gm-Message-State: ALoCoQlaN+kgY2f2tOZu3Ia75sHb3mncH2hHwHALdVk0148VelPgeyOVdjWjTdyHyTycA4trG5vy
X-Received: by 10.140.133.199 with SMTP id 190mr37662244qhf.17.1434375361384; 
	Mon, 15 Jun 2015 06:36:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 06:35:41 -0700 (PDT)
In-Reply-To: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
References: <cover.1434114213.git.jussi.kukkonen@intel.com>
	<7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 14:35:41 +0100
Message-ID: <CAJTo0LZjSiQ7LU+3PaF3AHV7Y5aSkP5Re6bm+L_G+Cs3zYKxeg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] gtk+3: Upgrade to 3.16.3
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
X-List-Received-Date: Mon, 15 Jun 2015 13:36:04 -0000
Content-Type: multipart/alternative; boundary=001a11353390e4177305188e89a5

--001a11353390e4177305188e89a5
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 14:11, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> +           docbook-utils-native gdk-pixbuf-native libepoxy"
>

Note that libepoxy currently doesn't know how to be a "no implementation"
stub of OpenGL so this does mean that GTK+ 3 now has a hard dependency on
OpenGL.   Upstream GTK+ 3 has no interest in making this an option so if
anyone is bothered by this, they'll have to step up and submit patches.

Ross

--001a11353390e4177305188e89a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 14:11, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1b4" cl=
ass=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0docbook-utils-native gdk-pixbuf-native libepoxy&quot;<br></div></bloc=
kquote><div><br></div><div>Note that libepoxy currently doesn&#39;t know ho=
w to be a &quot;no implementation&quot; stub of OpenGL so this does mean th=
at GTK+ 3 now has a hard dependency on OpenGL. =C2=A0 Upstream GTK+ 3 has n=
o interest in making this an option so if anyone is bothered by this, they&=
#39;ll have to step up and submit patches.</div><div><br></div><div>Ross</d=
iv></div></div></div>

--001a11353390e4177305188e89a5--
