Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3015E77181
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:32:12 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id ik10so83197717igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zlUYKanMuFpb7ZsEQGFcTT/Pblh/B5ryKwxWyEGuNWo=;
	b=sZE3JUuvfdxZUcbeJgrp2bLcP+Hf5XZzE3f1KNJ2e3VflTtm3BmHBFLR7GsVjhkykW
	MBeWWh9rGBRjU8c6Xo9kFDTN8cU5cEVQXQTuTa+Er52JZaX2yXg7rMOJDDDb6Nf/Yva1
	QmgHLa5l3pUc9OGAUKkna7TI2oGPuL3KFigWYM18yPWRKRlFFCVQJHHlVTJ9NV6oyyFt
	hGknItioHQDDP0UGBV3+P7jviOOYumxfvg83ZTer/jxbCo091ET3POgpJX3YjDckoC7D
	xUaYVbCPy1MZRH/HD0fx1gzQqczzbeNN/a8K5FsdN8sV2eVP7JJkAIaVUcR9P0MEvZrb
	EZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zlUYKanMuFpb7ZsEQGFcTT/Pblh/B5ryKwxWyEGuNWo=;
	b=fcgB5Ko87ST2dEehB7KxU4RsuJJgYau7GlKy2LXrBY52KYOlvXkFQrsmdToYkaK8UW
	cpj7MSCCV1DLY+/r3ymk/GubofIcq9IMCKUDe4CpFMNU5+Upj+mzFiow2RtbX0rIM0W4
	jbE38ZInmt4aestr1w0Wb5OxBb+LQ1dfKEtAJ6SF7zQRzkOASvdud7Kyp67W5Re8Z+Pg
	UPyhpCqjjoBhA+Vi8NBlojjeXI6/aILaCW+NdCsct7vaPZkMQsCzAeEw6vpXRKKihYpj
	Q9XXC5Nh/+P5D7dd7l8XPqCqg3HoxLqfKMblbgoM2F56EMCnaWCsp35NNagfP1e2kWVr
	Gpfw==
X-Gm-Message-State: AG10YOQP5YsVRIiCFGEKjwEUtSJsPnshbzKU+AoeJhx/lhrCYj2ACokOCuhp89xKt4H0R6C2ii//IQuc6x204pf0
X-Received: by 10.50.13.100 with SMTP id g4mr27894270igc.64.1453908733109;
	Wed, 27 Jan 2016 07:32:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 27 Jan 2016 07:31:53 -0800 (PST)
In-Reply-To: <20160127141013.GE2574@jama>
References: <20160127141013.GE2574@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jan 2016 15:31:53 +0000
Message-ID: <CAJTo0LaD+n3yj+wQit+BQ+7jvsYPc2P8aUyLzC9kNwp8u2uChQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-01-25
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
X-List-Received-Date: Wed, 27 Jan 2016 15:32:13 -0000
Content-Type: multipart/alternative; boundary=089e013c661492fe99052a5281db

--089e013c661492fe99052a5281db
Content-Type: text/plain; charset=UTF-8

On 27 January 2016 at 14:10, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * /openembedded-core/meta/recipes-kernel/cryptodev/
> cryptodev-module_1.8.bb, do_make_scripts
>     * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb,
> do_make_scripts
>

I can't replicate these with qemux86-64 and current oe-core master.  Do you
have any idea what could be causing this?

Ross

--089e013c661492fe99052a5281db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2016 at 14:10, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3qc" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 * /openembedded-core/meta/=
recipes-kernel/cryptodev/<a href=3D"http://cryptodev-module_1.8.bb" rel=3D"=
noreferrer" target=3D"_blank">cryptodev-module_1.8.bb</a>, do_make_scripts<=
br>
=C2=A0 =C2=A0 * /openembedded-core/meta/recipes-kernel/lttng/<a href=3D"htt=
p://lttng-modules_git.bb" rel=3D"noreferrer" target=3D"_blank">lttng-module=
s_git.bb</a>, do_make_scripts<br></div></blockquote></div><br>I can&#39;t r=
eplicate these with qemux86-64 and current oe-core master.=C2=A0 Do you hav=
e any idea what could be causing this?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--089e013c661492fe99052a5281db--
