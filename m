Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4479060069
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 21:53:47 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id h5so2543644vsc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 13:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4wY4ewjBrJDFUgzfE1T4/ERxn3lEpfkBkuf0g0qecbc=;
	b=cWbEjLHFri26XnLISXkCXQAXGVgAyQWb6+OIXdzqjaGFH4ZuuLgZJmVJLHnSuggfxC
	5hxbm9bFWoBv7eNX07Pb0t9Su4KWj0VNl031jdBLhfW1KXRc8qFI2BuFO2pEC9446x9W
	PxsgTqwljMiAWZ2EmjdTs8Ebs6IBhoDZC8Ztt19jkPs/zQKtxOcujzgzYsXWcQOPirhr
	60rh9mWBeRS7ArGbiHZHVvSfGjyv8AmHwRSM6VlpoxYLNfCJ6Npqsd8xw4sDtJxOCCuW
	aW6cWvn81zomIHD086nhzYky123fsnlwUBzoyUYi+/XQCc2t+q39rGKPIuIZVnvuTjWt
	kT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4wY4ewjBrJDFUgzfE1T4/ERxn3lEpfkBkuf0g0qecbc=;
	b=e5IZs/DPP9yVgzyNryCzFBwESG7cTFf0BYCLcwRUz9vxE+ieOeIe/NXD4lbQYF+aci
	6Uh4slkpupi0FMTuKOyvGPc/+p4XfplPlrxcfIOMdEv1skJtmw4sEBhzipjEFekAhsDa
	zzthyDcsilPPns4Tj6hpwxgYmxpuSgtKTtyLJytle5qZsy9HP5YXgqo/ed+hTzm0VxGd
	3kf57fWhAhJIHxx3i4viMm0f5ZHbaoKbsdr+4mfczDXDz3I+fpiIXG/8qzK4unzCBwuE
	N1oyQu05lCEcKEWn9KgGpxhF0SHf+lJDcjOg42492R5sWSsIDJC7o/OejuJ7cv1qLWRB
	ukDg==
X-Gm-Message-State: ANhLgQ1nRx5PPGHUQAMEagQPKtGY/3Zu5IW4B0Romm5mXxMKlXQ43I/I
	3HUbN4m1GXYcKrXCr5v8GgvTL6xlLqUAFVD64Mo=
X-Google-Smtp-Source: ADFU+vtYrU8+fT/hFsOL9qE3Zo3sZyWsayPOV61ZUs6kzsZDeClCe8Xr/ggOx7CgsZ46cLN1AXoN3Lvi3uydoC1MCt0=
X-Received: by 2002:a05:6102:503:: with SMTP id
	l3mr3613236vsa.94.1583531628211; 
	Fri, 06 Mar 2020 13:53:48 -0800 (PST)
MIME-Version: 1.0
References: <107c01d5f174$bbf566a0$33e033e0$@gmail.com>
	<CANNYZj83rytWFgGPj6BS6R874eqa6_KCoeoMA5afgnx-_YBunw@mail.gmail.com>
	<efd0caee261782a0b8d752c728c25be23f69cbae.camel@linuxfoundation.org>
In-Reply-To: <efd0caee261782a0b8d752c728c25be23f69cbae.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Mar 2020 22:53:37 +0100
Message-ID: <CANNYZj_Q72+SDFEeq68d214wt+Ft4NA0gUYHEYsdCmzkv+b_pw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW09'20
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
X-List-Received-Date: Fri, 06 Mar 2020 21:53:47 -0000
Content-Type: multipart/alternative; boundary="00000000000030b20d05a036b03e"

--00000000000030b20d05a036b03e
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2020 at 23:42, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> Just FYI I think there may also be a couple of other packages coreutils
> pulls in and they may also have reproducibility issues (gettext-ptest,
> glibc-locale-* and procps*).
>

Patch for gettext also sent :) glibc-locale and procps I could not
reproduce :-/

Alex

--00000000000030b20d05a036b03e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Mar 2020 at 23:42, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
Just FYI I think there may also be a couple of other packages coreutils<br>
pulls in and they may also have reproducibility issues (gettext-ptest,<br>
glibc-locale-* and procps*).<br></blockquote><div><br></div><div>Patch for =
gettext also sent :) glibc-locale and procps I could not reproduce :-/</div=
><div><br></div><div>Alex<br></div><div><br></div></div></div>

--00000000000030b20d05a036b03e--
