Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 250C26093B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:04:21 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id f187so2380354itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ffjJBtsCrrsNQWeeGKbZoFvYAz5QHiROnSpyMELZTn0=;
	b=NH7AMWbDnp0xXfWqxi/oLBfBkbRSaZIPbzN+a5AbuuojsO8URcr4QhjAS7WLDLJ7P+
	2aPk/L/SHHQPXvZXwZlqvljaQsFxL80kOmuMXf+WegDAYiSZHhJcnkk9iaFD/iBoBRc0
	FMiFWb9c5omKqffssdc1zxPdspoY1mDWCvfEbekNcgFErf1RXJ1uVzmF2uCWSUmhfXpy
	B57l6tT1vnp6DpmiAjul0l4/JWQUH53GdjAszaaGrdPjSFt0KJ5Hp+iTQLkQAcCZR2uw
	vOZkAgQPyXIWm+0kkw38TtM94Y7gb8q+HUAFmNYCvjRIcoPUdzGPdQHJMU39nLI+5Ksu
	WGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ffjJBtsCrrsNQWeeGKbZoFvYAz5QHiROnSpyMELZTn0=;
	b=RkqAF2mI4noBnouLTS52vL7km7rfFHeyx70ZZoJLddHqL2X1djjTA6jip2xRNFaZKJ
	tMosoH2G5UkgS45JUR0IoNAdSxUQ8elr2v9o5s9/YNYILq7LPOoxZboeE0zcAhzsaKPQ
	r1bOXp+s9caFV1utH1VVJ95TI9vnrwfg7LRNMb008OpX3v/NmuLK4CVMiFcAyr8kb2fq
	4vvyhYxnOFbxVTovOL4atyeSccHGjitECN5k2TO2a+PxYZndn0ypH9qvQ9lur1fxSDMJ
	wmzrynEt2RWIWEJu6rwk8njMSPrNT3yRsXTQJmHHMvgE5pO1DBIRkHcdOEVFZ4yPY5Xf
	xONg==
X-Gm-Message-State: AMCzsaWIKW0vHIvRdSzn7+vHtj3aKdoHxeTf8duHVjmiRlu5A7Rcr1vX
	t4X1DpBDOpVwy+U0Efn+p0gjF55wwTup3U4wZdiB+A==
X-Google-Smtp-Source: AOwi7QDMZmozSeDXLrdYvapMCFzPMa1mau31N8kINtGYOWR8DZnXuSZRgg16ZM/xzstfaNlO7VqFgIxZLvS9MXuQLwE=
X-Received: by 10.36.197.129 with SMTP id f123mr20225518itg.27.1507640663210; 
	Tue, 10 Oct 2017 06:04:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Tue, 10 Oct 2017 06:04:02 -0700 (PDT)
In-Reply-To: <1507640372-934-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1507640372-934-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1507640372-934-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Oct 2017 14:04:02 +0100
Message-ID: <CAJTo0LYL8f52cGGG1OAsGP9OTG3_tHBRrcPy_Pvhm7CqZ2-FSg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] at-spi2-core: 2.24.1 -> 2.26.0
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
X-List-Received-Date: Tue, 10 Oct 2017 13:04:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c07aab02e13c8055b30f238"

--94eb2c07aab02e13c8055b30f238
Content-Type: text/plain; charset="UTF-8"

On 10 October 2017 at 13:59, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade at-spi2-core from 2.24.1 to 2.26.0.
> 2) Delete one patch "0001-nls.m4-Take-it-from-gettext-0.15.patch", since
> it is integrated upstream.
> 3) Modify one patch "0001-nls.m4-Take-it-from-gettext-0.15.patch", since
> the data has been changed.
>

Wrong filename here.

Ross

--94eb2c07aab02e13c8055b30f238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10 October 2017 at 13:59, Huang Qiyu <span dir=3D"ltr">=
&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangq=
y.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1) Upgrade at-spi2=
-core from 2.24.1 to 2.26.0.<br>
2) Delete one patch &quot;0001-nls.m4-Take-it-from-<wbr>gettext-0.15.patch&=
quot;, since it is integrated upstream.<br>
3) Modify one patch &quot;0001-nls.m4-Take-it-from-<wbr>gettext-0.15.patch&=
quot;, since the data has been changed.<br></blockquote><div><br></div><div=
>Wrong filename here.</div><div><br></div><div>Ross=C2=A0</div></div></div>=
</div>

--94eb2c07aab02e13c8055b30f238--
