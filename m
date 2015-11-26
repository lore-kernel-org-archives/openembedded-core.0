Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 99B476012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 12:05:24 +0000 (UTC)
Received: by ioir85 with SMTP id r85so86352975ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 04:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QOEviuvJYcrrOIE28WhYV1Gz3441yVb3X+Yr3cWYUDI=;
	b=xuuD50IZgmdH9+ugwwPKVMkRdrb2yYdavPqmP3i+Y1SOZydnSjrUz7bMkYFHggVskN
	xqqUrz/2E7ltvEvil6dv93w4FLBORsW0SnRIQ+kg/0dENhvhnuHvGdWoTu1+wlHFwEHO
	Im0oSosmS0AisDZ/AJwGZTZZ95x+7+zoBPCm0KRXayuKcr0RI4Sdddi5PV4rNXRj6nQG
	m88XUmpX0l3ZY0Pd8Qh3SlCuCcv4w4y0dp5EYehFFer2Cdyi+tkqZ0hdZYaT3CY99+uP
	HBu7NpHE9QnGWn3y6+duQMwyf8ixg1lXagQxxaBmhTkW3DjWjBInybNI9c6jADvBD3aZ
	yY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QOEviuvJYcrrOIE28WhYV1Gz3441yVb3X+Yr3cWYUDI=;
	b=a4C8Mr4ekmuZlzNPTROD85y9rHIQATZa28MfTLuKzs1SZJeCYrdMS4CcHWBEFLDtZA
	sEqu5xkVyjphG/+wlhL84UOcRpZ3AWvkfBJEMD8HMrXQq604izmXoAo1v2GGfaCPYeen
	3owcOa1yTUoT4NxFsZkFEVYyWGF+efzwXF6IS4iSPJenpBKcKZWrzAlbpq/8XhMQmlfY
	VjC+WoKdSRtjJLQ7w7pafMP4UQpFCMijj5gpgmlpj6zEg4qDg19JJZtKF/vgagmIZq7q
	J1t3rNcYsXn77tLYWmyz0Py5sHqx74R/5/+JIrywa8RXbgA2Bzkym08z7ppeApts9LeO
	Fggg==
X-Gm-Message-State: ALoCoQmbax3yRp71b3Tnui+V4cAuE+IHrBLq4a2pSH+TA2c88JOEOfBD5cpZYMsaFg3OZk/cE9L/
X-Received: by 10.107.130.155 with SMTP id m27mr45223750ioi.133.1448539525096; 
	Thu, 26 Nov 2015 04:05:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 26 Nov 2015 04:05:05 -0800 (PST)
In-Reply-To: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Nov 2015 12:05:05 +0000
Message-ID: <CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 12:05:24 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94d63bb6052570632e

--001a113ecd94d63bb6052570632e
Content-Type: text/plain; charset=UTF-8

On 26 November 2015 at 11:15, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> We get below host contamination warnings of license files for
> each recipe, when we try to create a separate ${PN}-lic package (which
> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
> in local.conf.
>

WARNING: Could not copy license file
/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
to
/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
[Errno 1] Operation not permitted:
'/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'

Ross

--001a113ecd94d63bb6052570632e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 November 2015 at 11:15, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishn=
anjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":=
enj" class=3D"" style=3D"overflow:hidden">We get below host contamination w=
arnings of license files for<br>
each recipe, when we try to create a separate ${PN}-lic package (which<br>
contains license files), by setting LICENSE_CREATE_PACKAGE equal to &quot;1=
&quot;<br>
in local.conf.<br></div></blockquote></div><br>WARNING: Could not copy lice=
nse file /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6=
.0.0/COPYING.LESSERv3 to /data/poky-master/tmp/work/corei7-64-poky-linux/gm=
p/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3: [Errno 1] Operation not pe=
rmitted: &#39;/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/=
license-destdir/gmp/COPYING.LESSERv3&#39;<br></div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecd94d63bb6052570632e--
