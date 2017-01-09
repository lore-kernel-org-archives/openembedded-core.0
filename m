Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id C717C71AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 10:13:40 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id v23so131286850qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ane5E07t2lzYJX5SicXUdpkGOxyKONSeUwg8nII71Mo=;
	b=rUdlBunTG75r68BWaR/ZqlIEkXjkuloSlD59X+sK8p0ev5+6+L/+Vx0AeIoDCkeSUc
	rPQBxpRqWW1INJ8EMQ3fjNhfvBe8nj6QfYAyolwVsSoAvL3xOt+AsI7Dd9UxccS5IYFn
	CP2PzGyZ6aoCLI8Eh/hWtlQV+UUYNxsZvrp94Orq7tJjQER5MVBLCDzaszw/f4ErqLzj
	yg/+jPv2mVUjEtBbTQaaZM0gguP5xCRWwa6TVlpL3Zy8boY02avCqx+VksnGBVK4g2n1
	Dewus0mmHZiDKWzShoPw/aPsuByKIhs5qDv0lqzWRCPpyVc750SIjk1pnGsEeicermea
	rGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ane5E07t2lzYJX5SicXUdpkGOxyKONSeUwg8nII71Mo=;
	b=VJdkiDerKUsaTxVpSNZAPQptxMPfRN4lki3HcvhMiRGoEPdllT+h7L+uBbYesH/ODn
	mCzB4dHi/Im2BU6/pc9P2BvNal8xEBvOBxzqBZvxV8G4zlY5Jotr7vRth5n+Z04hE8A6
	lCwZjSQP8yWlFVTeUHR5JQ11iaoKWbBgN2fIZ619A2te+R8xlr57hG+2GCAztUhcApBZ
	xOZApQrc+9FTR9VJR5rlbwV1QJE/sqFkrWOr1k/LgBqSZ3G4+0Jn2GiObm25dnhehUOx
	OMmkSMaB3sbXX9CAeBfdMYzH/02Y4bV2FtPhp+M7b+YIJbkguZuSICAJKnex5mwPIVF1
	s4DQ==
X-Gm-Message-State: AIkVDXLGXuzRMU8EyQl9ysS0JWMcGTvDmwlOzwAaO/1omU4knkn88SiMt+ZF+YD/WOv/pVzWDDxmkomyLtN/Wsqn
X-Received: by 10.237.62.232 with SMTP id o37mr18524866qtf.188.1483956821380; 
	Mon, 09 Jan 2017 02:13:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 9 Jan 2017 02:13:20 -0800 (PST)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73204A3A8F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1482732918-8881-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZoYUtoD-J1HWkZ4kZ_GmCWf3p9ekqQjiZYLax=snsTcQ@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73204A3A8F@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jan 2017 10:13:20 +0000
Message-ID: <CAJTo0LZ4ZwA9tHJ9=SjR7MfYn4boJ01ADK-PbvmhQgCLSgZ6BQ@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2 4.7.0 -> 4.9.0
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
X-List-Received-Date: Mon, 09 Jan 2017 10:13:42 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e33797c0545a69f1a

--001a11406f0e33797c0545a69f1a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 January 2017 at 01:23, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> I just refer to previous =E2=80=9Ciproute2-4.3.0-musl.patch=E2=80=9D patc=
h to produce this
> patch, So should I write Upstream-Status tag as same as last patch or mer=
ge
> iproute2-4.9.0-musl.patch to iproute2-4.3.0-musl.patch =EF=BC=9F
>
>
I'd squash it into the existing patch as they both do the same thing, then
you'll inherit the Pending upstream-status. Though submitting the patch
upstream would be much appreciated so we don't have to maintain this.

Ross

--001a11406f0e33797c0545a69f1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 01:23, Zheng, Ruoqin <span dir=3D"ltr">&lt;<a href=3D"=
mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujit=
su.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"=
MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US">I just refer t=
o previous =E2=80=9Ciproute2-4.3.0-musl.patch=E2=80=9D patch to produce thi=
s patch, So should I write Upstream-Status tag as same as last patch or mer=
ge iproute2-4.9.0-musl.patch to iproute2-4.3.0-musl.patch
</span>=EF=BC=9F<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:=
&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>I&#39;d squash it into th=
e existing patch as they both do the same thing, then you&#39;ll inherit th=
e Pending upstream-status. Though submitting the patch upstream would be mu=
ch appreciated so we don&#39;t have to maintain this.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11406f0e33797c0545a69f1a--
