Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFF677BC3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 12:42:59 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id n195so12667866itg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0vJsdBvEzSKlkL4p/y1W9SbkhZ5JixfQ27QGOBJvSw=;
	b=ON3E1ustXXMoScJ69YAVDXEtkFeNmzOBlwpk9RzqX3q1JPih6GceM5+m/nErJyxujR
	ssF8rTZ8WMu0Sz8v01ELDfUnPAdJhJpIeZ4vT8cieKFLHck+v1+J2GfSB2h1tbdVJrTO
	3yJJaEadZs7FX8l3wFhYp0ma2vi4lPMRJTH6ounUqdv8OR/3Bq0cPYX4bbT3ziMRYgAH
	/EJ7DJkN0xFAwfKiQmZr1GgK5/OQiEyDdiRj0fLwyI3MhUiTZ0JpTAuQ8qTQPjFEMhHq
	p9NCegxhtvrxx5YtcUzLYvRSpAx2MkCEfgWdQUlsZkdz0pcT1oe/PKTZwCgPRkmVdRZH
	OqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0vJsdBvEzSKlkL4p/y1W9SbkhZ5JixfQ27QGOBJvSw=;
	b=a9/J3YXGUssF2ut79bzbj29ZLnJWAZTCYgXXlYPqwtef6NgzRZFBzTZtivsJohZTNB
	GdrH/1b8FznrQZ71JnS7eR/CIfmz27zdB61BkxZ0+wptW03yXZE8dKr9lOnGyQshRO+f
	3Ac700wwWeEH3ppXpX/2xbKIjCgncreTSvQTKZLzuxQS/8Hh6SWNSzWXD3N4ZprPa+5E
	/hSZhhbkLvuGG0IBmD6gpU9ufDsUPNMy3uT2YdSVJz9qe1tpsocVXerpWtPDhODOWS6v
	63u74ZN8Ikrc1EtVT9nsVCyD0zR6JT+gDBgsaNW+25nug1csrLuoSDBuBJh+wy2ixOcO
	RZmw==
X-Gm-Message-State: AMCzsaWSWaNzfb+zTevY5ckKcghjwi0rq/EpnsuUPFk/3smemV+o1fH4
	bSqSpqp02jw7hkbeiKKDWXR7DaNvGOi9tUjomz/p7w==
X-Google-Smtp-Source: AOwi7QBukpYTYUXfzNXgAxIMwJwP+LQsIjBKf/zB3dOEjw28p7c9rjbvWKBGnpLCSR7srdECWOgTUBwqGwI37OZFZ/g=
X-Received: by 10.36.167.79 with SMTP id s15mr13067181iti.6.1507552981263;
	Mon, 09 Oct 2017 05:43:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Mon, 9 Oct 2017 05:42:40 -0700 (PDT)
In-Reply-To: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
References: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Oct 2017 13:42:40 +0100
Message-ID: <CAJTo0LZ8OkfLxgCLZi9-d2vpXUtWFo6jROedC01zid7fx=FX3A@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix building on armv6
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
X-List-Received-Date: Mon, 09 Oct 2017 12:43:00 -0000
Content-Type: multipart/alternative; boundary="f403045fb218edbc5c055b1c8703"

--f403045fb218edbc5c055b1c8703
Content-Type: text/plain; charset="UTF-8"

On 9 October 2017 at 13:21, Paul Barker <pbarker@toganlabs.com> wrote:

> This patch is backported from the upstream git repository to fix building
> libgcrypt on armv6 platforms such as raspberrypi.
>

Is this fixed in 1.8.1?  We've a pending upgrade for that waiting for
master, if so then this would be rocko-specific.

Ross

--f403045fb218edbc5c055b1c8703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 October 2017 at 13:21, Paul Barker <span dir=3D"ltr">=
&lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toga=
nlabs.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">This patch is backported from =
the upstream git repository to fix building<br>
libgcrypt on armv6 platforms such as raspberrypi.<br></blockquote><div><br>=
</div><div>Is this fixed in 1.8.1?=C2=A0 We&#39;ve a pending upgrade for th=
at waiting for master, if so then this would be rocko-specific.</div><div><=
br></div><div>Ross=C2=A0</div></div></div></div>

--f403045fb218edbc5c055b1c8703--
