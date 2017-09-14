Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id B3E33784F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 14:53:28 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 6so383711itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L21RnMytLpDNmabAlxfYh3rlDXRSl9ybDeJC6kXEthw=;
	b=tmR0nkI0e7YTY+34txJ9p5PAUFlmr878+W1TGl3+Wort/8nHyA9kqV3V/53gkLC3fM
	xL9cwxWXPpS35hNqEyzmgjx8htKrDMHrjAMA2Fyh1irOo8++H/36j1W9ea9ykKVXndbT
	UaGYNqTnnHTwShqRp/NZQABFMhwQp6+JaGL3PMlsxvdYWo0dy16uOwMkMvKf/TFFpvoy
	959/azP45h+0hy/J15xaNYAyGLwslsT3tkW0F6hDlDZ1JA5JI5HaZQ++7b+rjX3MT54Y
	0J74sHbyYP7cywdZ82JWq82Q+8d2qpaPimDVGz3w6Q3KNxJ5nofvGhcTOSm1Iq1jCu0E
	l7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L21RnMytLpDNmabAlxfYh3rlDXRSl9ybDeJC6kXEthw=;
	b=PdX/0MiWooYMpOuqnwArLYS8JKHl0WyyyRqKgim5TQINA8IYdte6qdJNFyOMZ+O+cZ
	6SoKT1lvjd7wwZnC8ZNunVv8l1O6P9pISnJLOL/T1UDo5pFu0R57wBxgoIkaW2TazK9P
	zn00xREU4OmVQppk112CGyAVfZH+4/eu172vsPZ9qeggImRGnhqeXgRjA8fqFcLO+97X
	yvYZZyAQYm0jZ+ULGmybpCVbbJCoRcs+OoTWKVgmSKnHVDBbniOefeWUrWutBwWGVM+Z
	mg3eipA98aurTJkNyzbG51wc0a07eXxpSlXghtZ6tsxlF0vIH+WN8HX9YuqnLW3g60yr
	aFaQ==
X-Gm-Message-State: AHPjjUiz3UapWZHCY0VR1lklqPaaw1NvP0+3xk4dRYGaoStg8pRTux8x
	VS4A+jji5iVXVza70NTelRrjx8/unnRNzO7gJc0S+A==
X-Google-Smtp-Source: AOwi7QALmzZO36m4zSIO5dzT6RUyrnMMv57LU9u2R6MmMsIptImQJiOvAU+i26r/FbG5dyrghtbg3sPMfvOJCAMyTBY=
X-Received: by 10.36.178.1 with SMTP id u1mr531871ite.120.1505400809956; Thu,
	14 Sep 2017 07:53:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 07:53:09 -0700 (PDT)
In-Reply-To: <20170913170943.60a3d856@seebsdell>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170913170943.60a3d856@seebsdell>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 15:53:09 +0100
Message-ID: <CAJTo0LZr+mFy9_behSGMpfy_=A0PUGOm_9xf2Co05PKqZQ5yOQ@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Thu, 14 Sep 2017 14:53:28 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0e8600d305592770c0"

--f403045d9c0e8600d305592770c0
Content-Type: text/plain; charset="UTF-8"

On 13 September 2017 at 23:09, Seebs <seebs@seebs.net> wrote:

> On Wed, 13 Sep 2017 22:46:59 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
> >   And some-other-unrelated-file is really some different file, not
> > just hardlink to the same file from some different directory (like
> > between WORKDIR and sysroot other "path mismatch" entries show).
>
> To clarify a thing: In practice, "path mismatch" with links > 1 is
> probably harmless. I think I had a patch floating around to stop
> alerting about it except when being paranoid.
>

Example:

path mismatch [5 links]: ino 27539515 db
'/data/poky-tmp/master/build/work/corei7-64-poky-linux/dbus/1.10.20-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd'
req
'/data/poky-tmp/master/build/sysroots-components/x86_64/binutils-cross-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld'.

Looks like this is just warning that there is a symlink, right?

Ross

--f403045d9c0e8600d305592770c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 September 2017 at 23:09, Seebs <span dir=3D"ltr">&lt=
;<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">seebs@seebs.net</a>&g=
t;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pa=
dding-left:1ex"><span class=3D"gmail-">On Wed, 13 Sep 2017 22:46:59 +0200<b=
r>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 =C2=A0And some-other-unrelated-file is really some different fil=
e, not<br>
&gt; just hardlink to the same file from some different directory (like<br>
&gt; between WORKDIR and sysroot other &quot;path mismatch&quot; entries sh=
ow).<br>
<br>
</span>To clarify a thing: In practice, &quot;path mismatch&quot; with link=
s &gt; 1 is<br>
probably harmless. I think I had a patch floating around to stop<br>
alerting about it except when being paranoid.<br></blockquote><div><br></di=
v><div>Example:</div><div><br></div><div>path mismatch [5 links]: ino 27539=
515 db &#39;/data/poky-tmp/master/build/work/corei7-64-poky-linux/dbus/1.10=
.20-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld=
.bfd&#39; req &#39;/data/poky-tmp/master/build/sysroots-components/x86_64/b=
inutils-cross-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld&#39;.=
=C2=A0</div><div><br></div><div>Looks like this is just warning that there =
is a symlink, right?</div><div><br></div><div>Ross</div></div></div></div>

--f403045d9c0e8600d305592770c0--
