Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF3A160118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 23:56:17 +0000 (UTC)
Received: by iouu10 with SMTP id u10so141855319iou.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 15:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gBHd0VScCEz30Yi3w/N3vaeszPWqUdkUApzC/HdGgtw=;
	b=Gq9/qGNb1GDwS7EGl0sJCCRNvOin4UczB2ONmsUD5qrz6rSRIC/FKRqw4PlRQ+rHLE
	i6c/SUuJJeU2Z4tgWXM/Lv/CNhMpiVNJs8hFWNkJ44sdu99af80368JidvyVA8UEqH+P
	kLH0jTnl+Vd8wJxvI1NkS/+gqzKWRCpGxqaGRBjz1HM3MzMiqMb0yClz+D8ytFnWHzKJ
	WLtGIG/rNmn/0w4GwI8B3jwnPoGImz83/42so0swbdPlyG4pFxc6b6+9LFhMZzMp3SSG
	dgzdKbVcuu5umOV1htP+2ddw2tptdogy83QZ4ZwuaCPLioIwVPQ5SEd43aqJLEMYUrZ1
	JR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gBHd0VScCEz30Yi3w/N3vaeszPWqUdkUApzC/HdGgtw=;
	b=ZFaPiBfHFI3lKYBTSMSqBmBRyW/efAWYKWIr6lCfWe96sN64n91qDDQJg0jZFo5RRc
	YeYhqp8Ufd+TzsXiaxp2Knkbd8VyexuAKbEEeso1qk06kg1N8T8YTE5JOKVX/HOMWmBH
	SCuHZep/exupceVRjrfax9xlyBeaSzZpzqz23hXBW8uroJgJa3XFlQq1Cqh7LlAR2Iu5
	QKLz51y5ou9aXIZojmaRd0p7zXcqMUxnu+nF7tr3vFjlwhb1LTOYzBSDItR4loMhXgja
	3ZNcqc7VpZ/lB5H1Y+KVNyimXYHeiOUeK82jHCEv0PBoi/kgMDbcE3WbtOXUuhwhqa2g
	GPUA==
X-Gm-Message-State: ALoCoQn7yL7uTapyWPVRccbJb65pUJDz78VlXUzwUcj8aOPOTiUN/zuiKsPaWy4CS78k/gDLjxFu
X-Received: by 10.107.130.155 with SMTP id m27mr18169582ioi.133.1448063778193; 
	Fri, 20 Nov 2015 15:56:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 20 Nov 2015 15:55:58 -0800 (PST)
In-Reply-To: <CAMKF1soWaQ9NGetzHap6YLyK+qjdL2Cc3iGits4i6HqjtPT1Wg@mail.gmail.com>
References: <1447944434-63631-1-git-send-email-adrian.calianu@enea.com>
	<564F4068.8030701@collabora.co.uk>
	<CAMKF1soWaQ9NGetzHap6YLyK+qjdL2Cc3iGits4i6HqjtPT1Wg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Nov 2015 23:55:58 +0000
Message-ID: <CAJTo0LZQto4uyMrB7y5Yx16sW=LtZu9OpvgUm3LrS6=j2CeiBA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [fido][PATCH] [AArch64] Fix the big endian loader name
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
X-List-Received-Date: Fri, 20 Nov 2015 23:56:18 -0000
Content-Type: multipart/alternative; boundary=001a113ecd941c98770525019f3d

--001a113ecd941c98770525019f3d
Content-Type: text/plain; charset=UTF-8

On 20 November 2015 at 23:43, Khem Raj <raj.khem@gmail.com> wrote:

> it should get into master first so if you refined the commit message
> then please repost it for master.
>

tt's a backport from 2.22 so is already effectively in master, right?

Ross

--001a113ecd941c98770525019f3d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 November 2015 at 23:43, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1qj" class=3D"a3s" st=
yle=3D"overflow:hidden">it should get into master first so if you refined t=
he commit message<br>
then please repost it for master.</div></blockquote><div><br></div><div>tt&=
#39;s a backport from 2.22 so is already effectively in master, right?</div=
><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ecd941c98770525019f3d--
