Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9826575A31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 23:05:59 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g73so140366715ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 15:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Fsd6b76nc5t4v//DqkULVuK/CLHpHchaES+uyRupwOE=;
	b=IdbI8I4ehr27t8z7y6fBv6U6AcHdVyZ2JHzKB2gWJz6iBDUnR2PnliFkwcu3J/1KlT
	YA1Ze+ixul2qCp6hUdQqEFdRlZg/iqHwXIlzCC1OAzSub6tAB2IJOZ2gfP9A0EsUMQN5
	ljToegMiXWAJ1pYf4I7m1RGcrV012fY4V9MEypF4jrxpK2XbdS9u2nGeiKL/3pXuGtz4
	IawjdSW6yie713wF+6HpElmGCLlvBhXeBoyN9z8dNFZpp7d9NdY8u7d0uMRxZ/nqvbbQ
	iTX5LhYfZ9vXAvbPxoEEMhMJIrVmgYNa6aAnbBJfwEK+A/bmaPv2RX/JRtKK/xyuG1ZM
	stWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Fsd6b76nc5t4v//DqkULVuK/CLHpHchaES+uyRupwOE=;
	b=TxLGt7gdCCTpmEOTd8nMuEMioM/SvgRDYhs11CZK11brmSK4QMaCBg0pEfUMCF4w2j
	BoRacvtOTGc0nD3PV6Lxcyh81ksHzgsaCoNxRoWg2a+6c5UVzl/EN8oEDz0wLk84t1gf
	/JReU0+NetFvwBYjPFYn6homKOairrPmfVodxu0uqGnWEncZiOmqb99XkOAdnSJTcWXM
	b5MfwVLCyUvEnn8p08/G56wFHsG8WnAM+4BW/zcAyf9VOz3QVmV7xTPvsWRp2mFLZK8e
	kyqJHYUAGnm33i0xdBmfvLveNIN+2JHJvcFAxEzGVeIdHL4kuWSqMqp+MVOC4AnLGdNi
	CNVg==
X-Gm-Message-State: AG10YOSxN4mPeOKQamGu9UcCz92TpWEGu2zSEKJtCJNAyrVmAUVpeKMQ6jRbOQs/k8+CinImYdDC3H5eTMPhAwqI
X-Received: by 10.107.10.157 with SMTP id 29mr5503616iok.133.1454281559973;
	Sun, 31 Jan 2016 15:05:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sun, 31 Jan 2016 15:05:40 -0800 (PST)
In-Reply-To: <20160131215146.GB8889@windriver.com>
References: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
	<1454273105.7421.24.camel@pbcl.net>
	<20160131215146.GB8889@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 31 Jan 2016 23:05:40 +0000
Message-ID: <CAJTo0LbcJUi11Jm4wBXL3w6BQQL-3kLh12T8Nj8x-urTNO=ydA@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xterm: revert FILES_PN change from recent package uprev
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
X-List-Received-Date: Sun, 31 Jan 2016 23:06:01 -0000
Content-Type: multipart/alternative; boundary=001a113f8df8c936a5052aa94f10

--001a113f8df8c936a5052aa94f10
Content-Type: text/plain; charset=UTF-8

On 31 January 2016 at 21:51, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> Of course you are right.  In my defense, in poky, the full path is
> meta-openembedded/meta-oe/<....> and with two references in the path to
> OE, I think I can't be the only one consistently getting confused like
> this.
>

There is no meta-oe or meta-openembedded in poky.

Ross

--001a113f8df8c936a5052aa94f10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2016 at 21:51, Paul Gortmaker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":4w7" class=3D"a3s" style=3D"overflow:hidden">Of course you are right.=
=C2=A0 In my defense, in poky, the full path is<br>
meta-openembedded/meta-oe/&lt;....&gt; and with two references in the path =
to<br>
OE, I think I can&#39;t be the only one consistently getting confused like<=
br>
this.</div></blockquote></div><br>There is no meta-oe or meta-openembedded =
in poky.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a113f8df8c936a5052aa94f10--
