Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 71BBD77AF0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 19:13:40 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id y33so122492581qta.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y6icM+6XYgYxNBu1hn9z5l9MbZxOCAe+0o7E4Yf2XG4=;
	b=AXu7Ue3nUsjvVIRxonCIHD0D8wwnA5HeBtmi6Y6JvB4Kucv/SUrPjcf5NrY+Z/eiyN
	782ENf3YuBnhg4Rbn+md57sJRs6AsU0d1vycArUDJNHdKFVNxPJTKDJ/Pp8w91ievMHY
	0K2YbwirnfJA+1mUkNImDGBDBCZNAP3vd1mT5xwSdqR1HsiryNEPmYV5lARKL1KXKi7Y
	uSNtEERqDpV206nAB178SNzGYJwPFIQkEbJKIpxZsB7OdPajqrVILo2E26ShFtuDH99z
	9w4llQHhUilq9/joFO/gvp5yAc+iHs4iEHf2WvRW0mV9dZU3mWwr2/WiOHAoFsuzTOPm
	YQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y6icM+6XYgYxNBu1hn9z5l9MbZxOCAe+0o7E4Yf2XG4=;
	b=ewkVI72/HW1sEOHTVh8B7jlqRSoVe8Fwa5G7G6Xxu76D6F9gznnG6rnjuoOCzHwmv9
	XMQljRebUrCI6DcHl+0lxF31xFXaF9dEXTLt1d4TIPbAdNH2Yyz+IcITHwL7mZvYBKa9
	dcM9aKLjdnMw8jMvghUqaI0IKl0cUhX++cEMm1yDfoO8zaCDbDIK/TJOKsu/PLXMs8X5
	ALBPz0IQIMCLDKG5B93/Z8WV5NKCYeuH3CtKrOx7hgx16BH7zJivEa8xFrxremIq6nBs
	t4YkhEuaot7YbXu+4MPgvVGn5vP/0q+cP4Hlc+eit8po2LT/7m7kRGwk17A4LPP1BpEl
	aE5A==
X-Gm-Message-State: AN3rC/64grt/yVMgXdJE0Nru8i4paCfvKX6j8BeXTGiS0QfBQcLwXGp4
	f5tmT8d8tFj7cMMRPRYCYxR/HYXNvZQZ
X-Received: by 10.200.3.105 with SMTP id w41mr26145901qtg.188.1493061221376;
	Mon, 24 Apr 2017 12:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 12:13:20 -0700 (PDT)
In-Reply-To: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 20:13:20 +0100
Message-ID: <CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 19:13:40 -0000
Content-Type: multipart/alternative; boundary=f4030435cf58ba79cd054dee673d

--f4030435cf58ba79cd054dee673d
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:

> All merged, I'll fire in a moment.
>

lttng-modules fails:

In function 'lib_ring_buffer_align',
    inlined from 'lib_ring_buffer_try_reserve' at
TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:118:3,
    inlined from 'lib_ring_buffer_reserve' at
TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:179:6,
    inlined from 'lttng_event_reserve' at
TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lttng-ring-buffer-metadata-client.h:317:6:
TOPDIR/tmp/work-shared/qemumips/kernel-source/include/linux/compiler.h:518:38:
error: call to '__compiletime_assert_269' declared with attribute error:
BUILD_BUG_ON failed: (size_of_type) == 0 || ((size_of_type) &
((size_of_type) - 1))
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^

Suggestions welcome :)

Ross

--f4030435cf58ba79cd054dee673d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 10:09, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_extra">All merged, I=
&#39;ll fire in a moment.</div><div class=3D"gmail_extra"></div></blockquot=
e></div><div class=3D"gmail_extra"><br></div>lttng-modules fails:</div><br>=
In function &#39;lib_ring_buffer_align&#39;,<br>=C2=A0 =C2=A0 inlined from =
&#39;lib_ring_buffer_try_reserve&#39; at TOPDIR/tmp/work/qemumips-poky-linu=
x/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:=
118:3,<br>=C2=A0 =C2=A0 inlined from &#39;lib_ring_buffer_reserve&#39; at T=
OPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9=
.1/lib/ringbuffer/frontend_api.h:179:6,<br>=C2=A0 =C2=A0 inlined from &#39;=
lttng_event_reserve&#39; at TOPDIR/tmp/work/qemumips-poky-linux/lttng-modul=
es/2.9.1-r0/lttng-modules-2.9.1/lttng-ring-buffer-metadata-client.h:317:6:<=
br>TOPDIR/tmp/work-shared/qemumips/kernel-source/include/linux/compiler.h:5=
18:38: error: call to &#39;__compiletime_assert_269&#39; declared with attr=
ibute error: BUILD_BUG_ON failed: (size_of_type) =3D=3D 0 || ((size_of_type=
) &amp; ((size_of_type) - 1))<br>=C2=A0 _compiletime_assert(condition, msg,=
 __compiletime_assert_, __LINE__)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^<div><br></div><div>Suggestions welcome :)</div><div>=
<br></div><div>Ross</div></div>

--f4030435cf58ba79cd054dee673d--
