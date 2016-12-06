Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7E65871A84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:46:41 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q130so201770576qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tsWdK4nXhNF4fW4cJA3XM9JtkmETphbh6oP3vB9rkLM=;
	b=Kafixp3h8UjQ4rFYEgsbDvw4t2btz59qLcpS8JhUqAnqznSMj/54YXbgVUnsQGRfNE
	Rctv1AVu5c1BxZ06G21dfMkEk4LS++5rxlkZttTQyknzSswANI9hsOzKRPsWw7xA8W8X
	UThXmhkUkql1Adhh/cszNxVH0fEuZzlikDXkI8gQkcAErzlF8FASbxPaf1lCkBcDaqY+
	ev9yMv41x+miepz7XcdblWPkGxvMajtBWB6Wv7Z+unV7IafuGM2BtJRNQL2Iz/NgPfpW
	p4N8AptTzrkZZTfmfA3TJg40IImAciCt8JjbmmAhvuV1gzYkE/7MZZjnvECyqzStNRSR
	YmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tsWdK4nXhNF4fW4cJA3XM9JtkmETphbh6oP3vB9rkLM=;
	b=SFX1L3pHGOtydXAdt7wzjb8uZJqYwua08OJ45/M2zd55fXdxncBY5YMQiRGYLhDBHO
	LiiWahk++Hh4F8AZnB5dbOhGu1kx2zm0a1u/oCFcSqOc7kPJkWbIdsNfpseS8AHhoExw
	6junm2lxBAw8ko7yrjJvfJ8y+q5yCRdF08SVhiwH90TF81yyNzrexoQSia5QeUJWDi4J
	fdpa8SKjRp1mIZNeGuUPGB1hT9NdqxETVoEP4yeHc4Tx+KEvVnZuZqYLHH/F8E96a2yS
	WYuazJuxQxvalPdDrtCzXd2jHeYZgRaTaNnlCRtIEXqCBaZSSu3Q8TFySXnUimviVDmz
	LCfg==
X-Gm-Message-State: AKaTC00S6eAexKQZuLL2guwg0yO/CYg/9nDqTC7a8ze1xrZ8anXr/tb59r8M6KYy4MCRM+2Gmz6AxO1ke5+s+kuj
X-Received: by 10.55.39.88 with SMTP id n85mr54570972qkn.244.1481050002636;
	Tue, 06 Dec 2016 10:46:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 10:46:22 -0800 (PST)
In-Reply-To: <022c6339-1f2f-bd63-c8dc-1a6f74fa1eb2@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-22-git-send-email-obi@opendreambox.org>
	<CAJTo0Lb2fVvMAtrTFLQwMjWhubMyF_Cbz7ccDxgsdHPmKnwruw@mail.gmail.com>
	<022c6339-1f2f-bd63-c8dc-1a6f74fa1eb2@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 18:46:22 +0000
Message-ID: <CAJTo0LZ_oxdqybeKNjM=LU6vUm_v5-+9GOVUamL8Vf7XZufB5w@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/33] package_manager/deb: create Packages.xz
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
X-List-Received-Date: Tue, 06 Dec 2016 18:46:41 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b164d8d5e054301d3e5

--94eb2c094b164d8d5e054301d3e5
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 18:41, Andreas Oberritter <obi@opendreambox.org>
wrote:

> That's a good question. I guess I didn't add anything, because there's
> no direct dependency in place for gzip-native either.
>
> I don't know if it counts, but there's a dependency on apt-native and
> apt's source tarball, like many others, is compressed with xz. By
> default, apt also depends on xz because of PACKAGECONFIG = "lzma", but
> that may obviously get changed by users.
>

I guess the use of xz to create Packages.xz should depend on xz being
present, and then package_deb should explicitly add dependencies to the
relevant tasks (as it does for do_package and do_packageindex already).

Ross

--94eb2c094b164d8d5e054301d3e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 18:41, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2qr" cla=
ss=3D"a3s aXjCH m158d5710cbf1fcd3">That&#39;s a good question. I guess I di=
dn&#39;t add anything, because there&#39;s<br>
no direct dependency in place for gzip-native either.<br>
<br>
I don&#39;t know if it counts, but there&#39;s a dependency on apt-native a=
nd<br>
apt&#39;s source tarball, like many others, is compressed with xz. By<br>
default, apt also depends on xz because of PACKAGECONFIG =3D &quot;lzma&quo=
t;, but<br>
that may obviously get changed by users.<br></div></blockquote></div><br>I =
guess the use of xz to create Packages.xz should depend on xz being present=
, and then package_deb should explicitly add dependencies to the relevant t=
asks (as it does for do_package and do_packageindex already).</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c094b164d8d5e054301d3e5--
