Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 67C4560124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 10:36:29 +0000 (UTC)
Received: by qkao63 with SMTP id o63so1374097qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dd3mZD9DA2S8amUZBh3aHGdCVllbYtF8BicFQBRwZUU=;
	b=m96vwXSExjVFi98FYZAHBL2OSF3WPzM7dxQkWh8XWZm89ju7a+cNeMZI3TFP1k95Bn
	L+jaxswNQjmM1fqB1U8c4wEEJq9NI3VNmiEFzAGpXh3RhRfEdXr/LZFpBmI/iFVPDYNL
	3coiEgMbmUeiqYxy3k/gAGPwyjX9DXH8FBl9hak9PSbGv/MO1SxWyvc+jCzWsdGFAi7H
	8EoTBan9Cy+IapQBeONqjKvgLGDgHOtExte7YFeusLJmp+OrWLe6CyFnsQsuo9d4IxQM
	DmevnYDk+8JUgkApE3MpgyOI9+t7XXLEH5LbaRgcNXpRljZHy63QYx5/knUEsL96zCLw
	p+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Dd3mZD9DA2S8amUZBh3aHGdCVllbYtF8BicFQBRwZUU=;
	b=R/UWEvKhIsaN1RtpE8mbkDAzMY2+B1at9fhH0+z1edJoNNCk6X0Rkizg6cMf8lBPYn
	kY2nkV3m+hEi0wcW5Uuub4QkxNekCNH9km169eKenRpB72zUY0ubtigcAm91lKb982l9
	nLldlNhgWULe9DAZZIwMy38i3h6GPZ5i1KMfwvmcwKZJ8J3zdzSdP+HOI9BbWT18xyXe
	ezkGsvsmo1xIhIfI2rY2YVA4PVLs8y71yUk63Jx0Ha2FawD04IdiBgbnr9FOcMlRhZC7
	beQMbiMRY3lvBE3qZjIjqZH1ND2f9QZo9DT4aJ4uoVmOJUOuirHtorNs8FHloTQISJ9F
	dyJA==
X-Gm-Message-State: ALoCoQkac4fG+NpKS0Q3dTrEzxSmC7EfUR/XlCfYU1svgXZ7acN/ZKYkTxJry3koluW8Qxzgxdou
X-Received: by 10.55.78.143 with SMTP id c137mr12303703qkb.72.1446806189849;
	Fri, 06 Nov 2015 02:36:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Fri, 6 Nov 2015 02:36:10 -0800 (PST)
In-Reply-To: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Nov 2015 10:36:10 +0000
Message-ID: <CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Fri, 06 Nov 2015 10:36:33 -0000
Content-Type: multipart/alternative; boundary=001a114a8f680174880523dcd100

--001a114a8f680174880523dcd100
Content-Type: text/plain; charset=UTF-8

On 8 October 2015 at 15:36, Jens Rehsack <rehsack@gmail.com> wrote:

> This updates libusb1 from 1.0.19 to 1.0.20
>
> 2015-09-13: v1.0.20
> * Add Haiku support
> * Fix multiple memory and resource leaks (#16, #52, #76, #81)
> * Fix possible deadlock when executing transfer callback
> * New libusb_free_pollfds() API
> * Darwin: Fix devices not being detected on OS X 10.8 (#48)
> * Linux: Allow larger isochronous transfer submission (#23)
> * Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings
> * Windows: Fix broken bus number lookup
> * Windows: Improve submission of control requests for composite devices
> * Examples: Add two-stage load support to fxload (#12)
> * Correctly report cancellations due to timeouts
> * Improve efficiency of event handling
> * Improve speed of transfer submission in multi-threaded environments
> * Various other bug fixes and improvements
> The (#xx) numbers are libusb issue numbers, see ie:
> https://github.com/libusb/libusb/issues/16
>

And apparently introduces a parallel make race :(

mv: cannot stat `libusb_1_0_la-sync.loT': No such file or directory
mv: cannot stat `libusb_1_0_la-descriptor.loT': No such file or directory
mv: cannot stat `libusb_1_0_la-core.loT': No such file or directory
mv: cannot stat `libusb_1_0_la-hotplug.loT': No such file or directory
mv: cannot stat `libusb_1_0_la-io.loT': No such file or directory
i686-poky-linux-libtool:   error: 'os/libusb_1_0_la-linux_usbfs.lo' is not
a valid libtool object
make[3]: *** [libusb-1.0.la] Error 1
make[3]: Leaving directory
`/home/pokybuild/yocto-autobuilder/yocto-worker/ptest-x86/build/build/tmp/work/core2-32-poky-linux/libusb1/1.0.20-r0/build/libusb'
make[2]: *** [all-recursive] Error 1

(full log at http://errors.yoctoproject.org/Errors/Details/21443/)

Ross

--001a114a8f680174880523dcd100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 October 2015 at 15:36, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":nb" class=3D"" style=3D"overflow:hi=
dden">This updates libusb1 from 1.0.19 to 1.0.20<br>
<br>
2015-09-13: v1.0.20<br>
* Add Haiku support<br>
* Fix multiple memory and resource leaks (#16, #52, #76, #81)<br>
* Fix possible deadlock when executing transfer callback<br>
* New libusb_free_pollfds() API<br>
* Darwin: Fix devices not being detected on OS X 10.8 (#48)<br>
* Linux: Allow larger isochronous transfer submission (#23)<br>
* Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings<br>
* Windows: Fix broken bus number lookup<br>
* Windows: Improve submission of control requests for composite devices<br>
* Examples: Add two-stage load support to fxload (#12)<br>
* Correctly report cancellations due to timeouts<br>
* Improve efficiency of event handling<br>
* Improve speed of transfer submission in multi-threaded environments<br>
* Various other bug fixes and improvements<br>
The (#xx) numbers are <span class=3D"">libusb</span> issue numbers, see ie:=
<br>
<a href=3D"https://github.com/libusb/libusb/issues/16" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/<span class=3D"">libusb</span>/<span cl=
ass=3D"">libusb</span>/issues/16</a></div></blockquote></div><br>And appare=
ntly introduces a parallel make race :(<br><br>mv: cannot stat `libusb_1_0_=
la-sync.loT&#39;: No such file or directory<br>mv: cannot stat `libusb_1_0_=
la-descriptor.loT&#39;: No such file or directory<br>mv: cannot stat `libus=
b_1_0_la-core.loT&#39;: No such file or directory<br>mv: cannot stat `libus=
b_1_0_la-hotplug.loT&#39;: No such file or directory<br>mv: cannot stat `li=
busb_1_0_la-io.loT&#39;: No such file or directory<br>i686-poky-linux-libto=
ol: =C2=A0 error: &#39;os/libusb_1_0_la-linux_usbfs.lo&#39; is not a valid =
libtool object<br>make[3]: *** [<a href=3D"http://libusb-1.0.la">libusb-1.0=
.la</a>] Error 1<br>make[3]: Leaving directory `/home/pokybuild/yocto-autob=
uilder/yocto-worker/ptest-x86/build/build/tmp/work/core2-32-poky-linux/libu=
sb1/1.0.20-r0/build/libusb&#39;<br>make[2]: *** [all-recursive] Error 1<br>=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(full=
 log at=C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Details/21443=
/">http://errors.yoctoproject.org/Errors/Details/21443/</a>)</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a8f680174880523dcd100--
