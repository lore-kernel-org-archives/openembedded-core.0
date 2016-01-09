Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5360173257
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 10:06:19 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id mw1so87627356igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 02:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v2u8CfYfQy4aGFCh1T8g3714JoMNrkr0XKrCY7FZMTY=;
	b=j8U0uLuu5Du2upHouxDBl5qUWZaUfuZGyKpzythR5sLGS30svxgfG7Zdxa9SRzuiES
	fvu7cq3tLt57esRfIjSZ4nrHqxTwQ3bItjYaLjjvACAnA+WuucwFccC0D0IPU+puweva
	S76T5UhwYnsl7NqZANMZXbHnSvOqxig7WgNIPGeM5gzBxUFkPS85zN6iYQxcXeHlebai
	81Lb6/w7oXwo9klwHhrw29M231Xe9co4aLplNeSMjdoEXbz2BtvMKotVU47O5ipEsWBg
	DEMtfkaX2/Jws8zEDruiiU3zEzAWnU5w/YFG3vHK14xBy02QjW+/WVtJnRemGL0oiQmk
	XCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v2u8CfYfQy4aGFCh1T8g3714JoMNrkr0XKrCY7FZMTY=;
	b=ePzcFE7Edrg78ygplMFy+VDF4u6W5tFEmdGJqkXUxK7WagIr3IpjH9T0/Yk4si7VF3
	j43cw3/G6Gvrz7g++oZV8c4FZvfn2vMltrFWJq6awxsu/Df0HW4RoAMdUkQcjoVwq0Ao
	HQJuST0SpaH0zx6rDLz2VILYEWM4vdML+jfy1WMZpZwrYzOqAAmgHCzEHYkeVQokyBZB
	ig+hkIkYfHtBaDgQ4G6d34e+iT4AqvpVDais+qKVAEL7Gx9yShEDmYnWiWGjyT5heAwX
	XoShPasFYe1zGcTegkOgEfcoCjK3Ro+eOeJasaquLEK4wbf+6Pkq7l1Eg2tKAVY2ZxR2
	y5xA==
X-Gm-Message-State: ALoCoQk52gFAYF7I3gP06gIAMfBNB0Gk5q+/mAQy0oNYyYoGyuYZonXnxA0CaVJJOehzQ6BEKtkpac0wvhfY1nKuvKvR0T2/RXAeINXDClk+/ylSsgUy3tU=
X-Received: by 10.50.55.4 with SMTP id n4mr2949180igp.64.1452333980531; Sat,
	09 Jan 2016 02:06:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 9 Jan 2016 02:06:01 -0800 (PST)
In-Reply-To: <CAMKF1sp5CX-n2SqZdhJzkmU4TVzhJXOPPW21apdTkRydn-2jqA@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAJTo0LZeEtWA9qNQjNvqDPyW8d6hUjziJr_VuQsdEn4Y5dGcvw@mail.gmail.com>
	<CAMKF1sp5CX-n2SqZdhJzkmU4TVzhJXOPPW21apdTkRydn-2jqA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 9 Jan 2016 10:06:01 +0000
Message-ID: <CAJTo0LYNxVQE3_wTtsBd1ko5CvBhFLmcUKoc+01UkKr0PVVkHg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sat, 09 Jan 2016 10:06:21 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b49014c370528e3db88

--e89a8f3b9b49014c370528e3db88
Content-Type: text/plain; charset=UTF-8

On 9 January 2016 at 09:23, Khem Raj <raj.khem@gmail.com> wrote:

> I have pushed a fix for this to pull branch as well here
>
> https://github.com/kraj/openembedded-core/commit/db21a7a31e9c37f7c2dd0a914599d7b3467ae2d9
>

Awesome, thanks Khem.

Ross

--e89a8f3b9b49014c370528e3db88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2016 at 09:23, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":s5" class=3D"a3s" style=
=3D"overflow:hidden">I have pushed a fix for this to pull branch as well he=
re<br>
<a href=3D"https://github.com/kraj/openembedded-core/commit/db21a7a31e9c37f=
7c2dd0a914599d7b3467ae2d9" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/kraj/openembedded-core/commit/db21a7a31e9c37f7c2dd0a914599d7b3467ae=
2d9</a><br></div></blockquote></div><br>Awesome, thanks Khem.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--e89a8f3b9b49014c370528e3db88--
