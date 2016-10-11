Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D438671A08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 14:58:12 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id i202so27286866ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GLO26WX019SjIIMRCSFwRX1fsu84kZraPDWQ49tjdn0=;
	b=cWMSOcbeCHCwofylPnNm8gwvRawytT2+NJp81hWrmqqXSkfQMXpxBbviDbuXNys+rH
	T2yYcYom4yWDMMV6YDrt2xVHz+LTKSo7/cWbJq8YnqJ4vIlpqCsW42Gfo9VxvJm9hVGb
	31y9ZtMLjML4QgyJb36zWoXV7wM7mVk6O3QCIgBjCsdtsBuOkleltu4AH0rRPOcf3LhR
	SUdFNo/7ER4zmhn/tRwV6XYlktQYWN+iEj+M9Qf6m0WEoDMGqLrK6GTxnx8Wq9f7F4cU
	PZ+GLL6+tvwEAOWSLaS9z/xID8cHkCQWgYSqNHbpTivNZedlbeWLVuLxcwAz+wxEhnPX
	A8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GLO26WX019SjIIMRCSFwRX1fsu84kZraPDWQ49tjdn0=;
	b=X2VrzY9n79/3DkPgDQuSCDO0KoAg/lWutGwQTmlMAo8b/wC0NxHhJHCCTOl0kBhfxb
	uvgrVdop4HN5z62jdhnDhMlMJ/AlyS5qmiFzQF/NhJEUzKYEF+jl/mZR1dxzZOIdIXHc
	1LgL92+ctjQ+Q9eHOrpMFI9sJuehuJJsnOPUyqbsGjJPYu1mSbRZAnAC7/Yl9CklH5kg
	wn9m1NjFPHphjPcEDRmt6aXr5ZdW8nUjuiO7oStt/5UNHVvdthxn0S3nIRFv8+ee3Ndd
	mn5yPhS0TInuUVkw57EYhTuTILFY3W+UcOfmyeRPdgBSziemw4mhw2rNlKyPj8Tv+JeV
	NjLA==
X-Gm-Message-State: AA6/9RnjRtWy1rwmVDVBHVr7X1VJlMitmNNUZeBb8GJJK0IwfmqjMtxm7Oj83lxf9+TYLYyZC62lgwCzWS314PRx
X-Received: by 10.107.17.32 with SMTP id z32mr6468173ioi.1.1476197893875; Tue,
	11 Oct 2016 07:58:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 11 Oct 2016 07:57:53 -0700 (PDT)
In-Reply-To: <1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
	<1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Oct 2016 15:57:53 +0100
Message-ID: <CAJTo0LahAKipF1Dz9TQw8TVM3vp361ZATtVPHjXy5ZupRDdZkQ@mail.gmail.com>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] librsvg: Add missing pixbufcache dependencies
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
X-List-Received-Date: Tue, 11 Oct 2016 14:58:13 -0000
Content-Type: multipart/alternative; boundary=001a113f2676155b56053e981bec

--001a113f2676155b56053e981bec
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 15:17, Kyle Russell <bkylerussell@gmail.com> wrote:

> g_module_open() failed for libpixbufloader-svg.so: libXdmcp.so.6:
> cannot open shared object file: No such file or directory
>

Can you replicate this failure on demand?  I can't see why eg xdmcp needs
to be in this list but say libxcb doesn't, which is presumably there that
linkage is coming from.

One solution for xdmcp would be to remove it entirely...

Ross

--001a113f2676155b56053e981bec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2016 at 15:17, Kyle Russell <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bkylerussell@gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>g_module_open() f=
ailed for libpixbufloader-svg.so: libXdmcp.so.6:<br>
cannot open shared object file: No such file or directory<br></div></blockq=
uote></div><br>Can you replicate this failure on demand?=C2=A0 I can&#39;t =
see why eg xdmcp needs to be in this list but say libxcb doesn&#39;t, which=
 is presumably there that linkage is coming from.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">One solution for xdmcp would be=
 to remove it entirely...</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a113f2676155b56053e981bec--
