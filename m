Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc1SQ-0004sY-H1
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 00:43:06 +0200
Received: by mail-wi0-f180.google.com with SMTP id hn14so1098377wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 15:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=p+meqUUhpB11KImrCDX8CEbW9RJ8hoOdshrS13JlArk=;
	b=iDMbs8x41nnHnwl5d2wF+NikOk7iXi3n7+juGyFVrvP+xMQ1duPuUGrtyul1cTfJ9k
	xxWV5uKlgpE9BdMCR1GdoZ+HEj/dbUPi/XSzSsZkMunovjvFyvm9KzF3zIp7aiM+rkq7
	Sp/u+fvv5PWoxKqJtfhb5ZbNBnaVDvFVudCZSpiIzvB5NqBfnn47hfeek8jpLwUmxZL9
	JLsmdDIB/AeMqgRk0VnNQkrM2jLfaR6IxN9kHRKZtTLmAQC7q9p8a5ewd3OJ0ji1+lTo
	6rnZckxW4Wc2D5HwY1KhmW7G1l0fMKGMwArsqanG3uKmMwI10Gtp1ZkW8iI7M/n4rE70
	NnqQ==
MIME-Version: 1.0
X-Received: by 10.181.13.169 with SMTP id ez9mr509858wid.8.1368483892515; Mon,
	13 May 2013 15:24:52 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 15:24:52 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131729130.13480@oneiric>
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
	<alpine.DEB.2.02.1305131704540.13080@oneiric>
	<CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
	<alpine.DEB.2.02.1305131712570.13256@oneiric>
	<CAHUNapTaTrZ8A8zMiaAiqwYbZx09s096EHNDRCo0nOw5-EO8HA@mail.gmail.com>
	<alpine.DEB.2.02.1305131729130.13480@oneiric>
Date: Mon, 13 May 2013 18:24:52 -0400
Message-ID: <CAHUNapQWyJG0SXNk2gkucL_84BoxV7HO0w_De6CC6+5rYnGzzQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 22:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 5:30 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>  i'm confused ... why would you be building two versions of the
> kernel?

Maybe I just need to provide a PREFERRED_PROVIDER_virtual/kernel?


