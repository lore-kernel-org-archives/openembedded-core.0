Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3835C6AC49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 19:15:14 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hl2so3956256igb.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 12:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=yMhDH5zs0gOCLqLgHEUqEmfHkL9AUTWNeGi7ZC6htts=;
	b=GkgLeYULA7XfWXRzZRKXBfy7mSLWGn61IyK+5jsY22tphxgXSzFDs/56ww25oDWr/G
	NCh13WxJok3Wb5uZca+dw5Wagu/jqaBl1d++xPviCHLp9bKvgYRvi1I8ka5jgTR0rbJt
	elO55+ljrIojnrqKamAN8xBXJqO/TVSU+3xq0FNYCETBT9oQyXRZ1Hun1nqzkIWTwO4z
	2rOGVI1c+OUBkt8XEgdDp5gGsmcGQoz6QrBttQBDAfPxlKwojc5P02SW1LUtuRqGZ2dh
	uhu4y7M1xzarN7e8OI4ZXM1DPJTIZQDqP26cUe/oAOugQXY2EYCad/xA9kpfHPKP8lHo
	BYcA==
X-Gm-Message-State: ALoCoQkWGKoF3qODy6uQzT4AiX8wbf0MwZxk481AJcKp0XEmDpwFahXc6owy/AD19QROKDlZz5fZ
MIME-Version: 1.0
X-Received: by 10.107.13.137 with SMTP id 131mr22454058ion.2.1414696515057;
	Thu, 30 Oct 2014 12:15:15 -0700 (PDT)
Received: by 10.107.148.145 with HTTP; Thu, 30 Oct 2014 12:15:15 -0700 (PDT)
Date: Thu, 30 Oct 2014 14:15:15 -0500
Message-ID: <CALXw4G7x6Xbf3Wr=mKUCk6G5e4k=8sz_pph9VUMegLn1txA9WQ@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Subject: Opkg 0.2.3
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
X-List-Received-Date: Thu, 30 Oct 2014 19:15:20 -0000
Content-Type: multipart/alternative; boundary=001a113fdfd43eeacd0506a8b366

--001a113fdfd43eeacd0506a8b366
Content-Type: text/plain; charset=UTF-8

As Paul mentioned yesterday opkg 0.2.4 is on it's way and 0.2.3 has been
available for 2 months. If there are not any objections, I have an updated
recipe and re-created previous patches that I could send. This should also
modify opkg-colateral to use the new syntax for lists_dir.
I would also at this time like to propose changing the default list
directory from /var/lib to something else (/usr/lib ?). On a read only
rootfs, everything in /var/lib/ gets mounted on the tmpfs, therefore
packages installed get lost.
I've tested changing the lists_dir and everything is working as expected.

Michael Gloff

--001a113fdfd43eeacd0506a8b366
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>As Paul mentioned yesterday opkg 0.2.4 is o=
n it&#39;s way and 0.2.3 has been available for 2 months. If there are not =
any objections, I have an updated recipe and re-created previous patches th=
at I could send. This should also modify opkg-colateral to use the new synt=
ax for lists_dir. <br></div>I would also at this time like to propose chang=
ing the default list directory from /var/lib to something else (/usr/lib ?)=
. On a read only rootfs, everything in /var/lib/ gets mounted on the tmpfs,=
 therefore packages installed get lost.<br></div>I&#39;ve tested changing t=
he lists_dir and everything is working as expected. <br><br></div>Michael G=
loff<br></div>

--001a113fdfd43eeacd0506a8b366--
