Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 208A8608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 14:48:10 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ig19so85807405igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2jF45ChzONqOIezFumL0AbVOTQmaSWVV4r3u/K7dL9M=;
	b=cmMtRCpm9tr1jSZm429zHr92awqtN54Yp1Hr3yyTib2ANEXiPfirkRGK+VTmqBJO7e
	pNCKlKsIYqNJjDoBDMaPkQVFfBV4J6x7AkT9/Fd2SRouAZGM/IUz+1ecMejvhbUmO8X5
	8jMOxHUJMci/X95CVnU2rEu5+BdP0InGY2ygHeQVbLPhxb97MNksVaK97HMNkobDO6gW
	gQMQllqWPVPKZPox6Cvx2c2pkpP19gthVrPx8mPmFu9waSerlxk2qhjJ7aG6s4Cd0Rnk
	GDeSGSodfeXzciWlRG2HsQ3fpVYv2UoZ7w6SfELLYIwSCnIYNo497TbvK/tgL/sc63Rs
	KAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2jF45ChzONqOIezFumL0AbVOTQmaSWVV4r3u/K7dL9M=;
	b=m2OP0UX28BoLys+yeXR5G265lyR0OyDoMLTAAPVTFNrmyXPmmgatSvWp+3BESU5wGT
	76AqtZULC9UrSSj7+Polt7sM19uU2w76TW1ZkesxQjLvCW6x+/iPqsb3UeE5/KCaSsR5
	se3c9P0sUZvEsbrC78xMGBAwbiw2+S2bNoWWrtI+EbZQckpf89Do2Fu3mOm3aOVpB/H8
	1IM7cg+9qs4+EmCWAcnpwqWMNkrthrt0Pu9krEF/fWFXA/LGywgNCOYwwAc7WdUYQtCK
	/0x6ceLeg6boITMGe0mEYPi3O7aNJysMBDK7GoGorNgMviJAZRjOxOmdB3CfHUD4+YbQ
	yiMQ==
X-Gm-Message-State: AD7BkJLtIZewWbPaMsBbbQKl+ZZvBVQkqf9YZtWlsi+seUkRvYK5NAKeMYlCHzmCb+YTlKxs9Ak8MFs79ezf1mPA
X-Received: by 10.50.155.72 with SMTP id vu8mr11983078igb.64.1458571690976;
	Mon, 21 Mar 2016 07:48:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Mar 2016 07:47:51 -0700 (PDT)
In-Reply-To: <ee2f2af704cb828dd936d435cb98c88de74db825.1458397812.git.hongxu.jia@windriver.com>
References: <cover.1458397812.git.hongxu.jia@windriver.com>
	<ee2f2af704cb828dd936d435cb98c88de74db825.1458397812.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Mar 2016 14:47:51 +0000
Message-ID: <CAJTo0LbbXz4PkHzW97csmTBjnffFJwJnR6JauecLrXc-nH3_BQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/18] gconf: fix buildpaths QA issue
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
X-List-Received-Date: Mon, 21 Mar 2016 14:48:12 -0000
Content-Type: multipart/alternative; boundary=001a1134bb18854db8052e902f13

--001a1134bb18854db8052e902f13
Content-Type: text/plain; charset=UTF-8

On 19 March 2016 at 14:56, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +PACKAGECONFIG[debug] = "--enable-debug=yes, --enable-debug=no"
>

There's an explicit --enable-debug in EXTRA_OECONF, and reading the
configure --help shows that the "off" mode should be --enable-debug=minimum
as "no" removes the GLib checks which can result in crashes if bad data is
passed to the API.

Ross

--001a1134bb18854db8052e902f13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 March 2016 at 14:56, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9qh" class=
=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[debug] =3D &quot;--enable=
-debug=3Dyes, --enable-debug=3Dno&quot;<br></div></blockquote></div><br>The=
re&#39;s an explicit --enable-debug in EXTRA_OECONF, and reading the config=
ure --help shows that the &quot;off&quot; mode should be --enable-debug=3Dm=
inimum as &quot;no&quot; removes the GLib checks which can result in crashe=
s if bad data is passed to the API.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a1134bb18854db8052e902f13--
