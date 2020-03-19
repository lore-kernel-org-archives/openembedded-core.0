Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id B976960AF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 19:33:26 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id a63so2480150vsa.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0asyx1oKjL3cTuOGgSuCyYbSHvuaWZWDTe3KAZwmRy4=;
	b=atYYHA3thABWr2dopyA7NPJ55i5GRmfsIYOTsPP27Owm5GXH12sM322oESI2plennK
	jqpiBOmw1jZ3zTuFdwAoHuOtKZ32FnVDn2bg/PoZTrmJVg+4UYTTBmEZZUtAWbbB/YDO
	dFsT4d5N5IH3ZYAC7Q8IQYstkIQq9Vr7wJhbMmkxKHobBVkW9U7/3nMq7099vX4POKSS
	N+0hJ3zn85xVYo2wHt4LqsPsQgfC8Y0TjZECPD3+FVkpii1rL80nmjmHSim6CRtDBAfC
	KdyG5anoGIiohbQr1EF78YwiMAOWUB1WuDvahD/PjCAiL72AaQwvB5jUXPDYjXaw/9lK
	C6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0asyx1oKjL3cTuOGgSuCyYbSHvuaWZWDTe3KAZwmRy4=;
	b=PIpGJUUwzGr1YKZO/pPINCE/lbAeP8ztggKb7ph9XdZfNa6WSxhUEi9j85Ssxjn8RX
	d/1b+BeQmQUGwkiKHr/vyjveMWlvf4AdB6BZmHHGohT6TTpxoM+1U2e7VZS6P0vpcANn
	bmvN2yx2ngtt55yzPSKKRqNB7b+IYU5RV0LVTRdN3SBKCO7EBBP9Pk+ghtW1LA2TPXdd
	o/rW64Fb+4uskM7rUftWvEmafQQoLo9JJTFZfZcepkr+JI55z+7odBy6IVJ+0N+reSgh
	b3kDyA8QAWiV6VgP6b+1qXGUy/sueqwbKLLIYJU6E8/dZJ+TB1ErRuDqGlll1k+UnbrF
	kooA==
X-Gm-Message-State: ANhLgQ0kDpTaGoXucoYNbt4iEtI1GjUBoFMqGoBdpzN3/aOepTD4dbyB
	61f4lgebapc25+sGcIOJFyxbTl1+L/j9gPYlnSQ=
X-Google-Smtp-Source: ADFU+vv7z+lX/fwfyMWgpAOklniG1dZk4KwU5esgtc1jgdwoFPE+U38i3ZeHV5A9OKFL5WmA2D7YB9WBo4ILcUwfkh0=
X-Received: by 2002:a67:d06:: with SMTP id 6mr3341181vsn.11.1584646407261;
	Thu, 19 Mar 2020 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200319191913.13388-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200319191913.13388-1-Martin.Jansa@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 19 Mar 2020 12:33:17 -0700
Message-ID: <CAJ86T=U9+UuFK214nZgjw_-6EU1EbCUkdV-HoWs61gk3=MbLGw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [zeus][PATCH] sanity: check for more bits of Python
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
X-List-Received-Date: Thu, 19 Mar 2020 19:33:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 19, 2020 at 12:19 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> From: Ross Burton <ross.burton@intel.com>
>
> MJ: icu in master doesn't need distutils anymore, because icu 65.1 currently in
> dunfell/master doesn't depend on python3-distutils anymore since:
> https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4be8ef536bb1
>
> but the icu-64.2 in zeus and openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb
> still need python3-distutils as described in:
> http://lists.openembedded.org/pipermail/openembedded-core/2020-March/293984.html
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sanity.bbclass | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 936fe913b4..5c2f8f9d75 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -625,13 +625,14 @@ def check_sanity_version_change(status, d):
>      # In other words, these tests run once in a given build directory and then
>      # never again until the sanity version or host distrubution id/version changes.

s/distrubution/distribution/ (not part of the original patch but maybe
worth fixing in a v2).

> -    # Check the python install is complete. glib-2.0-natives requries
> -    # xml.parsers.expat
> +    # Check the python install is complete. Examples that are often removed in
> +    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu

Stray # left over from reformatting the comment.

> +    # requires distutils.sysconfig.
>      try:
>          import xml.parsers.expat
> -    except ImportError:
> -        status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
> -    import stat
> +        import distutils.sysconfig
> +    except ImportError as e:
> +        status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)

Should that be the Yocto Project Quick Start? Googling for "yocto
getting started guide" doesn't come up with anything.

The version of Yocto Project Quick Start found by google doesn't
mention anything about installing python3-distutils though, so maybe
it's not the right document...

>      status.addresult(check_make_version(d))
>      status.addresult(check_patch_version(d))
> @@ -667,6 +668,7 @@ def check_sanity_version_change(status, d):
>          status.addresult('Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n')
>
>      # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
> +    import stat
>      tmpdir = d.getVar('TMPDIR')
>      status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
>      tmpdirmode = os.stat(tmpdir).st_mode
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

