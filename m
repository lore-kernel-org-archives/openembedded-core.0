Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 480596FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 12:04:03 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id q21so151939816iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 04:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DJ6434+17d9nVNS9deLdeXgJs2cPpSyHyiOph5yJ24s=;
	b=r1kDmJ5eI68pavT2VS8PdjPhSRSKDVkc6ALFu2DqGIIXHpJQ8nAUjuJxYP2+gI/1C6
	Uzff4z+m+YnTGsl5gwcJUOpUSfy1qYmX698M5nDYnTKRfa59EO2vuz8PvdgFjIWeX0Y9
	57h1w1DC/LILsdgOCZFyFxqP+gXh/DM/rXp6wHxNxSx5WGzM+VDdZyi99ZyAozCPj6vz
	JLjfNjZPyGrtS6B55coDOf5spOZfOue841FEvKhnYCPci1QwKVAJbLNEssdtcD4c7Vd+
	mLsKqUWjDcmN3nfBqG/hZ5jTJwAhq7DL8zANo68D4DXT9PsAqpmZEoALzmOfG+F30VH8
	3/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DJ6434+17d9nVNS9deLdeXgJs2cPpSyHyiOph5yJ24s=;
	b=XZPL2kB13vuAS0Bd7WT5hQ6BCo+p8Q2wCgq8dnUW+3dYxxXE5ITqL8nN8daRGoStZn
	5fifpIWBR0SUwk5IIBY6JICrXW2RzPCWwI6AEHCG9cgivQ/hqQgSj5X5zxyyHaXqdzYP
	3BzTDzlOTn2NFF597uQ3aSxXTyR0YdxZekFfpBnV+3EYgKIOgeSNrl4OS8fRK6DgesCK
	H+3DsMrGrNPw9WA8sLCFZFT+32emTBKA1L9mgG3s+jRoeeoBo2CLSYClCSGVQkqTHQp6
	tIq5DpSu/uPCGz/Wroe9aSip9fVOoUvbIy/D+YwX48g8k6IjZrx7KUhYNIo4B8JvgaVn
	S3dw==
X-Gm-Message-State: ALoCoQnqQuWVqz93rx7nOstXZiafpTETMq7Olll7ChlSsu3hIyirnNBh8MIa3HPru4cgppMlXuWnbHKhULoz9g/iNcA2GvT60MjRLO4JI4Wq4I4LhSMW924=
X-Received: by 10.107.164.161 with SMTP id d33mr72562826ioj.148.1451909044101; 
	Mon, 04 Jan 2016 04:04:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 04:03:44 -0800 (PST)
In-Reply-To: <DUB130-W169AB1FBDD4284EB42D7DBDAF20@phx.gbl>
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
	<DUB130-W169AB1FBDD4284EB42D7DBDAF20@phx.gbl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 12:03:44 +0000
Message-ID: <CAJTo0LY6MpvHRaZ9teS088jaoSrgb5NLMF32uo7KmXJK0nGppA@mail.gmail.com>
To: Chris Trobridge <christrobridge@hotmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: gobject introspection - distccd?
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
X-List-Received-Date: Mon, 04 Jan 2016 12:04:06 -0000
Content-Type: multipart/alternative; boundary=001a1141c976d1fe9b052880ead5

--001a1141c976d1fe9b052880ead5
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 11:50, Chris Trobridge <christrobridge@hotmail.com>
wrote:

> I will test this out more thoroughly when I can build yocto again, but is
> it possible the gobject-introspection recipe is somehow causing distcc to
> be added to the target?
>

More likely some of the existing packagegroups which add distcc for
convenience, such as packagegroup-self-hosted or
packagegroup-core-device-devel.

Ross

--001a1141c976d1fe9b052880ead5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2016 at 11:50, Chris Trobridge <span dir=3D"ltr">&lt;<a href=
=3D"mailto:christrobridge@hotmail.com" target=3D"_blank">christrobridge@hot=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I w=
ill test this out more thoroughly when I can build yocto again, but is it p=
ossible the gobject-introspection recipe is somehow causing distcc to be ad=
ded to the target?</div><div></div></blockquote></div><br>More likely some =
of the existing packagegroups which add distcc for convenience, such as pac=
kagegroup-self-hosted or packagegroup-core-device-devel.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1141c976d1fe9b052880ead5--
