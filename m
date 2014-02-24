Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8546E3E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:09:40 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id fp1so6360873pdb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=+fg88PZHW2SXZbpRnen5AY1k3KY16u86wtlxzN/KLPs=;
	b=V7sB3tvTEvB125X06pZsdNcNBOxfpVWZpSIjV1jYnyLAsR1n4ezUyVHIwVqw+myKmO
	3BjM46R8UctRzm3oVsACGweqLtq2huhqbopeCNg5fRaWXap+F8iPadADOFkv9VdQHIaV
	hRL/0xUEcetjevspkRdcb/LzzqNHink5NHRChS/9p9Y7XgqJA8BxHDI9mudwbpX3Ls4Z
	vs9ThDVeXsQzCCFloACiCqlLXxcxeA2ceKuPeRBjf1FSfSJz4vy6gDIWGeF31K66P6tZ
	N5XibXJ1Us2M5NLpTUf7WIg6yyg1+aRAgLHoiOBnMffMeQ0EDWZgKvNOptxiESWSM//f
	B7uA==
X-Gm-Message-State: ALoCoQkWTwdMV6Wu9CdXwhX2PgPQ6Y/wL9of0XfMYhGhou6QrkXMJB4oOL4G9OdHvC0SkBVgJNv7
MIME-Version: 1.0
X-Received: by 10.69.2.2 with SMTP id bk2mr25276766pbd.75.1393250982109; Mon,
	24 Feb 2014 06:09:42 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 06:09:42 -0800 (PST)
In-Reply-To: <CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
	<CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
Date: Mon, 24 Feb 2014 14:09:42 +0000
X-Google-Sender-Auth: LaE-0bL-A7ghpkbxgtGbXp3OaLw
Message-ID: <CAOMwXhPiWGre5UiVtyVvVc2L7G3yf79LKF55VKwuLtTd6ZRBiw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 14:09:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 1:40 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Feb 24, 2014 at 2:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> I just tried this with the latest master and it is only looking in
>> the meta-yocto layer even though there is a conf-notes.txt in one of
>> my local layers as well.
>
> hmm. i just tried too. i create meta-layer with:
>
> $ find meta-mylayer/
> meta-mylayer/
> meta-mylayer/conf
> meta-mylayer/conf/conf-notes.txt
> meta-mylayer/conf/bblayers.conf.sample
> meta-mylayer/conf/layer.conf
> meta-mylayer/conf/local.conf.sample
> meta-mylayer/conf/site.conf.sample
>
> then, if I run
>
> $ TEMPLATECONF=meta-mylayer/conf . oe-init-build-env bbb
>
> It is working fine:
>
> ### Shell environment set up for builds. ###
>
> You can now run 'bitbake <target>'
>
> Common targets are:
>        my-custom-image
>
> You can also run generated qemu images with a command like 'runqemu qemux86'
>
> I tried with up-to-date poky, e.g.
>
> commit a1faa7df2a0972fa631d3aee98c59f6b0e8eb43c
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Feb 24 12:57:38 2014 +0000

It works with dylan, too?

