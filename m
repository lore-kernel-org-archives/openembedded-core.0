Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ucj0h-0002D3-DP
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 23:13:30 +0200
Received: by mail-la0-f50.google.com with SMTP id ed20so2272617lab.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=4GMKgY2IsEFEZuTKAMguB8Wo329Y3b8kr1SdYNSTeN4=;
	b=MtM/PD4p//crm8dKJtk5WRrZIRo9d+gHwE+kCqeM7LEyi3nzCTzCMAYdaFCXPfIfOK
	fM+fF+4L1U56dmePUo1hm4639JryJHaxHzJo4Q4ddE0dfDZiF4I4S22db8Nz5FRlYe5L
	+pxBf9UQN90wFrk2pXtgW2hzrxuJMFzzMNNO1DTwzjKgSAGdK9kSYh519om29zOMMPAW
	QeiIdsgtZvnFh2s6hlHieW7WWSXdmzoU3m9XQfUFrIBHlM7j0Ez8QFSE4aCsAj02CYKq
	/ii5Fs8CFiVypFkihiZpL/KJXy02aUq1ZZTcYITQfq3MeP6DvBlMSiwnyGhJT6puR/ns
	7Hmw==
MIME-Version: 1.0
X-Received: by 10.152.45.33 with SMTP id j1mr33307lam.29.1368651305904; Wed,
	15 May 2013 13:55:05 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Wed, 15 May 2013 13:55:05 -0700 (PDT)
In-Reply-To: <CAHUNapSuTwy0sSDCXAmk6PEqVkqJzGsrLyPJL9VQCaN5gMbOOA@mail.gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
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
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
	<CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
	<CAHUNapSuTwy0sSDCXAmk6PEqVkqJzGsrLyPJL9VQCaN5gMbOOA@mail.gmail.com>
Date: Wed, 15 May 2013 16:55:05 -0400
Message-ID: <CADkTA4MpRM5Vw8iDL6gw9jMZ93Bu3Y6mGwy5JVx69pkkP2F06w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 May 2013 21:13:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 1:58 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Wed, May 15, 2013 at 1:24 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> You set the SRCREV that Khem sent. That was my 3.8.4. commit. The version
>> number in the directories is coming coming from the PV of the package, which you
>> didn't tweak.
>
> Ahh... yes. Thank you. Makes perfect sense now :-)

qemumips64 login: root
root@qemumips64:~# uname -a
Linux qemumips64 3.8.11-yocto-standard #1 PREEMPT Wed May 15 16:43:43
EDT 2013 mips64 GNU/Linux

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index b79fa4e..d458212 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -5,6 +5,7 @@ KBRANCH = "${KBRANCH_DEFAULT}"

 SRCREV_machine_qemuarm ?= "8fb1a478c9a05362e2e4e62fc30f5ef5d6c21f49"
 SRCREV_machine_qemumips  ?= "b8870f2b11f4c948ae90a19886335fa8b7fca487"
+SRCREV_machine_qemumips64  ?= "49041e56a3c4ff552bf9f8195809b8040e2e2723"
 SRCREV_machine_qemuppc ?= "e4c12f12e61a29b6605c4fcbcfd6dbe18bd7b4e4"
 SRCREV_machine_qemux86 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
 SRCREV_machine_qemux86-64 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"

-----------

Try a rebuild with that, works cleanly for me in oe-core. When I
enabled the board,
I neglected to pull in my SRCREV update.

Cheers,

Bruce

--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


