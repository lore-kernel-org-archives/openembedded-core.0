Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 30EFA71A81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 15:53:20 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id s140so190155092qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mSMLZcx+//7/CHKIloh8sOlewUFhwoPcckU1OkPFArU=;
	b=dkm8QQS49hzZr2CmcFUuh3PKdggEHmEqy2VR0HMBuARfAvIEczh+CtnQ+082lVFZJd
	5D3MaEOI0cihQH7fuSe7pTDM5+2QnjLK20Ybr3xntWd5RZIozCp1m8gCHO4eTnn66vGB
	/Dcr+gk6FxiCVoAVR9xfqTUA2yb3V79YtHpKgvoblM0Zw8l6V+GnqkN/5qCwXssS1deu
	STU7RTOlNAu4IVumQJW79PC4IuFYusAcyrTNYI8EZEGPUwj6bqbRJ0HYp6Ptu0SK3IFz
	0UVWp2kBTye3raf7NK4nSukRYICZ9hfwveJyByVunyGUqGIzdBfOJcbDNwWYywrj542w
	KzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mSMLZcx+//7/CHKIloh8sOlewUFhwoPcckU1OkPFArU=;
	b=n/NfPBTu/IuFgy69iM+f16K7VP8OuygU6OFQrPXotXoNCIHv1mqLMS6DhZISvRnMcT
	g2Dv7t4AH/GICLA3pFbDAlYZlakM1ARUzBvm4z1jE0nXxfg5OmXmYx8JtIoWJkgdq7Ij
	WLHvKPbsIQNZV7hTGcCJ65wB366SEmRCCY4ZoqRBHe50qV/3LnmvpcMeRi/3gF8MNoNR
	RsbEwQC17Oi4mxyCTX4wHgxwI0pPTMHw+GUGpCXCC179WP7cVdcpUTyOgY/hk8Pp89Qk
	FwOjkfbjXFsM6nUm34Lv3xSnoq/yD/aGhC6oG7Yt5+I6bC27F33/TJgPEXzyqbxqaqbc
	BRSw==
X-Gm-Message-State: AIkVDXKzMUFG57i8LaAci+srR2kfLfFHoz3dv2UmDzRuH//9eUbADl5x8mPOqL8wvCWNXFYJT+hZGrWkf7wJ/SVg
X-Received: by 10.55.207.78 with SMTP id e75mr10114736qkj.36.1484150001143;
	Wed, 11 Jan 2017 07:53:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 07:53:00 -0800 (PST)
In-Reply-To: <1484149497.3966.17.camel@pbcl.net>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<1484149497.3966.17.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 15:53:00 +0000
Message-ID: <CAJTo0LbXhWycY34OB=_nqRLDZJ1+Nge69sBc7KQPFUWphewsfw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 15:53:21 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b89ca6a00545d39967

--001a1145b7b89ca6a00545d39967
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 15:44, Phil Blundell <pb@pbcl.net> wrote:

> The log message for this commit is a bit misleading.  Glibc 2.25 has
> not been released (and the release is not scheduled for another three
> weeks) and we clearly can't upgrade to a version that doesn't yet
> exist.
>
>
I'll admit that I threw it my build machine before looking closely at the
patch.  Yes, this message isn't correct.

Ross

--001a1145b7b89ca6a00545d39967
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2017 at 15:44, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":4q6" class=3D"a3s aXjCH m1598e3=
4f92aabd43">The log message for this commit is a bit misleading.=C2=A0 Glib=
c 2.25 has<br>
not been released (and the release is not scheduled for another three<br>
weeks) and we clearly can&#39;t upgrade to a version that doesn&#39;t yet<b=
r>
exist.<br>
<br></div></blockquote></div><br>I&#39;ll admit that I threw it my build ma=
chine before looking closely at the patch.=C2=A0 Yes, this message isn&#39;=
t correct.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a1145b7b89ca6a00545d39967--
