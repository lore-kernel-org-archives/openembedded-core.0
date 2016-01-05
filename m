Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9D860589
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 19:08:23 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 77so165396073ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 11:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wLmucnXVy53wlkCb8q9fUlZlemaKO5rVLH8sp3j5cBc=;
	b=DfwGQ/dUiwTJjrY2gWOWSuGHTzwRpEIF0MAfIiJX9vajIne51KTIjxmp4af9e7S5Jn
	t5JdMGPqKMdzb84QlhX2FdnKl0Bgef+HtZlevu1W32kmvSNtzfa7nxZJM0UZQ+zginzB
	3lmLC79ua+Hw0Z5TGXIExq42ZkTw6UHOLgJDnzNIPeP555B4i62GHMC3VYerZzdSyKHi
	zjME1ppiDWW5aRBtQKfRTCi0P6FDtgtaKcVQaRTnbijjq0irC+W/IvD5mu+gFbfLQ+1s
	aPdpHrMB8ibEXLPVcjO4mxq1m+xYQj3jUilXh1vOjHMyp5HJmg5ryJO0dMWEpuqCjnb6
	/5+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wLmucnXVy53wlkCb8q9fUlZlemaKO5rVLH8sp3j5cBc=;
	b=ToMhzDMAlbqVwh2qCKA3DTu8v0eVfxt5/xJTJ+1uqm2328AFtLcRMatfiF6mVtZG8g
	E3GhF7647TfeQ83IHTtlMsAjB77N8R8q29djj1/xxq3V7tBPEmAIxEHo34lTZBtYZM3Y
	tCAVnY8pJxuaVUKZGvn6PwEfFOhdp7X/2SnX+T1LfrHFk3PcfAFysTRvaHzD599cTG/t
	+G7jrwAsSSxc2y5CaSFQz8iHW04WhkdQVGbrSrIYhKXwLc+pYCzncXl78aMle5pg03qw
	hhclHCw7bcTDiI6vTS3teZ6uHM6QDew3iU5xAAq0Z0sb6ve6nUK2/xeNlPcfN9R1hets
	gRxw==
X-Received: by 10.107.133.40 with SMTP id h40mr45887838iod.83.1452020904256;
	Tue, 05 Jan 2016 11:08:24 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Tue, 5 Jan 2016 11:08:04 -0800 (PST)
In-Reply-To: <cover.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 5 Jan 2016 12:08:04 -0700
X-Google-Sender-Auth: K4TCqbhA_xovRhH0EUAD8BNR_HE
Message-ID: <CABcZAN=S55vPVZYA21tZvgBxSaCRoCOBfGzjdjvX7kqHgAiaMQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/4] Misc improvements 2 from Mentor
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
X-List-Received-Date: Tue, 05 Jan 2016 19:08:24 -0000
Content-Type: multipart/alternative; boundary=001a113fd8cc346c5f05289af67e

--001a113fd8cc346c5f05289af67e
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 4:41 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This is the final of three pull requests / patch series from Mentor's
> queue of
> changes destined for oe-core master (not jethro). This series includes a
> small
> number of improvements which may be more contentious or may require more
> consideration and review.
>
>
> The following changes since commit
> e44ed8c18e395b9c055aefee113b90708e8a8a2f:
>
>   build-appliance-image: Update to jethro head revision (2015-11-03
> 14:02:57 +0000)
>
> are available in the git repository at:
>
>   git://github.com/kergoth/openembedded-core
> mentor-misc-improvements-2-after-jethro
>
> https://github.com/kergoth/openembedded-core/tree/mentor-misc-improvements-2-after-jethro
>
> Christopher Larson (4):
>   linux-dtb.inc: use absolute upd-alt paths
>   opkg-utils: add update-alternatives PACKAGECONFIG
>   systemd: add myhostname to nsswitch.conf
>   systemd: arrange for volatile /etc/resolv.conf
>
>  meta/recipes-core/systemd/systemd_225.bb           | 20
> ++++++++++++++++++++
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 12 +++++++++---
>  meta/recipes-kernel/linux/linux-dtb.inc            |  4 ++--
>  3 files changed, 31 insertions(+), 5 deletions(-)
>

Any objections to this series?
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113fd8cc346c5f05289af67e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 12, 2015 at 4:41 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ue" class=
=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
This is the final of three pull requests / patch series from Mentor&#39;s q=
ueue of<br>
changes destined for oe-core master (not jethro). This series includes a sm=
all<br>
number of improvements which may be more contentious or may require more<br=
>
consideration and review.<br>
<br>
<br>
The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f=
:<br>
<br>
=C2=A0 build-appliance-image: Update to jethro head revision (2015-11-03 14=
:02:57 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/kergoth/openembedded-core" rel=3D=
"noreferrer" target=3D"_blank">github.com/kergoth/openembedded-core</a> men=
tor-misc-improvements-2-after-jethro<br>
=C2=A0 <a href=3D"https://github.com/kergoth/openembedded-core/tree/mentor-=
misc-improvements-2-after-jethro" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/kergoth/openembedded-core/tree/mentor-misc-improvements-2-af=
ter-jethro</a><br>
<br>
Christopher Larson (4):<br>
=C2=A0 linux-dtb.inc: use absolute upd-alt paths<br>
=C2=A0 opkg-utils: add update-alternatives PACKAGECONFIG<br>
=C2=A0 systemd: add myhostname to nsswitch.<span class=3D"il">conf</span><b=
r>
=C2=A0 systemd: <span class=3D"il">arrange</span> for <span class=3D"il">vo=
latile</span> /<span class=3D"il">etc</span>/<span class=3D"il">resolv</spa=
n>.<span class=3D"il">conf</span><br>
<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_225.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_225.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 20 ++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a> | 12 +++++++++-=
--<br>
=C2=A0meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A03 files changed, 31 insertions(+), 5 deletions(-)</div></blockquote><=
/div><br></div><div class=3D"gmail_extra">Any objections to this series?<br=
>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<=
br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<=
br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></d=
iv>
</div></div>

--001a113fd8cc346c5f05289af67e--
