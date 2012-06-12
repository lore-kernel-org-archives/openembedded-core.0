Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeRlZ-0008T0-6z
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:08:17 +0200
Received: by eaal1 with SMTP id l1so2380688eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6bSe8dClOcIOyGFOMdHbeie9eX2JFRC516qApR03fto=;
	b=yEbLZqxp0yJAC4h8xUCK5iFTHgW1MizHogo3zKzvIDg8t+neIdsPnaAFKLFJk7/vgm
	HzmxGSciLBA+A4p4YjrjVcZpOSe8yz3+ADA8CosNn9mW07hfR8CaYHKBCyaWqs/z39lK
	2BRejcUZzd9n0yOOOxkdhqrJmRnyMPj7TeRYXHOZn5TiWAoYqkJ6mXOUN1Nik3hnU984
	dYzcm/RFNTeq6FMxSxC8gj4MqDFRX15OofPP3dd2pQLcIcPflBCR7pbF873mSo8ee29z
	asoQUdF+QsYII17NtKl+Fb1MfgyMsidTjsIAA0IEmQNl3SWX/yc+YEILq7MX4BdcLPt2
	opKw==
Received: by 10.14.119.197 with SMTP id n45mr6654185eeh.180.1339509462278;
	Tue, 12 Jun 2012 06:57:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 12 Jun 2012 06:57:11 -0700 (PDT)
In-Reply-To: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2012 06:57:11 -0700
Message-ID: <CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fixup_perms failure on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 14:08:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> OSError: [Errno 1] Operation not permitted:
> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'

what is your host machine ? did you also update bitbake ?


