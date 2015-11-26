Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id CD41C6011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 09:02:51 +0000 (UTC)
Received: by iouu10 with SMTP id u10so82003397iou.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9sUupXIrA7ce9aV5DhMKmAvnEqmZKPSpuzUP5KkA7yA=;
	b=mknK225Srtx+K5xpG+4dUBalGpqVslIJHZzTtvV6zjG29caslKoh+ECc31Z7G8ZoI6
	A/ZP+5aaiLuKf1ea1XdR9o2xjx9FtqlN9Tzi7JQfFEnpQq6aUEd85okMuFwZal1dVzh+
	tFnJn3yyjePfKjKn5Imoe3NJn72zU4tSJwrG4NleFJH4l5cH8WSPYzuzoIfMMCS5uiL0
	KpfXL8HwYv0syeMbqN1nwQipMGVJDrLKz9g6FwKF8JINJ0Fq8UmPLy+NRCaAecDIVHzt
	GJMHuhs68VAGCIhNOBhOEfRT4UE0kL3ArH+7LdeHtOZvvxO1sei7lVls3uo8CVazbqnU
	Nt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9sUupXIrA7ce9aV5DhMKmAvnEqmZKPSpuzUP5KkA7yA=;
	b=W58YaPF5Bj8GAyUSurNVvq9vJcRC5Ng9smfuAk3ghuJv6KHOTJhxJHLxS4lfgA7lTs
	b4m9lGWxIS0RC6urPirWaulbmQcIOuZyibC0/fSn3/Df27iLGYeBT9auOJy3eiViD3TB
	Ri82oH96t/xsdrOXYzkc8GE44lLajS3yLFJr1Zbfjnose7mmxEw/EV+exhOwU2fyJ8fs
	ij1jTLYFVFGEpkXSF0kNaQfaSeU++cPVGOAzIv8Vsv876jY78MuLXkIXjxBWYdTBoLXj
	DGNAis6m1HrQz7XvHB0bZox9a8UuaTQJ8Qkoylpe5j+JH6ylneXehiWALU/KViLnOFnE
	TrXw==
X-Gm-Message-State: ALoCoQl3RYmqi+Gi5z2KkVYEzNGWc31FgbqUT0NZztljuDhpdO4/Es6mlln3Cos0mcAnn8erm4Ab
X-Received: by 10.107.3.144 with SMTP id e16mr37014672ioi.99.1448528570259;
	Thu, 26 Nov 2015 01:02:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 26 Nov 2015 01:02:30 -0800 (PST)
In-Reply-To: <5656A7C8.7080001@windriver.com>
References: <1447249213-28910-1-git-send-email-ross.burton@intel.com>
	<5656A7C8.7080001@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Nov 2015 09:02:30 +0000
Message-ID: <CAJTo0LZvvw=LcoHg30qWO4xNnymoNfNTBZPDrSF9qtwxkjD39Q@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl2: require GLES when building Wayland support
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
X-List-Received-Date: Thu, 26 Nov 2015 09:02:55 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40e0de2805256dd64a

--001a113ecf40e0de2805256dd64a
Content-Type: text/plain; charset=UTF-8

On 26 November 2015 at 06:33, Yi Zhao <yi.zhao@windriver.com> wrote:

> I tested this patch and found it also need to add libxkbcommon as a
> dependency in PACKAGECONFIG[wayland]. Otherwise the wayland support would
> skip if libxkbcommon is not built before even if we already enable
> video-wayland.
>

Thanks for noticing that, can you sed a patch for that?

Cheers
Ross

--001a113ecf40e0de2805256dd64a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 November 2015 at 06:33, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mail=
to:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":avf" class=3D"a3=
s" style=3D"overflow:hidden">I tested this patch and found it also need to =
add libxkbcommon as a dependency in PACKAGECONFIG[wayland]. Otherwise the w=
ayland support would skip if libxkbcommon is not built before even if we al=
ready enable video-wayland.<br></div></blockquote></div><br>Thanks for noti=
cing that, can you sed a patch for that?</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Cheers</div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113ecf40e0de2805256dd64a--
