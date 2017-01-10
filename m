Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3C65260107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 23:30:53 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u25so575865092qki.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 15:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rx2zgtpWkbOUM6Ylq3914T94CwgDINr0YC/8pHOTLrY=;
	b=s57fCcMe+BOjFHTmaRBGdxIsxMQom8QTmXy7YPuzmSCeOKim4N7bfYxX747xp3wjDa
	Lf5ltyj1aT1Z3rOfEntekIzTb8cAH23o9/dkAMlMQWv+6bJyy3wt3/KmlXQLx6hZXH0d
	d/9UYrHPuPrtKI3OzHdCq5mzkwPxsszGsw2wHwgGWhJoeQ+wLg6igGkVKXM566uctOnn
	upu9YjYAmorgT7Pf2+KN2KLi46BxWbRWlNqLfWZCZQxTSBoBCkZgWhnZdTrd5z/+Jzjv
	rDYpoVv0boRDWF5eVpv8vK8C9Bjby9h2wtpbi5di80n4O6LJpk4wHGbrCbgdcS6ALlz2
	mh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rx2zgtpWkbOUM6Ylq3914T94CwgDINr0YC/8pHOTLrY=;
	b=tutqGAEP9E5doqVFuwEpiJERT3UvD+9lOrHtG6WNDZgHMoHqE8k40jvpVILrkjkafn
	/uVue23ZZ2k1gjypy55LtHX+E7TLEau3sO8v5z9Gs2jzVsrXIA/aqHynf6/t565mphmJ
	E7FT+ipYIcFpCyUc9UC+mMITxYkjHN2mUPJJXranWMtnRkZARBNgw8V1hJSHt7ApM7WV
	j255D0yhyLN0jEC3LHA8JVK58HkGwt57W7TBHhQHXlAx3CSgrMdD/a/S63/a+SyRCNid
	SIiWOCCFYpN/1bIFL7nO/bA4f/2BF9Pp5ZRvz+0TfvW6OTsUtmb5LG0ByWYcbaIsz6zS
	Z3yw==
X-Gm-Message-State: AIkVDXKf/oi4Du5zU+7c7W3U18BjFXIotS8tjJYfyyN3LtCFUgnG6U29IdEsxALZ338+b+FQyhWRdaAeraiVWTK3
X-Received: by 10.55.16.11 with SMTP id a11mr6109222qkh.3.1484091053946; Tue,
	10 Jan 2017 15:30:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 10 Jan 2017 15:30:33 -0800 (PST)
In-Reply-To: <CALbNGRRtQYDs_-KqD7TPeQKdWX7UQrYp1DKLfHkt5SJa-Ca17g@mail.gmail.com>
References: <1484070799-19031-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LZA_r=H8_Nchybr+7+bZu0Ka35MXd_AqvbYNZ9Db6VRLg@mail.gmail.com>
	<CALbNGRRtQYDs_-KqD7TPeQKdWX7UQrYp1DKLfHkt5SJa-Ca17g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jan 2017 23:30:33 +0000
Message-ID: <CAJTo0LaEh+C-bFCwfAe8_E8VGoHtaYNXBPo4wVNXcaPkAnYwYg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
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
X-List-Received-Date: Tue, 10 Jan 2017 23:30:55 -0000
Content-Type: multipart/alternative; boundary=001a11475cbc15cc9a0545c5e06e

--001a11475cbc15cc9a0545c5e06e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 January 2017 at 21:09, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Yes: we need python3-pycairo in DEPENDS and RDEPENDS. V1 had
> python3-pycairo in RDEPENDS only.
>

Thanks Andreas,

Ross

--001a11475cbc15cc9a0545c5e06e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 January 2017 at 21:09, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":45b" class=3D"a3s aXjCH m1598a36f72fa2ad1">Yes: we need python3-py=
cairo in DEPENDS and RDEPENDS. V1 had<br>
python3-pycairo in RDEPENDS only.<br></div></blockquote><div><br></div><div=
>Thanks Andreas,</div><div><br></div><div>Ross=C2=A0</div></div><br></div><=
/div>

--001a11475cbc15cc9a0545c5e06e--
