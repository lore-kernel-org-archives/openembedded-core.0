Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id D567D7C07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 16:05:21 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id b16so18041034ior.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 08:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s5Fs6ixI8nOI7IPD0iDeYtI54q4tQBVR4mAFCFmC5z8=;
	b=B0bedWZkkr6s9Rzm5qOn8IX6xkd2xq/Emy1IXiT2g9QjL6eogqycrc5cKl9fV670L5
	dvhM+Vizsjd7h3Gu38IwpS4KtO/dFxefK0GnO5jAOQ8Uobu3NsaL8LCBcyTKKu4BptE5
	9xAnvirmoLbCh/AUxNj2e8KM+2b87OIvHWUx3bxLOMdSSVRFupk/Rf76I0d9OR+3ZHEy
	HAeZjnX7kTTz+eDnOqGiSUkLfzYdBqHJjzwLYTOzFtsmHhzfn0uruPzutznDtr8ZSy3H
	6VSioI9n/bbS4bKRdOZZWKZ7nIOE4jL+tA9YkRHcM3hZ41H5niZB13ojwHuT1W7vqBgh
	xtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s5Fs6ixI8nOI7IPD0iDeYtI54q4tQBVR4mAFCFmC5z8=;
	b=i9FUxurLuQrKsQNU4h7+Gf5eDfbjbkrAvjVyGVZZKbtoP5nKjJyLfcj3LNBBymYwAI
	BX9NUtgIqs457ZEjHWt3YG04R8YXQg/30n3AOVGTctSdCckM2c9BtAwM9NY1REcwOgAh
	ZCpokCh1Cj0fvvwl5u1SdbAev43zo72tofo+rXut5FvrCL1TIL6J6WPlvyrxTWpPqUzg
	tpAZeXjRVr90K/Xskop5VImVAiryu6GHGnScbg2kOpCt/LPWBBL34meXPe3rQoVf3aCn
	tBuK3wb2qRhXeAWam82+rizHAh3OEd1Trs1TzH/l2lBhdQg/7DNSXX/Krk4gBe3hMFq4
	U76Q==
X-Gm-Message-State: AJcUukdL0Qacg9vEkvMQ84lE3rgCE2mQP8ri06bqA79efbWO0kMmYziQ
	anIcTDpRPPrLGjq+HtWAYVkNTNGy3ucl648UydTeWg==
X-Google-Smtp-Source: ALg8bN5TY0BX8wkRk64inWtX6jSDT2uNYB8VZBZAFZ8Fqv5fqTYyqjzQdCKkJR1y+t273ukQSm/b6i8RLPJOdRM4gCU=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr15705785ioe.20.1547481923073;
	Mon, 14 Jan 2019 08:05:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<699c3aa571ce454e98d6fb405e1375a56aab1c3e.1547477793.git.alex.kanavin@gmail.com>
In-Reply-To: <699c3aa571ce454e98d6fb405e1375a56aab1c3e.1547477793.git.alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2019 16:05:11 +0000
Message-ID: <CAJTo0LY0FF5apEOOz8N9rCdXwsJ+F3LYiw6R_KMhrS-WQgmY7A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/23] mesa: enable native and nativesdk variants
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
X-List-Received-Date: Mon, 14 Jan 2019 16:05:23 -0000
Content-Type: multipart/alternative; boundary="000000000000526083057f6d3619"

--000000000000526083057f6d3619
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jan 2019 at 15:05, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> -ANY_OF_DISTRO_FEATURES = "opengl vulkan"
> +ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"


Sounds like this means we should be fiddling the native DISTRO_FEATURES
instead of making a distro feature check target-only.

Ross

--000000000000526083057f6d3619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 14 Jan 2019 at 15:05, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">-ANY_O=
F_DISTRO_FEATURES =3D &quot;opengl vulkan&quot;<br>+ANY_OF_DISTRO_FEATURES_=
class-target =3D &quot;opengl vulkan&quot;</blockquote><div><br></div><div>=
Sounds like this means we should be fiddling the native DISTRO_FEATURES ins=
tead of making a distro feature check target-only.</div><div><br></div><div=
>Ross</div></div></div>

--000000000000526083057f6d3619--
