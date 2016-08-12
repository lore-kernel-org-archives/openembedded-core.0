Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 472377723F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 10:26:57 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id x130so8400057ite.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uFfvxVDl3+rNLF52s06Nh9Wfc7zlpr7mub5NPDOavDI=;
	b=Uy8z/OrBTSNOY0cKgu1mjNBykRu3WWKI6OplJB+f60szqUuRZmaA1A5J6rUdeG03NC
	RZSxjnQxDF+jwXufqsn09zp7FKGh7aGwk57la764/KWt1SbWUraLaKRmlJfWTxlHG7Vk
	69V49Wr4cpLshkv4IOVPLUsr+uWri2SSpY4RNTlYtrKt72nCfIzmFSJjSBzJACsm1R9E
	pyl+bimowR53xTXqCbfxS5+X/22+r4+6DgQY52fiKnbv+li2IHGJyKH9hR+tvMrgt94h
	Tim2SNjCzjnOBBKn2W59bCQoUSCFqeHWdwMRvQgw78PHdZ9nDodkJvb28hBSG4FsJH/n
	AhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uFfvxVDl3+rNLF52s06Nh9Wfc7zlpr7mub5NPDOavDI=;
	b=e5aWnXdT4jKbVsDEQQV+eBQPPivvHFGxtzmPSCfl7j48GB2jtouuJtlfmrQrKZFCs0
	hqlWDaWAIQ7IwWqiJ7wMhpPbV1JDpmb2CTNu9/0ViFhwQhHblNqe7nYJW63jHKfr1jfF
	gXun1BMc6KCQYDhfV6iL/oZ96f6CXShUkcfzRjp6VxKLtXJo7bYEMfoPU+KKl/IjWj+Z
	uxnr6bZIBIL4FNllbzXuC9vA0nsmn5gbPYtAyHVDAG2csroN8yJ3+EtiqGUt54Bgdw/V
	/If4SHHvNLa4YJzRjf+ZBVIq2mDNwykpsxo3rQhnYbQq/5nv2nntKXUETrSnXSGNWqEF
	YGEg==
X-Gm-Message-State: AEkoouvHb5R4tZ5J5QElqHgrIs4AfApXlWzn7z16F0+6u6T8vCzcoxTltjPqRo7WiSBpy1agKxSKK/Ut8wkh5I7M
X-Received: by 10.36.129.213 with SMTP id q204mr2419865itd.38.1470997618373;
	Fri, 12 Aug 2016 03:26:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 12 Aug 2016 03:26:38 -0700 (PDT)
In-Reply-To: <BCEB06E0-9F66-470B-9691-95CA0DA1968C@gmail.com>
References: <1470786256-25154-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Lap6sa53wkDi_dJr-yRZiGkwHc_fuDmt8OG5ob7tgyAeA@mail.gmail.com>
	<BCEB06E0-9F66-470B-9691-95CA0DA1968C@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Aug 2016 11:26:38 +0100
Message-ID: <CAJTo0LZF6-fUnEh2YV2wdknbmq8LaqQEH7XejQFf1AGkEBq5gA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master] curl: Update to 7.50.1
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
X-List-Received-Date: Fri, 12 Aug 2016 10:26:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc8242f10539dd52df

--94eb2c08b1fc8242f10539dd52df
Content-Type: text/plain; charset=UTF-8

On 12 August 2016 at 06:47, Khem Raj <raj.khem@gmail.com> wrote:

> 7.50.0 has broken API which was fixed with 7.50.1 so we should upgrade
> asap.
>

Patch sent.

Ross

--94eb2c08b1fc8242f10539dd52df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2016 at 06:47, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>7.50.0 has broken API which wa=
s fixed with 7.50.1 so we should upgrade asap.</div></blockquote></div><br>=
Patch sent.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--94eb2c08b1fc8242f10539dd52df--
