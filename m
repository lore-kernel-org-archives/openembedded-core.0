Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id AD8EC782FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 16:13:50 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g33so18489753ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ril7WY7NcpsGAHRvI9wEUG8LvQgZF23QeQbi+o/yu6Q=;
	b=i62Bc8oWCcuILf0D5YkigYREHx18V2VtDivVwNxztqy5bn5rf/vQjA7zzRYpOdk0sX
	n9MNgagadPiaNf3DfDbOqNTvIK6jjrRChJgVFIwBy/hqZcor0Ghebl8Ra9q+yDySIOd1
	RzieNAzaCM0S61QOESr+xIcC6E0m/52gx34f3ivFqm35B3YOPz31p9klP4MZHh66vmvR
	hJm8sSJPcinfOglZKa0YLKFV/OnXJw9vjpMIPQ/escyUexp6fcarQtrhuXrGllh6/Tdo
	7I30stm/jCpBCKwu6OKkpyBbj1qZw9MUAFR/vaDF2DezLTt6royLHRQYkYUpran7J1zD
	gzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ril7WY7NcpsGAHRvI9wEUG8LvQgZF23QeQbi+o/yu6Q=;
	b=DLnsdm3iN2ya+BYnXLAuwfjssFyAOHP1ZWp6TN5Tth6QvdjTBwvW/52tpwyi7Y82qG
	GIrUIp6QTmbDZbxACRhk97F7qcTAfG1YxF258hNk8zEwWoJXEee4T/za/RxQqV0MZCzK
	2g8x4O0CZKLlo1eNu117+L6RGgiy+5Z3Igial1cSNfPbpdpjLdDHRtbFX6P365nKj6ey
	FyvUYBFibufif2vcioAFaxt9uhA78KU6cHeyPO8moCPPQpW+lKS+DWYt6ihuhkfOKhK9
	pYAquQxSDOU87/wjuDEXTdSW7TpqCi7ElGJkCh9gw4VA+Qo4u5ziFnbldh7HWMxJXQnx
	Q/Aw==
X-Gm-Message-State: AHYfb5jJ9f016MjdZJJP8P2zvx5uya6b+0JRazSLDoKfIXLjktihQ7Hg
	L57usRTb+kmt9zRhhll8hdQt5j+NV/Dj
X-Received: by 10.107.27.133 with SMTP id b127mr4556210iob.144.1504023231796; 
	Tue, 29 Aug 2017 09:13:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 29 Aug 2017 09:13:31 -0700 (PDT)
In-Reply-To: <1503991517-3965-2-git-send-email-yi.zhao@windriver.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
	<1503991517-3965-2-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Aug 2017 17:13:31 +0100
Message-ID: <CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] iproute2: enable build tipc by default
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
X-List-Received-Date: Tue, 29 Aug 2017 16:13:50 -0000
Content-Type: multipart/alternative; boundary="001a113fd5e2774ed20557e6b29e"

--001a113fd5e2774ed20557e6b29e
Content-Type: text/plain; charset="UTF-8"

On 29 August 2017 at 08:25, Yi Zhao <yi.zhao@windriver.com> wrote:

> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[tipc] = ",,libmnl,"
>

Surely it would be a lot better to just add tipc to the default
PACKAGECONFIG, so this support and dependencies can be turned off if
required?

Ross

--001a113fd5e2774ed20557e6b29e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 August 2017 at 08:25, Yi Zhao <span dir=3D"ltr">&lt;=
<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windrive=
r.com</a>&gt;</span> wrote:<div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-PACKAGECONFIG[tipc] =3D &quot;,,libmnl,&quot;<br></blockquote><div><br></d=
iv><div>Surely it would be a lot better to just add tipc to the default PAC=
KAGECONFIG, so this support and dependencies can be turned off if required?=
</div><div><br></div><div>Ross</div></div></div></div>

--001a113fd5e2774ed20557e6b29e--
