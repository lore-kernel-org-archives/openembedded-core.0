Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 866726FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:59:23 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id mw1so70270751igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 00:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cMey7STDXXXbehID035XSm2ZvJvdXFfp689L3ib9MRk=;
	b=J5MRuxtmUprfA7kiYxZj+HBDknpq2WuL9TYAYY9M8f32tOTmCqqe+WDxwMbPmaKrf9
	7D6j85ikp7UI1NsvfeTpxC2a1HZshcYee+9JsYGndYnCNbTjLhUbrZpQSB0V76ivHfn6
	re6/TqcrHuMk0Xukea10eNDVdyE/8Dppo/D0w+BkknCCA39zLEP1P3syVOp4wZovGSOO
	PUOlo6rMx8m9dFiFUbM6pq6oNo+yj3xexqBxAwFbknf5ftXSffHt5K1a1cxAGb2rSsNz
	SZoPRB9xsRjUOfym9IQpZeMVeX8dKRJT4LmL71L/tSH3GYZklG8G335LUBXypVSeqLBR
	gG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cMey7STDXXXbehID035XSm2ZvJvdXFfp689L3ib9MRk=;
	b=M//GuFHsCMVegQ9I+g8YPeTXD8AkJLhOiCTfsjSyqo3pIhnpkBDWc1y72GpCDumDvT
	Fhc5gToGEVUHgkf+AwxeGDHXH1iAFQ/jgEuVNmfwiNlGn32oVOVDTwVQbcC/fu1Ie3D5
	W/Xuygonp+DmP266FAZqbYjCN9vaH71GCcCtNKm2tNpOXuxBqROHVDkK7rSg0KbESia2
	QRmC/l5y9O18rwQIj9NxdTQrCenLQqILYFm0kLV5rvdq5zECwFYYdvFoLQAGgX0SIjvZ
	8+s3kDp+dRheMoZ9K/qWW7Axwbzc8FnnszL2qhX7G/dJGSkn+he7+3pVobotXDHXh4/J
	pvSg==
X-Gm-Message-State: ALoCoQk7ijbJjl03wBG866X+u8eE3VRQDzhTJCL1GijyQCS+d9mHhLNPYsu/q4pkT3UASstJss/XjIpOSmAJeodjDBh6223zSLniYyldt7495JfDIzrAfVQ=
X-Received: by 10.50.126.8 with SMTP id mu8mr19478774igb.52.1452243563677;
	Fri, 08 Jan 2016 00:59:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 00:59:04 -0800 (PST)
In-Reply-To: <568F76EF.20009@windriver.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
	<1452137394-333-4-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com>
	<568F76EF.20009@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 08:59:04 +0000
Message-ID: <CAJTo0LYvLxSBXZ5VWzVrKzSww7xQgpX=L2_dc=ZxOOkCpzX+vA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oeqa/runtime/parselogs: escape special character for grep
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
X-List-Received-Date: Fri, 08 Jan 2016 08:59:24 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfbda8560528cecd91

--047d7b1635bfbda8560528cecd91
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 08:44, Yi Zhao <yi.zhao@windriver.com> wrote:

> It still need to escape quotation marks if using -F option.
> Consider the following log:
> [521514.737] (EE) evdev: Qemu Tablet: Unable to open evdev device
> "/dev/input/touchscreen0".
>
> We still need an extra step to replace " with \" before grep
>

Actually that's only true as the grep command is passed to
subproces.check_output() as a string.  If it was constructed as a list the
shell wouldn't be parsing it and you wouldn't have to worry about quoting
at all.

(always pass lists instead of strings to subprocess, it makes everything a
lot easier)

Ross

--047d7b1635bfbda8560528cecd91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 08:44, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=
=3D"#000000">It still need to escape quotation marks if using -F option. <b=
r>
    Consider the following log:<br>
    [521514.737] (EE) evdev: Qemu Tablet: Unable to open evdev device
    &quot;/dev/input/touchscreen0&quot;.<br>
    <br>
    We still need an extra step to replace &quot; with \&quot; before grep<=
/div></blockquote></div><br>Actually that&#39;s only true as the grep comma=
nd is passed to subproces.check_output() as a string.=C2=A0 If it was const=
ructed as a list the shell wouldn&#39;t be parsing it and you wouldn&#39;t =
have to worry about quoting at all.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">(always pass lists instead of strings to subp=
rocess, it makes everything a lot easier)</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bfbda8560528cecd91--
