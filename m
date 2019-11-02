Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 372E47FBD7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 22:29:44 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id w25so8693141vso.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2019 15:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jCfBj7fcoWfBUkAf8J3LcKVopn2sx4FZFlUI8hR7DfA=;
	b=GeokoE44pP6HsAisAlemyqv+xwraDp2J9PfpweV05kqGfEI4Z1izMLwW3pzQdWQjZt
	oAiZTMqZ2TdPv0vXJDeuLxKL5pX+ipr9V0Qekwx/Ef8RouyS7V+rIpjVh5+HTjc4stoR
	3m/5G/gWo9Sx3dpYv/Liw269UVuc/Zcid5Q3dFWfO8CDbl/scoJ6uWhxo3plvQCUWR9R
	g7rionkGzXKcKfp6Jg8kEXOaChsY/O+PyiuAhRUmyurYtGwaGN9/tA09s6OL/s7kIE79
	FusZ9ubcyuuwglTKAn6acFa6rm49TpH3xtRAEw084GOtITnF7WPZpJO3EPvE8VpUgV0N
	nmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jCfBj7fcoWfBUkAf8J3LcKVopn2sx4FZFlUI8hR7DfA=;
	b=MqMD2LuBgnz0/Nfe0+In+jaJ9KahKuK0kYHmNwPxIYAh7rbygVNLzZODlswpxP0c2t
	foM5Oj2ZyfTkfTCDKfgODbsjhQ5vwCtyicMW4F5Zdf65apHQGQF6uPZq1w/vu8hnTE0H
	QSb3VVlNblu0rzZ8ul4kMhO2a2nJPLWQ8FLhiGbLBhE/8n43Q9hOgrKdTYolz2s7Zzv1
	xpRNYZOBZ8pIK3h1f4hDAo0o79RD32tyKPYMXplVdoNuFYwiUhI7APZD8+kLNqoIPm9G
	yyulrp/HDAAqTHvqIQq4NUUkrYpiOUBxbhBO+1TZsJHWzZxFfvuxBvoTway5/fHeedhR
	rz7w==
X-Gm-Message-State: APjAAAVC+v1+GTp1aDt3S2MvdNiwevoTvphFssx8CfBGfVKr42QfOGew
	NQCTeX9UnK9p+GqgMOe5/E0TgDHHtnj2ibZW3aw=
X-Google-Smtp-Source: APXvYqzD65YtPjfNZRWLFAqGYS8rKNjUxExCA3BRG7qHkKcUSRYe8ITY74D8CEo8g4ZtXTyVdYYKD0khRgzmaq1xROU=
X-Received: by 2002:a67:ad0e:: with SMTP id t14mr9405634vsl.35.1572733785001; 
	Sat, 02 Nov 2019 15:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
	<CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
In-Reply-To: <CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Nov 2019 23:29:33 +0100
Message-ID: <CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Sat, 02 Nov 2019 22:29:44 -0000
Content-Type: multipart/alternative; boundary="00000000000094d2b20596649e62"

--00000000000094d2b20596649e62
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Nov 2019 at 13:07, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Same failures on the Debian 10 worker:
>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/778
>>
>
> runqemu - ERROR - Failed to run qemu: Xlib:  extension "RANDR" missing on
> display ":1".
> qemu-system-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863:
> epoxy_get_proc_address: Assertion `0 && "Couldn't find current GLX or EGL
> context.\n"' failed.
>
> Thanks - the Gtk part is passing fine, so it's something SDL does that
> upsets the X/GL stack on the Debian 10 host.
> I am reluctant to disable the SDL part of the virgl tests on Debian 10, as
> it is a new distro (unlike centos 7).
>
> I'll try to see if I can run Debian 10 in a VM here and try to reproduce.
> Or is it possible to debug directly on a Debian 10 worker?
>

So I actually went ahead, and installed Debian 10 into a qemu image, then
transferred a pre-populated build directory into it, and ran runqemu there
against tigervnc (hurray for the nested kvm feature!).

Both 'runqemu kvm sdl gl' and 'runqemu kvm gtk gl' work fine, including
running kmscube!

So I'd like to see what packages are installed on the Debian 10 worker vs.
my Debian 10 installation.

Can you issue 'dpkg -l' on the worker, and send me the output, please?
Maybe something is missing?

Alex

--00000000000094d2b20596649e62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 2 Nov 2019 at 13:07, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote">Same =
failures on the Debian 10 worker:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/778" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/56/builds/778</a><br></blockquote><div><br></div><=
div><div dir=3D"ltr"><div>runqemu - ERROR - Failed to run qemu: Xlib: =C2=
=A0extension &quot;RANDR&quot; missing on display &quot;:1&quot;.<br>qemu-s=
ystem-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863: epoxy_get_proc_a=
ddress: Assertion `0 &amp;&amp; &quot;Couldn&#39;t find current GLX or EGL =
context.\n&quot;&#39; failed.<br></div><div><br></div><div>Thanks - the Gtk=
 part is passing fine, so it&#39;s something SDL does that upsets the X/GL =
stack on the Debian 10 host.</div><div>I am reluctant to disable the SDL pa=
rt of the virgl tests on Debian 10, as it is a new distro (unlike centos 7)=
.<br></div><div><br></div><div>I&#39;ll try to see if I can run Debian 10 i=
n a VM here and try to reproduce. Or is it possible to debug directly on a =
Debian 10 worker?<br></div></div></div></div></div></blockquote><div><br></=
div><div>So I actually went ahead, and installed Debian 10 into a qemu imag=
e, then transferred a pre-populated build directory into it, and ran runqem=
u there against tigervnc (hurray for the nested kvm feature!).=C2=A0</div><=
div><br></div><div>Both &#39;runqemu kvm sdl gl&#39; and &#39;runqemu kvm g=
tk gl&#39; work fine, including running kmscube!<br></div><div><br></div><d=
iv>So I&#39;d like to see what packages are installed on the Debian 10 work=
er vs. my Debian 10 installation. </div><div><br></div><div>Can you issue &=
#39;dpkg -l&#39; on the worker, and send me the output, please? Maybe somet=
hing is missing?</div><div><br></div><div>Alex<br></div></div></div>

--00000000000094d2b20596649e62--
