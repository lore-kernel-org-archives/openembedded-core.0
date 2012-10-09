Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1TLdxK-0000oL-C5
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 19:50:58 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so4953083pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=sUrf255lTGEeyltmarb2WH5D1273tiFmPRjDe4FHaUI=;
	b=q6O06hl2juBm+BvzBQzV+QFN+zMNwq7hi7R+GoMw/bthqmFvG58OX+elfXyyUN9zfw
	XS21G4tHXXx1HsY5YA5ODDvv8Tht94BLkTCKKUhTD2hGNXk8WmHdoUUP6ZHH1RqMHRD2
	wEOeKuJEXO18zxX3/ZV1ojmXMvUYLaLhjzF2vcZSR8NGKkZSY5F9gT0Uy/w+a/zx5rB6
	upIe4RQ4a/HECW5SdVpfnl+NCXvF8NSSO81C2hPyVkNIjqBDyAicbiWomzsHR4jZ9XRz
	5gMF3pnndvj7A2/nYCVqR9ivKmyawbK2R9PFppL6k4SlFU0wCv7VO8JHsJmgPTVHSg9/
	RoqQ==
Received: by 10.68.131.35 with SMTP id oj3mr55735765pbb.128.1349804269838;
	Tue, 09 Oct 2012 10:37:49 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.112])
	by mx.google.com with ESMTPS id oe5sm12703674pbb.8.2012.10.09.10.37.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 10:37:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1283)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <F90052C7-AE0C-49EE-9471-29C8618432DD@gmail.com>
Date: Tue, 9 Oct 2012 21:37:42 +0400
Message-Id: <518EE65C-BC64-4BB4-A4ED-3C9BD3C0E017@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
	<CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
	<F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
	<CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
	<F90052C7-AE0C-49EE-9471-29C8618432DD@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1283)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 17:50:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Oct 9, 2012, at 5:48 PM, Elvis Dowson wrote:

> So, now I've got gcc-4.5.4 working with eglibc-2.13, upto the point =
where the kconfig infrastructure was added.
>=20
> Next, to add the kconfig infrastructure to eglibc-2.13, and fast =
forward to the tip of the poky master branch, and
> see if things are still ok, with the PowerPC440.

Good news, I was able to get the backported patches for gcc-4.5.4 and =
eglibc-2.13 working with the latest poky and meta-openembedded master =
branch commits. This includes the gcc toolchain rework and the kconfig =
support to eglibc.

Let me now try to switch to gcc-4.7.2 and eglibc-2.16, and see if things =
work. I noticed that there was a recent patch to fix a core-image.bb =
class, that prevented root login if debug tweaks was enabled. Perhaps =
that is why I didn't see the boot prompt on the target console with the =
recent gcc versions?

Best regards,

Elvis Dowson=


