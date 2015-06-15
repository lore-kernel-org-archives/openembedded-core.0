Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1367E737AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 20:57:38 +0000 (UTC)
Received: by qgal13 with SMTP id l13so9596662qga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 13:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LvzEOV5sDNv7h4NUoVMVlP/ariE7/ma8K6WIvLeZUvo=;
	b=BN3EybqB4NX233XgxFDVH1puZC2HTtwDvdZYFd665lSa/CkvW1yahNp6nsR7ENrT/4
	JYJmV0jldzl/wH90Dd4aaobWZ4j/11WzBzITb95cOFj3LKyg9LjC4btcX3j1m7jV56p7
	sycrrRYDYmejzJYNxvP6adrI8u8pS5QPEWjjCM7iURxs0ZOWzK8tgrXUwgZQZtMLUZm1
	0IwFxBhbCv7l59rmNdgrDDls1gLDmjzU0oYzmXqziB0HzT7WDds9aOvaHjDPbZmcwGtI
	1MObCDCAqdzwPNl/Q0aMb3pLFsWmuVX/7UkSuBXrd4l5t9z9jzOCfFtLKXm6Rk6HwoGz
	Haww==
X-Gm-Message-State: ALoCoQkY7c5fxgsK+l01GPLV7EfSEyqwUpTD0qjuOt8ag+xZxJHpI2s88SS1aQTTimEvncmWBGm0
X-Received: by 10.55.43.130 with SMTP id r2mr64264479qkr.14.1434401859894;
	Mon, 15 Jun 2015 13:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 13:57:19 -0700 (PDT)
In-Reply-To: <1434400486-21168-1-git-send-email-cristian.iorga@intel.com>
References: <1434400486-21168-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 21:57:19 +0100
Message-ID: <CAJTo0LbtPB2jOQnndML2qktEQoVVH2JJ47mLe1Z4_D7SwQ4OkQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix building on x32 systems
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
X-List-Received-Date: Mon, 15 Jun 2015 20:57:45 -0000
Content-Type: multipart/alternative; boundary=001a1147afb05316a2051894b5cb

--001a1147afb05316a2051894b5cb
Content-Type: text/plain; charset=UTF-8

On 15 June 2015 at 21:34, Cristian Iorga <cristian.iorga@intel.com> wrote:

> +Upstream-Status: Pending
>

You need a signed-off-by in the patch too.

Cheers
Ross

--001a1147afb05316a2051894b5cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2015 at 21:34, Cristian Iorga <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17g" cl=
ass=3D"a3s" style=3D"overflow:hidden">+Upstream-Status: Pending<br></div></=
blockquote></div><br>You need a signed-off-by in the patch too.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers</div><div =
class=3D"gmail_extra">Ross</div></div>

--001a1147afb05316a2051894b5cb--
