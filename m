Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id B3FDF731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 21:54:35 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id x131so237061285ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nx6vUdPkvQf3YfrdByz2RHU1NKYi+F8oXyAooSYFSsM=;
	b=rKX5acVfpd+/L0JBmosO14aeW1rMJK4+pYGtfs0DXRKAL8Wb8myhW2WRVI1N3dhaXq
	jKUKpwlXLVtQ7PLASXYM5xJ/6xNtgehDR0ydBWjvlBr9eJRBxneAlFk6x913M/bW5JQW
	CFMQwnFxb4r0uH2qejJ5uu+NFS+vmLe0q3zRDDjkItBqYjFq6caZ2v4PVsux3qqIwvva
	irOurPeP9Hg8+i90/DJaUEzAOPvgEDQ+1rIYThTbH0UpwrwQ1TfTBsXDt/K4sEz6DzTs
	c4Y91/bg5HK1ttTszt8Yj2s1Xnlc4UkFLbw/H1Mdjw790I6NQN/pDDQeRdVyVtTEJObK
	zqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nx6vUdPkvQf3YfrdByz2RHU1NKYi+F8oXyAooSYFSsM=;
	b=bcSkGBbEYganX53itqRDX7hekmpuFgqBuzXEnmsXv/PxBYAwMuA9S7fi7nbGXu7Cnj
	c42IDv0PoqK/Qtia9Ea47I67kq6GbFxbmqu45JUdixo7zDdh/NfeVwYcr+bJjyWKNp09
	sCHsPWi6VX2rqN7VCiKt6urc3V5Gtngx07Bav/dneo5Ft9ZCbNYZ+DCRD5v4D1SunKc8
	TR4+mfipYpEywoHiyTxlRXqxcIkpoipkvFGJLtMtRWE8A1dU4DkpBxbjw5BqRQESqJWL
	Xm63RTAUmxNPzQyN4NaGHTYu++JmY8p3wBaTH2xmSQUf3xmCpPww9Coreewb3+67UdQb
	yDPg==
X-Gm-Message-State: AEkoouumUXvne/Q4IO5WfQz2ehvgLnVCzb9oC4qbHR5BrhPg4Es05/6L+Vq4H1lcQfSICbam8rbhUSV6+316aoy8
X-Received: by 10.36.129.213 with SMTP id q204mr1399785itd.38.1472075676347;
	Wed, 24 Aug 2016 14:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 14:54:16 -0700 (PDT)
In-Reply-To: <7d4ba06b-e9d5-a518-68b8-1d5f01ea34bf@windriver.com>
References: <1471371380-21952-1-git-send-email-jslater@windriver.com>
	<7d4ba06b-e9d5-a518-68b8-1d5f01ea34bf@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 22:54:16 +0100
Message-ID: <CAJTo0LaXSK=G1bk141VWiYOojZrv0dN5PDezYZK_4A98mmvG=Q@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd: do not delete users and groups during configure
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
X-List-Received-Date: Wed, 24 Aug 2016 21:54:36 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fcc5872c053ad8537b

--94eb2c08b1fcc5872c053ad8537b
Content-Type: text/plain; charset=UTF-8

On 24 August 2016 at 16:29, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> I don't see this in oe-core/master[-next] yet.
>

It's in mut so assuming it doesn't break anything may be in master next
week.

Ross

--94eb2c08b1fcc5872c053ad8537b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2016 at 16:29, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D"=
mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
1q3" class=3D"a3s aXjCH m156bd2c4c69e9def">I don&#39;t see this in oe-core/=
master[-next] yet.<br></div></blockquote></div><br>It&#39;s in mut so assum=
ing it doesn&#39;t break anything may be in master next week.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fcc5872c053ad8537b--
