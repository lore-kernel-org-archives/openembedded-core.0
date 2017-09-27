Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7489377D74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:02:01 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id c195so6713786itb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NJS28BXhHaalJ/6yrBNoQU3zm7xxTcjtuNNjH7o1SQU=;
	b=kpHVJARS2qfoBFsRZbVqlykMbUTjB9gqy4S1fx8+KCPfoBR2TWlIeAVdV03SpqUpnw
	vIl0zCiboQOjP+qXShSNi5jlfjGf2g58rp8VpB3DAOu10tj98xTqGXHdQo4LwDu6/VMD
	4m6Xr1aD1Wc0SSAjUmxu5IQadw01f6hUlnlJGKjZgmws2k7BthvhS06s53E0rAyMTV/F
	GcWQ6/Slo+7BXcAOtfvNF6mL+rtVx6H2Vs0LWgPlPNpwtH1EuzRVQxaXzCZcXTHqovgM
	xlFyKMxvdIDU7y/J4Uy4+3wBrWdiN5QAbTQwEvm/+tSFr6+TVJiK21f8B5PSgFgT554k
	PBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NJS28BXhHaalJ/6yrBNoQU3zm7xxTcjtuNNjH7o1SQU=;
	b=hEy1v/fQoiFfFWOW9y7y6jtzZi1Q6p7Zm0zz3k/gqeZi4SHniloFt5e6LdBI9bTysB
	EU4eqfL5v/G4ZYMju+omxRI1cjNC4JWrDUwkh0qUg7ojPfkSaYgK86zq/r9xk0S/y8K0
	wBqQm19ldS87LH+I+T7pllV3qak3v4FdEfQXLaN8lm6z66N6zLhyZBwAWYeJ2OcmaN2S
	QB8Lzk1RPV0YAHQl/qs/dcQS7S/F6vnfDRX/W9NbEspHcD81EEu32pzAU8wzxE3BUzN6
	ZVI/U96IgfS50EX9nUcMA5P7onxypV8+0/OoSXo9/DJn403Xa4tcIxWanJbzEupKdxzz
	Sp7Q==
X-Gm-Message-State: AHPjjUjKEK3I3vTlEs3dmsAPxGhXqNfUbMu1fXnKUu2CCdnK1dOQKSLl
	e1lsQfnLwXy1JingX9mIO3puhWcgM8plcWkIeI+w4A==
X-Google-Smtp-Source: AOwi7QBpAGpG26FfY6m51rTaHHdw4CTkM50N7eXUR9da5lq7yjbUwa5FyPgU8b0LxBiEWI3fFnPL3uCbiYCmpTCmN0w=
X-Received: by 10.36.181.73 with SMTP id j9mr123633iti.6.1506513722453; Wed,
	27 Sep 2017 05:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 05:01:41 -0700 (PDT)
In-Reply-To: <20170922235219.2785-1-sgw@linux.intel.com>
References: <20170922235219.2785-1-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 13:01:41 +0100
Message-ID: <CAJTo0LaJmEy6EbDZ+uv92ESgLZx-wYB8mmKboJsP4pAR8uDA5g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland-protocols: extend to native and fix dependencies
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
X-List-Received-Date: Wed, 27 Sep 2017 12:02:01 -0000
Content-Type: multipart/alternative; boundary="f403045d9e4246c992055a2a8f4e"

--f403045d9e4246c992055a2a8f4e
Content-Type: text/plain; charset="UTF-8"

On 23 September 2017 at 00:52, Saul Wold <sgw@linux.intel.com> wrote:

> When trying to build a newer version of Mesa, a native version of
> wayland-protocols is needed to build.
>

Why does meta-target need wayland-protocols-native?


> +DEPENDS = "wayland"
>

So how does wayland-protocols build now?  What was breaking?

Ross

--f403045d9e4246c992055a2a8f4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 September 2017 at 00:52, Saul Wold <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.int=
el.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">When trying to build a newer vers=
ion of Mesa, a native version of<br>
wayland-protocols is needed to build.<br></blockquote><div><br></div><div>W=
hy does meta-target need wayland-protocols-native?</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">+DEPENDS =3D &quot;wayland&quot;<br></blockquo=
te><div><br></div><div>So how does wayland-protocols build now?=C2=A0 What =
was breaking?</div><div><br></div><div>Ross</div></div></div></div>

--f403045d9e4246c992055a2a8f4e--
