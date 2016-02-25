Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB6F76651
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:19:53 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id y8so4386858igp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HlII4BsXHqDhQtj4fDcrLpkFQgkEeTLxKUeJfm+7IVc=;
	b=Fc5GdcjmBcK4TZA2Hq0C24/qsGiqgq97BW80TCXfdMptmkzIQpP7zqZ/dZUPph605l
	KcLmKyHD3O18mPjR5FDiYnlosX5LQnvdvkSQZhURzV2Z3jVTtNjvFdF40XxurADch8rB
	LCvX55Kt0ZSn62de4fBk6Nq2k6nKPrShW+RvrOQY+QVlyxRlRQi9zrnYyibYUogKHHZR
	vcMSE33z4VVZhhESqZdfaRy71dXy9DEMxTH7WTkzIG7mIv1JZC1XU+yZqyNu9j+73auJ
	usXUUG0JUQqj8r2rQBAMAk/PVU5z1zj14rGyhWCkP0nL3/z8tCzTzpHgRIrbf037B54Z
	VATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HlII4BsXHqDhQtj4fDcrLpkFQgkEeTLxKUeJfm+7IVc=;
	b=cENumA9VeRhLsmKHD4uHdZlkVJeEHFjTu3Dc6WrTwf9ub51qk3TLDMtO1aHY5Bkms1
	OC1FJoNPvFiq/TAdlgMS4l31LVQGTR4fEh3sRRs4EmKtDE+A/yRg9duWwwJlYQdHURjH
	0gHvotg+7RM1iJzpHghRClXhMeN6aq0kEfSkWiJvpr9x0XMg90CI49lJ3FmYb9NQFJeZ
	G80of89Okio+Y5f5FqKA+YfEWqC+28i7n9pS9J73+nQR5M09WxVmrU6jtT1ETOejerKX
	24wbgGcwWY/e/9Rg8a2tOKKP6n84MrOKf1WhNlBP/0FEagZfMebN4qYtYO6WTy6lUgds
	We4g==
X-Gm-Message-State: AG10YOS0hnv01PZTKLSOmhKafxsQAtNSYXc9WhdzRqp5W2kryDlrmYMjgvoc03sBJ1rZ2mfl0YIax7SUyI1KVte0
X-Received: by 10.50.97.71 with SMTP id dy7mr748299igb.78.1456366794605; Wed,
	24 Feb 2016 18:19:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 24 Feb 2016 18:19:35 -0800 (PST)
In-Reply-To: <20160224162044.GF2560@jama>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
	<1456148105-9644-8-git-send-email-derek@asterius.io>
	<20160224130413.GD7560@jama> <20160224162044.GF2560@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 02:19:35 +0000
Message-ID: <CAJTo0LbATKddvyLZNh2d+AHOnyPn2q8dmBQJebowa5CejxuXdQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Derek Straka <derek@asterius.io>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python-setuptools fetch issues Was: [oe] [meta-python][PATCH 08/11] python-mock: update to 1.3.0
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
X-List-Received-Date: Thu, 25 Feb 2016 02:19:55 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc174a5aa052c8ed134

--047d7b10cfc174a5aa052c8ed134
Content-Type: text/plain; charset=UTF-8

On 24 February 2016 at 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:

> distutils.errors.DistutilsError: Could not find suitable distribution for
> Requirement.parse('pbr>=1.3')
>

Missing DEPENDS?

Ross

--047d7b10cfc174a5aa052c8ed134
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2016 at 16:20, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":e84" clas=
s=3D"a3s" style=3D"overflow:hidden">distutils.errors.DistutilsError: Could =
not find suitable distribution for Requirement.parse(&#39;pbr&gt;=3D1.3&#39=
;)<br></div></blockquote></div><br>Missing DEPENDS?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b10cfc174a5aa052c8ed134--
