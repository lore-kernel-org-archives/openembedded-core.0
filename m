Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T0Qwp-0002iW-RE
	for openembedded-core@linuxtogo.org; Sun, 12 Aug 2012 07:42:47 +0200
Received: by eaak14 with SMTP id k14so721274eaa.37
	for <openembedded-core@linuxtogo.org>;
	Sat, 11 Aug 2012 22:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5f4GjVPSfTGohl3XLIDwtbn27WFBPgoRukHdmUFrQck=;
	b=mHOVj607ekmIUZwI2+SSMWbwSc1g0hebX7SKIAGL7IYffVTDIivmPTh9SJDOwXwJoz
	OPw4mNcafj2BiBzQTvXgXAwFP5KRi5SPXXKbvSCciW6bW1Bnq+eSIr3VTXnMI0fiFv/U
	djrCONyPkr8DfOMIqa7/BBv9JfO2IsQbVNWWJRaJxzMJ0y2c4OgHqhS7w4ldEiizEXaU
	V+qKL9BHU9BKcV4r1O8xKfXnV9yTmf4dRZdClBst+EEw96yoSTp54Clcvy9kDV0rM/Q8
	J2uXDnE0RtuzdsY4XAxHZR+I/UGAdXGxgv2hkK1oeQy7naZpZsqwVA0uy3DONG+JVnhu
	9fBw==
Received: by 10.14.206.201 with SMTP id l49mr5807397eeo.3.1344749456076; Sat,
	11 Aug 2012 22:30:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.225.6 with HTTP; Sat, 11 Aug 2012 22:30:25 -0700 (PDT)
In-Reply-To: <20120811080416.GA3258@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120809131016.GA3273@jama.jama.net>
	<CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
	<20120809145732.GD3273@jama.jama.net>
	<20120811080416.GA3258@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Aug 2012 22:30:25 -0700
Message-ID: <CAMKF1sqDmRKA=eaTbZesfDFd9axJXUbHDR-7b-0vpF1SMu9RSw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@linuxtogo.org
Subject: Re: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Sun, 12 Aug 2012 05:42:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 11, 2012 at 1:04 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> | === If you get failures below, please file a bug describing the error
> | === and your environment (compiler and linker versions), and use
> | === --disable-elf-hack until this is fixed.
> | ===
> | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r2/mozilla-release/build/unix/elfhack/elfhack -b test.so
> | test.so: terminate called after throwing an instance of 'std::runtime_error'
> |   what():  Unsupported relocation type
> | make[7]: *** [test.so] Aborted (core dumped)
> | make[7]: Leaving directory `/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r2/mozilla-release/build/unix/elfhack'

it might be you are seeing same bug in elfhack as described here

https://bugzilla.mozilla.org/show_bug.cgi?id=632920


