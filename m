Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C1D6065CC2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 20:50:57 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so162004079ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 12:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HifDefwwNeoj2BAZjcaAhJqjUyr8FDJ6G8/k0XwZHx4=;
	b=ob29QALRwx5qFKOrrwt5LPxO0kPOslN8SR+CilIM1RohskHisqYbo1d8dsFHTUlnoy
	mNyV911YxV/pzLIcZSzUS7S34jeXh7rAX6+gvnRPnwkZ76VOLe+MmwpZROCGgmGMH8Q+
	BvPQYYLOJl9zgQMmeOAm2RL2veWDclJYkt2v8Z8GDrn8VWAnXBrO845WuwHKc2D2SD+l
	v/NXboi4yAroyKZXjrTbpHDOc65Kwr+du6T4MP6Td+lISW2zMDuqOGIkC7aMFHQ5pfuL
	0bb4Ra84uJjseU7fzjk/5CwYtH6LazRU6dtvz/OJdhMo5yIW8PEruOtApBfbrzORdp8f
	E9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HifDefwwNeoj2BAZjcaAhJqjUyr8FDJ6G8/k0XwZHx4=;
	b=UZRq/rgrG08b5gcwdsjYXLf9BMh8uESh/IGntF4yYoIUy+MdFnMpkN9ZOlLRL3r0T8
	wWRRv049eC/cpfN+4dG+SkmQjSXaOlEh5AgBygoOfiYH13HR8e4wtg2+cvLYjsONbluC
	Wbf0FTZ/FqzY8M5iAAAkV/V0iloS4BR0IAp7zZOzW7CR4XMiSuVREGTj7empO1PPKLvK
	6UG/h4IC0SGnEeXHKo6kC7oLBKCos61npZs57cwWjJQJzxkZTR9ahLsZKrqtgD6KJKLw
	4pZ19ybxL8Yum8RKoNH8ZBPBILatY1v5adwIsZ3kj/D+4Xa29e4MPtvtql/7DL2zPAtr
	MZ6g==
X-Gm-Message-State: AG10YORpTZzh+d8j54FyoXRdj5M7qbRWWnV3nh7HbiQLBESXEl6i1H0Jgiw3inRr6PR6m7WS5MAZiRYOJwhtnxY5
X-Received: by 10.107.137.92 with SMTP id l89mr8595301iod.133.1454791858334;
	Sat, 06 Feb 2016 12:50:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 6 Feb 2016 12:50:38 -0800 (PST)
In-Reply-To: <1454773573-6990-1-git-send-email-akuster808@gmail.com>
References: <1454773573-6990-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 6 Feb 2016 20:50:38 +0000
Message-ID: <CAJTo0LaGPJ-11B_008M+BXqs4UBvt6nd_Mhtt3wf2oeSYqssxA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsscsi: Add new package
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
X-List-Received-Date: Sat, 06 Feb 2016 20:50:58 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4f044bd052b201f3f

--001a113ebdb4f044bd052b201f3f
Content-Type: text/plain; charset=UTF-8

On 6 February 2016 at 15:46, Armin Kuster <akuster808@gmail.com> wrote:

> The lsscsi command lists information about SCSI devices in Linux
>

And this should be in oe-core because?

Ross

--001a113ebdb4f044bd052b201f3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 February 2016 at 15:46, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"=
mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":16d" class=3D"=
a3s" style=3D"overflow:hidden">The lsscsi command lists information about S=
CSI devices in Linux<br></div></blockquote></div><br>And this should be in =
oe-core because?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a113ebdb4f044bd052b201f3f--
