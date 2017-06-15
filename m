Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8E79E7839F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:01:28 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id u19so21614620qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ag3ag5QgZzIIvkLioAQ8DIk6tnrch2fjpmed04Hm1Xo=;
	b=vvBxYglNLXwFAVB51D4Zb13cbVc0u5rrNPyDlAeIin1r1k7t3ix6B3NQ77CjoV1VZ3
	9+L3mvjWMHrXWYblhRKKp39ca8DbBcXAJc4JqbEpL3tnnCnBMlhffxIN3ZVxDhNzDXoa
	RPx/j/k1yhedppjs7NQGQofr7LPoN/jkC9rCfYXTjYlhPOlGTXZi1UHlpKt09ptD64cx
	qKY5WM39wUC1e+HE9JKBWO1GyeuGyL0mlVIJPdROr8h37JuMtVa2EfNpTRmJQ05TCcD5
	SfTYc33ZeDrAaWsR6kZZ0opU+ihJwGMzEhdPZMEKgIHLRq+u/RR8SDNffk5b8egbXESK
	CpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ag3ag5QgZzIIvkLioAQ8DIk6tnrch2fjpmed04Hm1Xo=;
	b=THdYBVhLCS6tRbOKQbfjKXWZQiysJYCDOT6u/9LMYYHHb9oGq7LtVUZpaem5gZx2dU
	mvfDuZ6qDByUdpRV1H4zfauqr/ha+EEiyBD5O3J8uOOR6S/B1OikVpmpLvHaUqitVEZH
	oXqdFZU+gbDenkCAUD6IA7eyieLf3l0fPPTrR3/jpsd8usIuLDITzQs+8Sd1KLF1gclR
	NFrnCCFNw4ZgGg56xDY7BARrZ1o75rZTg4ONbJz7Wap3hiSpZfZChBm/ON9V4GIB1Ymx
	ekNURVN47JUg/1+dGBsxqtLBqpDpV5pm2cPf0Qky7EHftnLmKfyKJZm1UnJFbUjy6z0a
	SWMg==
X-Gm-Message-State: AKS2vOxYK2OpI7Z/8m0Y/pxueKlkyuXEFjkyXKToqCVc047wh9ayMtiM
	bD6WL9EUfq6iYabdVzzy2bSo9za74P54
X-Received: by 10.237.40.97 with SMTP id r88mr7063988qtd.27.1497535289518;
	Thu, 15 Jun 2017 07:01:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.16.7 with HTTP; Thu, 15 Jun 2017 07:01:09 -0700 (PDT)
In-Reply-To: <CAJTo0LZY+R=kiwGO87T3_Z451Piwi7H2H5GK3K-hGLKfuniAUQ@mail.gmail.com>
References: <cover.1497534748.git.pkj@axis.com>
	<c889d79e52d9a86ad4c7a5de5555aa4e49e0610d.1497534748.git.pkj@axis.com>
	<CAJTo0LZY+R=kiwGO87T3_Z451Piwi7H2H5GK3K-hGLKfuniAUQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 15:01:09 +0100
Message-ID: <CAJTo0LY0wYSwGKGe7VjkArwz7pFq0xNBN2j6+h2vZXmt-D3q+w@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/11] git: Do not install git cvsserver and git svn
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
X-List-Received-Date: Thu, 15 Jun 2017 14:01:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b34f881970552001a9a"

--94eb2c068b34f881970552001a9a
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 14:59, Burton, Ross <ross.burton@intel.com> wrote:

> Is this a good reason to remove the binaries though?  What if someone
> added the modules and wanted to use these binaries?
>

Oh, the new filedeps logic will add module-level dependencies.

Maybe PACKAGECONFIG these?

Ross

--94eb2c068b34f881970552001a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 14:59, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
Is this a good reason to remove the binaries though?=C2=A0 What if someone =
added the modules and wanted to use these binaries?</div></blockquote><div>=
<br></div><div>Oh, the new filedeps logic will add module-level dependencie=
s.</div><div><br></div><div>Maybe PACKAGECONFIG these?</div><div><br></div>=
<div>Ross=C2=A0</div></div><br></div></div>

--94eb2c068b34f881970552001a9a--
