Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 13732609BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 11:35:30 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so10831083pad.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 04:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=QeJDCxsana3/rfET46Zyne5y/IWQ2gqlju7/Zn4qelk=;
	b=TxMNltkuam2Oj4SzqpXMkYwTgNpVMgGylIlqRkQdYzqqd3gWJ/gK0qT57dv/I6kDxd
	SY1kEA5tC/ns0cRwUHQtT5B+GuEpwgitf4HaMrSy+0YVjPkmUESwCyzO/AxbME0wY28u
	m4s5IRLASRlqoxIQRlqWiawICt1Vxdlq97gZzTxt0lt0xu60x6x/yuLt7ZiR2bCO0Clj
	TP/FDG9jQb5xjm+o2zburZxqNB2ZFYyAUGdAq8Gqy5WaEypr0SU6OKyCEEKy4NL15WjL
	e4+FNCv9KZZo+pNVYVAP8hlD6VhLPizsuvlcAN2Lpp2StfwU4F0p5WKcwObdQyNIaw9l
	TW6A==
X-Gm-Message-State: ALoCoQl8sb1Fn0cMJm5PEiRLKqlGS0zlnWdDn+tdDlwhKa8Cc45yO50kKNblO2oqdi9Rf7AyCjtM
MIME-Version: 1.0
X-Received: by 10.70.22.97 with SMTP id c1mr7478294pdf.62.1407756931548; Mon,
	11 Aug 2014 04:35:31 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Mon, 11 Aug 2014 04:35:31 -0700 (PDT)
Date: Mon, 11 Aug 2014 12:35:31 +0100
X-Google-Sender-Auth: vzqks_GijBkl5QMtTiKNyFvRsVQ
Message-ID: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Adding cgdb to meta
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
X-List-Received-Date: Mon, 11 Aug 2014 11:35:33 -0000
Content-Type: multipart/alternative; boundary=047d7bd76634d5e401050058f36e

--047d7bd76634d5e401050058f36e
Content-Type: text/plain; charset=UTF-8

Hi,

is it just me who uses cgdb on the host (or the target) for debugging? Gdb
is semi-painful by default because you always need to list things, cannot
really browse the code easily, etc. It is also black and white, so the
source code syntax does not necessarily stand out for helping.

So, instead of different developers maintaining this in their own layer,
how about including it in meta?

Since it is a host side thing (or it could be target, too) and debugging,
it would not bloat the target images that much. It is just an ncurses based
frontend, but it is great!

Cheers, L.

--047d7bd76634d5e401050058f36e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>is it just me who uses cgdb on the =
host (or the target) for debugging? Gdb is semi-painful by default because =
you always need to list things, cannot really browse the code easily, etc. =
It is also black and white, so the source code syntax does not necessarily =
stand out for helping.</div>
<div><br></div><div>So, instead of different developers maintaining this in=
 their own layer, how about including it in meta?</div><div><br></div><div>=
Since it is a host side thing (or it could be target, too) and debugging, i=
t would not bloat the target images that much. It is just an ncurses based =
frontend, but it is great!</div>
<div><br></div><div>Cheers, L.</div></div>

--047d7bd76634d5e401050058f36e--
