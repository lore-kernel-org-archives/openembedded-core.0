Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Sz94u-00010w-4N
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 18:25:48 +0200
Received: by qaat11 with SMTP id t11so868128qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=kdPVq96bfd3g4xkPCLBBJ/64K4fRc3hJCsBcdAlszHg=;
	b=Nm85r+AFtgjuPOw7MxyDIzRhvjIACtZDccu6Y4w+nkd/FWn7PDxl81N0lVMMPEZasR
	X9MNdmaFu2ebimcfB/NTT42zXy3xjQ+5VGnNS9VNcxvyggonRhdl9jpwJvLgupnd2LxY
	FO2/wkK/nQK9aNn2x+0Bc3PXoU64AfMbLIUfbKbY7lWM/dsy3sgrdm+pdPzLHz6njrPW
	ohPXIDIgtyfkIsKP5cr3p/ee/LilNlmea1bvl85kEg/7mNGF0kG0QCjjBf+JQ5F3BOfX
	CmkcryfRa3djSjK1gMRzZMXhoX+SxpHYXvPvKTy4FtCvAk5OMxuaWXgwqOI4NJVqW/LE
	C59w==
MIME-Version: 1.0
Received: by 10.50.95.225 with SMTP id dn1mr288069igb.58.1344442440094; Wed,
	08 Aug 2012 09:14:00 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Wed, 8 Aug 2012 09:14:00 -0700 (PDT)
Date: Wed, 8 Aug 2012 18:14:00 +0200
Message-ID: <CAGiJk9d7sCukgAiM=vdEJm3RKOP=6yqTW6HAGGiBb4oqBj0LqA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Qt test cases (was: Re: Replacing Web in Sato with Midori)
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
X-List-Received-Date: Wed, 08 Aug 2012 16:25:48 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/8 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Wednesday 08 August 2012 17:04:16 Samuel Stirtzel wrote:
>> > On Wednesday 08 August 2012 16:47:05 Koen Kooi wrote:
>> >> Op 8 aug. 2012, om 16:03 heeft Paul Eggleton
>> >> <paul.eggleton@linux.intel.com>>
>> > het volgende geschreven:
>>
>> > And? KDE is far more demanding upon Qt than most Qt-based applications. We
>> > had to make specific changes to our Qt recipes just to accommodate it.
>>
>> If you're talking about adding accessibility and session management to
>> configure -> these are set by default by Qt.
>> Don't know why they where unset in oe-core though.
>
> Not specifically, I was mainly referring to changes such as providing qt4-
> native; we did not need to do that before.

While this is true, meta-kde is also the only layer using qt-mobility (AFAIK).
So you implicitly want to say that Koen is right because _there are no
other testcases_ for these recipes.

Or do I get you wrong?

>
> Cheers,
> Paul



-- 
Regards
Samuel


