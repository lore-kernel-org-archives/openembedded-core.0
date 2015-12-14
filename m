Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D9D9B60796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 23:04:18 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id o67so463257iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iltD7dKutS7BttI6+Ks5sGiyGVaVp34QLL4WzLkwX+Q=;
	b=N/1nEXOcNuOTGFjGeMXGAdCww27KsObv8OAxSmgZ90T4UmPaBBL2cArc1ZNW4ISIsM
	8Q85LcAGLv1XhYd/x+Lq0da81mD6hJ7Sr/V1nuzU49/EBg0rHckKJHZeMtRwRePIiqcA
	rwuW3zUosoxt+0e5UQz8eEDJPAyGSAfVRkUhAoyPpsC1Z1G0evn8HXEpdd9g/V5dGDDm
	J0tVw06iVSZig8JKQwYvz/P0DWJq4hRvMTLfjeP3marB3Vn1+1m3qqu4XuOHqyFrX9aH
	GU0psWo70apfVnLtl6Cw4Vul9mt7b2ViAk6rF9XKSiERP4NyQeixSAMkTOF/Uhx5Vv3F
	knlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iltD7dKutS7BttI6+Ks5sGiyGVaVp34QLL4WzLkwX+Q=;
	b=PuCqR/zRmfgbZ6BXoKDpaDVSydcx02YkXBs6sYzz3OSSZ2ifli6JQPSD/gxkSOxJDj
	HUJC5UXvGGj/Pcpp8kSSWY0Pj3mOaZ0/fy8laU6DRsVmIfGoPJMRlQENvZJ/a1QuV2Gb
	/hNR53xS4LlVLMjhiljZVGfee29wvCmp0KfODZ3O24RiPP/GmNDeZBiWZ0udsf963F9G
	7lqeWPw+k4llWu/zsfS9EMNO8TA9/Kdzv/FkrgHE4/FdtuD92Ix2CT+m6SAaD24zKX0x
	/1a5emS7DbHJlvqxpovwdPisr2M0hpxYgqZvbDeQxiLJClSXVNIWeH4qhLlon4w8XerD
	vfOg==
X-Gm-Message-State: ALoCoQmqFLtxtWDdCWGHBLF0hLHHxsoEN+z/Ang73pfHg9uvUpq1AxTIWlHjgAm94OsgvQpmwxjYh64Gjwe3Anya8O8hyhIKZzqrmb8XHTHUIoMMOnP7YAw=
X-Received: by 10.107.154.131 with SMTP id c125mr9699250ioe.148.1450134258989; 
	Mon, 14 Dec 2015 15:04:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 14 Dec 2015 15:03:59 -0800 (PST)
In-Reply-To: <CA+chaQdQuUXMF2jtNMb3b1P=CoXyenTDcOFM=CjFzA5AS71Uxw@mail.gmail.com>
References: <1450132464-14675-1-git-send-email-ross.burton@intel.com>
	<CA+chaQdQuUXMF2jtNMb3b1P=CoXyenTDcOFM=CjFzA5AS71Uxw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Dec 2015 23:03:59 +0000
Message-ID: <CAJTo0LaLWWaQF4BWpSutXwt6MkbfnNK2eveZjX7Xa7a4=rD3fg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] clutter-gst-3.0: add missing gudev build dependency
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
X-List-Received-Date: Mon, 14 Dec 2015 23:04:19 -0000
Content-Type: multipart/alternative; boundary=001a1140f36862543b0526e3b171

--001a1140f36862543b0526e3b171
Content-Type: text/plain; charset=UTF-8

On 14 December 2015 at 22:59, Martin Jansa <martin.jansa@gmail.com> wrote:

> It's libgudev not just gudev, see:
>

Damnit, thanks.  I'll drop mine and pick yours. :)

Ross

--001a1140f36862543b0526e3b171
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 December 2015 at 22:59, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">It&#=
39;s libgudev not just gudev, see:<div></div></div></blockquote></div><br><=
/div><div class=3D"gmail_extra">Damnit, thanks.=C2=A0 I&#39;ll drop mine an=
d pick yours. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1140f36862543b0526e3b171--
