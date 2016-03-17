Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id AEC836011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:30:18 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id kc10so2384563igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JLU4GubkA07YR0R4XFwJvA0nZeg59dudNRAHFdy74HU=;
	b=hsrWa4yJeOLKAeFzWDaZ7smeKoN2Ux/AARIiVHkWkkLPQ5tm8hqkuZqv5EpVher16A
	MFBKTOS6nDRj88DF5Hf2Z2Ao+xtKHD+INZ5ubjns6XeZfoS9xO0QZvNUa6gTbv2pbH+S
	pXe83bX6j7KgyultwY6/0l3K52aJB+jGvKodJ3W5OPPqqD7yKHZCDrJLIAwVDuVGV+9g
	0hEzC/0UycKDe0/b3ICOPDLsgC5Z9H4ONatkTUJkEVaB07nouMh4Hx5cVbWttgJvdCCP
	FZTN5icgVnSsUGwF0cXavY1dMkNMP1i6RdjGEwpEpm30DIEd7dh1rSPkb71cyu3WGYgI
	viqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JLU4GubkA07YR0R4XFwJvA0nZeg59dudNRAHFdy74HU=;
	b=GzSA5PvxxCMvpCpcgsbpHGvIMEPQXadIZMbNk3tZdfQOXl9fmP2gy77xbTgEjVIKCb
	S/WQeD9PnS+47ZFkUKwn1EkKb+yjeT9uRWIo9hkd1vkYC5juTdLyHNMQZ+W/bNM/922i
	ON84sVMLcN4mdutEtHZBbh+FN8TU4sfRD0rEKfkfHablD5g8KoSEPriZo7HoO4FdJNLY
	PFjpCN+wjh07UMTbT1qWG3/SnDeMmuZAXodwCw/kpU9e7FeMNItOW2K29R2M4MhWCgYa
	ESq2f7UgWtm4QYqC8FuyJksp8aoqZa/WQYhQ7oZ8r2M4yFbVHCShw14H7BDGlpPZyaTK
	elAA==
X-Gm-Message-State: AD7BkJI2FLT9ovoNTpzPsPpD9MqhPWgpdl6Tq1IO9oxTmfZbIyonXoPHD76ZjRjkWE5koowcAGoxR04m/CafKCQq
X-Received: by 10.50.43.226 with SMTP id z2mr39663709igl.78.1458235818659;
	Thu, 17 Mar 2016 10:30:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 17 Mar 2016 10:29:59 -0700 (PDT)
In-Reply-To: <1458235169-9267-8-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-8-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Mar 2016 17:29:59 +0000
Message-ID: <CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gobject-introspection.bbclass: make additional DEPENDS conditional
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
X-List-Received-Date: Thu, 17 Mar 2016 17:30:19 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4f890a3052e41fbb8

--047d7bfea0f4f890a3052e41fbb8
Content-Type: text/plain; charset=UTF-8

On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com> wrote:

>  # Generating introspection data depends on a combination of native and
> target
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS_append = " gobject-introspection gobject-introspection-native
> qemu-native"
> +DEPENDS_append = " ${@bb.utils.contains('COMBINED_FEATURES',
> 'gobject-introspection-data', 'gobject-introspection
> gobject-introspection-native qemu-native', '', d)}"
>

Have you verified this works with g-i disabled and a clean sysroot?  I'm
thinking builds will still need at least some of this to provide the m4
macros.

Ross

--047d7bfea0f4f890a3052e41fbb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2016 at 17:19, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":au" class=3D"a3s"=
 style=3D"overflow:hidden">=C2=A0# Generating introspection data depends on=
 a combination of native and target<br>
=C2=A0# introspection tools, and qemu to run the target tools.<br>
-DEPENDS_append =3D &quot; gobject-introspection gobject-introspection-nati=
ve qemu-native&quot;<br>
+DEPENDS_append =3D &quot; ${@bb.utils.contains(&#39;COMBINED_FEATURES&#39;=
, &#39;gobject-introspection-data&#39;, &#39;gobject-introspection gobject-=
introspection-native qemu-native&#39;, &#39;&#39;, d)}&quot;<br></div></blo=
ckquote></div><br>Have you verified this works with g-i disabled and a clea=
n sysroot?=C2=A0 I&#39;m thinking builds will still need at least some of t=
his to provide the m4 macros.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4f890a3052e41fbb8--
