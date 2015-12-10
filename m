Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2C11A6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:02:08 +0000 (UTC)
Received: by ioc74 with SMTP id 74so107472174ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AJjV7nTymjxGwFkkZZElq9229tkCWm5zAbIPwD3JkGk=;
	b=EC0jqapj9IukO++KibJMeWXCbpRLeNUNz6z5EmYYpZ/ueXUI9h+PbN4uhDTlQV9a4H
	NfZB4qM/KLVYnL9odLALckMMzinnGv3vDUp4lkeTC/K3gPZ1d2vT1lY/u3bMKb/FEEf4
	SfpwbjGNJTGbda6lw24lssfJvQxPTXX/FpW1cIs+k9Y8d5fg8GJ6NC/5KUnxg9cz+YzZ
	cUP0KCoVkaL3sCArEKNBJJj9hr1QzV5hbJRY76rwuNkR4twoTyUkqHNQT97vKgQ2vZGS
	xFyskGBXOdZUFASW3vs32byfj15m5V4BtH2NxdI+iltTQZqsTDM42jVtgxVuznZWUaWs
	gfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AJjV7nTymjxGwFkkZZElq9229tkCWm5zAbIPwD3JkGk=;
	b=Mx/r6CAUq2PAn0cqFVNXKfWvO8ikXwUmS18+TG5EeW6pIkpdUwn6lUdr3bFX0Jh5XE
	0jefV0KOIkCfo/0EGlXnmzPYXXbkk2qa/D+GnIps0Bk6djRNEijlqcJh29FUs5laclhH
	kaRO3+zHaXflJPfSfPbZMjmRrtE77tfJzIvTutSgErbBJgnPTIlllQ/DAbbhd2l6guhP
	7vN6Da+0ZqI98I69F6idLSVrJcxohmlhpdmmUluxyg493LAQTWTwvlhr2IrUYIGPp4Vl
	S6wX+g0c9UDFnKurRt9MP3Cgu2GvWF3vARcZDeAnv/BLHtm7DsKoenaw+8UNaI4ysLf8
	grdg==
X-Gm-Message-State: ALoCoQllCEqZCku1Gs108ACtVE4luwJXkTNeoebc3TyCBn3ca1O6OZW8eWSVVc3Fq2+NKHzsIDHt4xcpJXHMf1ruUIbTWZY1e5fY42zT239HsPItTYo3K4I=
X-Received: by 10.107.130.155 with SMTP id m27mr15277042ioi.133.1449784928807; 
	Thu, 10 Dec 2015 14:02:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 10 Dec 2015 14:01:49 -0800 (PST)
In-Reply-To: <49ad2cee12cc6fdf471ea3e600afb7949138beb6.1449693306.git.randy.e.witt@linux.intel.com>
References: <cover.1449693306.git.randy.e.witt@linux.intel.com>
	<49ad2cee12cc6fdf471ea3e600afb7949138beb6.1449693306.git.randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Dec 2015 22:01:49 +0000
Message-ID: <CAJTo0LbpvDC-NZrKkAmVMan17-DNLptSKUhagrPzA3LcundFNQ@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][master][PATCH 1/1] uninative.bbclass: Choose the correct loader based on BUILD_ARCH
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
X-List-Received-Date: Thu, 10 Dec 2015 22:02:09 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94aebf5c0526925b92

--001a113ecd94aebf5c0526925b92
Content-Type: text/plain; charset=UTF-8

On 9 December 2015 at 20:50, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> -UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"
> +UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64',
> '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2',
> '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
>

Would it be neater, and more flexible when other arches are different
(specifically I'm thinking of aarch64 here) to do:

UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux.so.2"
UNINATIVE_LOADER_x86-64 = "'${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"

At least I think that overload is correct...

Ross

--001a113ecd94aebf5c0526925b92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2015 at 20:50, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div id=3D":1it" class=3D"=
" style=3D"overflow:hidden">-UNINATIVE_LOADER =3D &quot;${STAGING_DIR_NATIV=
E}/lib/ld-linux-x86-64.so.2&quot;<br>
+UNINATIVE_LOADER ?=3D &quot;${@bb.utils.contains(&#39;BUILD_ARCH&#39;, &#3=
9;x86_64&#39;, &#39;${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2&#39;, &#=
39;${STAGING_DIR_NATIVE}/lib/ld-linux.so.2&#39;, d)}&quot;</div></blockquot=
e></div><br>Would it be neater, and more flexible when other arches are dif=
ferent (specifically I&#39;m thinking of aarch64 here) to do:</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">UNINATIVE_LOADER =
=3D &quot;${STAGING_DIR_NATIVE}/lib/ld-linux.so.2&quot;</div><div class=3D"=
gmail_extra">UNINATIVE_LOADER_x86-64 =3D &quot;&#39;${STAGING_DIR_NATIVE}/l=
ib/ld-linux-x86-64.so.2&quot;</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">At least I think that overload is correct...</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113ecd94aebf5c0526925b92--
