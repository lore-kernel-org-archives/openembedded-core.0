Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Uc4sC-00081G-Pg
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:21:58 +0200
Received: by mail-lb0-f175.google.com with SMTP id v10so68052lbd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 19:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=FNdejYXQPVlg1GxhPqYZwLcKXucDkA57CdKBDivz0jM=;
	b=mAWA8gCD3ho8hlSSMn1kqZV94U2pdQjsneBKfCGq6yS5dxsg0btpvsaV1N0VAi93Wg
	6NXGvLLJz+QBF08zA287i/T+JeKjUEAz6cip0nozWVWDvw2w+Q4FrUiRW5LQu7QFcTx3
	yLFFadSeofx/CKvBxEu8f0/5/ClGSiV9QyxJsJ+JDaS54h7TP+QaPV6XmLMUvDiuU1M1
	GOLSJGWDf/atKj+hj6eCfjiiPdIN1JJygH+AU8W4pJvu9WStnbsfbUHZ1xGlK4TjyUSY
	oyUP1NcYrWZgNY4FS7ls4l6mDDCdyCzT6jy6PzoxU2E7aXWAHsBNJrlCJJWNPxSbN889
	88BQ==
MIME-Version: 1.0
X-Received: by 10.152.19.98 with SMTP id d2mr843007lae.19.1368497022052; Mon,
	13 May 2013 19:03:42 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Mon, 13 May 2013 19:03:41 -0700 (PDT)
In-Reply-To: <CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
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
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
Date: Mon, 13 May 2013 22:03:41 -0400
Message-ID: <CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
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
X-List-Received-Date: Tue, 14 May 2013 02:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 10:01 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> By adding:
>
>     PREFERRED_VERSION_linux-yocto := "3.8%"

Yep. This is what I was about to recommend, but did you apply Khem's patches, or
use his contrib branch ? The 3.4 kernel has no compatibility with
qemumips64, so it
should have never built, and you shouldn't have needed the version set.

Bruce

>
> to my conf/local.conf I was able to get the image to build/use 3.8.11;
> but I too am still seeing the kernel panic as described before (i.e.
> in reset_counters()).



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


