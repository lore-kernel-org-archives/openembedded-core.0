Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD21606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:14:15 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id b62so155197792iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kbfw7WC7jHZ/uCjhlwrs0MHmHvWSC2u/N70svy/lcJk=;
	b=asZV5zj0wMBa9GKWyECgG0mxj38D2JtiVp8WUNBb8ez0D2YXKTMGI8wjTDhVQLhBdN
	bDuDmPhJAl73t2SeliluDkON6my9aReN1ZFrwru0R38dt86CW6noSzMfRYHc/cKGKYSL
	9FjhDGKTBN0TylwAlydfeKklGlR2CfFQlE2I2oEoPkTKay242Dh+5qkIULBBLDRahEuc
	icjXIWgBZGPMivwt2/p9WmK9o44NDel2q0JbwMsiJg6ElBiyi4yhhBl+Ce4sJuohrI/o
	Lo5oKwt77N8EK30EY2nPMNGQYielC/x+P8lvgtfo8QosuvSHBhFC6m+Zje/cEc1ekSQA
	0JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kbfw7WC7jHZ/uCjhlwrs0MHmHvWSC2u/N70svy/lcJk=;
	b=VnQG8ccngiqQuIC2e9oQHLQGcwOIAYfcv8mLL0oRYmZMEit8KdQrO6d2ZIWScqTsm2
	MFGuvUt7y/At/hZlpcNP9C9xzQKTVXhF/u7++FUmK4a/ko0JQAyMwDFsVDnbkpAkDOQ2
	kWmJOOLxRCq9XMYrFSFcO+HrKo60Z2UqFecd2WvdS/ahNKmBZdH9sByhimy6sZk8z+8+
	4lnerJJ14HqoakrpfSftlvBmmvplv2SMtpuHSRrFX0jAp6wA3Llp448LECUOFndXgGVm
	Mm3dmBA6Ijmh/NRxBpAOgrbqfH703vHGU8zT4JO1b5/pYtXSRNx5hEkhb5kc0Vz2PTA9
	iN7w==
X-Gm-Message-State: ALyK8tJmcqLGvNGyW/Qt4EkOd3T1nESXnPPxh7PQg249wnedEzu/r4bmgjQzEAPecA/lvFxzKcU1F9KCTpWJpekJ
X-Received: by 10.107.154.196 with SMTP id c187mr3534940ioe.99.1468836856338; 
	Mon, 18 Jul 2016 03:14:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 03:13:57 -0700 (PDT)
In-Reply-To: <a98f595f-5f51-0623-8796-9c5d35ee4aea@felipetonello.com>
References: <20160715163633.6854-1-eu@felipetonello.com>
	<20160715163633.6854-3-eu@felipetonello.com>
	<CAJTo0LaHHZ98dgw9Sj8gAQ2Sz86gDWhxW799X2Y-k7q71UrNLQ@mail.gmail.com>
	<a98f595f-5f51-0623-8796-9c5d35ee4aea@felipetonello.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 11:13:57 +0100
Message-ID: <CAJTo0Lb=LRth6QKky7U5gzT+Av5iRKLGGFNeSSMr_SZrLRGuyg@mail.gmail.com>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] juce: Added support for JUCE framework
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
X-List-Received-Date: Mon, 18 Jul 2016 10:14:16 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e0e54e60537e63b0c

--001a1140e81e0e54e60537e63b0c
Content-Type: text/plain; charset=UTF-8

On 18 July 2016 at 11:07, Felipe Ferreri Tonello <eu@felipetonello.com>
wrote:

> I can send this as part of meta-multimedia, no problem. What is the
> process to promote a recipe to oe-core?
>

To be part of oe-core you basically need to be able to demonstrate that a
large proportion of users will need it.  As this is an audio framework,
meta-multimedia is the obvious home for it.

Ross

--001a1140e81e0e54e60537e63b0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2016 at 11:07, Felipe Ferreri Tonello <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonello.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2z7" cl=
ass=3D"a3s aXjCH m155fd79fe50ec768">I can send this as part of meta-multime=
dia, no problem. What is the<br>
process to promote a recipe to oe-core?<br></div></blockquote></div><br>To =
be part of oe-core you basically need to be able to demonstrate that a larg=
e proportion of users will need it.=C2=A0 As this is an audio framework, me=
ta-multimedia is the obvious home for it.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81e0e54e60537e63b0c--
