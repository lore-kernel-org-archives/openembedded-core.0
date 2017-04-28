Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2040477EBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 13:59:06 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id y63so53291274qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MPARQ32u4sBignRtSZ1HH1kiWOXdD/U0nWvNEPxdgF4=;
	b=hCAaNNwKBZdaAat4b1GZ22Y4xCFpCizyMrpsNEouQ69sPTUwjUaXWEINFlMJA0cJNB
	miy9s5kR4fGf2fRXr5+H+svftjONqXL6CkVWDA8e3gxZbOdBVEyrGxEF2ZApZ+ZK5bFd
	NZYIy0F4rTBE1xYhstqWDGy/xg9xILjD4x0tk2VB2efrRZVRfgbfR3m8lHEYRwh46L7A
	SSIWnGh7z+iN+qHVXFNOA0rbDj7VvGkwMxtZXMFNOEZbssddj16Q/VIRcJAeWynlI20Q
	lcr/rv248qeJheHBxaRIEf5IJ3KgEB6QvyVWi3/gPDZX3mB3tdLZc6kGh1/qlgV2mUs2
	V/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MPARQ32u4sBignRtSZ1HH1kiWOXdD/U0nWvNEPxdgF4=;
	b=FfPnqaMZlU0zrvL0KnYroVGtjhT6/EYSYD0HkKISKx2u0PmVcXQudFU7fKBQLfp/W6
	OROnU4GMoSeEwyhThg8/UoJbDslo2s2tmlX7rUlniqX8Vgj+id3o9o3sqL6viwivN41J
	2zyIk9tTgUyJXxm2Asda4fCpnPktYAP/jkhnyt0e5VI7FCB4XYu0cZtsXp3DJfHvkCQv
	AbM/L4NxtiGps7cP/wrg1qHGBQ/WtncYvPFEstvU9ITjZJ010sg9PT7yYwxgSagesyuo
	F4VTl7x3pOLXc4tWg+H91IatE2qvSqiPV5IHTsyy3gVu9tjynU0uYLzAQDODgR+HWWfS
	wWYQ==
X-Gm-Message-State: AN3rC/52kskVuTUY9H2xrtgFADJvaH0yA1Yp4rArPXBqdczN4dOIYL0B
	wJICgO1JIlCbT/JVpDiIB++B+sjTCnAU
X-Received: by 10.55.214.208 with SMTP id p77mr10697945qkl.121.1493387948089; 
	Fri, 28 Apr 2017 06:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 28 Apr 2017 06:58:47 -0700 (PDT)
In-Reply-To: <1493385304.3156.5.camel@iki.fi>
References: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
	<1493385304.3156.5.camel@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Apr 2017 14:58:47 +0100
Message-ID: <CAJTo0LZsEnqepWkqtEubN04A6+XYzcj+wpATT8jg20pGk1hF4w@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] speex: upgrade 1.2rc2 -> 1.2.0
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
X-List-Received-Date: Fri, 28 Apr 2017 13:59:07 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f8288d20054e3a7aa0

--001a1149d4f8288d20054e3a7aa0
Content-Type: text/plain; charset=UTF-8

On 28 April 2017 at 14:15, Tanu Kaskinen <tanuk@iki.fi> wrote:

> Oh, I'm on speex-dev, and I missed the announcement of the new
> version... The recipe reporting system didn't notice the new version
> either, probably because it thought "1.2.0" is less than "1.2rc2". I
> wonder if this will be a problem for package managers too...
>

dpkg thinks that 1.2rc2 is less than 1.2.0, I suspect the RRS doesn't use
the same algorithm.  Not sure what opkg and dpkg think of it.

(1.2rc2 was a badly chosen version for the recipe and we should have
noticed)

Ross

--001a1149d4f8288d20054e3a7aa0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2017 at 14:15, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":3iu" class=3D"a3s aXjCH m15bb4b=
450c798970">Oh, I&#39;m on speex-dev, and I missed the announcement of the =
new<br>
version... The recipe reporting system didn&#39;t notice the new version<br=
>
either, probably because it thought &quot;1.2.0&quot; is less than &quot;1.=
2rc2&quot;. I<br>
wonder if this will be a problem for package managers too...</div></blockqu=
ote></div><br>dpkg thinks that 1.2rc2 is less than 1.2.0, I suspect the RRS=
 doesn&#39;t use the same algorithm.=C2=A0 Not sure what opkg and dpkg thin=
k of it.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">(1.2rc2 was a badly chosen version for the recipe and we should have not=
iced)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a1149d4f8288d20054e3a7aa0--
