Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UbyOw-0001S8-QV
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 21:27:15 +0200
Received: by mail-we0-f176.google.com with SMTP id p60so6427182wes.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9YlImbzw9n+BZC0PxrB7G2Jx/whERkLDW1Lw0ZVmdwQ=;
	b=fK1Fbzr0QnMisHyDgYBtr+tkx/hpU0bQR/4wkrGlA6+nX0aHov8Q+4Z9qnCDz/P6aQ
	zYOBCgqm8u/15ULBv3lAg6oFROFIPDvHfCPwnkR0giPVqA2ABb2CM0myBTFxaMNHsiDw
	oh2vT6VLDq42bXEHlM1G7m9d1F5PDfbkZREBylxHi2po3omWOubdyn//DcUE8G1L+y07
	b5RhVorl91bZCSx8fcq7/a/hqJceIPAOB0q8AMj3iA1WIxr330J3SzJcDW9OInCQPeq/
	sRijuHsnAsbhmihX5GIorRBnkXR3076gMKOto6prNRR/Tib6nmw7uMFIrkwWQ66aiQGo
	sX8A==
MIME-Version: 1.0
X-Received: by 10.180.20.148 with SMTP id n20mr21423280wie.8.1368472141183;
	Mon, 13 May 2013 12:09:01 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 12:09:01 -0700 (PDT)
In-Reply-To: <37DAA5BB-07D8-4B84-8304-C870036694FC@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<37DAA5BB-07D8-4B84-8304-C870036694FC@gmail.com>
Date: Mon, 13 May 2013 15:09:01 -0400
Message-ID: <CAHUNapTu0zviNoc9G_xoPuZAvZiRVRG4atsALwc60ev-Gy-oLg@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 19:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 3:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> you must be using systemd. I am seeing same failure with systemd but only when my build host is archlinux

Are you referring to the build host or target? My build host is
openSuSE 12.3 which does use systemd. For the target I'm just building
core-image-minimal which, as is my understanding, uses sysvinit by
default (i.e. I'm not doing anything explicit (that I'm aware) to
request systemd in my target).


