Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SEzVY-0002iK-CZ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 10:54:32 +0200
Received: by wera1 with SMTP id a1so2159080wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Uaxs8awifTLs/THFQVV6UtEGwYjNj1+K2bg/EURQ2T4=;
	b=LFQ2LbM0oY1x2QrPDxOrpcpij8v3OZtjveEsrDsd0cSuNjnATKcjI2UGguoImcSQGp
	QPbtIDk2LFknKc2dsnQIgFzOMMqh25ybx8CbqVpKfC4yaf4fX7kjJ1Nj3XjXIKtGm4gX
	joxnUGiSI5RkVNDTDrTsd2fYvYeVsOqjxrFt76bG1RNwa5wHHbUe7XeH5pBhxXfPZ6UC
	3/bzb+wohWPKKaLNxCot4GKxztmc6axE79t33DFJdvCKtZaIc4dqiPQh6jCAXa71jpHJ
	E2SLwS4N7qz6KGT2hI+kuSdEBuSHlc9/iQGHBMFZNtk2XcrwT8YbsDK6C5e+S2CE6/oz
	Yatg==
MIME-Version: 1.0
Received: by 10.180.101.136 with SMTP id fg8mr4220403wib.4.1333442723355; Tue,
	03 Apr 2012 01:45:23 -0700 (PDT)
Received: by 10.223.89.83 with HTTP; Tue, 3 Apr 2012 01:45:23 -0700 (PDT)
In-Reply-To: <CAGiJk9cA_NvrK9R_HrGFkTU853VBp3Ct3-j9nEQSZ00DTw2VLA@mail.gmail.com>
References: <CAGiJk9cA_NvrK9R_HrGFkTU853VBp3Ct3-j9nEQSZ00DTw2VLA@mail.gmail.com>
Date: Tue, 3 Apr 2012 10:45:23 +0200
Message-ID: <CAGiJk9djNRgipUj=6==L4A9muZ_cKO7GW5Gtuwa=j-5+K1vA2g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Odd behavior of docbook-xsl-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 08:54:32 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/3 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Hi,
> I just noticed that building docbook-xsl-native appended the following
> line to my user ~/.bashrc:
> . /work/oe-core/tmp-eglibc/work/x86_64-linux/docbook-xsl-native-1.76.1-r0/docbook-xsl-1.76.1/.profile.incl
>
> Has anyone else noticed this behavior?
>
> --
> Regards
> Samuel

My mistake, this recipe is not coming from the oe-core layer (like
other recipes)...

Sorry for the noise.


-- 
Regards
Samuel


