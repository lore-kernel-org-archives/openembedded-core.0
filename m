Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc1rY-0007Pb-RC
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 01:09:06 +0200
Received: by mail-wi0-f174.google.com with SMTP id c10so1458714wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=PnnX5V5y5n/BY22jouvNIEZ8W6s5RH3JHvC7A+FLmZo=;
	b=nBcQ+wHYdKYQeKFa1zSbSfdI98ES6F82ioYGck/JRGLBnAdBBUofZ2PEERu2aSEoSW
	wkopB007HFC4tE9fUFfIQpsSkbK+nlT00YVHBgeY/nH0OE/3khRfQdRNTdvYIyDg7jRD
	6hDr8CXLmW3RsuBKr6aV6rNgOA2+u79f1lBw7cNVT+LOiVT+RmWSP8dkfITAB+WYrI48
	UuLKNrgYz2re1t8/MPeF9Xv1WANqdn7sIFctIjDZeEMbcNV8ova5oc/VziypKzk827l8
	5NtlsACcBwj7dg0X0AjE5ika25RIvaHbFZSgDaaH+e+y8hG/XdiARvuD9XS9i1Wtcsra
	3sSg==
MIME-Version: 1.0
X-Received: by 10.180.21.242 with SMTP id y18mr642609wie.7.1368485450367; Mon,
	13 May 2013 15:50:50 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 15:50:50 -0700 (PDT)
In-Reply-To: <A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
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
Date: Mon, 13 May 2013 18:50:50 -0400
Message-ID: <CAHUNapRxc1m3fF10sFm2kXHSw=isw1cNbdK5e-2w7v99zsFZ5g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 23:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 6:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> sysroots/x86_64-linux/usr/bin/mips64-angstrom-linux/mips64-angstrom-linux-gcc -v

angstrom??!

angstrom -> poky?

sysroots/x86_64-linux/usr/bin/mips64-poky-linux/mips64-poky-linux-gcc --version
mips64-poky-linux-gcc (GCC) 4.7.2
Copyright (C) 2012 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


