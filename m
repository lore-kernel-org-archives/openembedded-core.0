Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2964E74F63
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:03:45 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id t23-v6so43241833ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CxlNxJsQrVkcOrOS5uvA7Hk9gjPzpb+ULrqq2EIHmmY=;
	b=jpJqhOl1ms3r0sBKo0eOFAJk54GZiBGHNSp/rdAfNODua+YK+FOROD6XG1lsI6cjM+
	fIsKFnfxdLQl+Fx2Qet1AUJim6T2uXUN6cCd+ZpD0jNSoYHt7MIoCnyJrUgfEOEG7i7D
	DeLOAXSndEH0HkEv1ptrPDoJIzT0LODoGU7oqOhg/MqSDGGe91bvUKqTQhsGf8jFdoS+
	ok14lRVFA+CdNBXYgYvEBHUo92x37VTzzWySB20h22SaAVswWyr3kQVw2eTTlpvh80iv
	ejrRA50OcpM7xUgCIvCXbu4JQukEZnoyzEqPjEzBAAo67wIkGxceIszEBbYOTKokk4xh
	O+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CxlNxJsQrVkcOrOS5uvA7Hk9gjPzpb+ULrqq2EIHmmY=;
	b=mR+Zv2p/S077/TAvFclVjQQT1KNNT9LdKJqzhBByvOpXMaq4PZTKcgacV9sFhwp1Lr
	wM2I6zNTS9JUeFPVUzn/cms0ZkTR8bX+92SLZZ8xLpP7qd9TKltSesZx0QiLRXfLOc6+
	LOxIbGvCBlENBJ64y3pJaJkwlkmWA+okuSr0mU83a4fxsDWM1DnkrZFUBN1datvzX+5r
	4G9GmBAtb77YTf+nLyXWZLjzHd3RPJ4kAOum0Y6gzlGjKmalJhiK3RiSpzvg4x9Fp9xf
	ywegB3L5RlR3j6NrOgqItZU+Brgr/jp7ZYUCQXsH/UPc0CS34CS8xcNGO698ZVQSeeDl
	MQeg==
X-Gm-Message-State: ALQs6tAQYOrSp/6cXLpiGokqL5o8dZA7JadB37BG1dlPvVYX5NYOjHOG
	hPq1NskNbJLe6SDyKYwe4C71npiZjHuR8JjAoBdFgQ==
X-Google-Smtp-Source: AB8JxZpwYid8gzl7wb/FSeIWtrroCrHxGMOh9gjgorG51s2RxcsNWIlq4ezRVj/e77qn28qrHQQao2WB2L2rM/rTHes=
X-Received: by 2002:a6b:752:: with SMTP id
	79-v6mr50942384ioh.216.1525881826835; 
	Wed, 09 May 2018 09:03:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 9 May 2018 09:03:26 -0700 (PDT)
In-Reply-To: <3814374.oaZWZoq0et@yow-masselst-lx1>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<20180508211844.GA2573@jama> <3814374.oaZWZoq0et@yow-masselst-lx1>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 May 2018 17:03:26 +0100
Message-ID: <CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Wed, 09 May 2018 16:03:46 -0000
Content-Type: multipart/alternative; boundary="0000000000004209ca056bc80cc3"

--0000000000004209ca056bc80cc3
Content-Type: text/plain; charset="UTF-8"

On 9 May 2018 at 17:00, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> I am also seeing build failures due to this conflict:
>
> ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/
> libwayland-egl.la is installed by both wayland and mesa, aborting
> ..
> ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories were
> installed but not shipped in any package:
>   /usr/lib64/libwayland-egl.la
> Please set FILES such that these items are packaged. Alternatively if they
> are
> unneeded, avoid installing them or delete them within do_install.
> mesa: 1 installed and not shipped files. [installed-vs-shipped]
>
> is someone working on a fix or should I take some time to put something
> together?
>

As it appears you can test quickly then I think you just drew the short
straw.  Should be a trivial patch...

Ross

--0000000000004209ca056bc80cc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 May 2018 at 17:00, Mark Asselstine <span dir=3D"ltr">=
&lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark=
.asselstine@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
HOEnZb"><div class=3D"h5"><span style=3D"color:rgb(34,34,34)">I am also see=
ing build failures due to this conflict:</span><br></div></div>
<br>
ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/<br>
<a href=3D"http://libwayland-egl.la" rel=3D"noreferrer" target=3D"_blank">l=
ibwayland-egl.la</a> is installed by both wayland and mesa, aborting<br>
..<br>
ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories were =
<br>
installed but not shipped in any package:<br>
=C2=A0 /usr/lib64/<a href=3D"http://libwayland-egl.la" rel=3D"noreferrer" t=
arget=3D"_blank">libwayland-egl.la</a><br>
Please set FILES such that these items are packaged. Alternatively if they =
are <br>
unneeded, avoid installing them or delete them within do_install.<br>
mesa: 1 installed and not shipped files. [installed-vs-shipped]<br>
<br>
is someone working on a fix or should I take some time to put something <br=
>
together?<br></blockquote><div><br></div><div>As it appears you can test qu=
ickly then I think you just drew the short straw.=C2=A0 Should be a trivial=
 patch...</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--0000000000004209ca056bc80cc3--
