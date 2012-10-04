Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1TJqA1-0000wD-22
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 20:28:37 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so561569lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=z9gclCvhyNQ8X4DNUyOW8sWR7x8IFU0L1v+qjA3jtvA=;
	b=M8nsppTQ5EFZG2QvI5YI8CdbdwDrEYMPKj3bJ4e78/8vDlyU/x8tJA87rT2zVHLYYJ
	wmy//xG3RembWmXRPaMYahDfGU1fZdEyT5KqgrwRc3zRGlUbCz/+zPbERTByFQbYyVzy
	LaPELJK5hLDdu3+DlmpxxaiiHe+ge9XR86VtUKZjoGhX094YoltXO3zG2rW1tSegHMEz
	lfXpMv2q9S8nHcBGtPuqyw14hJuKuMBM4NX1kdr1mCaZmZZlB0St8sZFF2+UVAVN6xyO
	UHoQjCyBokinLI0NzYjNFRNEmDRied4bNoEXGpTSuPDWxQog82NAx7FeBZvkBrT2tJCk
	uHyg==
MIME-Version: 1.0
Received: by 10.152.148.195 with SMTP id tu3mr4845288lab.16.1349374535888;
	Thu, 04 Oct 2012 11:15:35 -0700 (PDT)
Received: by 10.112.154.66 with HTTP; Thu, 4 Oct 2012 11:15:35 -0700 (PDT)
In-Reply-To: <506DCF4A.5020101@windriver.com>
References: <506DCF4A.5020101@windriver.com>
Date: Thu, 4 Oct 2012 14:15:35 -0400
Message-ID: <CAHUNapRUMPFYdV8YPjAz2Fw2NgvsXjXJ5gjUo358aRtA3mjdhg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Secondary Toolchain
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
X-List-Received-Date: Thu, 04 Oct 2012 18:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm curious to know if anyone (I certainly wouldn't be able to!) can
take a guess whether this would "play nicely" with external
toolchains?

In other words, if some recipe is already PROVIDES'ing
virtual/${TARGET_PREFIX}gcc etc would the correct toolchain be used
for the special packages needing the secondary toolchain?


