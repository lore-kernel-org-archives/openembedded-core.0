Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2B4739A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 20:57:52 +0000 (UTC)
Received: by qgdz107 with SMTP id z107so31817299qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 13:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TVvDBL2B6aOvdMYGXOeKhOZlqnNrdwEcJ/wopU9y5vU=;
	b=fieowxzrjhx9eqq1LeIP73LUviipl7/KB4ruRiA4wnLD4H8OoRghDZvctBBnfG67fg
	0F/3JhoAuHg2SK6IeegueOKhMLAcOQbSpzEi9uIe6ZhxxaeYpNtk0B5B4L80WRoa+ypd
	JVtI8aOx6IWPm0eRb+lKiQfliMdwNOcVXTMf6lh2frD4jZUm5g3dZVfwrG9tWALhF5O0
	VgHjYoF87Dn9gx8cMLK468Yth/+kYnqz2nr/3JvmvTzL1p9+nx4iG6iIzjnlo/7xeFPb
	Hs18s6DZu16IAlq5QRCWjfz+T5horegCX14u4JggyqVIi/tzkkm/C5VhcTbwcu2jYOlK
	FFIA==
X-Gm-Message-State: ALoCoQktKTnJ3H7HDqmbEYdkl9fSwzeQU5QI3XH0aAltxbj7MwIih6jbn9uk1GnyOOJiYMDGuZTG
X-Received: by 10.140.232.3 with SMTP id d3mr38986513qhc.82.1425934674105;
	Mon, 09 Mar 2015 13:57:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 9 Mar 2015 13:57:33 -0700 (PDT)
In-Reply-To: <371E240E6FC1D44DA5E51EE9DCDCB784012B9C4987@NA-MBX-01.mgc.mentorg.com>
References: <371E240E6FC1D44DA5E51EE9DCDCB784012B9C4987@NA-MBX-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Mar 2015 20:57:33 +0000
Message-ID: <CAJTo0Lboahoc8Y6BDoEfOLQpG=y-_UuA0cEakNNaTy=nZo818A@mail.gmail.com>
To: "Mehaffey, John" <John_Mehaffey@mentor.com>
Cc: "mehaf@gedanken.com" <mehaf@gedanken.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng: Add tracing group when building lttng-tools
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
X-List-Received-Date: Mon, 09 Mar 2015 20:57:53 -0000
Content-Type: multipart/alternative; boundary=001a11c128b0b94a610510e14947

--001a11c128b0b94a610510e14947
Content-Type: text/plain; charset=UTF-8

On 27 February 2015 at 02:17, Mehaffey, John <John_Mehaffey@mentor.com>
wrote:

> +inherit autotools-brokensep ptest pkgconfig adduser
>

Did you mean useradd?  Or is adduser something Mentor-specific?

Ross

--001a11c128b0b94a610510e14947
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2015 at 02:17, Mehaffey, John <span dir=3D"ltr">&lt;<a href=
=3D"mailto:John_Mehaffey@mentor.com" target=3D"_blank">John_Mehaffey@mentor=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7p=
b" class=3D"a3s" style=3D"overflow:hidden">+inherit autotools-brokensep pte=
st pkgconfig adduser<br></div></blockquote></div><br>Did you mean useradd?=
=C2=A0 Or is adduser something Mentor-specific?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c128b0b94a610510e14947--
