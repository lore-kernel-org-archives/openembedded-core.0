Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 22B74772B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:47:40 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id q68so29912361qki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s+woDmkRUX9DwNGsLZX6sXxQfqUZT94zrPb61qe3Y3w=;
	b=RUgIlRTMCFXk3F/a92LFn1vJ69QJAVx6ai9kpJ3dkWVV4lWlOdx4b66ThaarGS7VyC
	lh5KKJeH7W3no9HLfqau6Gq9LFhnHTUnpnBzZS1gJRnMm5nqfZRWLuJpCgkJtFxK24pw
	WFtLCdQKY4gPCiyagrRHsDmZ4RlD9NrhxgFo1zfGXcDukWhfXD3dG8ca10z483rxi6VO
	XV7cSBbtiV2sK2RJUeYgKrBGYEgtOCHmsnD9loPupx407BGLW60xJAOI8x1l567/V0vA
	WmwmlGch2iaYlxWjiu928+n4kd+4pgbzvDwroQ0imqajKj1VzKvQzafxMBwxbW4NCfnI
	VXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s+woDmkRUX9DwNGsLZX6sXxQfqUZT94zrPb61qe3Y3w=;
	b=ZgNLo9a+Izn0S16uAoZh6hA5EmhDG7F5EUt91pOJqGvOcdPTa2NRN5KPXjXck3YjfA
	fRinOM+pe1apdaB1pGQ+rZHLGuFKPoKI5BON385IeIBhHn6JaXN9ERULePr50QqpucId
	W/COMcOqHeJDYlPdbPQKzyLzagkJr0Tqti8/8m6K0AdW5cBOK9b0jAFcBNliqUyxdPn2
	JTd875DvyiX2EPSR7qz5kQ30dMW2b9bvN/jSZ6NV4rGZdxcxcuO2M4UdrBWRS2vqECBQ
	tsDcs7dkQSjMa3giWAs+IXFwKnrfHW4R5rG7nxDKHsuhJhzMr6342i++k1H/7Wh8/TY/
	08UQ==
X-Gm-Message-State: AIkVDXLOsPE7ZqhshWmKsncdj+DuJT8mCMQDM2iCfFy6BSKnWPfiv02jVy4UX6FV0L/k50Lw720q29747J5WzEQA
X-Received: by 10.55.207.78 with SMTP id e75mr3681712qkj.36.1482184061641;
	Mon, 19 Dec 2016 13:47:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 13:47:21 -0800 (PST)
In-Reply-To: <20161219214258.GA16333@openSUSE-i7.site>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 21:47:21 +0000
Message-ID: <CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Mon, 19 Dec 2016 21:47:41 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b87c7abb054409deef

--001a1145b7b87c7abb054409deef
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 21:42, Trevor Woerner <twoerner@gmail.com> wrote:

> A fresh build in a new directory fails readily:
>

Ah, interesting, because I can't replicate that. :/

Can you share the do_configure log?

Ross

--001a1145b7b87c7abb054409deef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 21:42, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":41e" class=3D"=
a3s aXjCH m1591909ba5caa759">A fresh build in a new directory fails readily=
:<br></div></blockquote></div><br>Ah, interesting, because I can&#39;t repl=
icate that. :/</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Can you share the do_configure log?</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b87c7abb054409deef--
