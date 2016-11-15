Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 10ABE6093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:40:19 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n21so131378761qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 03:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dGjzHTwUAS7FW5rPi2fVK5iZQo36Y0Ki6jp3LluUfNQ=;
	b=EWp3fFxQOacNMhNFvQSRTncmC21zkLdabdz1NcP/2pilfzHEyShNWHIXi4qHnjJB6t
	oUUbTzfyMvwiVkFdsvmpDBy6cedB3JZCogEKiYtOEDtIkWFw6gOB8KUDBhdB6WdP7QP/
	Pj7vMqMrhWxC5/85F8HSANCRFfYTeaIOUxZOJ6pFOjSVgJDFsIT4ZTXOutv9l4Dlj4+r
	U23aat1YEhmQHTe0nKGysKl8WkV0NJVx32R9EWsWHI1qgadOq43Z05SSQc1h9y6RelE5
	ds23H9eHjTw8s9b4AB9SXZyB6MNACgb339QtBkX9Lv6wtKnS7Luq2EmnE2LHMxl+BVkK
	odxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dGjzHTwUAS7FW5rPi2fVK5iZQo36Y0Ki6jp3LluUfNQ=;
	b=kECR2JI4Yy3rP3fBSqw8nLupL7v9SM7gYwsHi2HEy3wYmD89oezHrhYZk7bmJDT8+1
	H/b632bb6fV/dmKdDtqNyHzGBheFaS2wpRqiRM1os+1qQ5gbhw4UHqQt+VTX5B227ffY
	1LN0kYMrMWJtkbBEmdVmZ7YqwvlKWZgydidj3jRn8SkkWzrFKrcRdpALCUBbQqeSu7b3
	lQRq2HRF5W6WBkDVWcWc6VAmFshgLvvZCsHjyn6v5UHEQ4HlhW8Ob3hHpWqEe7LL2Kfy
	IpJVJa0BDi3qnoAaJn9r6fey8WrANjCUGJXJLfhfeuiXRO7Ai8MgFhOZV7SZB7alG0Za
	9FKw==
X-Gm-Message-State: ABUngvepUJfMOGDxkYPSyzHBW8ZGUk3v8OF+iKM0wSzeIUJTvDeUDhjHG6XiV42SFtBW+eBIjgbIWVkG1v9mue8K
X-Received: by 10.55.106.134 with SMTP id f128mr24183287qkc.121.1479210020542; 
	Tue, 15 Nov 2016 03:40:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 03:40:00 -0800 (PST)
In-Reply-To: <1479130386.8647.5.camel@ts.fujitsu.com>
References: <1479119619.8647.1.camel@ts.fujitsu.com>
	<CAJTo0LZ68DbpCMpHy=5AKuxsHNCjzw2vJMJBd1WC27VTga=fqg@mail.gmail.com>
	<1479130386.8647.5.camel@ts.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 11:40:00 +0000
Message-ID: <CAJTo0Lb1zdvfoU4H=mYFokAax-6uTysQ=m_A_JM4w46fJd8uuQ@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libdbus-c++
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
X-List-Received-Date: Tue, 15 Nov 2016 11:40:20 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6d2e1140541556b24

--001a114fddf6d2e1140541556b24
Content-Type: text/plain; charset=UTF-8

On 14 November 2016 at 13:33, thilo.cestonaro@ts.fujitsu.com <
thilo.cestonaro@ts.fujitsu.com> wrote:

> Yeah I propably can and will be if I need to write my own. But the funny
> thing is, that there ones was a meta-oe dbus-c++ recipe and this was
> removed with the comment, that it didn't work and it's
> better to use the one from oe-core :)
>

Just found this recipe in my WIP folder, no idea if it works but it's
probably a starting point:

$ cat dbus-cxx_0.8.0.bb
SUMMARY = "C++ bindings for dbus"
HOMEPAGE = "http://dbus-cxx.sourceforge.net/"
SECTION = "libs"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

DEPENDS = "dbus libsigc++-2.0 popt"

SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
SRC_URI[md5sum] = "ab89f48dd0cd3c581a9228fcbb3af96b"
SRC_URI[sha256sum] =
"a7c179cb7ecafc6477c789b080bd936ac3620220604ffb2ae214a33719839d13"

inherit autotools pkgconfig

BBCLASSEXTEND = "native"

Ross

--001a114fddf6d2e1140541556b24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 13:33, <a href=3D"mailto:thilo.cestonaro@ts.fujitsu.=
com">thilo.cestonaro@ts.fujitsu.com</a> <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:thilo.cestonaro@ts.fujitsu.com" target=3D"_blank">thilo.cestonaro@ts.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3eb"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m158630b4f8ed16c3">Yeah I propably ca=
n and will be if I need to write my own. But the funny thing is, that there=
 ones was a meta-oe <span class=3D"gmail-il">dbus</span>-<span class=3D"gma=
il-il">c++</span> recipe and this was removed with the comment, that it did=
n&#39;t work and it&#39;s<br>
better to use the one from oe-core :)</div></blockquote></div><br>Just foun=
d this recipe in my WIP folder, no idea if it works but it&#39;s probably a=
 starting point:</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra"><div class=3D"gmail_extra">$ cat <a href=3D"http://dbus-cxx_0.8.=
0.bb">dbus-cxx_0.8.0.bb</a></div><div class=3D"gmail_extra">SUMMARY =3D &qu=
ot;C++ bindings for dbus&quot;</div><div class=3D"gmail_extra">HOMEPAGE =3D=
 &quot;<a href=3D"http://dbus-cxx.sourceforge.net/">http://dbus-cxx.sourcef=
orge.net/</a>&quot;</div><div class=3D"gmail_extra">SECTION =3D &quot;libs&=
quot;</div><div class=3D"gmail_extra">LICENSE =3D &quot;GPLv3&quot;</div><d=
iv class=3D"gmail_extra">LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd3=
2239bcb673463ab874e80d47fae504&quot;</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">DEPENDS =3D &quot;dbus libsigc++-2.0 popt&qu=
ot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">SR=
C_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2&quot;</div><div =
class=3D"gmail_extra">SRC_URI[md5sum] =3D &quot;ab89f48dd0cd3c581a9228fcbb3=
af96b&quot;</div><div class=3D"gmail_extra">SRC_URI[sha256sum] =3D &quot;a7=
c179cb7ecafc6477c789b080bd936ac3620220604ffb2ae214a33719839d13&quot;</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">inherit auto=
tools pkgconfig</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">BBCLASSEXTEND =3D &quot;native&quot;</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a114fddf6d2e1140541556b24--
