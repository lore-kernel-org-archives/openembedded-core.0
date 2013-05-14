Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc568-0000oD-OQ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:36:19 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so3538013wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 19:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=VnTM2GlhM2GeLuRrWoHoBNUvUMEbCu40QUrxx7wi8/Q=;
	b=ijYTczRX6qnRbTb3im5D5DZjo//q/bqmHWkOv1ejncczW60rYCbIRdjBREDwy4qR8j
	QXKk2R8NKgNXjub7kf2YjMM0ed7z1ZiZw8Fi3fF7dQHDN6wHT4Q8dhSAIRwxEDxrLD5J
	QtXuyy57zhg7u7iV5A8FvRNwg0T3W+Lym+E1ysGksITqKHPBV5iZCTgPWO1NMndJpRaT
	Xn9BnCmBVDWJEY6xcQvD5V42Owhn23fUiWkkH3E6okiaWGDRkiq1AgkkVNZ2ug3YPgon
	RbMAIpDdtWeBtUGr4TQtfe1UPzomAG0MlJLELyHoOB46ZgNo4Ms4reYwRO+k67feOVhI
	xLrg==
MIME-Version: 1.0
X-Received: by 10.180.189.68 with SMTP id gg4mr1551973wic.27.1368497886226;
	Mon, 13 May 2013 19:18:06 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 19:18:06 -0700 (PDT)
In-Reply-To: <CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
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
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
Date: Mon, 13 May 2013 22:18:06 -0400
Message-ID: <CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 May 2013 02:36:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 10:03 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, May 13, 2013 at 10:01 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> By adding:
>>
>>     PREFERRED_VERSION_linux-yocto := "3.8%"
>
> Yep. This is what I was about to recommend, but did you apply Khem's patches, or
> use his contrib branch ?

His contrib branch:

Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "openSUSE-project-12.3"
TARGET_SYS        = "mips64-poky-linux"
MACHINE           = "qemumips64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20130514"
TUNE_FEATURES     = "n64 bigendian fpu-hard"
TARGET_FPU        = ""
meta-yocto        = "master:a9f5bf0ed398bf9cb861feaa8b6fefd8645b1d09"
meta              = "kraj/qemumips64:b0592ab08273e17cb1511384ad189281f88c8b03"


Are there patches to apply too?


