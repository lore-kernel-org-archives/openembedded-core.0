Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C95AA605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:22:26 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m88so6659345iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fJgn05lHxhU3TkYPkHIu7UKXBOYRSsKLaPvzvp8tt0I=;
	b=ELhxH/2nDIu0MLrVWdK1pCj/KaUHusZTow2Pgok2fSqfWhD0rKg+DSZjJp8kSRnD/X
	+JvSFtqnhDX3nL1CKJfJ1W/4T2egGdS/KQYalPFuaCXxHw1yKdVX52BP8exTJpQrFCdR
	mqDtWvSfyTwEL59fdXyNkC9NmaSPR2NyKeTsoOen0YfL2CNm83/bkmQYT+DRNIl5tBq9
	kAr/VWoSIlJ8ZuK0txep72J/SuW8SyYxrezz4ohsQwWoo9i4fl0VUd4fgvG7/Hx0U+Mq
	JvQid4V/bQKfd4TMz5XLb3VazB/aOYP7l9suIfRBrniFPM5UiW0pNd8jIjh7duFTi2RX
	iulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fJgn05lHxhU3TkYPkHIu7UKXBOYRSsKLaPvzvp8tt0I=;
	b=L+YYs5GKiYFjUGpjges9RXEhvCsmd57FPjiR5XJGZ4huce1+tu8I7zigEBxPuJLQBD
	osxlRt7m/lg0VPT5wh8ns4sv285auMgnalZ5q+t4s6/XptmNbLqDFpnX0sYzVTvFuwSi
	bkWoCIs5AgTS4v2DuSixZSh2JHAGi2nSVuDx8GksQNad3wXHjT3Y9Mnrni28hYhGNfNx
	xktrgsbR62FKL7ET/oolR+8lZ4vU6xLJ1lsAhwrXuIRjKT+GY4sTvrrok8joIZADOK+H
	CpO2xhMpKiJLEWko8UvkHkQPU2S27tljf0lR42xTv0Eb9f4t2dSl5HUgZqJp2rt1hniF
	8FlQ==
X-Gm-Message-State: AIVw1137D58gfga65r1Dlu9kdkCqxB0LiMe56EOV4uDq58pVHCZE+LVn
	8FfaCA+EqdysDo3uybbCXARllk4ei19N
X-Received: by 10.107.160.132 with SMTP id j126mr4854985ioe.224.1500578547700; 
	Thu, 20 Jul 2017 12:22:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 12:22:07 -0700 (PDT)
In-Reply-To: <CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 20:22:07 +0100
Message-ID: <CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 19:22:26 -0000
Content-Type: multipart/alternative; boundary="001a1140da664b462e0554c4ab0f"

--001a1140da664b462e0554c4ab0f
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 16:37, Burton, Ross <ross.burton@intel.com> wrote:

> This fails to build on ppc:
>
> | checking for libdrm >= 2.4.75 libdrm_intel >= 2.4.75... no
>

Same on arm and mips now.  Basically everything that isn't x86, so I'm
wondering what the difference between your build environment and the
autobuilder is!

Ross

--001a1140da664b462e0554c4ab0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 16:37, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
This fails to build on ppc:<br><br>| checking for libdrm &gt;=3D 2.4.75 lib=
drm_intel &gt;=3D 2.4.75... no<br></div></blockquote></div><br>Same on arm =
and mips now.=C2=A0 Basically everything that isn&#39;t x86, so I&#39;m won=
dering what the difference between your build environment and the autobuild=
er is!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a1140da664b462e0554c4ab0f--
