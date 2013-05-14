Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc4pv-0007eT-KK
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:19:42 +0200
Received: by mail-wg0-f43.google.com with SMTP id c11so6953540wgh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 19:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9GP5r7NcY0z3ErPgrqT8yx7lwO4pHfA9pVvipMMI0BQ=;
	b=k1XlikTUG/sL/UDjbivyhEmmBK8aHzyLpcbMcNMLlbzqHGuBiXbo53N44CKChAEeKj
	k/L755VHhGBBa3KgZPtSNnFA4VXEZSQkHdTeSpekZuQLwLwMH7Iukxaqs1yCCgyWq9Nl
	q8tIcebd1zm2TqiN95j4zIT6v+pIo6eZTdM1WzAQzXHoaemF5tdxOp1rCm/SJurEC+Fe
	Ar/Iv6WtshHboFx9IcwJZKShIoEdtbAq4as1WWqsQRzjBeu+TwPIlCR6c9l8kkM8A8D/
	B8AVqcwP4AcmzfqNShjupb+ycVlw64eAJkptul8yphhOysdzKnIDEAEBdLgb2KOxxAps
	xTrw==
MIME-Version: 1.0
X-Received: by 10.180.37.133 with SMTP id y5mr1492186wij.20.1368496881329;
	Mon, 13 May 2013 19:01:21 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 19:01:21 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305132059460.25048@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
Date: Mon, 13 May 2013 22:01:21 -0400
Message-ID: <CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Tue, 14 May 2013 02:19:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

By adding:

    PREFERRED_VERSION_linux-yocto := "3.8%"

to my conf/local.conf I was able to get the image to build/use 3.8.11;
but I too am still seeing the kernel panic as described before (i.e.
in reset_counters()).


