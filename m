Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 99CF07F2F8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 13:06:45 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id u192so2681648vkb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p5A4B6zk0jp33UMQ3+HgsBxgVM+Y0WcTfcYfun+WZEM=;
	b=JM+dsRdJ8yR7JXtS8qKC7n+j+QcDOkUa8dBM9D+K4OE26npJM9JslbrgwmicYvG/l9
	HnPgWYQTj+ZK9Ta3Vlf4sn9/WdH9dnniqI/0JVfYore04wAsuOCMxahvKFISfpHtiJU0
	qNXC5LmkaF5+NlYsGpmbeAum9Anbw2dtxuZZDSRgUHQDfN+S5PhTqBXV+EgLJQoS1yII
	LEfSysZAsibIE/QfFNp996xey7PJH2mdGZIkfTDpnEilFFRxBU9jAjZJd6mJa0RpwqUQ
	kwuviQZ5D1AIcZyMF1jxoHR3VZ4wiEWXT7cUw8vEx5OvdZLx/ze1IKmguvYHECfu3J4s
	vq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p5A4B6zk0jp33UMQ3+HgsBxgVM+Y0WcTfcYfun+WZEM=;
	b=UgfaBfb1VKTKz58wmJAIMKj4Tvnb8XW6wVEQMSBH4jaXvQmqk+nrNxbq7B4bQtzrq3
	M8V6rjvYW8mVh4gcVu/Pxh484+pR5zWsRIs5/t2MgCQeX6xTLCkyUY/ZGaxYzNTftHfg
	s619rTYBahKiYurLYZSDpmE6sJk2+b97LW93xJ+DTQfBVvWi2aU/+VpLQd10di845jKc
	6XiqN5g3kT3zRuNNI9/ge7FFk+PXMB2Z6/LRq/OpcFcUhr9W908S2RPJATNZHaCC7bi3
	C1hpOYe9+qtv13qx41qPReZuaPuXGsK0hgcYvi7JM/9ePw6m20YDRie4FncgrIvz6zK6
	GmUQ==
X-Gm-Message-State: APjAAAUIjzmuoGNP/iREKGA+bXAIOmlI4m9I9Xl4xY+E7Lz4u6L8JVSa
	tN46YbJzQDoHSLo9QJwWA+YdVoxIzd9arR/aHG/ZOA==
X-Google-Smtp-Source: APXvYqz4VsmxcflRWgY80ID0uFXFcJ3CvKWH6wYFRVG4tsOZk8Zo1rl0xj0nyMiLRV4G+udSJ/1TJbt1SMZgC3O10HQ=
X-Received: by 2002:ac5:cc70:: with SMTP id w16mr3946388vkm.59.1568034406251; 
	Mon, 09 Sep 2019 06:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj8kH3Oqp_ac8BsRCRpT4qEqnCg3VYk0LFW4vnkGxnoF9A@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E199@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E199@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2019 15:06:35 +0200
Message-ID: <CANNYZj_OBagcWxfBb0yF80Jr=CmhPg_FND5-V6ze4a4qFWYOyA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Mon, 09 Sep 2019 13:06:45 -0000
Content-Type: multipart/alternative; boundary="000000000000c7c03f05921e7572"

--000000000000c7c03f05921e7572
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Sep 2019 at 13:19, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> ->What do these two sed commands do? If we create /etc/rpmrc just above,
> can it have the right content from the beginning?
>
>
>
> Well, in the environment in Yocto Build system, the value of
> ${PACKAGE_ARCHS} include =E2=80=9C=E2=80=93nativesdk=E2=80=9D as not need=
ed in SDK environment.
>
> And the ARCH name of core2-64 rpm is core2_64 like
> rpm-4.14.2.1-r0.core2_64.rpm.
>
> So I modify the ARCH name in etc/rpmrc.
>

Thanks, can you put a comment in front of the sed commands explaining that?
It would be useful to anyone who reads the recipe.

Alex

--000000000000c7c03f05921e7572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 9 Sep 2019 at 13:19, Zheng, Ruoqi=
n &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujits=
u.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-3955333043397975607WordSection1">-&gt;What do these =
two sed commands do? If we create /etc/rpmrc just above, can it have the ri=
ght content from the beginning?
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Well, in the environment in Yocto Build system, the =
value of ${PACKAGE_ARCHS} include =E2=80=9C=E2=80=93nativesdk=E2=80=9D as n=
ot needed in SDK environment.<u></u><u></u></p>
<p class=3D"MsoNormal">And the ARCH name of core2-64 rpm is core2_64 like r=
pm-4.14.2.1-r0.core2_64.rpm.<u></u><u></u></p>
<p class=3D"MsoNormal">So I modify the ARCH name in etc/rpmrc.<span style=
=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,=
73,125)"><u></u><u></u></span></p>
</div></div></blockquote><div><br></div><div>Thanks, can you put a comment =
in front of the sed commands explaining that? It would be useful to anyone =
who reads the recipe.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000c7c03f05921e7572--
