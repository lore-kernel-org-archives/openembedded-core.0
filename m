Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1491C607A4;
	Wed, 15 Jun 2016 15:29:16 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id f6so17319628lfg.0;
	Wed, 15 Jun 2016 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MBorrHDJUQbrJGkve1+rz8Q7xnH//oPz3uZVaVPR+h0=;
	b=ZO1RjRjI7bxrIGFvSiV6ZJiv8cY9l3sAFvA5LnzLYlftNw0NYwszW41UN8dD5lPPU2
	QRj3aBTF1ItmKIb9RRRtkGsSsXz+jiGE9ft4i7IwYWotQ8JAXaWE+Yinig0hYCGIA1cT
	Hadg5/tal0C4HchJ+op+r7uDg7LN9FT2HD90W8lVvve2YHjbifxlkZE/rFLeOVsMp+CJ
	arpguZg2Uxs1iAZpxJXztpG6XEmpG/Ryc2FyySzvS9DvYHAgb44zCBee4TYTdQVFEnAU
	bsIPtoT4dUhbH8ZYpRhncuVjoG2oplihfC1dS/gOBDXo8EGdUHlr64xSSbS4u5qLYTwj
	W/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MBorrHDJUQbrJGkve1+rz8Q7xnH//oPz3uZVaVPR+h0=;
	b=LiTGWV8u9QnJ0AiLehSYmiCVwmL0ey3AQDAQhXNxe7MlOWU4dC/wpbE47Bxgn+l4FV
	Rx0KVNyMcU/tX5l0JBYN+o/ccBZ8iRjagH05wBq63P0+SogcRM7/b4AW3NZIzpA0LMa8
	lnn3Aq74f94bItZwi5bAGi4TJ23Bi97Umn6yzwCpZiMfPHZTkgOfkTbzVMgc8mnbVXwx
	HFifm1ert41dVJJuh99C/kbQy6Dubzh5FSIPR3LwVfe6NByynZ4KlqI8nMgzZj2RtcJC
	7es6LlB+oDoGT6cQ78e5YbKJjgllgdayd8pK4FopwLoaoQYVo/LmWZvm3Td8Bswy+xFq
	yZOA==
X-Gm-Message-State: ALyK8tK56/M/DXvOxJje2S+nixvukbgNT1e+VYMtSe2aU2MOOhRgx0sALJDIx6g+On7gWEE/SF2HIv1pYzUPiw==
X-Received: by 10.194.99.244 with SMTP id et20mr12911202wjb.92.1466004556693; 
	Wed, 15 Jun 2016 08:29:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.60.111 with HTTP; Wed, 15 Jun 2016 08:29:16 -0700 (PDT)
In-Reply-To: <1466002419.9543.1.camel@intel.com>
References: <20160615104518.GC2569@jama> <1466002419.9543.1.camel@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Jun 2016 17:29:16 +0200
Message-ID: <CA+chaQc-WwdLz78kLJhSPxo3UrfN8TD7VYaVvxvf=Xwq+EJiyQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-06-13
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
X-List-Received-Date: Wed, 15 Jun 2016 15:29:17 -0000
Content-Type: multipart/alternative; boundary=089e0102da1ed7529c053552c87e

--089e0102da1ed7529c053552c87e
Content-Type: text/plain; charset=UTF-8

Derek already sent similar patches.

Thanks

On Wed, Jun 15, 2016 at 4:53 PM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Wed, 2016-06-15 at 12:45 +0200, Martin Jansa wrote:
> > libgphoto2, v4l-utils fail because recent upgrade of libjpeg-turbo in
> oe-core (PNBLACKLIST sent)
>
> I have patches ready for that, will send them now.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
>

--089e0102da1ed7529c053552c87e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Derek already sent similar patches.<div><br></div><div>Tha=
nks</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 Wed, Jun 15, 2016 at 4:53 PM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=
=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Wed, 2016-06-15 at 12:45 +0200, Martin Jansa wrote:<br>
&gt; libgphoto2, v4l-utils fail because recent upgrade of libjpeg-turbo in =
oe-core (PNBLACKLIST sent)<br>
<br>
</span>I have patches ready for that, will send them now.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--089e0102da1ed7529c053552c87e--
