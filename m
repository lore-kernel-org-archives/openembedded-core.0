Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id EBAF277085
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:04:21 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id z14so41215585igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ubS5H6rNN9BdrUDi6gEZOm9MmBjGqslwO/wDEW54Ubk=;
	b=Nwt/vNORAZbMdFlyz/WL+9iYPzYRLJT0Ri+X6qktB/e8w3ytBEbLkLAkm17T687C/C
	QTyDOHgAlSJE1OtlVF6HvjZWo24aNqxrFBrba0sc22G0kN6QYH58RAD6w8+ewo3uO6Y0
	AToe1ec8qhm8sZ6U3YDV0WSPAeH3VAVwz+bbRXLcM90bm9Ke5euBKSc/Ao+6iTsr0bRy
	bPsqZMYD2RZcXXU0TwS65sCCS08lHQz+ZTHMWSepYT+U0uRuwRDiCxXXzBj4fduFZpdh
	ErVefvTiGLrICzyoENBqYrP9Di004dxRFl7/hQtHyaMMKuDdbtlWFJ9+63gJUtsnbEGT
	Swsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ubS5H6rNN9BdrUDi6gEZOm9MmBjGqslwO/wDEW54Ubk=;
	b=Kc7or7dz156VEJcEY/knk7VBM8EN2Ce8dv1LlMq6WBwdIwVfvR1TQQG7sprQhv1TZF
	l+V76G8lQT+XO1EXB2Wbr37cjfcv7OLDfp7UMY5Z2IEmUUbL55ngTXe9LaSnh2+4lZjN
	pEKA3M1wXQqLpGbHa27Q1sjUpcP/8QFB7ZBIkU1I29C51OvWZT33COf4zKqbWeR8qnIr
	wZ0obbSq0pJsHNiQWSebasAHVyPiF8KDgZnm+eE7V+2Gxckut27rJurn4518jDPcYcOG
	0QThveh5gESKkJJGOq9hMA3hYHrcfYrrJQ598bNilRMmN4Ykv1zmfVLtDc5bOrVEko9Y
	5rMw==
X-Gm-Message-State: AG10YORHn8A1tsjwXLf7ehrz6dLWF1RYhktOchgdnbhjOGfruqHYh0orNq/fj0MNhbMVPKUS+NMdu0kGJ7VWWA==
MIME-Version: 1.0
X-Received: by 10.50.111.111 with SMTP id ih15mr19333230igb.78.1453745062127; 
	Mon, 25 Jan 2016 10:04:22 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 25 Jan 2016 10:04:22 -0800 (PST)
In-Reply-To: <CAJTo0LZbDJS6MCjsXqaBE7krYiR9toB=VoxaXGx+2J45hw+jKQ@mail.gmail.com>
References: <CALbNGRSZ+edCEyGJzWbkniTkds6M=PqF3_gD65=fO0JiYOELBA@mail.gmail.com>
	<CAJTo0LZbDJS6MCjsXqaBE7krYiR9toB=VoxaXGx+2J45hw+jKQ@mail.gmail.com>
Date: Mon, 25 Jan 2016 19:04:22 +0100
Message-ID: <CALbNGRR-p420-Ot8Qy6KNpUnc1VvWTKy+uCz7b7xSVWmzBX7TQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg pkg_prerm on package update
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
X-List-Received-Date: Mon, 25 Jan 2016 18:04:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 6:37 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 22 January 2016 at 09:50, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>>
>> although opkg 0.2 -> 0.3 is long ago I noticed a change in behaviour
>> when updating a package:
>>
>> * 0.2.x did not call pkg_prerm
>> * 0.3.x calls pkg_prerm
>>
>> Is calling pkg_prerm a valid behaviour when updating a package?
>
>
> opkg is copying what dpkg does [1], which makes sense considering opkg is
> basically a dpkg clone.  It passes variables to the script so you can
> identify if the context is "i'm being deleted" or "i'm being upgraded".
>
> This changed in
> http://git.yoctoproject.org/cgit/cgit.cgi/opkg/commit/?id=3Da8555d352d285=
1ee1482b74b57ba9eacfb354c18
> if you want more context.
>
> [1] https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html is
> what dpkg does, fwiw.
>
> Ross
Thanks a lot but I need to ask for more :)

As you know of "i'm being deleted" or "i'm being upgraded" - you have
a pointer for this? To find a common solution: Do package managers
share same behaviour here - or is there a common document package
managers should comply with?

Andreas

