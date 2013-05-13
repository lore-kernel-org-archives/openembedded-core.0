Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc0IB-0006eV-CO
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:28:28 +0200
Received: by mail-we0-f175.google.com with SMTP id p57so6755918wes.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XQWr8SDT4Xkr4yCBfSvriIT9tA2Nj9Lhg0pBMN6GyCg=;
	b=Fv3mUizbrkpZ0S+ZxtUjf5ryEDlk8ly145HMSn+LICWlYyMIojCoPZBZWmrGXn2IS6
	4ywybWFXZ83+7B3WU68EyjjsVpH0B3atVq1m7EEt3U7kYq4ztRh2Gc1kYme4CLfUjZxq
	Z1t8FYR4/+egkjPvjnTXDG9hoZJEO9B2m2j1BzcBL/IxYvW1VNXS7ytnMKPPTEcOnJEn
	fzvNkAbcnSCFuNOAEavWTgIdnhPA/ybJfcajQNR+5cvL8TTDylgEqa3A4HPLMMC/NGL5
	+iMeqs8qJbJUI7elizpxJWZpdzsaA/zWK8BjDqMP5ejP1YiJDLlT0itn0PPHfS9aQJ0h
	aeTg==
MIME-Version: 1.0
X-Received: by 10.180.39.137 with SMTP id p9mr12187385wik.27.1368479412878;
	Mon, 13 May 2013 14:10:12 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 14:10:12 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131704540.13080@oneiric>
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
Date: Mon, 13 May 2013 17:10:12 -0400
Message-ID: <CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 21:28:30 -0000
Content-Type: multipart/alternative; boundary=001a11c365724981fb04dc9ff1ea

--001a11c365724981fb04dc9ff1ea
Content-Type: text/plain; charset=ISO-8859-1

Bruce, you said you were building 3.8.11, but I'm not. When I run my image,
my banner includes:

Linux version 3.4.43-yocto-standard (trevor@zzz) (gcc version 4.7.2 (GCC) )
#1 PREEMPT Mon May 13 12:14:42 EDT 2013

--001a11c365724981fb04dc9ff1ea
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">Bruce, you said you were building 3.8.11, but I&#39;m not. When I run my image, my banner includes:<div><br></div><div>Linux version 3.4.43-yocto-standard (trevor@zzz) (gcc version 4.7.2 (GCC) ) #1 PREEMPT Mon May 13 12:14:42 EDT 2013</div>
</div>

--001a11c365724981fb04dc9ff1ea--
