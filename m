Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id CCA5E601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 12:21:49 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id w33so7530655qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ruRyMMX1DPQantgp/lMauV8GQsV5eFd5mhqFZXXknts=;
	b=fu6mFjWPxGdO3PJVRPIQIKmqYBQBvZSED4G7AUXHhXhkuXC2YLBB2N+VR6SslQc/P1
	+xToVSQDF8pm0x6klTX1FBGy6s/0aS085RgLiZNY7W/6W/b4eMEy07OglnYzneYnEl00
	jVte5x8plDxVMkNdCAuvLUN7+1aD+rK16zFdl3AxdIsG5bCGinVd0qgOO6hweol7Eanm
	tmb+ckNDPtJ1wQI/QPiWvBcTqYEZ36pOTOl1LnrJK9JQ+wN/GGlvZPAVT+4qTqgkGYiZ
	klRAP3VbVPGMFipHs/bkL0KFzz/Jc/Gz2If8YEa6G9g3OWBNEYPvEYjsAqDY8wV0DF9c
	ck3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ruRyMMX1DPQantgp/lMauV8GQsV5eFd5mhqFZXXknts=;
	b=DWvUU0jpTLHn3C96MnCr8fAD9O8NknTcvyVztL82Br3dv8CBX08j1iAZeVxkA8KseC
	afIlcCOvEmj8H2EptE5Rk7uJtPtOeCrDG+3giZW8ESVJFZnmryLBwrtQhHJ4n+5burA8
	+fSq4hSXAi/rHNJO/FtjuFtT/pATA5h6aLQ30/mB4F2rBJ2OXWXO47h/xiYtu86wfYCG
	qqsIAzR0AVRKy5xYN5AX7vKoTZEjPFt6i7DEMkNdeHWYF/YlApys2TnI9ZgC9FCjg307
	8AZGcT4ou56kz05tzC/tXVlLK9MUlbbSA0+NkmyrkI6T5S27J1PEYDytqtJMoeGyaTsE
	6Jzw==
X-Gm-Message-State: ABUngveIvT7GDzVCXNt5p9OvyGc5+94SUaYEW3Y46RKIPiT7Bogvm3ujMHatOzlEKICtd06GCGHmmPB1gVSQ21UQ
X-Received: by 10.200.50.35 with SMTP id x32mr2981525qta.78.1478089310714;
	Wed, 02 Nov 2016 05:21:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 05:21:30 -0700 (PDT)
In-Reply-To: <1BF9A377-D1BB-467B-90F2-0E205B7CEF49@basmevissen.nl>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-4-git-send-email-fabio.berton@ossystems.com.br>
	<CAJTo0LbZrrrcvMmqpb943oarTKY6B=UkmszpdFLv=3cWqCV9SA@mail.gmail.com>
	<1BF9A377-D1BB-467B-90F2-0E205B7CEF49@basmevissen.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 12:21:30 +0000
Message-ID: <CAJTo0LbayQcAY1qGtiJWjfJ2X+kNHZAeC4cf43d-5rwWx-EEjA@mail.gmail.com>
To: Bas Mevissen <abuse@basmevissen.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] serf: Update to version 1.3.9
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
X-List-Received-Date: Wed, 02 Nov 2016 12:21:50 -0000
Content-Type: multipart/alternative; boundary=001a1143e1da4fd2190540507c28

--001a1143e1da4fd2190540507c28
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 11:39, Bas Mevissen <abuse@basmevissen.nl> wrote:

> It looks like https://archive.apache.org/dist/serf contains all releases,
> including the current one.
>

Perfect, can you send a v2?

(just checked the history and it moved to snapshot.debian.org from
googlecode)

Thanks,
Ross

--001a1143e1da4fd2190540507c28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 11:39, Bas Mevissen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:abuse@basmevissen.nl" target=3D"_blank">abuse@basmevissen.nl</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">It looks=
 like=C2=A0<a href=3D"https://archive.apache.org/dist/serf/" target=3D"_bla=
nk">https://archive.apache.<wbr>org/dist/serf</a>=C2=A0contains all release=
s, including the current one.<div></div></div></blockquote></div><br>Perfec=
t, can you send a v2?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">(just checked the history and it moved to <a href=3D"http:=
//snapshot.debian.org">snapshot.debian.org</a> from googlecode)</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,</div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1143e1da4fd2190540507c28--
