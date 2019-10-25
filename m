Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id DEB826D561
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:38:41 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id v2so997963ilq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=7+yhosSpzyZLoPTLUd0bve9JHwG+qkYUzSxpfJf5WYc=;
	b=iiUHHcT0dmKbTq46T8gKaUUUbh41GdHFBkSzrgx+iuTUTCz3ucPCvWyzsO7uPwWpaP
	822KnxlHGlEpLrUrXgv9nH02udn9Vc0zSsuH2TPJYI/Lpy/WT52yT4mGrdeqTyhw7hOX
	WM9tnCXL1NAHsDPBEvrrW6BOLw5LuPqvQ97SFvHUZSKyJvDEx8KHCjCmpzQK5PnB1+gg
	lOWuAhXlUX7TeGfJcgrNBoxvJUZlYAFOGRQoG3a9o3s/feryorrQZgHuZw+i+Wm8lbdt
	Ui+4WvE6LVXiEirfVoKd+mEBdSwMzwQQhk/OAjn+0bHVZN3/4vkhPCSoRc2ICsAGnh2s
	Turg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=7+yhosSpzyZLoPTLUd0bve9JHwG+qkYUzSxpfJf5WYc=;
	b=qd0JPMzWdw8JmhVAfwzUPtOPrYTroN/fZxGu1wEpyVJ2V2TcIHsRZqiWhL5WJzMGMx
	sUiVcRleB49zv85lwgZyP17IrgEMWxhtmK8UIE3CClNmmYPd2m0f/0YG8GtTG9i9kA/p
	48lbbfJwPCvR2dam9d0VV4miYvRCiUcML+Mx4P3jUvR8GZ96NjyCnnMYdf4uXTKQfZyx
	u685J1U8lx5FKrKSZ0X35yWR0V1cnu2k90PVjI813pZtHYFj1wz56QRERE+FTAdUII6C
	fSBKsH97l/Vpq2frQEBh5FbnDIhfCUiRU3JbHf/nL30JAc/wTNfsZ0rDQy8sW0jHgvGH
	kocQ==
X-Gm-Message-State: APjAAAXO778rIPWuLI9ZUwq6ru58lOhRhNDJX4d/syxBEkI0RKe7/qjS
	TijMiH/3JoB6nEFIOT5IN5D7elqxgCq2YxGxWIGT173M
X-Google-Smtp-Source: APXvYqy7JBdWJeYbUtIk1QJQZ3KEhuV8+88HV2M7icI2UASDk6ZZJNWfM+UK0Dozv5nsscUmey4hdrN4awRz1MkD4I4=
X-Received: by 2002:a92:8746:: with SMTP id d6mr2607777ilm.267.1571989122579; 
	Fri, 25 Oct 2019 00:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191019130633.9488-1-schnitzeltony@gmail.com>
In-Reply-To: <20191019130633.9488-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 25 Oct 2019 09:38:30 +0200
Message-ID: <CALbNGRSQzPw7OepACxSgBfdC2ZKC+kTFwkuqVzSJyw4q8gr0Pw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Subject: Re: [PATCH] libical: add PACKAGECONFIG glib and enable it by default
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
X-List-Received-Date: Fri, 25 Oct 2019 07:38:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2019 at 3:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * As long as there is no solution upstream [1] build src-generator native=
 and
>   adjust cmake file to find it
> * libical-glib is a mandatory dependency for evolution-data-server >=3D 3=
.34
>
> [1] https://github.com/libical/libical/issues/394
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Haven't tested but it might not apply no more after patch adding
DESCRIPTION & HOMEPAGE in gnome recipes. Before I go and rebase I want
to ask (seems motivation to apply this is limited): Does this has a
chance of being accepted. If not:

* Why - it is meant as temporary solution
* What way would be accepted to get libical-glib building?

Cheers

Andreas

