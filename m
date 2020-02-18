Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id E833561574
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 01:00:25 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id f10so15807763ils.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 17:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=EW0Fnf3YXcKqFSs9Rd2Yv4JlQlGtDQ8qmQpioAEqqNQ=;
	b=o8xISoHVFvsGKN7hdqImys+64pMBHCeQ1CASu2QFHTAqtO9RLOzdvjhEH/xFa1OwT7
	zrXmmTDF+Hiks2bCzV9SEdQU3f/fn592SPj3Di3IzTNTWYr6brACj+mEyNHvncm9ikz1
	tPzlPBk5NTtX5UIpJ/dl9H1NcJyBJF9N0CgrgKToej+YJnH7bxd7QqCxQtuCy1j/XJo6
	y4t/RSSR7krC5GSDjcTpbRvZBeYWeAf2WTg9Yesbw3CEwhaYRv9XpUm4nttrQjYFDl8A
	4VC3ZPWLfnBNb7PNvgkBIRTk3UuAqt1iPkOSP4sgU3BL0xpaXJaIK+G5CPG0GRkWvFJE
	bpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=EW0Fnf3YXcKqFSs9Rd2Yv4JlQlGtDQ8qmQpioAEqqNQ=;
	b=b9Y6TYe7x6BWn6htAAtObYSO4N6ti6z6Wj+/dEJDt2O5MvKfehku1XyPcww4vrZ+wv
	jCxultzqyzJ9Ya8+FD31qPNXfNGvAqXc+AsmNSfTFg2YU0bDsMjEZAelKSvKYRKO9uTx
	DPsMuqqdlzmJWcD+4qNIjZ+Bpl9k1LSxHpdWvcGL4f61x/2yTwsVvQFA4ICD0cQEmMZ/
	6oP7LxJl/bbirat6tsR91dHtuWthLIrgOdC0BbZIweoTKwyDjcpba0kPFcXMCa3HFqYZ
	fpPJl5UKSPVBpbPbB9dw5urhSo1eAxvje6f3EHFJAhkLVcztjTf+2k/awAsg1Py5q3Oy
	attA==
X-Gm-Message-State: APjAAAWUwwSKLSXuPyM8rtmRqbvpBO7juPprZa5RG5JxpQV7dwfqVyZ2
	j528wRQga1RnUE774bqQ50t4rABaL27diMI9Ncg=
X-Google-Smtp-Source: APXvYqxqBP5yqr87WaOZEro0sPSkzN9aQ6pTx8HGV4BQdS10MoRw74Wew2HcyTITvRBanvaJvt+snKpR0VRYIT1T2h4=
X-Received: by 2002:a92:216:: with SMTP id 22mr16818493ilc.53.1581987626912;
	Mon, 17 Feb 2020 17:00:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 17 Feb 2020 17:00:26
	-0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 18 Feb 2020 12:00:26 +1100
Message-ID: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
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
X-List-Received-Date: Tue, 18 Feb 2020 01:00:26 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Apologize for the cross posting.

I am running kernel 4.19.75 on iMX6 customized device with WiFi and 4G
LTE, it was running well in an RW rootfs. After I have just changed
rootfs to RO UBIFS partition, it failed RF Kill and postinsts I
suspect both try write to the RO and failed, any advice how to fix it?
Despite it failed RF Kill and postinsts, it was still working.

[    6.097762] UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2,
name "rootfs-volume", R/O mode
..............
[    6.151932] VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
.................
[  OK  ] Listening on Load/Save RF Kill Switch Status /dev/rfkill Watch.
         Starting Load/Save RF Kill Switch Status...
[FAILED] Failed to start Load/Save RF Kill Switch Status.
See 'systemctl status systemd-rfkill.service' for details.

[FAILED] Failed to start Run pending postinsts.
See 'systemctl status run-postinsts.service' for details.
...............
root#

Thank you.

Kind regards,

- jh

