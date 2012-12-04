Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Tfhv8-0001fk-9z; Tue, 04 Dec 2012 03:08:12 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so5462757ieb.34
	for <multiple recipients>; Mon, 03 Dec 2012 17:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=a9yC3c6FibgJmje1drtBkADTHiEmDr1gaO9QMQ728xo=;
	b=tyF/9g2O/EEjehsL66ZbejuPgsiHZ3FfGAF5f0EQ1olPqlTyom4KEDy9p9p1/pucOX
	NNnXNbxu/Fu++pMOGo/u2hSDzCsaNZtcUAaun/zC2aoUOyQS1VlcUMKza6tr7Ny1sgys
	4KCfYfVBdBy6FEiM1vGSd+hnkmdyHJpmM6MyId9AcBdNVJ12BtNrpPyJMOdOgdr9RzCc
	z1KI/fCJEHumkN+y3qHuq3lOq4tY9+TnATV9yclZWrkv25o2OicVySmHLc+quzvf2BTp
	Ei11iAH6fNsO5iFWRvjOodX5QUf20Zv0MqaqfDt6Bd6IP4L0Y03hBTLn/DiyWQ2M90br
	GFuQ==
MIME-Version: 1.0
Received: by 10.50.91.169 with SMTP id cf9mr1042139igb.44.1354585995559; Mon,
	03 Dec 2012 17:53:15 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.64.147.37 with HTTP; Mon, 3 Dec 2012 17:53:15 -0800 (PST)
Date: Mon, 3 Dec 2012 17:53:15 -0800
X-Google-Sender-Auth: WsUrVhi-Z-5Uo1x3etdesjsmhEU
Message-ID: <CA+YB3rb2gftzzJBNDGFgWki4U3=OTSGZXeQ9AAf_wNa3J7uC3w@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OpenEmbedded TSC Minutes 6 November 2012
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
X-List-Received-Date: Tue, 04 Dec 2012 02:08:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Attendees: Paul, Mark, Koen, Khem, Richard
Minutes taken by Richard

ELC-E presented an opportunity for a face to face meeting so there are
no irc logs.

The only topic we were asked to discuss was ntp. We agreed that creating
an ntp namespace for OE was a good idea for non-commercial use. We
agreed that either:

1) This should be commented out by default requiring a user to enable it
or
2) We should put in a licence flag that excludes the ntp recipe unless
the user explicitly agrees to it

which are ideas designed to stop people accidentally using the namespace
commercially.

Richard has taken the action to raise ntp with the Yocto Project as they
may wish to use their own namespace too.

Other topics raised:

We have some issues around overwriting of files in areas like the deploy
directory for allarch packages. These are not new issues but have been
there for a long time. New sanity checks are exposing them and there are
real world bugs these cause. It explains several "mystery" bug reports
we've seen over the past couple of years. This topic doesn't lend itself
to f2f discussion so we'll do it on the mailing list but the end result
may be some restrictions on when you can mark a package as allarch and
vice versa.

There was a lot of "misc" discussion about other aspects of the project
but nothing specific I want to capture in the notes. It was useful to
have the TSC face to face to discuss things for a change.

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


