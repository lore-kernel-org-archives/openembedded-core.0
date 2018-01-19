Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8491B7872C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:01:11 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id c17so2263569iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ryGmmzYSrblQOOpfxwf+2J3A9XTYQ1FMsWQUElGKLNg=;
	b=GA9Jb+DSlvo5lKFSFfr8Ar21MKe/EOZjdE4m4bxhf0d8SgLx5vlaZmOIKW8f2slsKW
	MytBhsyeBjNLTjvlobQdF3QIJXs4EU7j/Y7rN7axF/60gPzCSGPcfUrR0tBDPLEH09uZ
	CgXPmwaEkGC+8TlCT8Kvq2N6KVRfk2gkmDgS/WED04k8I54ihuOwZSbr1zl2hMp5PMaU
	tANTg4jfAwbvmRJIX61HSJL1zfT0lTU/qVpdMKkia/2hf4oEaEXo0+kA42Nw8fdGq4iz
	maKebVvGu4h3fJgJlmaZ77hbPTGUIHprRMNIw8Vt3XogaFovImyRQhb0jb62qCWnxS8O
	pXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ryGmmzYSrblQOOpfxwf+2J3A9XTYQ1FMsWQUElGKLNg=;
	b=dswRBTDk86Qbw9wgt9XiA1tgNC9VM2vHPyULJvdxPM9QF1YaI9pCeRpcS9PojDQ/Yc
	vhEhdFrI2ancgIEy6LYvNh80UH0CaiPDjn0cOMQu0AUi5zC2TVyXvzx9UkH2KAFNLir1
	1TsxEcE6DmA28S0SumdaElnbmZsKA6A3GmBAERlNBJDvCKLGij+7lxWx3gK5LIxId4m3
	mbaH9ZqIxyEu1B0sPfbxoUWknNg9WMbXkil9LzydlLAuBezmpZ6ygy1d8EAfkfZyIiAW
	Z5tLeJhhr22FvaMDJS2Phf2R/hLn2T7x2dZATDwFcMXw2Jb/OH7T9KuVqclqbyriqbuu
	IIhA==
X-Gm-Message-State: AKwxytemZHq4hES2ehGv5+oof7TwmfTsIa6gpWPUXmXhHO396Uv6SFMI
	bkVtrt81JDMEkG3LB6ez1XZ3MZsqBK+1kKaItwMGaA==
X-Google-Smtp-Source: ACJfBouTIFnaqyAffNT0RkCUc0O+xD+e5Hh/LUhEG7FnORrVOuno60iNU29bh2vOszsx7pNVSOvrqxfmQCtfYWq76Jc=
X-Received: by 10.107.175.8 with SMTP id y8mr22371083ioe.37.1516370473327;
	Fri, 19 Jan 2018 06:01:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 06:00:52 -0800 (PST)
In-Reply-To: <trinity-3e6429b4-2102-499e-ba7c-9cedaf2f9d75-1516370245496@3c-app-mailcom-lxa10>
References: <1516359976-26345-1-git-send-email-ole2mail@mail.com>
	<CAJTo0LYxWfHvpFQUGk8Qy=AG7A7=PCY6CSm4UWW_8qbCWTO5RA@mail.gmail.com>
	<trinity-b50cf031-4a89-4af1-9fcc-c9caa29e98a6-1516367853822@3c-app-mailcom-lxa10>
	<CAJTo0LYf2eQqpm534m8JMDiPa1WZCKjEqHGzk2_MZjzKWDy9pw@mail.gmail.com>
	<trinity-3e6429b4-2102-499e-ba7c-9cedaf2f9d75-1516370245496@3c-app-mailcom-lxa10>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 14:00:52 +0000
Message-ID: <CAJTo0LY9dm16=tYbBMCFN4WQgsA5pujrUgTozjaDFKu7xDtz0g@mail.gmail.com>
To: Oleg Kokorin <ole2mail@mail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 14:01:12 -0000
Content-Type: multipart/alternative; boundary="001a1144a268693d7005632183fc"

--001a1144a268693d7005632183fc
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 13:57, Oleg Kokorin <ole2mail@mail.com> wrote:

> I've got the points and re-sent the patch, but I'd like to add mine:
>
> by adding complexity instead of taking care of git and specifically
> send-email command providing necessary portions you'd like to have in patch
> in automated manner - you are decrising number of participants
> significantly.
>

Re-adding oe-core again.

How can git know that you're the original author of the patch and didn't
just copy/paste?  How can git know that you've hacked a workaround, or
backported a fix from upstream?

I'm fine with a small barrier to contributions when it means that in five
years time I'm not scratching my head at a patch with lost history, no
comments, no ownership, no indication whether it's a workaround or should
be sent upstream, wondering what it was meant to do.

There are still plenty of patches like that in oe-core, where the history
disappears into BitKeeper repositories that nobody has anymore.

Ross

--001a1144a268693d7005632183fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 January 2018 at 13:57, Oleg Kokorin <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ole2mail@mail.com" target=3D"_blank">ole2mail@mail.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div><div style=3D"font-family:Verda=
na;font-size:12.0px"><div>
<div>I&#39;ve got the points and re-sent the patch, but I&#39;d like to add=
 mine:</div>

<div>=C2=A0</div>

<div>by adding complexity instead of taking care of git and specifically se=
nd-email command providing necessary portions you&#39;d like to have in pat=
ch in automated manner - you are decrising=C2=A0number of participants sign=
ificantly.</div></div></div></div></blockquote><div><br></div><div>Re-addin=
g oe-core again.</div><div><br></div><div>How can git know that you&#39;re =
the original author of the patch and didn&#39;t just copy/paste?=C2=A0 How =
can git know that you&#39;ve hacked a workaround, or backported a fix from =
upstream?</div><div><br></div><div>I&#39;m fine with a small barrier to con=
tributions when it means that in five years time I&#39;m not scratching my =
head at a patch with lost history, no comments, no ownership, no indication=
 whether it&#39;s a workaround or should be sent upstream, wondering what i=
t was meant to do.</div><div><br></div><div>There are still plenty of patch=
es like that in oe-core, where the history disappears into BitKeeper reposi=
tories that nobody has anymore.</div><div><br></div><div>Ross</div></div></=
div></div>

--001a1144a268693d7005632183fc--
