Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QoyWb-0001oc-0r
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:03:49 +0200
Received: by wyg30 with SMTP id 30so1457170wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MxnuVffXFEYohGvbunMWSFjGQ5i1wVHieQQhjQGHqk0=;
	b=ZyCZISPSl5+xgtSY4Grayl5rrt2yEx7EGy71tpghKk/2A2Tu5YBBZJ+gibrZ0DY4l4
	oYSKGC062U4zztSmhHcf2jpUPGrKMGeUrDxi0Zj6EFHZCk/LvIdZ2h6YRvIi/HQSULNA
	HQpi+kanSbEfvhjcfDpjNiOj1ffywmwpaofyM=
MIME-Version: 1.0
Received: by 10.227.11.82 with SMTP id s18mr752709wbs.76.1312466365282; Thu,
	04 Aug 2011 06:59:25 -0700 (PDT)
Received: by 10.227.2.74 with HTTP; Thu, 4 Aug 2011 06:59:25 -0700 (PDT)
In-Reply-To: <CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
	<CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
Date: Thu, 4 Aug 2011 15:59:25 +0200
Message-ID: <CAGiJk9dRGyMOEJuo8wFxysptbOm0nf9c09P+i=tyfWPaD8MFAA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error running QEMU with oe-core / angstrom console-image, hwclock: can't open '/dev/misc/rtc' : No such file or directory
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
X-List-Received-Date: Thu, 04 Aug 2011 14:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
if anyone might be interested, after a code review I have redone parts
of the scripts.
They should be much more readable now and the user can pass more
parameters (like kernel image, root filesystem, memory and parameters
to qemu), however this still might not work on every machine.

This scripts are not a replacement for runqemu, they where just
created because runqemu does not work on my machine.
Normal users would probably do better if they use runqemu (I've tried
it like it is described here
http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-angstrom-for-qemu/
and like Khem hinted in his mail but it didn't won't work for me)

In the future I might update this script and to make things more
comfortable you can allways view the latest version, without
downloading any files, on the pastebin account I created solely for
this purpose:
http://pastebin.com/u/SkipIfEqual

This scripts where tested on ubuntu inside a network with a DHCP and
work fine for me (can connect from host to guest (QEMU) and vice
versa, from the host to the internet and from the guest to the
internet).

Regards
Samuel


