Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id F248472FE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:10:09 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id b16so26581256qte.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 04:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M46agy9TcC2ZCFbpwTbYN92g4X/wWNMFqJ3ajUT6FF0=;
	b=11qZGdoWcSAfab991yqeWRSXFijZ3aWy4PqtnctRlEcl7Bil+zFpn3kDbR0/QHaazD
	MpOgEoaFyhEzt3dS7BpoqfzmchrMSfjOyml2MT2V3lQmev+1AaOD/j+SLXZqWphdMhJZ
	GmhrHDen7fEbEZdXklhWGSupvwdp0WbGr7S9MFdIcUUBd0HJJ8GUy99jRwjmloNpaTAF
	iZH5lai5ncdmXMpR67suDeW3MJuhuVFE+5ZEnFjJKp7WWhPqkDiJ0S7jCoWGZVNcgFla
	7J73wLe2uqa0utACsN9aE0LxVB6IPEL0Rbhzdtj/z1AdXqpj+ms50u0th+Y677lV9qyL
	c+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M46agy9TcC2ZCFbpwTbYN92g4X/wWNMFqJ3ajUT6FF0=;
	b=pJzqV/rU2yFKV0X7kdYFuYvGazFYWECxrD2HtfP72HAjeYZsrULeZwj6ZFEXSpXb8r
	iSfhuhWBD5Ce8qgZvELV+Ni99Kle7lf99LcGtNa1wmQb+GyIe8iB8xasnxVneHGYEBhS
	z0spmN+g9fpuh/+uy9SepCSUmRBRvei2R7rSCzEPkhtB7uOGGtNWxRofPmdek3O3GUo9
	pmWA+dlOrt1/6G6WG5rHM0TFdEu8g9VJ0zMnU4X3r/V59sNljJhwZbk0Id9gd2DQVYih
	3YuIsr59yECDPKBnETYoaVi4SDI+Nm2so32SaBVw5wyL9no2ao8Zat5lfQw/itytKc9Q
	eMOA==
X-Gm-Message-State: AMke39nArV2J9b2SEuO1jJLCIhIgjyOSQRHWyJJLyJNMzELP5V6/QcwAoHuxN5QZ+WgjLRTD4l2JL2DunafTPMy0
X-Received: by 10.200.45.247 with SMTP id q52mr38386397qta.197.1487851810824; 
	Thu, 23 Feb 2017 04:10:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 23 Feb 2017 04:09:50 -0800 (PST)
In-Reply-To: <CAHiDW_FBuM3GzPCzEVCZnR8j106EkaKYQ5BJMHFz1qCi3CXSbA@mail.gmail.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
	<f6a8a61195fb454781e93c2dcf615e48a2fc8682.1487764904.git.jussi.kukkonen@intel.com>
	<CAJTo0LZT-NukaBOgdA_Wajfu0pVkNCiNu18ZEE_CYGruXOz1ow@mail.gmail.com>
	<CAHiDW_FBuM3GzPCzEVCZnR8j106EkaKYQ5BJMHFz1qCi3CXSbA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Feb 2017 12:09:50 +0000
Message-ID: <CAJTo0LbMWNO+=rgCKrSui9+fcwJ06OcsXnFrF8qybaP72Zfmng@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] libdrm: Upgrade 2.4.74 -> 2.4.75
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
X-List-Received-Date: Thu, 23 Feb 2017 12:10:10 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf0a9cae60549317e1d

--001a1139cdf0a9cae60549317e1d
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 08:51, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> No, these were removed as tests for "functionality which is neither being
> worked on or actively maintained". Should have mentioned this in the message
>

Cool, thanks for the clarification.

Ross

--001a1139cdf0a9cae60549317e1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2017 at 08:51, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r">No, these were removed as tests for &quot;functionality which is neither=
 being worked on or actively maintained&quot;. Should have mentioned this i=
n the message<br></div></blockquote><div><br></div><div>Cool, thanks for th=
e clarification.</div><div><br></div><div>Ross=C2=A0</div></div><br></div><=
/div>

--001a1139cdf0a9cae60549317e1d--
