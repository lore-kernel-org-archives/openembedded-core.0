Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id F2201726C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 22:02:12 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id bm13so260206qab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 14:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1487TU/+fz8uMnHva9PsuDoB4KF7G9we1LWCJ5+NJzM=;
	b=hu86noHotL4CHR/ncaq4zAGnhw94ivDXFImeiIKirtU32+0QDaTr7rNBJ9gpBamCoZ
	31rypb5EmggKrNIN+mjmTLYV8qLus3b6R6/7CJuwq2Z06u1u2pnUOb8p/w0xLeeU9x7B
	tysFDUDwxSfLn21lUDIGs2dnP9RLwJdH3dTvxgB+Yqs7ccIhCKEGLjeVqOgoPm8pINJP
	y+Olm3E7HtqtwHQ7VGMYVciA3spDtPG4SAClrLHZajkTG71l8gV0ZkJROSo5SPjWUGDw
	wRk+6+2scvHm8faojEa0lUInCFv5hp0bAp99ifJVqEBAAu+QfhLvVmfZOI8i+SFne8DH
	RcYQ==
X-Gm-Message-State: ALoCoQlVuZr2RA0meY3s1rzB/s/EqZjJYYW8ohfdf0Ez8u3j8eb5ZSlUnj9JFVU6PMV26TUJ1CzP
X-Received: by 10.229.249.68 with SMTP id mj4mr80143605qcb.23.1418853732936;
	Wed, 17 Dec 2014 14:02:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 17 Dec 2014 14:01:52 -0800 (PST)
In-Reply-To: <1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Dec 2014 22:01:52 +0000
Message-ID: <CAJTo0LbDA3djoa8CSsLb+RK3mmrHfe2AqhKz22g0gJprsfNChg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Wed, 17 Dec 2014 22:02:22 -0000
Content-Type: multipart/alternative; boundary=001a1133525cbd84d1050a70a067

--001a1133525cbd84d1050a70a067
Content-Type: text/plain; charset=UTF-8

On 5 December 2014 at 09:58, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> The automatic mounting can be disabled by adding a line
> MDEV_AUTOMOUNT=y
> into /etc/default/mdev
>

Presumably you meant =n there, right?

Ross

--001a1133525cbd84d1050a70a067
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 December 2014 at 09:58, Mike Looijmans <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.=
nl</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":nt" clas=
s=3D"a3s" style=3D"overflow:hidden">The automatic mounting can be disabled =
by adding a line<br>
MDEV_AUTOMOUNT=3Dy<br>
into /etc/default/mdev</div></blockquote></div><br>Presumably you meant =3D=
n there, right?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a1133525cbd84d1050a70a067--
