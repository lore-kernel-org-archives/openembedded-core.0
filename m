Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
	[209.85.221.182])
	by mail.openembedded.org (Postfix) with ESMTP id EEFDA61011
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:05:55 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id t129so2325550vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FA2GCquRuXh5aOHjuZywCi/f7k198hyx9DIV0rc+5U0=;
	b=Dc4k+cS/SyjECVfp167O0B7xgeZEClDMwXogYwpEzKM4kFHgd3O7hnXdL6PXBMNdMn
	figf9vSlYaDMzjWyNYPyezc1vK0udDkfsP4p+9Gh00qcEZ68/fvSrzi7PO9/Tvau175y
	s88h3lKU29RZhZSPYqPGM4YhzOvxmFdW6hDaHf/FJT8jGwEO1jZr4y9+fBd8rv065qE5
	Po1Z/TUZfb3pZBwo2KuN6nOIqcnj4iQ7RFncwOw6WtYQEiWFm3ymHvjD35cTXP9SgKLO
	7wdkIoQ+OqBZO+zA1HyR0P5YtgMU0kxH15uTEgqLYzJubvhBWsWyhy6Owhj/Xz/Y5Lz0
	+Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FA2GCquRuXh5aOHjuZywCi/f7k198hyx9DIV0rc+5U0=;
	b=cUB9zGocuAd711jmFAVHJn69D2IdUM6tMPNjKy3wfPe2VSM6EDUTx4gThI0TEKfbU6
	pUGqPNFe3+69Yyx2wTKXnL/+cUWXvs6KabvlmT1v6EA3cr56oIjTJ3oZqyl1HjelX5bL
	JSe+mK7mCVKd97DgWlH4hrbxOJwHbLsnnYsAsSvErO3Ixa+KhELvIPTYYeuNq23Fgfzq
	LAPoKNtFHZ4z+TeKO9l5NloIQZuHbraSg0Llay+rBN1DJftlDUi7o2FmOTOA6tBOHPyz
	kUwH3DUUi6FHUrRKrFhqvsykr7DIkwFW+X40fKya+zqKAhCWXnJBTFLn6Rvu/V8he50k
	eStQ==
X-Gm-Message-State: APjAAAW5ea6j1UBX2kr5LMDRrtWibbfTD4mxuIHkV0gbX5QjuHeg9UMQ
	xpHbKAj3c/CgUw7yAaVWcXWVGWIrL+gTuR6RFGs=
X-Google-Smtp-Source: APXvYqycRhPuipNrsAZ1oEogOlepsnIEJpAj5QoSGDhrIndwoFZoU7hN6yVcN9kv8shrE0GikqXe0q8kuF4juYWyuPQ=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr961082vkc.29.1581663956816; 
	Thu, 13 Feb 2020 23:05:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
	<CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
	<CAMKF1sp_fEAyuGxgxUG=bXuVEMm01NG+g6Vqz29Pseht0nPQDw@mail.gmail.com>
	<CANNYZj_tT5QSvyqhk-dOThThcO-rM-jT6PrTwM4pt8y7sPVSxQ@mail.gmail.com>
	<CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
In-Reply-To: <CAMKF1spgO92JJAaVCP26veEsedY_FAziNn6zi9cbpuy2_ofmSg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Feb 2020 08:05:45 +0100
Message-ID: <CANNYZj-7Aidoy4Y6P7ZzXNuGtUCcKddF4B3oeBMrcmmNAceDtQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Fri, 14 Feb 2020 07:05:56 -0000
Content-Type: multipart/alternative; boundary="0000000000004cd71a059e83d6b4"

--0000000000004cd71a059e83d6b4
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Feb 2020 at 02:40, Khem Raj <raj.khem@gmail.com> wrote:

>
> autobuilder runs poky, to reproduce this you will need to use
> oe-core+bitbake checkout
>
> and then for qemux86-64
>
> bitbake -ctestimage core-image-sato-sdk-ptest
>

If I set up a nodistro build, ptest packages are no longer available and
build doesn't start:

akanavin@ubuntu1804-ty:~/poky/build-nodistro$ bitbake
core-image-sato-sdk-ptest
...
ERROR: Nothing RPROVIDES 'acl-ptest' (but
/home/akanavin/poky/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
RDEPENDS on or otherwise requires it)

Can you share the config (local.conf) I need to use? Or maybe you can show
the failure you're getting. The tests should be skipped if /var/lib/rpm is
absent on the target image, so I would like to find out why it is there
(presumably).


> it might also work in poky setup if you remove
> PACKAGE_CLASSES ?= "package_rpm"
> from local.conf
>

That's what the autobuilder test does, and then it passes, so I don't think
this will help.

Alex

--0000000000004cd71a059e83d6b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 14 Feb 2020 at 02:40, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
autobuilder runs poky, to reproduce this you will need to use<br>
oe-core+bitbake checkout<br>
<br>
and then for qemux86-64<br>
<br>
bitbake -ctestimage core-image-sato-sdk-ptest<br></blockquote><div><br></di=
v><div>If I set up a nodistro build, ptest packages are no longer available=
 and build doesn&#39;t start:</div><div><br></div><div>akanavin@ubuntu1804-=
ty:~/poky/build-nodistro$ bitbake core-image-sato-sdk-ptest<br>...<br>ERROR=
: Nothing RPROVIDES &#39;acl-ptest&#39; (but /home/akanavin/poky/meta/recip=
es-sato/images/<a href=3D"http://core-image-sato-sdk-ptest.bb">core-image-s=
ato-sdk-ptest.bb</a> RDEPENDS on or otherwise requires it)</div><div><br></=
div><div>Can you share the config (local.conf) I need to use? Or maybe you =
can show the failure you&#39;re getting. The tests should be skipped if /va=
r/lib/rpm is absent on the target image, so I would like to find out why it=
 is there (presumably).<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
it might also work in poky setup if you remove<br>
PACKAGE_CLASSES ?=3D &quot;package_rpm&quot;<br>
from local.conf<br></blockquote><div><br></div><div>That&#39;s what the aut=
obuilder test does, and then it passes, so I don&#39;t think this will help=
.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000004cd71a059e83d6b4--
