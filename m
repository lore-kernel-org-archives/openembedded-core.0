Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB0B6E666
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 10:28:14 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id d16so4324739ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sAD4lhWbXKkVGN67Z8mpQXBUlhBbH/+oR6lDBxlXINY=;
	b=ppi5jxEQn207P5j8pORIs+lrCMyX4x8BFMJBJU/w1v334KO0P8po2qZ8vD/bSPyGn9
	bR7LYZZv0m5px6vq6Ehdq6HRqcI1KrI9SRZ9fqbBkRH5ZIGd82XzmBdesEfUgHLQUWfN
	k6SjtZDRXqtiAiGhdW12g8I/uQ0bSHpWZVJAMDr8+WBUM4C/NX8rpPwIsfdUbYP3M+Zo
	Hsd/+ypwKUOtqsox76UwtMwOBYW/5YdKotSOF+tykLJIPAizoVyOvCwkg9KXVBiH8os1
	c9Z04VyHyD+yEJ9Tld390fIpylyt+H/q6ChUbxpmVbScn3UA75pMaZi7yG9hmzXHyhM8
	R+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sAD4lhWbXKkVGN67Z8mpQXBUlhBbH/+oR6lDBxlXINY=;
	b=c+Dk2+pjHS96fGwPgctzN317c0740UtZFA4UgSnwxup7mo3j/WpTKFzW7PkyPw3H/6
	cA5N3yTUN4rpSl9yVW8WgPXnzsPsOxcISFu8z4sTfTN+feO6gFxBnw5sw9FZ/6FkhAJD
	ROQA398IKbJrr9EeMjWSHGd380VUvXQr7ZZr+ynPdXyuN6zvYH4vZOBzNpkYqqchJAe/
	WvCYLwuNh7lzdK+0JP82U3EinU/MArKCZMxMufAkkTFPEtCGArc7G1rb6FtlHDQvC9mK
	ov2NMaSiptKLiZbvwshquSATAIobVnVCa28iPtEvCf7ltdZ2yezJ2MSLvqevmOjgoINN
	yYqA==
X-Gm-Message-State: AHPjjUgnoNvqCDE8f3BKWCk42ClCzE6HOfn4mAe9Bdvkx/UWt08AuGvu
	jXZHKuV5uE21n69e3jsnrdJj3JKxWRenBgvjiXlxQQ==
X-Google-Smtp-Source: AOwi7QCJX98Hp+lNaDPuwRCAyjsnCZiPEOGXCJGpRoUmrpzifEaDw5+llzdwq1C8ofKS5Lt9+cv21vGCAFFahDVb+vQ=
X-Received: by 10.107.41.135 with SMTP id p129mr22447401iop.142.1506940095607; 
	Mon, 02 Oct 2017 03:28:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 2 Oct 2017 03:27:55 -0700 (PDT)
In-Reply-To: <CAP9ODKrx0ATQ2BB6sn9ggUwH3Fd3KgspCqdODJKxZFMqdbd62A@mail.gmail.com>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LZ+FcABO+WPvQ10qQHuJ8QQzYYbwBbNHMQGEJC3vn62hw@mail.gmail.com>
	<1506778986.9509.1.camel@collabora.co.uk>
	<CAP9ODKrx0ATQ2BB6sn9ggUwH3Fd3KgspCqdODJKxZFMqdbd62A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Oct 2017 11:27:55 +0100
Message-ID: <CAJTo0La1UmJwV=XaLSMf8V1bRPC-_JPXU9VWaD612M-6H8fAUQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/3] wayland: Fix installation patch issue
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
X-List-Received-Date: Mon, 02 Oct 2017 10:28:14 -0000
Content-Type: multipart/alternative; boundary="001a1141f22618e5ca055a8dd5ff"

--001a1141f22618e5ca055a8dd5ff
Content-Type: text/plain; charset="UTF-8"

On 30 September 2017 at 14:45, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Sat, Sep 30, 2017 at 10:43 AM, Fabien Lahoudere
> <fabien.lahoudere@collabora.co.uk> wrote:
> > On Fri, 2017-09-29 at 11:32 +0100, Burton, Ross wrote:
> >
> > With xserver-xorg I get:
> >
> > | make[2]: *** No rule to make target
> > '//usr/share/wayland-protocols/unstable/relative-
> pointer/relative-pointer-unstable-v1.xml',
> > needed by 'relative-pointer-unstable-v1-client-protocol.h'.  Stop.
> >
> > (in the xwayland directory)
> >
> >
> > I am really surprised, I succeed to build core-image-weston which
> contains
> > xserver-xorg and xserver-xorg-xwayland on a host where wayland is not
> > installed.
> >
> > $ ls
> > /usr/share/wayland-protocols/unstable/relative-pointer/
> relative-pointer-unstable-v1.xml
> > ls: cannot access
> > /usr/share/wayland-protocols/unstable/relative-pointer/
> relative-pointer-unstable-v1.xml:
> > No such file or directory
> > $
> >
> > Do you have something specific in your setup to help me to reproduce?
>
> Only way I could reproduce this was using pkgconf instead of
> pkgconfig. But AFAIK Ross is using pkgconfig, aren't you Ross?


Ah, that last run may have been using pkgconf.

I'll have another look later today.

Ross

--001a1141f22618e5ca055a8dd5ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 September 2017 at 14:45, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Sat, Sep 30, 2017 at 10:43 AM, Fabien Lahoudere<br>
&lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk">fabien.lahoudere@co=
llabora.<wbr>co.uk</a>&gt; wrote:<br>
&gt; On Fri, 2017-09-29 at 11:32 +0100, Burton, Ross wrote:<br>
&gt;<br>
&gt; With xserver-xorg I get:<br>
&gt;<br>
&gt; | make[2]: *** No rule to make target<br>
&gt; &#39;//usr/share/wayland-<wbr>protocols/unstable/relative-<wbr>pointer=
/relative-pointer-<wbr>unstable-v1.xml&#39;,<br>
&gt; needed by &#39;relative-pointer-unstable-v1-<wbr>client-protocol.h&#39=
;.=C2=A0 Stop.<br>
&gt;<br>
&gt; (in the xwayland directory)<br>
&gt;<br>
&gt;<br>
&gt; I am really surprised, I succeed to build core-image-weston which cont=
ains<br>
&gt; xserver-xorg and xserver-xorg-xwayland on a host where wayland is not<=
br>
&gt; installed.<br>
&gt;<br>
&gt; $ ls<br>
&gt; /usr/share/wayland-protocols/<wbr>unstable/relative-pointer/<wbr>relat=
ive-pointer-unstable-v1.<wbr>xml<br>
&gt; ls: cannot access<br>
&gt; /usr/share/wayland-protocols/<wbr>unstable/relative-pointer/<wbr>relat=
ive-pointer-unstable-v1.<wbr>xml:<br>
&gt; No such file or directory<br>
&gt; $<br>
&gt;<br>
&gt; Do you have something specific in your setup to help me to reproduce?<=
br>
<br>
</span>Only way I could reproduce this was using pkgconf instead of<br>
pkgconfig. But AFAIK Ross is using pkgconfig, aren&#39;t you Ross?</blockqu=
ote><div><br></div><div>Ah, that last run may have been using pkgconf.</div=
><div><br></div><div>I&#39;ll have another look later today.</div><div><br>=
</div><div>Ross=C2=A0</div></div></div></div>

--001a1141f22618e5ca055a8dd5ff--
