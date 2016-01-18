Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id E8AA06FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:41:14 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id z14so58082145igp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eFFz/XFX+SclmuQ3NKqkY6AUZlg7v08PlBovo3J4xaY=;
	b=w+1apsHywFRJJag+rHJnyM30mNbH9eDuNHAnUdnlyyFE7HPwsv+iKDclrwLuuz24PG
	/8+qqw8X8mlHDs/DjQFF/AiXyFDzIq63igzObMcXeZ86WJDFTDtPeixDJo9aZJErUR0Y
	i6JzFA7ofN1Y2Qv9RrrGOhLTWtca3jekGf7c82QWqT1jVlBmV6ZGh7fJngYSnOcWShZc
	DPV9dCzTjIDF8elr7TlYd85VQOcJkeEAHZGlEO1BEiFLUvA4fPV6lH4NNw0I2b6whfY4
	HKHZyf8Lu85GMNDcxTc2DUZVw1ySWTM5ioBcTfh4ocH6zyosevXCLuxOhHzhcpcJB7qE
	73xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eFFz/XFX+SclmuQ3NKqkY6AUZlg7v08PlBovo3J4xaY=;
	b=Oq7B1b3He5v7p3z8HEsytFmrIc5J0Q5QVB1efBUobjVYp9hpDb59oZgW7tKV+WEJyh
	luEc0hSZcPk5xjG82ZJQOnLwgQ9VoHFx7zF0K48uUo7vZKS7NAzxco8nR8fJ8VhxZ2uN
	LZrIewA8okmA1yoZTkh+0YtDnwLP+uCpxJT92MrgFPwz53Gqkg6ZLcfXMKf4TDGujiEx
	Lm8cgMHckjO5/KrusQavCKQlWYp2Kn1unpij8X6fDt0ZJP0qBZAuRucJ4W/Ggl4JPnSc
	/u7mtRBrFest+Jf5/EwAmKVDJOavT7l23pWUsX48Ned/yMkRruXt++j7q9QoqRbpORQ/
	Axgw==
X-Gm-Message-State: AG10YOT0pEO7BWwctDTY2/QZPSAaQJviTznnqHpHkXI1SyNaRCR2c8QkLD9GZ48H0GIWfM6tf7wHkCDjMtW1dSIF
X-Received: by 10.50.30.69 with SMTP id q5mr11657877igh.78.1453131675064; Mon,
	18 Jan 2016 07:41:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 07:40:55 -0800 (PST)
In-Reply-To: <ae92e4f1b2b1ce46e943903798d96a7b39a1fc85.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<ae92e4f1b2b1ce46e943903798d96a7b39a1fc85.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 15:40:55 +0000
Message-ID: <CAJTo0LY_hqMjgrTX6-RJTvcMabdoA7vE-M54H2fDCXJoz8-1Sw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/73] libdrm: Upgrade 2.4.65 -> 2.4.66
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
X-List-Received-Date: Mon, 18 Jan 2016 15:41:16 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c4e5f4705299d956a

--047d7bdc1c0c4e5f4705299d956a
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:35, Khem Raj <raj.khem@gmail.com> wrote:

> Fix test build failures
>

packages/corei7-64-poky-linux/libdrm/libdrm: PKG changed from libdrm2 to
libdrm [default] - may indicate debian renaming failure
packages/corei7-64-poky-linux/libdrm/libdrm: PKGSIZE changed from 56367 to
176551 (+213%)
  * PV changed from "2.4.65" to "2.4.66"
  * FILELIST: added "/usr/bin/random /usr/bin/getversion
/usr/bin/updatedraw /usr/bin/setversion /usr/bin/name_from_fd
/usr/bin/getstats /usr/bin/hash /usr/bin/openclose
/usr/bin/kms-universal-planes /usr/bin/kms-steal-crtc /usr/bin/getclient"

Please remember to run buildhistory-diff :)

This is a simple matter of more binaries being added and overly-restricted
FILES matches, I've fixed locally.

Ross

--047d7bdc1c0c4e5f4705299d956a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":7i5" class=3D"" style=3D"overflow:hi=
dden">Fix test build failures<br></div></blockquote></div><br><div class=3D=
"gmail_extra">packages/corei7-64-poky-linux/libdrm/libdrm: PKG changed from=
 libdrm2 to libdrm [default] - may indicate debian renaming failure</div><d=
iv class=3D"gmail_extra">packages/corei7-64-poky-linux/libdrm/libdrm: PKGSI=
ZE changed from 56367 to 176551 (+213%)<br></div><div class=3D"gmail_extra"=
>=C2=A0 * PV changed from &quot;2.4.65&quot; to &quot;2.4.66&quot;</div><di=
v class=3D"gmail_extra">=C2=A0 * FILELIST: added &quot;/usr/bin/random /usr=
/bin/getversion /usr/bin/updatedraw /usr/bin/setversion /usr/bin/name_from_=
fd /usr/bin/getstats /usr/bin/hash /usr/bin/openclose /usr/bin/kms-universa=
l-planes /usr/bin/kms-steal-crtc /usr/bin/getclient&quot;</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Please remember to ru=
n buildhistory-diff :)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">This is a simple matter of more binaries being added and o=
verly-restricted FILES matches, I&#39;ve fixed locally.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--047d7bdc1c0c4e5f4705299d956a--
