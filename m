Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>)
	id 1UW8Fk-0001zH-IF; Sat, 27 Apr 2013 18:45:37 +0200
Received: by mail-oa0-f52.google.com with SMTP id n12so4799611oag.39
	for <multiple recipients>; Sat, 27 Apr 2013 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=SM6Q7rY6fuh/71GHn1F2E49mk587/vxZGqL7sBnnd7g=;
	b=A3EJNFILwfLSxsvcwtzkX6vnfrW9X35GaPSJW6vqPXOMp59PtqcaBQiJsaC0a+EhEe
	8z7Ep+i6SQT+nQsUh9+bdWwy9sLrOjrrgYKLR9XFc2T5ek5zjujl7q5zez1qW0Etp92T
	mhot9xgBHUh21MkURbUGLi5TrX6z/ikIL8Q4pg9rDUmZsbdhT898V5PoR9jBws3XJVy+
	BTtDVJ2R05jpi3+xGqJv3WOJeSIvVuopg0zdydUW+HsqsQnuNHZUBfAbBaW+noIb6q02
	T7A08r4DtRj9sHWhdBYT5lkpIcYUdmFcSaegIM7gavgj2GbU+itjG93GeQRYH8Ge/oss
	Wz9A==
MIME-Version: 1.0
X-Received: by 10.60.142.230 with SMTP id rz6mr26288558oeb.22.1367080069242;
	Sat, 27 Apr 2013 09:27:49 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.2.72 with HTTP; Sat, 27 Apr 2013 09:27:49 -0700 (PDT)
In-Reply-To: <20130427113554.GC3199@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
	<20130427113554.GC3199@jama>
Date: Sat, 27 Apr 2013 17:27:49 +0100
X-Google-Sender-Auth: L4SppwoLZgMkl5s_kKJDJNWmoWQ
Message-ID: <CANyK_8ehcHZKvEeXAhqBUQ=7sPLu=i067ok9yEBCjF7A7ekqkw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Sat, 27 Apr 2013 16:45:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 April 2013 12:35, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I was hoping that people who care about them will step up and fix them
> to build at least in default configuration - that's why I started to
> send "state of bitbake world" emails.
>

Most of the patches I've sent so far have resulted from running
'bitbake world' and seeing what warnings/errors I get. For raspberrypi
my current BBMASK is:

/(rpi-first-run-wizard|qcanobserver|mesa-demos|packagegroup-core-tools|weston|gperftools|gst-plugins-gl|omxplayer|php|luajit|strongswan|mplayer2|net-snmp|openmotif|lzip|mg|vlc)

Though that includes a few fetch fails which might work now. My notes say:

# rpi-first-run-wizard: no provider for zenity
# qcanobserver: compile error
# soft66: warning: Includes host paths
# strongswan: fetch failure
# lzip: fetch failure
# mg: can't find term.h
# zram: warning: systemd unshipped files
# cloud9: warning: systemd unshipped files

I'll be adding more notes and taking another look over this, if
there's anything in particular that should definitely be working but
I've had to mask out, let me know and I'll give it another look.

(apologies for the noise due to gmail's big send button being so close
to the bottom of the edit window and needing no confirmation)

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


