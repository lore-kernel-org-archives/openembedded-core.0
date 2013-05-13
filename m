Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Ubya7-0002NY-JY
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 21:38:53 +0200
Received: by mail-wi0-f174.google.com with SMTP id c10so1306462wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=j+cel02n2IdUYzD6C267UHESX9iQPaben9n6FxIT+aQ=;
	b=XMgAz1NkyhRK0rfOPyS3deNQi+DRc3VR47bRC+JTsBmcKqEk6cZVk0kaNLn+ceZYjO
	fUGhMReU3D0loHPatUU2Ofvmy1hDRX0n5fjmfrE6PdvVOfqLTq2Ca83jRJeEYL2Y1vwH
	+IqHHnLD15frmLeaE+H65+28UFpF47z5XkzkN/DhJw6oGJUNUOp9p5qRz5EWADV3l0lC
	iyl/3JUbhvE6v5ztM8xkC+Zx/boqwIJxhKeVSxomUOyEWgVQyjSP4akIcY/SGPEjmdP3
	rQkGvn/ehl+ppEygd36LaqZ2SL7R399Jc4MrhXvVvl19B+kSKZ25R9E6NzL7+L0bsr1k
	YSOA==
MIME-Version: 1.0
X-Received: by 10.180.20.148 with SMTP id n20mr21518130wie.8.1368472837629;
	Mon, 13 May 2013 12:20:37 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 12:20:37 -0700 (PDT)
In-Reply-To: <CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
Date: Mon, 13 May 2013 15:20:37 -0400
Message-ID: <CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 19:39:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

There's something else that's going on that is strange. When I do a
"qemumips" build from the master repositories and run it, the
qemu-system-mips that is used is the one built as part of OE (i.e. the
one from the build sysroot). But when I build and run the "qemumips64"
image using this branch, the runqemu script is using my computer's
native qemu-system-mips64.

Did I configure something incorrectly?


