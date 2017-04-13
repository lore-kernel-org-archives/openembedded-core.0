Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2425577E44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:48:01 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id n46so47523466qta.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eLTMJZ0N2OGi1VLCRHRK0jPa9zu3G4Qfz2uXd4aKKjo=;
	b=d9pp5WqF2ItMxNGEIfOtqiHjHUNQ4veG+xQVWngJhjvldEd6xLqiEwexM4sOwnFSFg
	IorweqGvY6MfnGfBNjfMr2ewKKcrTE8Zalh2v1PHq8duCgWqxRvKOwsFWdITOeGgzA3t
	KlR9cwym0SZhIt7UhA5zAbDI84e9PIqY0eYBivxpfV/uAvOt8gj2vTnkG/C4wWc3E2I7
	CNcH/8Noc0owxGZUsgKt15LgKJlDWIRgwDy4yb/AzJXm6UQ2pYF7OmSuJK/JTtyPV6QJ
	tIsTnMkf54WkY+ID+pMmG/JRfUjzdXTu+MWKaGi1DBnIOfqAcv8nvoac8UVle1Ki4Wk2
	7X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eLTMJZ0N2OGi1VLCRHRK0jPa9zu3G4Qfz2uXd4aKKjo=;
	b=GAI1uWtSJ4afHJT5eIa32awGF3uSuG8WgI2qKHJt1I6xrEK3v0kbuXyYsPP9vIl+co
	f6nHhl5ETZn2aC/xM9gOoSsacB2DIQavwfij9kJJylo1vWFZ8j7RQkwnqvSq7uvW1L/u
	C/7Bc5mZiSgYhufMRnIdRZCZuI0BfbjjefJufKzXMexu759wchylk+quuBZWNufLeRX+
	l/W/U7wcBRnojhqFZw4Tl8y9NRdrvvsF9YoDiovvnxGs4waToryAJBMgJloJFBCVbvnT
	vBz9gm2laZNZxVbNA5571ICd2ruvrB0yJ8I1BgQQETTGDqjqZnCexuBhx3EYzy3477Q/
	avQg==
X-Gm-Message-State: AN3rC/5fi5L55vmicE3gXReVa2MtCFWw9Za+TRG6BUkD2wjFSwYqy9rE
	FCw6pK7M05wXyQlb5wY8k9v0l1y/kZrZ
X-Received: by 10.200.3.105 with SMTP id w41mr2794357qtg.188.1492094882918;
	Thu, 13 Apr 2017 07:48:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 07:47:42 -0700 (PDT)
In-Reply-To: <85c346c4-f6d6-c853-bfc5-0daa64ea2db8@linux.intel.com>
References: <20170413083344.22737-1-dmitry.rozhkov@linux.intel.com>
	<85c346c4-f6d6-c853-bfc5-0daa64ea2db8@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 15:47:42 +0100
Message-ID: <CAJTo0LYA8nsexqtfwz4bbOYA1HtnRDxCcKGZE8Jz+m+=tOcTdA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: make python2 and python3 alternatives to python
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
X-List-Received-Date: Thu, 13 Apr 2017 14:48:02 -0000
Content-Type: multipart/alternative; boundary=f4030435cf5877c54a054d0d693b

--f4030435cf5877c54a054d0d693b
Content-Type: text/plain; charset=UTF-8

On 13 April 2017 at 11:15, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> This runs against upstream recommendation and common distro practice. And
> it will break scripts that have not been ported to Python 3. Please fix the
> scripts instead to refer to python 3 whenever possible.
>

Agreed.  If a script uses /usr/bin/python and gets py3, 99% of the time
you'll get errors.

Ross

--f4030435cf5877c54a054d0d693b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 11:15, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":5tq" class=3D"a3s aXjCH m15b66d0a9c7997f2">This runs agains=
t upstream recommendation and common distro practice. And it will break scr=
ipts that have not been ported to Python 3. Please fix the scripts instead =
to refer to python 3 whenever possible.<br></div></blockquote></div><br>Agr=
eed.=C2=A0 If a script uses /usr/bin/python and gets py3, 99% of the time y=
ou&#39;ll get errors.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--f4030435cf5877c54a054d0d693b--
