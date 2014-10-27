Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 85DB9710C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:54:26 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id j107so3803955qga.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 04:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IMHcwNsC62aWd3qKVlkAxj/3C84wR2aYmKD6dFxVk3s=;
	b=LCRXpwSynupMdF/jM6szvnJbDTy3/pIYuW2s0EpMlIqyqEqqtxfQ5ouEe2r5sQsXlE
	LilAP75sW/WYajY5BeuqBlzxi2/9xizqQnNpgHReTPvER1jxa31Kn1Bo/hzkBq8yo+LJ
	3hgrC9XuzmtflHkmScqDKYzEIp+TO0NFQ4PkQqWxufe5LnvGsEUyaXH8iezt7vL7Srwl
	KJaVwGB9Zs6yqmUM/SazbTZD6kEMXBpbkC/sJH4tKLFL1D2PHEk+gTWQdLh/UA7x/gE1
	HArut5OdT4A5PvR2C58t0ctqMEC4vg1oCA0ob2Ix8jYDzVAC6OE0GBRmX1d3ZUZP57Jf
	Ylew==
X-Gm-Message-State: ALoCoQnofRO1hkbJnZPF3Wumllq+qhoHwA23xHN+3P3wBX3ubtKVfBczohlu1Vol4Gdlvo3m0VDO
X-Received: by 10.140.28.10 with SMTP id 10mr30554489qgy.15.1414410866818;
	Mon, 27 Oct 2014 04:54:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Mon, 27 Oct 2014 04:54:06 -0700 (PDT)
In-Reply-To: <18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
	<18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Oct 2014 11:54:06 +0000
Message-ID: <CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Mon, 27 Oct 2014 11:54:29 -0000
Content-Type: multipart/alternative; boundary=001a1138f44848a0e10506663195

--001a1138f44848a0e10506663195
Content-Type: text/plain; charset=UTF-8

On 27 October 2014 11:39, Koen Kooi <koen@dominion.thruhere.net> wrote:

> > SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
>
> Not quite, 'lzop' is not the same as 'lzip',the problem is this:
>

The problem is that the lzop SRC_URI contains the string ".lz", so it
incorrectly gains a lzip-native dependency.

Ross

--001a1138f44848a0e10506663195
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 October 2014 11:39, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D""=
>&gt; SRC_URI =3D &quot;<a href=3D"http://www.lzop.org/download/${BP}.tar.g=
z" target=3D"_blank">http://www.lzop.org/download/${BP}.tar.gz</a> \<br>
<br>
</div></div>Not quite, &#39;lzop&#39; is not the same as &#39;lzip&#39;,the=
 problem is this:<br></blockquote></div><br>The problem is that the lzop SR=
C_URI contains the string &quot;.lz&quot;, so it incorrectly gains a lzip-n=
ative dependency.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a1138f44848a0e10506663195--
