Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 22BEE60232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 11:39:57 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so3146381qae.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 03:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kOW2xf27TYp97J1rv32oULuOF54dVObf57/fIff8Tnk=;
	b=iSiAjJZf7s4xgNsRyrrTifoQdEBmqlaHNRus+npv7qZqUMv7FYvRQwNMpeyuhUu2O8
	UOaCLIZbZJ7lGqnWtsUFjNyozQZ21FbTyY5P5Km83fuEcK1v/uTpVNz0ZD4tPNHADidr
	xnnMfgBNYhNJ/P0n2fr78q8uQDQj94TJySHwzn1DQGWY5yhzAN3QLtz9LQBpikqhxLBx
	7UbVtNHMGYJYle3yrGGu2VUfNMbbEGitFNWQNtzUNvDCPouqWHYKCcNz+kGcuDlRBdsX
	c1006izaHu02kI1aDhSWZvOFPd0CwwI3NqYXHKp21ki3X9p0IE/zWwUtvNTQ76s79QOI
	vfxQ==
X-Gm-Message-State: ALoCoQmC95XRzU4ZK6vayymF7rPy5QWfQQMa/WTpXBfiYZZCxh3PO6HmoXxugDpCVKZ0XBDHlceV
X-Received: by 10.224.92.205 with SMTP id s13mr52224714qam.52.1418038797464;
	Mon, 08 Dec 2014 03:39:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 03:39:37 -0800 (PST)
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28E9FDFB15@EU-MBX-03.mgc.mentorg.com>
References: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
	<CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FDF811@EU-MBX-03.mgc.mentorg.com>
	<CAJTo0LY0-X-w2uarbL7bKKCjirw6JUi-w6GXO2Qm3f0zPmcJTA@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FDFB15@EU-MBX-03.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 11:39:37 +0000
Message-ID: <CAJTo0LbO4oz9vE5JWUKcaSyKycY2JnaCb3ZmZjmU8Q_cXqUAVA@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcb: fix socket writes
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
X-List-Received-Date: Mon, 08 Dec 2014 11:40:06 -0000
Content-Type: multipart/alternative; boundary=089e015375e4cd10080509b2e26f

--089e015375e4cd10080509b2e26f
Content-Type: text/plain; charset=UTF-8

On 7 December 2014 at 07:03, Belal, Awais <Awais_Belal@mentor.com> wrote:

> Do I need to resubmit this with [dizzy] tag or will this work?
>

If you don't include the [dizzy] tag then you'll need to ping Armin Kuster,
who is the dizzy maintainer (I've CC'd him to this mail).

Ross

--089e015375e4cd10080509b2e26f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 December 2014 at 07:03, Belal, Awais <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Belal@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"directio=
n:ltr;font-family:Tahoma;color:#000000;font-size:10pt">Do I need to resubmi=
t this with [dizzy] tag or will this work?<br>
<div></div></div></blockquote></div><br>If you don&#39;t include the [dizzy=
] tag then you&#39;ll need to ping Armin Kuster, who is the dizzy maintaine=
r (I&#39;ve CC&#39;d him to this mail).</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--089e015375e4cd10080509b2e26f--
