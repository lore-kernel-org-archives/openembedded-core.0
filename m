Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 295DA73175
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:08:58 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id z14so56707577igp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QIDPOU+VflROWiHoLiBCg+5822HURNC7oCkOuWCE1fQ=;
	b=BUlBD4p3aT9UrzwAy0BmVx98dAFGkORwWZBcySAG52FebOrhYCQwcO5YeJInLM4kkJ
	lNSEQuZZ91JHYRGKRS086sE1RNmVbJxzUeGAHdiBq3zstNuRMnD6G92dSy6mXk4dXSTF
	Fn07D66rBgV5HWp9bfHNkxwKUOZze8DHaQlJc0jWLcm4yjCBWp1wNtB/zHI4YkHJb2d1
	VIT6PcFrmB+i2kvtPaTEBd8IR3/8iZpWd6INIGfKhjZH6cHyn/EoHGQWtsfJ9FJ6r1ga
	FIhMUcL2lO7U0Ou++MXgSmSzYKh/a/krBpVabXbZLCjOdh2USPVK5W9pwSrRbYRua+G2
	skfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=QIDPOU+VflROWiHoLiBCg+5822HURNC7oCkOuWCE1fQ=;
	b=nNQrM4PhjRChijBI1bgsHFL0XpxsxOPInBsMd9WlEe5v7mjDsWhTj90qptMOK8NSNi
	Z4n3kPbD2gBIFxHlzXtCr/Vr6vZSgYS3rPb/j4T9kTh/IpTNglHr7bE6V2ltvZszrzKr
	IvdGqMHiW29TTagGW3n3X6uWsaQtkwiG1La4MohF45utjborlREs0OTmybSK1jBOqcvp
	tFt3P7Ur1bHT6KL9vHNte75dgdQPP7JGUd0yQOgHwAMSofPAmoBR7a85Rv69LIbCrdT9
	UTbvHE9LD7IKEhOjEgIWMNGL0stuV2C2BQ0K9ZrWlZosQMRRHC5nrf80fYR0jYAibGZo
	jCnQ==
X-Gm-Message-State: AG10YORBqA6qPr3BdN2MBU9AzlFNW2NJWl8hmnIadbLZwGTW70Sh46GNoOnm7yvt+rSSgk4y6zETR4MRvwSTeg==
MIME-Version: 1.0
X-Received: by 10.50.43.131 with SMTP id w3mr15486598igl.70.1454407739230;
	Tue, 02 Feb 2016 02:08:59 -0800 (PST)
Received: by 10.107.142.207 with HTTP; Tue, 2 Feb 2016 02:08:59 -0800 (PST)
Date: Tue, 2 Feb 2016 10:08:59 +0000
Message-ID: <CADwFkYfpFmA_29cJqSJTD=9ZMkBCWVGbqQm9_-05inkLJEYkbg@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: can't compile ffmpeg without x11
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
X-List-Received-Date: Tue, 02 Feb 2016 10:09:00 -0000
Content-Type: text/plain; charset=UTF-8

HELLO!

in ffmpeg.bb:

DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
PACKAGECONFIG ??= "... ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
'x11', '', d)}"


the 'DEPENDS' says it need libxv which need x11, so the x11 detection
in 'PACKAGECONFIG' will not work anymore.

can I use ffmpeg without x11 ? (indeed, I want to use opencv)

the old poky will work with libav, but now libav has been dropped.


Yi Qingliang

