Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 32D4C77E76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:34:26 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id q26so39653767uaa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HoeYNDD4O1ZOp574GfwdEMQvHkgswQQzHXKMzmniwJU=;
	b=h4sNIgbQMhTffK/Am8swiXQYS6OXZnkC42+AOmW8wKq+NE0eXAmUvE6Id4Xo435Jas
	rv3AtB6pRUSlaloVibbrvIC/8P7vO4Xosxbjo3EHbA7wK6HSC7acyY3D4aWwIoupgYL1
	xZhdajrc2ZYxnNyZpiAsQECz2IxzrmasOdRlg18xM/GGl+KF4s4ry7+s+BI2UDSQ6DCc
	mgU9dQ0RSCFTcZ6NuHQxv7cre3kCzODRg3uCQNSbqqmmyQXMfm3Ba4qbHbtwqulYaD09
	+gcyCobMeN4KKIHySjJ8nFjscT346iqfoFxSfQcA+wzz/JPz5fdLAsJ26o588sdfgMHz
	r6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HoeYNDD4O1ZOp574GfwdEMQvHkgswQQzHXKMzmniwJU=;
	b=OPG3g58NC0dfy8sk0nL9aDh2PojpaVHDlsFlvm/NoWHF05L1f8DLy4ca1CTVqgG8vf
	bKvj0t1CkbdC4zIsxnhWe+9Jm+HgkF/XAyItkTEvV610+NemUGFx3yY2sckhZxM6a0zw
	HH1qi4uGijR01XSek5mbqBy8Bjzi8wE0Cz7hM7X/20G6NBVP+BHy/YtP1K8CatHKr0Vj
	0LHFCA4AhlC16JE+ZSOn/enhAqGByxn7RWZcwujFsz6JR3AQQ4sGjoaSogayLsDUYo5X
	3SV5cIqnIsiGxck/ygaLfyil6furtSNRey/FYYQtaz1nAyEQ5FcAdv/rDzJR/NpgiXIO
	uuEQ==
X-Gm-Message-State: AN3rC/5BTWGO9iM+dxZkfgazReV9tIC0uqqI100vNfiFAYebS3fjhU/x
	E+z4vrpfUJSvHpoJd7uxpDyWKbuQXg==
X-Received: by 10.176.25.18 with SMTP id v18mr2312178uag.81.1492115667670;
	Thu, 13 Apr 2017 13:34:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.53 with HTTP; Thu, 13 Apr 2017 13:34:27 -0700 (PDT)
In-Reply-To: <CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
	<CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
	<CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
	<CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 13 Apr 2017 22:34:27 +0200
Message-ID: <CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 20:34:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 5:57 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 13 April 2017 at 16:53, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
> wrote:
>>
>> OK - but why do I see this error in do_unpack?
>
>
> What recipe and task?
>
> Ross
>
It is not that simple and it drives me mad (as usual :)

Failing recipes were [1-2]. They failed in task (do_)unpack.

For unknown reasons case [1] (polyphone) works fine now. OK - I pulled
oe-core again (40 commits) - this is what I usually do when things
fail but I cannot see what commit has mended the issue for case [1].

Case [2] could be fixed by
do_unpack[depends] +=3D "p7zip-native:do_populate_sysroot"

So I hope my do_unpack trouble is gone. Thanks for taking care and
ignore the patch I sent.

Andreas

[1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-mis=
c/recipes-multimedia/polyphone/polyphone_1.8.bb
[2] https://github.com/schnitzeltony/meta-retro/blob/master/recipes-games/d=
xx-rebirth/d1x-rebirth_v0.58.1.bb

