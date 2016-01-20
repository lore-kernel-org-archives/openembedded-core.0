Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 08F8365CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 16:43:57 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id ik10so104508800igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VKC1apnH5WhBjm6AHc+ESsjM8kjInq66I8VamtTM1R0=;
	b=yfhcrDuG3+UiHbjkU5ZpEEcw1p8+2F12fbfR2fMYLbGfXM5q6hXVB4N3j6GP0pB33J
	NIVBX/03y3jz3Xmdc66H6ySxEa/u3QY5WC/Rxocp6hCRvFOMPISxsGClkQoylsimuqhZ
	tpGNqEX3D5yQI7gnu+vhGu/hIFREVbXMQ7UyxPse1xlmv5HF5j6DBs5aKYLiiXM0mHZD
	IooKnen+vME9hnwQcL7zmLxhB+OTDaXStLZglpbR10P5Bqp97XdmbOU62RraSWKtyjSz
	UqNcEpGMBPcTc0/kIxKcNYwQtthmkNMdrF6F93nkCPeNSFiPX2tJf78zX7w4hjL8SLMZ
	jUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VKC1apnH5WhBjm6AHc+ESsjM8kjInq66I8VamtTM1R0=;
	b=IBIKefe2w2VnxcENJksDZjYTfsU1dZEr1X0mm0odQW5RfwWZBQJBKx8UULD8SWkj8/
	Y9jreAtGzcfUAIbgvGzc+8iShBTZcMmq2Jv5/mSLPVNnsDKqRYDt4ePbmCA0QHgRicl7
	ZWuLf0+cQFBd30gJ8tyvFFj/nDMrDs1KnOb7b5fG2zWNK0zUT/i+201Fpd4OSEweBKMl
	7230cccZAnHyCn4aBF1LHhXZPVI7Zip9W8KKJaKvJITgyxGlcv5q0gqoECuiZsCYe1cX
	5nvRArAwklEKSm15z4ZDDqLtsDcCkUw/gHELvE8K2nbHpY/c9yNxRX3cR33feQPECBVt
	ycxw==
X-Gm-Message-State: AG10YOSjbYW0KAI3gHIkS3qpW5ca83QTONap2t/gQdU2QEoJCGDgd3xa8rciYiI1+I3mxFz2lNzkNKGt1PnLYYoh
X-Received: by 10.50.111.111 with SMTP id ih15mr4765901igb.78.1453308238264;
	Wed, 20 Jan 2016 08:43:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 20 Jan 2016 08:43:38 -0800 (PST)
In-Reply-To: <8a9e3e9cbe3a314c2ad9a2d5f7bfde4752cf2cfa.1453307585.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453307585.git.alejandro.hernandez@linux.intel.com>
	<8a9e3e9cbe3a314c2ad9a2d5f7bfde4752cf2cfa.1453307585.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jan 2016 16:43:38 +0000
Message-ID: <CAJTo0LZE-_XMvYjANPYDJBoJ9-wNgxap7-k9EbzXrjxXTSZB3g@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-nose: Fixes python-unittest-native RPROVIDES error after upgrade
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
X-List-Received-Date: Wed, 20 Jan 2016 16:43:58 -0000
Content-Type: multipart/alternative; boundary=089e0149be344a97790529c6b18a

--089e0149be344a97790529c6b18a
Content-Type: text/plain; charset=UTF-8

On 20 January 2016 at 16:33, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> The python-nose upgrade to 1.3.7 required a new unittest runtime dependency
> after this, bitbake cant find a runtime provider for it when trying to
> build
> python-nose-native, this patch makes python-native RPROVIDES
> python-unittest-native
> to fix the issue.
>

A more accurate shortlog would be "python-native also RPROVIDE
python-unittest-native".

Ross

--089e0149be344a97790529c6b18a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 January 2016 at 16:33, Alejandro Hernandez <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejan=
dro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":iui" class=3D"a3s" style=3D"overflow:hidden">The pyt=
hon-nose upgrade to 1.3.7 required a new unittest runtime dependency<br>
after this, bitbake cant find a runtime provider for it when trying to buil=
d<br>
python-nose-native, this patch makes python-native RPROVIDES python-unittes=
t-native<br>
to fix the issue.</div></blockquote></div><br>A more accurate shortlog woul=
d be &quot;python-native also RPROVIDE python-unittest-native&quot;.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--089e0149be344a97790529c6b18a--
