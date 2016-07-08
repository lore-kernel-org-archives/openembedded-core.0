Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0E66160119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 15:01:53 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id h190so11788776ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=so/v2eP86qPhYXN73X5qru1zElHMjkJH5+3Q2D1x5Fg=;
	b=ruBfarYUb6Dw6kfs/sygYhgDUp8tCnRQ9q7TbQaCubM/M1NdT0Dmo8r8GqhYBR7fAC
	J4/dODvzjE80gFoiI4IAG7BLQ/n5rw2dc6dbA7al4W9/s+LJ9TzG64+s7icm4uFsLb79
	zytQMUXldzVTv8RJfln7yShUwz/XJNrW4hokaG0qOVmSEA0sE8Uoe7MUwUuda/cdiiq7
	27PPY4x6nULFY2Vj3mpmZMZlV91TUTQojnbXZVahQAC5BCGkmlj5q3EgmSRrh1LnAH3D
	SoGBoixUnZOoLALs99l36lTDQT9Dz1xbIggnLPUixdx5GCb6JBBuPXb6qr5eRoHPk9ED
	6iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=so/v2eP86qPhYXN73X5qru1zElHMjkJH5+3Q2D1x5Fg=;
	b=la5srcSCAF1EuAy4UqHULZvjTi4jfs8TXDWtcxCuMlXTAOLLu8KAhRNeqafLa4MoW5
	ByqphEEJepUrk83Pm8z9RyolVdYP1vYZLhC4c9Tzx4b4aFDOjlpnDnfKSVOevrnUtts5
	baKZ34ONr/reo88N90bWDY+APFOe4Fai6MPOoVM5HHSaGOwmc0L40pucQemTyGucVWTK
	jt33dLe5YXmLCIn9JvkgHcWPOkmIUTIl6zpo3cUf3Hn6Bq7LgcEnAV+4+odMMcN8lPlQ
	4ZHznJZ6HyBmVg6tKGMkIdC1IthdJjUIK/oHou63nZR85xGHmJ99LjoFOdVaXwYLk7Mm
	vRmw==
X-Gm-Message-State: ALyK8tJb2QyUmJHQdW8TOG9wUCTg9hx+F9HsO8BsoLc3NtfDSX6OPnVajyMsSVWCNYSNhnn+tZIGZ+R6SKRmKKxy
X-Received: by 10.36.147.198 with SMTP id y189mr3594316itd.83.1467990113347;
	Fri, 08 Jul 2016 08:01:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Fri, 8 Jul 2016 08:01:33 -0700 (PDT)
In-Reply-To: <cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
References: <cover.1467914773.git.raj.khem@gmail.com>
	<cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jul 2016 16:01:33 +0100
Message-ID: <CAJTo0Lag=_fv_Sa_Mo4mvU2btC1mSeXCQ=BBMncX3tW-T6LRzg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Fri, 08 Jul 2016 15:01:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c089e143d8263053721151d

--94eb2c089e143d8263053721151d
Content-Type: text/plain; charset=UTF-8

On 8 July 2016 at 14:50, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> What about uclibc? It should be updated as well.
>

Well, I'm about to send a patch to remove it...  so if anyone actually
cares they should speak up now.

Ross

--94eb2c089e143d8263053721151d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2016 at 14:50, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":648" class=3D"a3s aXjCH m155cac6770b51d72">What about uclibc? =
It should be updated as well.<br></div></blockquote></div><br>Well, I&#39;m=
 about to send a patch to remove it... =C2=A0so if anyone actually cares th=
ey should speak up now.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--94eb2c089e143d8263053721151d--
