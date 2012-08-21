Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3vhR-0000im-3g
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 23:09:21 +0200
Received: by eaad12 with SMTP id d12so71691eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vDoijnr4Zm+82tfz5eZALI6UupRS4FtG+NbWAOidFLE=;
	b=zwuoEtJI6vcSLWWVVvu0QRWWmCdUdCrd9/9vGU0P/kVNNrqMVDo6weZaNtqNmSl3km
	lyID8j1xpmP5VangGRyA7jpgG029BpIdX5qI2hWfkLz//U5cw4fvfUF0jbMDyMpLX1Uy
	Ed6dSaJFhDlaRxCgkJPJpmkNVx+ryTxqr8O5cbdfxgjPlJMDefVMkDZTQN5Q1kxpAO/L
	hiojLk6U6Sv8Bw7LurZb95hGUTkI86GLWlaiLQ1735+YsrJMP7pfz+C3KAd2VvcYTI8S
	gi7uHxMYY9CI9xGcNBX2fYG0QViallgxXkjaOZjqRH4YaghoOJdYv1P12t5BRsH1QbPB
	gISg==
Received: by 10.14.220.70 with SMTP id n46mr15471000eep.42.1345582637018; Tue,
	21 Aug 2012 13:57:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 13:56:46 -0700 (PDT)
In-Reply-To: <5033E14B.4020003@linux.intel.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
	<1345222136-24839-2-git-send-email-trini@ti.com>
	<502F01FB.1020303@linux.intel.com>
	<20120820175702.GA9706@bill-the-cat> <5033E14B.4020003@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 13:56:46 -0700
Message-ID: <CAMKF1srDS6YByrYxsZdt6=8BCakQ9Dp1+i1TdzqNFMRHFWO2dA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] u-boot-fw-utils: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 21 Aug 2012 21:09:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 12:28 PM, Saul Wold <sgw@linux.intel.com> wrote:
> HOSTCFLAGS="${CFLAGS}

needs a closing quote


