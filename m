Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1451365C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 12:00:36 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k15so2155582qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 04:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4xNIEwqw9elRtHzQ7yv/RDMAgDLvA55QVUDFsY0M45g=;
	b=KTUtzPo8Vkehg7yE1lfkQUeum3frPW/Us95y+B0nm2dgcnmxAGrvNIMmr90muxpzo5
	xtiavOuEKKTbq0jGlHrf5kjfeac486qvnwMgO/w8EkTQt2nxFWoIlDFuQbs+bF9vAhID
	IcgFbJhwvKfua6rsfN0oParjujhYs0vRE3NMu4Jt3UGHlzQxgHct1MwmS7LTyzerSxl/
	N/kAS/KbX6HfsEO73qnhZgIXbZKyrkEji+5TWTNuMFnandXU0LTz9UzmHHAHXfnuNejB
	heUdTzXpvSyt7SWIaI+GQy6tRujpK2AaepIose8LeXZ3fpgfuRCr9gbdY2tX1V7P0ogY
	ozFg==
X-Gm-Message-State: ALoCoQm+Gx8jR0ve77WR37VdyuTenwHyOOdDgD703JD4iBYayd+VDlXw7YsomyKOOS42psaRzXM+
X-Received: by 10.224.112.66 with SMTP id v2mr16071846qap.22.1415361636937;
	Fri, 07 Nov 2014 04:00:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 04:00:15 -0800 (PST)
In-Reply-To: <1412173418-32141-1-git-send-email-akuster808@gmail.com>
References: <1412173418-32141-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 12:00:15 +0000
Message-ID: <CAJTo0La7oYuqFVBm7S3ta1mHxroYA_tJSV+f-s+PR+f+bGoywA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: update to version r123
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
X-List-Received-Date: Fri, 07 Nov 2014 12:00:45 -0000
Content-Type: multipart/alternative; boundary=001a1130cb1299470b0507438f10

--001a1130cb1299470b0507438f10
Content-Type: text/plain; charset=UTF-8

On 1 October 2014 15:23, Armin Kuster <akuster808@gmail.com> wrote:

> Makefile md5sum changed since version is hardcode in it.
>

In the future, changing the license checksum so that it only checksums the
section of the Makefile that has the license instead of the entire file
would mean it doesn't need to be updated.  Then again the makefile is a
strange choice of file to checksum, I'd have expected it to be checksuming
the source.

Ross

--001a1130cb1299470b0507438f10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 October 2014 15:23, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":11j" class=3D"a3s"=
 style=3D"overflow:hidden">Makefile md5sum changed since version is hardcod=
e in it.<br></div></blockquote></div><br>In the future, changing the licens=
e checksum so that it only checksums the section of the Makefile that has t=
he license instead of the entire file would mean it doesn&#39;t need to be =
updated.=C2=A0 Then again the makefile is a strange choice of file to check=
sum, I&#39;d have expected it to be checksuming the source.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1130cb1299470b0507438f10--
