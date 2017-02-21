Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5268272FE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:20:43 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 23so11662751vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=HeIgEyE0xjA/v1H5/2BLBfpnWhvzViqrEJKqIc3Vhxo=;
	b=GB6K32+sOicpY6BCKfKBJW1Q9hEx6LYVyQSKlqJsVvuXfYxHI0JxgwGfJGitaAM2SY
	74oKB7h4aazpduD07QK1/uS7gOB9ccSCHikdXQxeV7GEtfAeFlX/22oUXvijIQggLR4O
	XUZw3xcVpMrGa9rHVP+weFnUobRbCyVjaaREtsKYnM9vV+6t1SwlAPrZVNxdoXWCjj3n
	23OiX8/7nrOJ9DbbG4mmxrqQdbMBz6mfelyhgTG7eGZXclFz+2uLjoUfz/sVQ+4FZNLN
	Glr91+l1MJGxNMBnyZnPkJOy4MH7cA6prEhLZapulxeUbkApUT0xPEVWnVyb+BwJZ3wT
	sVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=HeIgEyE0xjA/v1H5/2BLBfpnWhvzViqrEJKqIc3Vhxo=;
	b=K235HWKlhBYIfve000/NJE4WA2+3hyxxbmO5/5ZSmqdpCVqRTWsEerh2EXUFPfAu4q
	EmsNYOlOpEHeVxVi7sp9iOFAkR7UyXushWSWzXL+DYuYNkfLSKRd1fRITO969pFpH9Ms
	R3SRinTyZdyaUUJOXO3hMo5Rdy7WrTRcS+9nQs3ys/9XlBoizHGiIleI7IyhnuxVFhCL
	dxJOgjdPZ1IcEzGCg00kwN+imU58T/E+KIRvjK1rer1MMfa/xMzqBoaVQUKmRXVWrc5r
	pOki6hGxi/6NwKMiDYnG08j2RQRl1j8wgooN/susqB1jo8wBye64eGKVfG/D8UZPfhNP
	nFrw==
X-Gm-Message-State: AMke39nXWgdA54PFf0x2vnJQd/kD2vBGgmzvugweoZcZ+iyBxUHE5Iti6VzUzzqOqk8TjrdOLQThjOnMszs6HQ==
X-Received: by 10.31.212.135 with SMTP id l129mr12313049vkg.134.1487719245008; 
	Tue, 21 Feb 2017 15:20:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.72 with HTTP; Tue, 21 Feb 2017 15:20:44 -0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 22 Feb 2017 00:20:44 +0100
Message-ID: <CALbNGRQCTBqEUiByii0LFY7=Kw07KbBNn1fy+64zuF24+g-y-A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Task sequence question
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
X-List-Received-Date: Tue, 21 Feb 2017 23:20:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

after some fixing in meta-oe it seems I am able to build some
xfce-image again. Watching the tasks go by I noticed that do_rootfs is
running already while many recipes still do their do_package_qa. This
looks a bit odd to me. Not that I am happy about an early do_rootfs
but what would happen if do_package_qa fails? Isn't that a kind of
prerequisite for an image that do_package_qa passes for all packages
within this image?

Cheers

Andreas

