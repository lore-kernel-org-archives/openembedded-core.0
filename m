Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1SmJyL-00046k-RH; Wed, 04 Jul 2012 09:26:01 +0200
Received: by eekd49 with SMTP id d49so2763393eek.6
	for <multiple recipients>; Wed, 04 Jul 2012 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Y+LLB+KZ4YXJ89NJDlc/nX8V9NHX3fmLKreCYKNXNIw=;
	b=Cwc/E8rm+4CuTKWaUo/djI/K/mLgTLRjM8etx2F7LbRylZdkWPWn8BWAKhWVWjoTaM
	Mp8U7X25cpKhKPCYvEMsk2K1sGcqtxM902IERLdaxlinIRI8HLZwBfNe3jIPkEb9auSN
	HaHKWTqbuEjMaPLRrs/OqZCf9r9h1wD8DolkTITftfRtW6hi3yx1jAFsRxyFbXq9b++k
	Rfkys15FI3/FGFAFJhbCos0yInMpZ+CH6iFcYiRnZYjJmJ/p9hj3DUPrfK9qqBIcf8zG
	BjuImBoSJ160GpkVWdDlGTdUcg7pY5zuBbCen0Wo8Lw6MYJviV3zYJ6ekBKZ1+jNO3XW
	VogQ==
Received: by 10.14.53.4 with SMTP id f4mr5116203eec.93.1341386099214; Wed, 04
	Jul 2012 00:14:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Wed, 4 Jul 2012 00:14:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jul 2012 00:14:29 -0700
Message-ID: <CAMKF1spU53TcfLHif3CUzrHKqJTT1uBqBqsZAn-zfaBOBecMtw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: eglibc 2.16
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
X-List-Received-Date: Wed, 04 Jul 2012 07:26:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I have pushed a contrib branch with eglibc 2.16 here

http://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16

and I would like some hands in testing it out. I have so far tested
core-image-minimal and core-image-sato on all architectures
they build and boot fine. There are changes in eglibc which may need
tweaking some apps especially if its using gnulib. So give it shot and
let me know if you find issues

All you need is pull this branch into your sandbox and then set

EGLIBCVERSION = "2.16" in your local.conf if using angstrom then add
ANGSTROM_EGLIBC_VERSION = "2.16" to local.conf

Thanks

-Khem


