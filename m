Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id CE0EE6025D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 10:56:48 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id z16so11449834iod.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=X/avO0WB35s3hnH/Fi7rgBIN3czIHFiQJjrd916W/3k=;
	b=t0LcgOMUxxAxydw+WdeWzTOsFlVImXYcqbsBMVe0T+z8Ly0gl/Ummp0LEOSxsPclLm
	sfdacfgY3bDlDjYQSWq+fTkdOcZJvO2LvtYmd/6kJYxve+Q7mD8wiXKL2x63elDPOW/5
	ly88vuAbr/NXdmwgMYDl2+OLFGVasTpb9/RXVperpjbQHY2PeBnmgJw6nEVE+lwymvT7
	iMl6XtEkowy4+TJLFntYh69R1xyWtaVucD9Y0/ketL838l2HBhc+6HOr2Lop4xtGmj/p
	vTYMRSQKRbJv+hcPl7VeiW/3EHLX+fAZAIZqA5aqyM7AiqStiCcC/iMnC1+BvCyLRkW4
	tOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=X/avO0WB35s3hnH/Fi7rgBIN3czIHFiQJjrd916W/3k=;
	b=jnquQ2enwq5XwI07C5xLbpJ4fH9kwt9Ogi+MNFHrF7BhAkerR/tJEb/2f16/a7umg9
	ZpdIVT5N8v2Ok4VTpHphJQjKUDaq9BKUl6bSJLbcIFBwz3zPu5S5u39f9v+kr7S1SopO
	SaAYT5KXdAO+svzJRj6I10R3efM/+QC5dzE+rofljqq8BMr/dwhDkQA6GlJA8z9wHd7k
	CPeJqyFOCw8myqQvMaQk4N6tu7FEOR29/QZRtq+yDziZ+rOMFOvHwX1r+4cHtDFpw8dV
	ExoSfcqP2Hfdq5Ja6rVgL91pjHNokKJ6b+UtVtrh0ywiALo/jluk2tphm3KZQG7LWfeX
	cMHw==
X-Gm-Message-State: APjAAAWMedVOdqyD2vybasFTevbfk2V0sdpItX3/2ciSHYvlmgXDWBhc
	l3Vw1SMNq90QHp3U5ktaMgW8rOtp8VM3WkSzZmZB4P1/
X-Google-Smtp-Source: APXvYqySjmQSAgDycnPArYFV0AlVMzImYIiioKjF5bb4Fd82beJu47YpNWkBRH839FKj5Jrco+XBLq/nxgYkeJalVqU=
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr11955202ios.192.1580727409574;
	Mon, 03 Feb 2020 02:56:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Mon, 3 Feb 2020 02:56:49 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Mon, 3 Feb 2020 21:56:49 +1100
Message-ID: <CAA=hcWQSba31fHCkAEdaK4+FwR_Szzs9t0fTajq4+USqnbZb1g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Failed to add u-boot ubifs (not working)
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
X-List-Received-Date: Mon, 03 Feb 2020 10:56:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I added my local machine to ubifs, is it correct?

UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"

I built the u-boot.imx, but the ubi was still missing in u-boot. What
I could be missing?

=> run nand-boot;
Unknown command 'ubi' - try 'help'
Unknown command 'ubi' - try 'help'

Thank you.

Kind regards,

- jh

