Return-Path: <athoik@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id BA3FD60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 18:40:14 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u68so3859911ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wOZFFNSxBWVJAlHXFjh6HivQOaHrOa37PWG6CYVAwZE=;
	b=qkfq78aVzHZrZKcSWkSUOYhxVfIERy94N5ewqjGkH9c0IcYIkXmQwfsGHBJh/903lA
	uHvV47yZ9TA5vSH/tLJYCl4OSJh5OlYQov4rQu3uVmwI1Xt1xuW7oUNIBHU5zPPesyhU
	OiG2REV+LGHclw9JEYaVt90j267S6eIFRV5DK6If91baU4QeXsufj5iAg+CukrGhqbkE
	Ez3cF1nhLPbe3/Pi/CCRLpPSOUOMcP+h+DAmep+9XKc/Cea3rvjvP+wvg/Jt/mxympPy
	ssOvKdDOM11ct5EqlalwDEm2QNG99nENa6vGnBfpNocy7YsFvUIQgzD/zYlOf3JU/QzW
	Vf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wOZFFNSxBWVJAlHXFjh6HivQOaHrOa37PWG6CYVAwZE=;
	b=gi82AC5Ba9Ux48pKmRkoTDzUNBs7C8bENfcVRTmiu2OAU8FSios1y4ag+zfwQ3Lctc
	3ri//Z8mrXYGrdUmCgIiM0wrgI/9GUzUgJEJzwQDLi4niXmGW4DOoGp9kiS6Kd+iMGKw
	hBJlTDhuAdE1ZXhIxdIJ1OjjnXAoeTF7HDeCMZvEKeaQnQS28DSFZ9lVX5pRdZx736hw
	RO9P96pZDmPifMtjR7Q1Z7z2mYxYybF89qCTXdnRYSdN3j/pa9WA6o8s9WfoTyhzZ4E9
	euqS0BZKsY6k1tAGDzxHFuxxnQyAQCdE0BmNCMfRb7+qn2Kc2KqAlSYd37hPAmgZsSXH
	i4aw==
X-Gm-Message-State: AMke39kSUijrI7OomczMVYOfUhA5BybNOzteMSgnkUZxhoHcjaK21z0P/6YBd6o5gMfaabHkyBuE4bXUvtW1nw==
X-Received: by 10.129.87.134 with SMTP id l128mr7249301ywb.115.1487356814372; 
	Fri, 17 Feb 2017 10:40:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.164.101 with HTTP; Fri, 17 Feb 2017 10:40:13 -0800 (PST)
In-Reply-To: <CAJTo0Lb72FJj0hPU85pt-mGUE1Zv2n0eokV7E9A4bSQjYUssTQ@mail.gmail.com>
References: <1487350233-9392-1-git-send-email-athoik@gmail.com>
	<CAJTo0Lb72FJj0hPU85pt-mGUE1Zv2n0eokV7E9A4bSQjYUssTQ@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Fri, 17 Feb 2017 20:40:13 +0200
Message-ID: <CANDbA3f_x-UtMQ6GWww67GQ_oXSaZaxRUvrA9HWz7NfEguUV6A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] LSB 4.1: lsb_release script incompatible with busybox head and find
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
X-List-Received-Date: Fri, 17 Feb 2017 18:40:15 -0000
Content-Type: multipart/alternative; boundary=001a113aae9a933a9f0548be3e21

--001a113aae9a933a9f0548be3e21
Content-Type: text/plain; charset=UTF-8

>
> Patch comments don't need to be on # lines.  Also this patch needs a
Signed-off-by and Upstream-Status in the header.  I can't see a reason why
the fixes don't go upstream, so please try submitting it there too.
>

I don't believe they accept patches for lsb-release-1.4. I don't know why
we call it lsb 4.1.

--001a113aae9a933a9f0548be3e21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;<br>&gt; Patch comments don&#39;t need to be on #=
 lines.=C2=A0 Also this patch needs a Signed-off-by and Upstream-Status in =
the header.=C2=A0 I can&#39;t see a reason why the fixes don&#39;t go upstr=
eam, so please try submitting it there too.<br>&gt;<br><br></div><div>I don=
&#39;t believe they accept patches for lsb-release-1.4. I don&#39;t know wh=
y we call it lsb 4.1.<br><br><br><br></div></div>

--001a113aae9a933a9f0548be3e21--
