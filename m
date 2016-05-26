Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9A86AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 20:11:37 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id e62so101254611ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=MAYzYspWzOpQap9j6UDTLuqHvcRMOAON7mXIrJfqllQ=;
	b=nxOO/h7yWLP93apyCcU188WsbZ12oT+t0UHDA5THEs0XmzTAAIJje62OPcLSKy+V+O
	v6drb5npEJjX5yQFGrINK9/j3zKeyGU5vIp4/1g98W+0d0HQ5WXY5jngJZkyzWZTgwwU
	QI6a3ebTRveKIT8knpeNcbn1R5ks4wjnIW+q+0Q/6o4wrJ+Q2LJv1lYzJqqdoHR7nqhE
	hyke60JHAc/ZfnvDhTX5g6YKNNwWp1PEzV2Nv02jPJxVeBtjy4O9uyqIdxcJSwzm0Vz+
	V+VkVRVO8V635DO0GwRWMYjX0HyfMUjMrEOM6+QVz9KiN4FSDqj10GZXGFqReeoy0LwX
	7ibA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=MAYzYspWzOpQap9j6UDTLuqHvcRMOAON7mXIrJfqllQ=;
	b=a6+8H8D5UxRHgu6fnW2Um6eXrQyutJd9KMSv3FvzqK27hywGTF2iKsuXd4/+QqwkWJ
	CdAvmAhBUV9vN1iTYlXUPFvl3Nwgv7w5GSOUjedf+isXTgOBlja1W8jSSBRTcxHaANJK
	u84cZR5IGIZjen+UT5tBagWAea3kpNquhYtMaCTlZ2tLgSjnsWe9ceYS8v/lAWFiD6TI
	l1dBrxQf43zdZKkjHt7enTytXGfFmUAzDRY/tSVfRkElOE92OfHCvVaTqMBjNqEPWmEv
	rIhhz8rDgaKf+Q7RAeIhAAJP6QSos9addEJmto2ONiPtsdmOgLbz2BSFGQ5awTRNkIgW
	8kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=MAYzYspWzOpQap9j6UDTLuqHvcRMOAON7mXIrJfqllQ=;
	b=A+SJfNTXMp2ghGC1LPKX7XLxz9GKWdCakEbcUOI8jk+qAuhpl7aQ6Zp4C4Azoucup2
	qNyrDsKRldDRSEQ2WptOlYun0B9VoBNcnvAZmPDW+6BkLqrdNbSVDQbShSJqPHkrnVLl
	g+ePuyL3dZjUX/aLKT2c4qVHv3bsXgRe27pt5X9vmmyq83aoMpje0XRipk9objdmD72W
	0IKcPPbVl+SEO7Kcowut2s0xnV1aN5O0GokZNNddxuiPbtgnYuXjzPEgckwWJvl/jK3j
	3x4GUdiyxoxpS5rne+OW35GX2GF+FKSk2G4XrFTNlysc954SugtYxo9OqwYRJvFoVpeE
	5R8g==
X-Gm-Message-State: ALyK8tJ2Wg25HqmSoOk5KW+H0uSM4tLMUcSalLN3S9DRhh+HxIumFYIjXncpT8bkbbQ6caBD7IvZfsy12DokcQ==
X-Received: by 10.36.41.11 with SMTP id p11mr4990172itp.66.1464293498547; Thu,
	26 May 2016 13:11:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Thu, 26 May 2016 13:11:19 -0700 (PDT)
In-Reply-To: <1464291870-5602-1-git-send-email-liu.ming50@gmail.com>
References: <1464291870-5602-1-git-send-email-liu.ming50@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 26 May 2016 13:11:19 -0700
X-Google-Sender-Auth: l26KdRLWDs9j5I-fDBQ0u7gGpNs
Message-ID: <CABcZANk9BJp_1wMrv7mR8-vLk3JfMkdxRqTMqcWm62nHkCrnBw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: hide the error in case swapoff does not exist
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
X-List-Received-Date: Thu, 26 May 2016 20:11:38 -0000
Content-Type: multipart/alternative; boundary=001a1143fd70d3f79d0533c465d9

--001a1143fd70d3f79d0533c465d9
Content-Type: text/plain; charset=UTF-8

On Thu, May 26, 2016 at 12:44 PM, Ming Liu <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> To avoid reporting errors when swapoff does not exist.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>

This will suppress *real* errors as well. Better to just check if swapoff
exists and then run it if it does, if that's a concern.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143fd70d3f79d0533c465d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 26, 2016 at 12:44 PM, Ming Liu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a=
 href=3D"mailto:peter.x.liu@external.atlascopco.com">peter.x.liu@external.a=
tlascopco.com</a>&gt;<br>
<br>
To avoid reporting errors when swapoff does not exist.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.atlascopco.com</a>&gt;<br></blockquote><div><b=
r></div><div>This will suppress *real* errors as well. Better to just check=
 if swapoff exists and then run it if it does, if that&#39;s a concern.</di=
v></div>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson=
 at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maint=
ainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1143fd70d3f79d0533c465d9--
