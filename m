Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B7C65737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:12:12 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so17686135qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iJIn2cYmsMvVhPZQ7OXpc3BhF7xBthAH/9mv/Kv/b9E=;
	b=gkSBrhardSPB/PVPN9jMKphCKpyFu8VjZGDC2kHXKT4KaUA2+fEUfuECxj+9nJBlth
	5zNHM1X2nIh7BUj8vAB2JnYYBIqM8UmBramTNHZsUs9rMV10q/sNK4ygJMA0c9DEg9q8
	yddmkzWEiMmKwDZ3drE8qjAK+2rK4eSv0VkWnB6lux3oApNQX6kBOGmZa1eDu/xYlLKU
	QwJcemvnLycmIBRHo73ne4Ig/AXOuzXqb7A3hoUf/ODcdABtJKc6V2bYePloBiAp/ZTO
	5CbRI3k+43b6SptdOKiQ1Uc20CpMR9TjIyC2je0Pz0ouheQ3/uaEuoaF64535xAr/R9t
	ZSOw==
X-Gm-Message-State: ALoCoQmH+MREIDrDbW6GzDyG1oj7s6wSW2Jx9yhbiat1tWyuBSXfH4ypt0xKY94HJAOsg2/kYX6e
X-Received: by 10.55.212.13 with SMTP id l13mr6908757qki.29.1440087132454;
	Thu, 20 Aug 2015 09:12:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 20 Aug 2015 09:11:53 -0700 (PDT)
In-Reply-To: <53a7964df547908768b1554486603bb4f0d9830e.1440070230.git.jussi.kukkonen@intel.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
	<53a7964df547908768b1554486603bb4f0d9830e.1440070230.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Aug 2015 17:11:53 +0100
Message-ID: <CAJTo0LZgiz9jVRwkyZpAVxv50EwEo=BDBUb0U7M4fBxZexkU-g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Thu, 20 Aug 2015 16:12:16 -0000
Content-Type: multipart/alternative; boundary=001a1147a520f9ead0051dc069cc

--001a1147a520f9ead0051dc069cc
Content-Type: text/plain; charset=UTF-8

On 20 August 2015 at 12:39, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> +inherit cmake perlnative
>

Why perlnative considering it doesn't depend on any native perl modules?

Ross

--001a1147a520f9ead0051dc069cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 August 2015 at 12:39, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":197" =
class=3D"a3s" style=3D"overflow:hidden">+inherit cmake perlnative<br></div>=
</blockquote></div><br>Why perlnative considering it doesn&#39;t depend on =
any native perl modules?</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a1147a520f9ead0051dc069cc--
