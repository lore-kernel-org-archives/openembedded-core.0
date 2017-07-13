Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 22F576069C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 09:40:48 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id k192so38900060ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kfmvW9Go5ZthLoSuWcXn6c1r/F8ialBnw80jiSPVNMs=;
	b=1vRJueb/WW6yu/ciO60fC8Nj8XphmG+JQ4Dn7hLTAYdlRSUwA1YU0dv3tA7kBnv46V
	7y+Z4WPPpIiL/cJ5vdpy/aUVFMQOCXaMl+6MdfUeCW0LSxRooNdOe39Zbj5RMXSdv/e7
	mEJ9zxmj3R64t8msnVLSatCe4gP5UyB2K1QoOEt9jx21WIgCdaM6c4kgyuIoqlF/k3sz
	3Y9aMdpIiw+NDvu4QYjPEbHmFHEtHmu/QyJRV1NOhjaCttZbnzPzlWNCxMYAh3RHMpDX
	X1KHnVbgWF60BErlSqAJYQX7HKx/pYrCg320eywElMA0zKS3Kxo03QmGnJM8yyeHvHrs
	Hisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kfmvW9Go5ZthLoSuWcXn6c1r/F8ialBnw80jiSPVNMs=;
	b=qiEPBAZcagI5oTjhumhoIHVWw+CHaR/00sQNl/cwTtP41NBHyImuTqIGDSWS1SVHgO
	u5zAFJwm56cm3aBQGGQKWT8aBv1nV9t3TFro/OG5n+cr4NuE6A8CvFWciEi3VnKvU+LW
	Qwm1yaeoTSjemJdnQZeH+cNqd3o9mB3KGh+a5BVZHYCTV52Qi3WMkh0w1INVGyJF3FIB
	b6ru4FKm/4lz0DeUhomwkvofV+HdrOuDCHGdNIt0FUpNl3tTHvqBsrBjJhACgkPJmtlm
	jCAXs6YqsmiLbbCcao43MlRDb2m5YE4Y/23YqobLG7xTkVCTAjVEc/H1o9arJAypDSaa
	g46A==
X-Gm-Message-State: AIVw112fcJhFzlPGNq6oMZWIrG7CI7rS95UyMzb3EYafxpjf7WNF4Gbx
	WjVZgzEoQ5xvCYYpTSK9hEmCPcgOAnOg
X-Received: by 10.36.58.6 with SMTP id m6mr25795113itm.43.1499938850019; Thu,
	13 Jul 2017 02:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Thu, 13 Jul 2017 02:40:29 -0700 (PDT)
In-Reply-To: <96d138921edb8356aa7b683803e4facc4e0ade4e.1499854502.git.liezhi.yang@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<96d138921edb8356aa7b683803e4facc4e0ade4e.1499854502.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jul 2017 10:40:29 +0100
Message-ID: <CAJTo0LZ75z8kjoBKLGKhF6dOpSDQFmRx=pepc_uPZ87QCVSwoQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libbsd: 0.8.3 -> 0.8.5
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
X-List-Received-Date: Thu, 13 Jul 2017 09:40:49 -0000
Content-Type: multipart/alternative; boundary="001a114419ca57329c05542fba8d"

--001a114419ca57329c05542fba8d
Content-Type: text/plain; charset="UTF-8"

On 12 July 2017 at 11:15, Robert Yang <liezhi.yang@windriver.com> wrote:

> * The LIC_FILES_CHKSUM is changed becauses the files updated the date, and
> added
>   a BSD-3-clause-John-Birrell for man/timeradd.3bsd, this license is
> already
>   there for other files.
>

The musl-specific patches don't apply:

Applying patch 0002-Remove-funopen.patch
patching file man/Makefile.am
Hunk #1 FAILED at 29.
1 out of 1 hunk FAILED -- rejects in file man/Makefile.am
patching file src/Makefile.am
patching file test/Makefile.am
Patch 0002-Remove-funopen.patch does not apply (enforce with -f)

Determining if any of those can be applied always would be good.

Ross

--001a114419ca57329c05542fba8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2017 at 11:15, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:116" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15d364ce33a36af0">* The LIC_FILES_CHKSUM is chan=
ged becauses the files updated the date, and added<br>
=C2=A0 a BSD-3-clause-John-Birrell for man/timeradd.3bsd, this license is a=
lready<br>
=C2=A0 there for other files.<br></div></blockquote></div><br>The musl-spec=
ific patches don&#39;t apply:</div><div class=3D"gmail_extra"><br>Applying =
patch 0002-Remove-funopen.patch<br>patching file man/Makefile.am<br>Hunk #1=
 FAILED at 29.<br>1 out of 1 hunk FAILED -- rejects in file man/Makefile.am=
<br>patching file src/Makefile.am<br>patching file test/Makefile.am<br>Patc=
h 0002-Remove-funopen.patch does not apply (enforce with -f)</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Determining if any o=
f those can be applied always would be good.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114419ca57329c05542fba8d--
