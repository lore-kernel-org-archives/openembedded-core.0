Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECFD60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:40:25 +0000 (UTC)
Received: by ioir85 with SMTP id r85so83155146ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Pn7kFHQUr+hVuEixbJo2xURaBGXAw36b4mDmkTCUqw8=;
	b=UQKANGsy7ILiTJ5pY8F4IPiwqGXrQF7o40xsGiXBeZ9DsLAGC7jmD50QoVVtcB7CmJ
	r8zEOTg/SMNey3/djULvRzgPux8mte0oTzJFZ7fWgNP8IA3DMdD+KeySEuBpTFSzUqWc
	ePmmvKM7ZSGABLcgJj+xJa8/JZgtGV8IJBtx8Y3h+qZ7vWIMkI5rPK1mVID6r/bGi5Zf
	XGEq3EJsoWlf/l+STe3JkecErg7hm61P4OYYzb+NkrxD3pdcMVBuht0Rx7jXe0yblm6e
	JpMCVoW8WUPhUCIbcAt6HQaDz1ML7PNbLfQHdcOFEzAK3U3p4eNf4RsljAEfNuwL0Fas
	s6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pn7kFHQUr+hVuEixbJo2xURaBGXAw36b4mDmkTCUqw8=;
	b=XvidnmkNBInd5O+B1bGaurnzUNJY1mXOwUB9vm8LhjSzoeQVd9bgdulfx4L/8hX2Fy
	eXvNySCbkKaSuEk+3ZTIkJjBHcm3++0EL4E7E8MqEChioaUqB/T5cwSiWpQg8l52BRlX
	TLhgvGz/G8rFsGYW6fZzsxoy+A/Li2ly7JKanP0XbjzzSPMep5HSHJb2QkhNbherrEeU
	gcAxTVZvy1aYTaMjTMsdt1JwKNac5k+djkd7UgCAosU4BeEnQaKMkRzt7WkaIxY8XTx3
	6pVtQaPbqeIj3tHW+se+8s+CvnIXfMpnLH07mHMwdHUZ64J2eFseAAd2BAQXjdEe3r1z
	MJ4w==
X-Gm-Message-State: ALoCoQnvuIt/9nEM9n+X2JDp4cw2GkcnlP+SWjFufHqQ6ncM3BfEFaOuK+7KWtm4491RZuLLE7t5
X-Received: by 10.107.135.30 with SMTP id j30mr6783149iod.148.1447926026541;
	Thu, 19 Nov 2015 01:40:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 19 Nov 2015 01:40:07 -0800 (PST)
In-Reply-To: <1447781210-23924-3-git-send-email-otavio@ossystems.com.br>
References: <1447781210-23924-1-git-send-email-otavio@ossystems.com.br>
	<1447781210-23924-3-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Nov 2015 09:40:07 +0000
Message-ID: <CAJTo0Lay2uuHV_iT8L2mrNDon7jrL_rGEpa9p3e1LE=KKKTEKQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/4] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Thu, 19 Nov 2015 09:40:27 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a7936b00524e18cbc

--001a113ec64a7936b00524e18cbc
Content-Type: text/plain; charset=UTF-8

On 17 November 2015 at 17:26, Otavio Salvador <otavio@ossystems.com.br>
wrote:

>  rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng
> -tools_git.bb} (85%)
>

This now fails on MIPS machines:

runas.c: In function 'reset_sighandler':
runas.c:535:28: error: 'SIGUNUSED' undeclared (first use in this function)
  for (sig = SIGHUP; sig <= SIGUNUSED; sig++) {

(http://errors.yoctoproject.org/Errors/Details/22001/)

Ross

--001a113ec64a7936b00524e18cbc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2015 at 17:26, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":2iq" class=3D"" st=
yle=3D"overflow:hidden">=C2=A0rename meta/recipes-kernel/<span class=3D"">l=
ttng</span>/{<a href=3D"http://lttng-tools_2.6.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">lttng-tools_2.6.0.bb</a> =3D&gt; <a href=3D"http://lttng-too=
ls_git.bb" rel=3D"noreferrer" target=3D"_blank"><span class=3D"">lttng</spa=
n>-tools_git.bb</a>} (85%)<br></div></blockquote></div><br>This now fails o=
n MIPS machines:</div><div class=3D"gmail_extra"><br></div>runas.c: In func=
tion &#39;reset_sighandler&#39;:<br>runas.c:535:28: error: &#39;SIGUNUSED&#=
39; undeclared (first use in this function)<br>=C2=A0 for (sig =3D SIGHUP; =
sig &lt;=3D SIGUNUSED; sig++) {<br><br>(<a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/22001/">http://errors.yoctoproject.org/Errors/Details=
/22001/</a>)<div><br></div><div>Ross</div></div>

--001a113ec64a7936b00524e18cbc--
