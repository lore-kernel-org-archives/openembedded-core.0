Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QoUqv-0007dG-Bv
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 08:22:49 +0200
Received: by wwi14 with SMTP id 14so3014316wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=R+3k2Bmepw4p3bpQyssoS5uYHewhHWYh2oIriG4R1Gs=;
	b=eM8MfNeAtqSjeQsSuHo5viMFK7Yg2N0uPtvMINnSVapgMw7S4T/pcvl7QuB5O4kwKX
	IrNVFNnNa9qGzM9zqjteOYYy+QFrLvcEmOgvi6EnqNCJN4DPSbDGvBzyFmlAIWBI3SNW
	NmiqxINUSKkiEYDqlBVMnialEpoz2T2L7OlXQ=
MIME-Version: 1.0
Received: by 10.227.207.206 with SMTP id fz14mr7980468wbb.76.1312352307308;
	Tue, 02 Aug 2011 23:18:27 -0700 (PDT)
Received: by 10.227.2.74 with HTTP; Tue, 2 Aug 2011 23:18:27 -0700 (PDT)
In-Reply-To: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
Date: Wed, 3 Aug 2011 08:18:27 +0200
Message-ID: <CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Aug 2011 06:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
well I never thought this would work out, but after adding "-o rw" to
the -append parameters the system started and the login prompt
appeared.

So this problem is solved, for completenes I append my used command
line to start qemu:

qemu-system-arm -M versatilepb -m 128 -kernel
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin -hda
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
-append "root=/dev/sda -o rw"

-- 
Regards
Samuel


