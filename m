Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5F977E13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 15:21:57 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id t26so12213038qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=os3SDwnP9YKS+lsStEzLK1evc77b3nWn5GEnd0mrl2I=;
	b=Q97GngkH2KA3OR4poHbt3WdPkKD6jRDG6vKVwB7tVBg0gaS1zHRWv7Xpx1sJf903XH
	srYY0Su48ZKKFVoQ+6efBBRn1TIH05m1DxDf1W2yfHC4V3cfMqnMpj7B3ko+x5w9SYKZ
	XWr7/W60maPIow/PX8So2l5KiCg7/pzQ9aOc7TaZ3CMV/JKHPvmFpGW5kYUIv7TVO20M
	ff3qmiJ8KSNkY/aftTK3bRdgl3riJr9EDybr0vJNaEF3FdeZG7m0JxZAXVGJPF0r9cRL
	BcnnVUNDmtFVCdmKc1cb1gYqe5fevqXsKC6qmAz6Kb3ASHwFMdBqrqfdpaFhi/5ydaH4
	kDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=os3SDwnP9YKS+lsStEzLK1evc77b3nWn5GEnd0mrl2I=;
	b=HlVMDAi8pHuGrdjT74EMUvnfTR+w28u02bgeNdcBBKyxHC5QtUW0RL09LWAOY0cYqr
	SKuofKlPk3UyEzFCpssta4eyf6yZJMG5tbPU54QQ7JQJyZvgKzlSM50KJFL/k6II/+vi
	kuOcveQzEba1obZXjAP6+ZEaJN+RwQu0oPMjvVCT056O31bI9WV8vMa2gtGkl5uYhmVT
	kdOMTSxS25E2eHLZHUMltlZvJYlLubU2HuL6v3hMrrXAfkQwof4OfShxtadJkprEVMXK
	FmPOsGrMNSZ9aT0acYtwowYKytyz/mmlEwKMJ42OGU0h7PxlgBrS1XudULvH4wkFUv5r
	NR3A==
X-Gm-Message-State: AODbwcAq+6PsalWVxAcIw63kBmAekA9oL4K/PdoxB7wlbSztpyeozztN
	D2haqIBfkzTmDbwDQ7uHU5yO/M1Q8Lfn
X-Received: by 10.237.36.219 with SMTP id u27mr3861599qtc.197.1495034518170;
	Wed, 17 May 2017 08:21:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 17 May 2017 08:21:37 -0700 (PDT)
In-Reply-To: <20170517073138.23672-1-Martin.Jansa@gmail.com>
References: <20170517073138.23672-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 May 2017 16:21:37 +0100
Message-ID: <CAJTo0LZ4WBk8dtPmjMO5cDcsuz7QXnLaJdDLxc336zPNEJy-vQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-3.5: add runtime dependency from python3-compression on python3-misc
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
X-List-Received-Date: Wed, 17 May 2017 15:21:57 -0000
Content-Type: multipart/alternative; boundary="001a11406ef062056a054fb9d9a5"

--001a11406ef062056a054fb9d9a5
Content-Type: text/plain; charset="UTF-8"

On 17 May 2017 at 08:31, Martin Jansa <martin.jansa@gmail.com> wrote:

> * the /usr/lib/python3.5/_compression.py file is possibly incorrectly
> included
>   in python3-misc, either it should be moved to python3-compression or this
>   runtime dependency is needed in order to use e.g. gzip.py in runtime:
>

Sounds like that file should be in -compression.

Ross

--001a11406ef062056a054fb9d9a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2017 at 08:31, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":15p" class=3D"=
a3s aXjCH m15c15526fde00f90">* the /usr/lib/python3.5/_<wbr>compression.py =
file is possibly incorrectly included<br>
=C2=A0 in python3-misc, either it should be moved to python3-compression or=
 this<br>
=C2=A0 runtime dependency is needed in order to use e.g. gzip.py in runtime=
:</div></blockquote></div><br>Sounds like that file should be in -compressi=
on.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a11406ef062056a054fb9d9a5--
