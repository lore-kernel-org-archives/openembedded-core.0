Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 174317198A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:47:06 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 189so2960466iow.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uSL7P1+weu1CNdkDIpKYmLLQkc5faBBjvfeMPfHqVLU=;
	b=nCxVYXe+akdlQe/9mAMLZfUB0toYDLGOFWscAfl6CUPfHf6tXm+uxPMdOL4qrIDxzW
	WKFiMBPN8s1mzL70kxC0mCeRxLw3W6Rp+9Z5DEWr6YhmeJCZ4WM01LsbkiPOJ4f20rjR
	UTSzoHGyq6/ZZN6XnbGegVgi+ykTdclMaWlY/cWz0u9xMVi1AYPz86NAmBQRlEGagpeY
	0+2Cle5incc4nzkYvtURsoZjEGEAhln2JYNxK7Vtg6DkX+cA1CQUj/QeOYNaCzK2zSBB
	rt94GGhr8QprX0LpdHhWTDh/Jrvct3sHcFcFjMI6+bgwhNtCc0H+4wZxURaOgfv2fkvU
	d2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uSL7P1+weu1CNdkDIpKYmLLQkc5faBBjvfeMPfHqVLU=;
	b=XwAzCwClDCoXwO1J6VBZry7VmFDyQ99AXoXaiWwBmesGPZ7EzfMmG/y4ifR6FPkrb9
	b10mdKZ7xOwn5zGVLsFwhDA8TqAfnXXjasfFpVWghjAtzuYV3twzTOwBFQNv3HkFDXz8
	zRJ/tFlFmBrrvvEUb4k9L7b2mEhDodqUhUizKQyNIaHJ+rSc4Y2thiZedIA+4/qOTETo
	phGmGqXj7pBGQNK8P1p3SDseFfyCsrqoxapp6cJF0300C6c3ILOZVnMZddLZMTTPawSi
	uBJ9kWcixKwHRSOH42R0JtlEVbL2niIaYiaLbxSAGaLo35/F3hPyy9cy/SR1LQKYapUz
	hv3w==
X-Gm-Message-State: AMCzsaXXnMPH3Ihhd4uOMGpsR/9nw1YXeNDFS21d5t//MdAbd0R22hHC
	8VS7g6BxC4opZC8SOUh/wlFUQtTgJSCRSsk8WzJDcw==
X-Google-Smtp-Source: AOwi7QBz93Gc4ooqF+Y9uKEVnGJzf/yDMezk7rLEbJMjZiuZXEsBBHDNcQYqqBO9W39/UO/2ZYvp5rWoWDk/zJPVPMI=
X-Received: by 10.107.36.80 with SMTP id k77mr16395807iok.176.1508258828375;
	Tue, 17 Oct 2017 09:47:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 09:46:47 -0700 (PDT)
In-Reply-To: <CAJTo0La7zp9_dPd86X87QVuq7cS0SVZz05E==ryzJTXdPWfd=Q@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
	<CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
	<CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
	<CAJTo0La7zp9_dPd86X87QVuq7cS0SVZz05E==ryzJTXdPWfd=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 17:46:47 +0100
Message-ID: <CAJTo0LZkxMoh3K0xH+HUyUG7=-qiO8odyU7EgxDeM5N4sRZUbg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:07 -0000
Content-Type: multipart/alternative; boundary="001a1141909eb1e42d055bc0dfd9"

--001a1141909eb1e42d055bc0dfd9
Content-Type: text/plain; charset="UTF-8"

I can't replicate with pkgconf and with check installed on the host.  Can
you actually replicate this?

Ross

On 17 October 2017 at 17:32, Burton, Ross <ross.burton@intel.com> wrote:

> On 17 October 2017 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Tue, Oct 17, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > On 17 October 2017 at 17:24, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com>
>> >> wrote:
>> >> > Curious how you hit this with master.  For me:
>> >> >
>> >> > checking for check >= 0.9.9... no
>> >> > configure: WARNING: check not found - skipping building unit tests
>> >> >
>> >> > The configure script uses pkg-config so shouldn't be picking up host
>> >> > binaries.  Can you dig a little?
>> >>
>> >> do you have ptests on
>> >
>> >
>> > Yes but libevdev doesn't have any.
>>
>> and I am using new pkgconf
>>
>
> Ah, let's see if that breaks it.  Do you have libcheck installed on your
> host?
>
> Ross
>

--001a1141909eb1e42d055bc0dfd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t replicate with pkgconf and with check installe=
d on the host.=C2=A0 Can you actually replicate this?<div><br></div><div>Ro=
ss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
17 October 2017 at 17:32, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span clas=
s=3D"">On 17 October 2017 at 17:29, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br></span><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Tue, Oct 17, 2=
017 at 9:25 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 17 October 2017 at 17:24, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br=
>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Curious how you hit this with master.=C2=A0 For me:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; checking for check &gt;=3D 0.9.9... no<br>
&gt;&gt; &gt; configure: WARNING: check not found - skipping building unit =
tests<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The configure script uses pkg-config so shouldn&#39;t be pick=
ing up host<br>
&gt;&gt; &gt; binaries.=C2=A0 Can you dig a little?<br>
&gt;&gt;<br>
&gt;&gt; do you have ptests on<br>
&gt;<br>
&gt;<br>
&gt; Yes but libevdev doesn&#39;t have any.<br>
<br>
</span>and I am using new pkgconf<br></blockquote><div><br></div></span><di=
v>Ah, let&#39;s see if that breaks it.=C2=A0 Do you have libcheck installed=
 on your host?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br=
></div><div>Ross=C2=A0</div></font></span></div></div></div>
</blockquote></div><br></div>

--001a1141909eb1e42d055bc0dfd9--
