Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACE1783E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:48:05 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id u12so27927191qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DzB2M5OteVzOYpjNP+EoJOaHRJ81LT4cM6EXf0Xi5Zc=;
	b=Qpvs22CGZaxNPdiP6zinyr+wsj3p2Sev7FsP2pKhUHSpgYKWC4+DNnbEbOdzrrGfM1
	KuWNTx/kOCFcGmY7eqMjpi7PTBGaqxsEI9WFG++oWzHUP5jgLzFMTmgsxKySAh++jNgo
	eqtFWpPLZh+6tKiQau4vELWj2oO6YNJsTIzp4lt4m8L+9NbMHh2CmepFvy/yAIZjPrPE
	Dp0vWLldoR/Lnr7eZ5y/Ttx+2iiQmHhuQuX4nKyy1xJcJmlqBPi+eivihJ18sFNVDech
	Fderwcx0kovwIYQM1Rx4lNnl9lOwnebAnL7q7D8iwCywJv53OaHMAnTkui5t3LJes2j/
	pMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DzB2M5OteVzOYpjNP+EoJOaHRJ81LT4cM6EXf0Xi5Zc=;
	b=O9WxCWV4xoVFxhx620vHpAoPIk1a6wBtth0sMy0Hjf4IGJ882zC4PEIjx133v+pljC
	ILqSjUB7rRPkpcztRbrTm0UGb7NA+OpSQ3bj0NGVGZDDCxJ66LKj2i0GnrTLiCqFZv5m
	A+VynMh9I/NIL296AeE3eiZL9JDYx4rIQT37m2+hciPlff6FmLAAEbt3nIQp3ppC+N99
	yO+75M+lAdYupwrnEVmlAsMn168/JUQno3icR/J/Xvhqa1kmtrtuMizmTWEoyX+0Yjpj
	OjeK0HmonZ+GS8USCYC7s6UYTl6fBQqW8PQljFgiX4qR+YimxH/qiKrTzkKw4f5Vg/+H
	l7hA==
X-Gm-Message-State: AKS2vOyA8adkrakFfIMTTFDplC7wkZdA+/+iTDUQfSDNgnR7RKj1YS1D
	FLMjfaqgxdLyWQ43qLDPsR2M9LMijaD9
X-Received: by 10.55.100.130 with SMTP id y124mr7880313qkb.54.1497545286284;
	Thu, 15 Jun 2017 09:48:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 09:47:45 -0700 (PDT)
In-Reply-To: <1497545468.29576.22.camel@linux.intel.com>
References: <1497533249.3942.94.camel@linuxfoundation.org>
	<1497543585-32012-1-git-send-email-ed.bartosh@linux.intel.com>
	<1497545468.29576.22.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 17:47:45 +0100
Message-ID: <CAJTo0LZ6SdbAv0cHjiHpbKq+WC7-HEG1D4k4XXM8V6xBdJO9JA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Thu, 15 Jun 2017 16:48:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c0585aed30d310552026e68"

--94eb2c0585aed30d310552026e68
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 17:51, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> also, should it be a warning instead?
>

Not if the logic to use the value has been deleted!

Ross

--94eb2c0585aed30d310552026e68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 17:51, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D":39u" class=3D"a3s aXjCH m15caca27b8cdd6d5=
">also, should it be a warning instead?<br></div></blockquote><div><br></di=
v><div>Not if the logic to use the value has been deleted!</div><div><br></=
div><div>Ross=C2=A0</div></div><br></div></div>

--94eb2c0585aed30d310552026e68--
