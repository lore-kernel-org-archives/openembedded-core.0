Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9317A73C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 13:17:37 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so36635961qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 06:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=If/0cyOpZjKbL5Kd7ZRLqnsu55wCmdi1w81hLO38URA=;
	b=T7fAb/9kiOzbZt/oLcOTgVeuoTjcS1DTPL7SZeSXbbOWbhGVQ18xjaDbUnyYbTENoa
	izzP4R6CbBlj3qDWieO4+yD7q5vqYAfygkFPXk+GtT3NZA1hylVSFiv4GQjqwf3J4uOY
	k9uA5SGifvsoUgE3e9joVB6gYHmVFuSCqpJFvLotlFa8UPw0qMuzdG2a8FSjS5EvmaXG
	wR5swBZJKgWssHvZ+xaCzzb2x1QrKwjy6P7ndbbfw3k4JtEcvjwu+vdmKp/y0b+W2jO8
	/e+XMG6OazU4rBUI4IE5r8GSOdvmCOocXO7YAjJUES0gjmiLLezo5LtAvA7IvqBnoBjm
	MSYg==
X-Gm-Message-State: ALoCoQkcZncvNsyeHekVA1gkptEDflqtFw/Lk+mhz5VYNM2IFTSD4UBJzxCobGEmU3onkU44Zlc2
X-Received: by 10.229.110.10 with SMTP id l10mr4990300qcp.5.1431091058297;
	Fri, 08 May 2015 06:17:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 8 May 2015 06:17:17 -0700 (PDT)
In-Reply-To: <1431082927-30249-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1431082927-30249-1-git-send-email-ricardo.ribalda@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 May 2015 14:17:17 +0100
Message-ID: <CAJTo0LaEoJYHXWTe-ojF=z6QnkFBDwtzS2cBxhH6FtYMg3_A=g@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: Make xinerama selectable via PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 13:17:38 -0000
Content-Type: multipart/alternative; boundary=001a11344c842c09f0051591da8a

--001a11344c842c09f0051591da8a
Content-Type: text/plain; charset=UTF-8

On 8 May 2015 at 12:02, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
wrote:

> +PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
>

You'll need to add the dependency on xineramaproto here too.

Ross

--001a11344c842c09f0051591da8a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2015 at 12:02, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":23t" class=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[xinerama] =
=3D &quot;--enable-xinerama,--disable-xinerama&quot;<br></div></blockquote>=
</div><br>You&#39;ll need to add the dependency on xineramaproto here too.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11344c842c09f0051591da8a--
