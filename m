Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2485365CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:39:41 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 1so219638182ion.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9K+fU3+F+0eiFF2VtC6PXlTlNissGPUK7T5uyZWI7Bc=;
	b=teAZIb0XieegO1bCVNOdt5D+TCzqyrjJ0gq2lqmtBCk68SfB97JsBC6HkgEjX9nApV
	jrW2I0rxizzX+7+yFKrm/OOsvrO4sqWPsdWbab/yy9NhZTCY9BYbtqB8EAu4yZu6QSMm
	KX9ptJKLBEXtwuQi4hEyJOJYBrQ9dox3JTdqZepWedkwvsHt4wvl7tzaAIl3shuH7dv0
	FI+cQ4pD/HHDhvlPEg1YmHUePbnkWzChNrGFb0kWpqiGRAqRfquLBl4ZIE/3ZLy7YXJq
	IHmVvOqJFye277wHvElMiMxqMHuNt99Ej0lUYZE+DQmPyLnLYhVr0zP/U0LhJ3uCS9ra
	xn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9K+fU3+F+0eiFF2VtC6PXlTlNissGPUK7T5uyZWI7Bc=;
	b=XR9LhzZvZQrjx5b1T9ZrywvscoLMj1lEkGuPcibNb00vJLFuK13QScZ7ef/581/22E
	0bbJAX5JnbBNeDJP/gqapQJIa4QZBTjKbSx+VRMqF6eFVTyfvC9rl2Z43Yaz+ELiX5Bi
	lw1zxHUw0bI8ZDgJKpXcarwX1hi/RX73MO3z0Tma2w7UUQibwX1AzcaYZQVgSt+RgnLh
	NgJoktkFx1xPzuWFLykj6fCqfati6bSFJ8rx0M1/bJ2KeaHcNTnsosbTBuinnc7YPEw/
	u/m/o3fZksI2Zf6fQKdQxIMkmyJEX4zsiZ7+eac1/W75RZGRJidxRnrK0f4tLKNe+dOx
	Uyrw==
X-Gm-Message-State: ALoCoQm9pyGBZjyVqc0R3bSlz692cV1eki4+85Rtvh2bA8z7lkz/HvndwkUeAWKKcb2+9DxHHSlmZBgI3BDGJOBnwLGsMf7rchjqOgFQCBj8UOMmqNoNmWI=
X-Received: by 10.107.164.161 with SMTP id d33mr90056353ioj.148.1452202782300; 
	Thu, 07 Jan 2016 13:39:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 13:39:22 -0800 (PST)
In-Reply-To: <CAJ86T=VLQvP0mE3zCOYEr=Tkx0LJ-MYFh9kyEYZT7-1XYVi+XQ@mail.gmail.com>
References: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
	<1450828680-662-3-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VLQvP0mE3zCOYEr=Tkx0LJ-MYFh9kyEYZT7-1XYVi+XQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 21:39:22 +0000
Message-ID: <CAJTo0LZi8hpETfuWBOTan=8B83V5up_fzM2__rK4ZmXZXf2UPg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Thu, 07 Jan 2016 21:39:42 -0000
Content-Type: multipart/alternative; boundary=001a1141c976fb26aa0528c54e35

--001a1141c976fb26aa0528c54e35
Content-Type: text/plain; charset=UTF-8

On 7 January 2016 at 21:03, Andre McCurdy <armccurdy@gmail.com> wrote:

> Ping. This is more urgent now that arch-armv7ve.inc has been merged to
> oe-core master.
>

Sadly 3.11 totally breaks on PPC, so that's blocking.  Maybe rebase the
patch to master before the 3.11 upgrade?

Ross

--001a1141c976fb26aa0528c54e35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 January 2016 at 21:03, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"=
mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3bo" class=3D"a3=
s" style=3D"overflow:hidden">Ping. This is more urgent now that arch-armv7v=
e.inc has been merged to<br>
oe-core master.</div></blockquote><div><br></div><div>Sadly 3.11 totally br=
eaks on PPC, so that&#39;s blocking.=C2=A0 Maybe rebase the patch to master=
 before the 3.11 upgrade?</div><div><br></div><div>Ross=C2=A0</div></div></=
div></div>

--001a1141c976fb26aa0528c54e35--
