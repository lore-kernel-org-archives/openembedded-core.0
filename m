Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07F9B60796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 17:04:48 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q126so192398001iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 09:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+fjP+oRhj/YlN5JZftowv/yyecGpRyeFwIG4GKtPn8g=;
	b=IFsV6hduwYV9Xzdb57UKgbT/zB2E0AkD4VUxVy2wR8qvJsWO0iryYgks92ouSD1y5J
	RDOyQKBBBmrZAwDpQIw97XHzx9GcIQB0ZR8XnCQUiqkCSRKJ9oXEt4VfMRa4ZYQSbyNb
	R6SmKxeFSw5uablSY/TkDL3nZhCR88G29llXpy4Bu0SE95BSsfB64I4DmFfV56kPh8z4
	A34IdOQmEbQoadoG8xesVTPrW2MdQh5zQkReB5ewG2u52PQDFqdEXWz9Y6bx8wbPi1uw
	K7AFfFWD+xMH99QkRUqoXWnTn7vplPbmKjtyoQDS+ItyFgdeMZ7U72i9NnNvY4/V+s6L
	qdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+fjP+oRhj/YlN5JZftowv/yyecGpRyeFwIG4GKtPn8g=;
	b=KPJB4G/F9WLsXkAqsqZTysW7vx5mY1Pyu8SUJhCv787eWV41HFiWM6t682UI7yNjWU
	9XuYJ7zC5mnzDIp9UNpi7poNg1Wn/JB3cQybJdukBiNyIxUvkuiZ1lN4LKqOPFiMTiJa
	j1pG3YayzWzb6l2+6a7sMw2m5ptp1gRJXvEokzQ9vYEEaIL/1S3pYNUHb16CNEb9Q2K4
	4gz9MX88ezAM+bqcTr755Yi76QD7Y4VfHPCnP3LVKQ8GJbTCrOkC/D8eE836xMwAGpR+
	jN6loUm6M56ZXAsfL8zNcILhPwYdpOvRM1ay22ilW5cBnv/knlvGuHgWjdO++3mJPGCu
	GYng==
X-Gm-Message-State: ALoCoQk9Rew3dSYCguO3TrqAWkAy4sDzo5YOXb6xRG702/KdOsZXLQzesFJjOczkwlr1F8s8m38bWkx3AkBoHPFIfHmvuxcFYnTmCtUjnRWDgTAgLhHrXHQ=
X-Received: by 10.107.3.154 with SMTP id e26mr24916411ioi.99.1450803887499;
	Tue, 22 Dec 2015 09:04:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Dec 2015 09:04:27 -0800 (PST)
In-Reply-To: <1449718597-2085-1-git-send-email-nate.karstens@garmin.com>
References: <1449718597-2085-1-git-send-email-nate.karstens@garmin.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 17:04:27 +0000
Message-ID: <CAJTo0LbEMPzVs6JsjtnagwfHqxuyHmTXGXyKc302gCRrb4LKAw@mail.gmail.com>
To: Nate Karstens <nate.karstens@garmin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 22 Dec 2015 17:04:49 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a5a839f05277f9ae1

--001a113ec10a5a839f05277f9ae1
Content-Type: text/plain; charset=UTF-8

On 10 December 2015 at 03:36, Nate Karstens <nate.karstens@garmin.com>
wrote:

> Adds a new recipe for dhcpcd. Modifies the configure script to keep the
> host system header files from being used instead of the target system.
>
> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
>

For new recipes to be added to oe-core there needs to be a good rationale.
It seems that this is very well suited for the meta-networking layer (part
of meta-oe).

Ross

--001a113ec10a5a839f05277f9ae1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2015 at 03:36, Nate Karstens <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nate.karstens@garmin.com" target=3D"_blank">nate.karstens@garmin=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":70=
7" class=3D"a3s" style=3D"overflow:hidden">Adds a new recipe for dhcpcd. Mo=
difies the configure script to keep the<br>
host system header files from being used instead of the target system.<br>
<br>
Signed-off-by: Nate Karstens &lt;<a href=3D"mailto:nate.karstens@garmin.com=
">nate.karstens@garmin.com</a>&gt;</div></blockquote></div><br>For new reci=
pes to be added to oe-core there needs to be a good rationale.=C2=A0 It see=
ms that this is very well suited for the meta-networking layer (part of met=
a-oe).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113ec10a5a839f05277f9ae1--
