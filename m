Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id B95BC7FC82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 16:15:45 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id w67so797416vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 08:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eCUt6vK6093dbkG2mOO0puoxOOmYwiocJhFDeSansps=;
	b=kde6Xk+yIlCt/+xMxkdYwTfYf1RZsFaDdbwsGcGIPLZxTtp23OWjo3x1LBi08/pLGq
	v5JMHvqwgZq3LC+mZvnzejSqq0Jn4Nbk918z/DgCLpDovvZLUxjFC9cBpxvmwxeqhVYZ
	t9tiH+3ZUH+cRcEgzoMv10J43WiFLqn8ejrmmtOiUucQYlC1+Gb6zBV90jcOj8mB81WL
	B4fZ8VXyN/ET/vF7/lKivGl+PuBW+ovskcgL2Do8ZP0Gc9NPbDaKxkMjQpBPrtDqGFXA
	VrwI2pXCJXxSZP/cUWuK87ljVGtzoUZVZ/OdT2p7FxeXXcn16rFn0jZ4qjhA/n1XV0li
	lzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eCUt6vK6093dbkG2mOO0puoxOOmYwiocJhFDeSansps=;
	b=fkqesAZonc4R5U9fmfv3cNj8O9LgtWRuIsn+gvyUjHvEFNcw0IE0EfItI8nful9tyg
	AQJs46X4ZI1BCS1EnIZAFI4PnrwpjN6n2Mat+fDO8zJaJ8CCA9tIUTrxQJb8BZGjhzai
	p76/uJIWCErBGfF2RtPHBmurKXY2Ru+4mOd5d12d1B4N+QMGzunZ3YuXseaJAzxVwNcu
	m1jJ3qQ+scHaBVpIIlYfGItDjYAOoU9JNJwbK1zbtSjonpLDrrfmKoNn8KGIbj4HmqNu
	+inbXmGAq+CUBjJvBbpcopgGx/LXavCyGqOZdsUsp44ZEnF0UZqNqb+eBY88NlNyld8P
	O+YQ==
X-Gm-Message-State: APjAAAXF9AV3FAQICjcp+IHsxi6wjPE5/6MEP0/34vcDu2OZzLb9XMxW
	tBUvznSMDDoiEC/VAqPqsrnVGL7diDHN8ZL8haEkoLIq
X-Google-Smtp-Source: APXvYqxRlRH6cYcRxu/0JFAxR9vAD0+BXBp0WZp9dx/KEwQKNrXEmJ1z1IusxhScbOTfyQpgSm5bvb+aE7AHBY8PvbY=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr2362342vkc.29.1576685745012; 
	Wed, 18 Dec 2019 08:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-13-alex.kanavin@gmail.com>
	<20191218091834.41b49324@seebsdell>
In-Reply-To: <20191218091834.41b49324@seebsdell>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2019 17:15:34 +0100
Message-ID: <CANNYZj9yLNUhmU0tWcyeWJ7tRXQKGd31X-_GKNKshYzYaE3Auw@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/25] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Wed, 18 Dec 2019 16:15:45 -0000
Content-Type: multipart/alternative; boundary="000000000000c108220599fcc1e1"

--000000000000c108220599fcc1e1
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Dec 2019 at 16:27, Seebs <seebs@seebs.net> wrote:

> On Wed, 18 Dec 2019 15:37:46 +0100
> Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> > +Latest versions of attr have removed the xattr.h header,
> > +with the rationale that libc is providing the same wrappers.
>
> I'm a bit concerned about this -- will this still work with *older*
> versions of xattr?
>

It won't, as attr upstream moved the definition of ENOATTR from one header
file to another.

attr is supplied by oe-core though, so we have control over which version
is used.

Alex

--000000000000c108220599fcc1e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 18 Dec 2019 at 16:27, Seebs &lt;<=
a href=3D"mailto:seebs@seebs.net">seebs@seebs.net</a>&gt; wrote:<br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, 18 Dec 2019 15:37:46 +0100<br>
Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
<br>
&gt; +Latest versions of attr have removed the xattr.h header,<br>
&gt; +with the rationale that libc is providing the same wrappers.<br>
<br>
I&#39;m a bit concerned about this -- will this still work with *older*<br>
versions of xattr?<br></blockquote><div><br></div><div>It won&#39;t, as att=
r upstream moved the definition of ENOATTR from one header file to another.=
</div><div><br></div><div>attr is supplied by oe-core though, so we have co=
ntrol over which version is used.<br></div><div><br></div><div>Alex<br></di=
v></div></div>

--000000000000c108220599fcc1e1--
