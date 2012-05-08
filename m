Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRn39-0007yg-AY
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 18:14:07 +0200
Received: by eaae1 with SMTP id e1so1602963eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 09:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=atf9Zke8LHorPBHmP7mdETX9ATgqhC3iDpZdTHB0nmk=;
	b=TlYQ5Vx9eUFMnlZyIpXKcOsRTGei0a+FmBMMJxwfa4UaBQaC600b+3/fMdHjbHdTTU
	x32pLH0hEnrBPsTdr5byirGJRyFaKlnPFNzSO1WVZxqIjVHGI5gzODM4Tn4QG2Wb9AFY
	/jSHIRH9kgS2BkrAcCx7WXDW8KjhBjyMC6tCUyXZVeU4PWctkqByUkkXgxYbbsFkAEXp
	xiDC0JpQ7fh2ZZVFrEtEl5JM3tdTOzpCS5kaIq9X/fVI79WnCdQ90IwNHYO1Tf5meFUQ
	/6/OQ9yHeYTTl5jStrR+Vq1cjWSWmgUzSFFgEmv9Dm0yCuoTiaREbNXxA+to0uCB7avC
	XkvQ==
Received: by 10.14.149.129 with SMTP id x1mr3344620eej.108.1336493055785; Tue,
	08 May 2012 09:04:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 09:03:45 -0700 (PDT)
In-Reply-To: <CAMKF1sq_bMMFiGSJBBbnV0zckoAmkgnsj5jHeBw0M+jWbFYu4Q@mail.gmail.com>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
	<fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
	<1336055718.30113.125.camel@ted>
	<CAMKF1sqiSO9kz3-0fKV+XDpB8+v2+pph_rZgRb6xof3OSHjTWg@mail.gmail.com>
	<CABcZANm5muqfeq6hDnA-qUsMX+hof=BvdXA6THAnBvLCjUK5zA@mail.gmail.com>
	<CAMKF1sq_bMMFiGSJBBbnV0zckoAmkgnsj5jHeBw0M+jWbFYu4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 09:03:45 -0700
Message-ID: <CAMKF1spoXGCg1+TuKrP+ucbLyYtwJL+AcNko0rZOcCMrYNTefg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemux86-64, qemux86: Override XSERVER variable
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
X-List-Received-Date: Tue, 08 May 2012 16:14:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 10:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 3, 2012 at 9:47 AM, Chris Larson <clarson@kergoth.com> wrote:
>> ??= may be of use here (though I haven't looked at the files in
>> particular, it seems appropriate)
>
> I tried that and it started to build kdrive for qemuarm

I have now made it to use ??= which simplified  the patches I have updated
the pull request

http://git.openembedded.org/openembedded-core-contrib kraj/qemu-xserver-xorg

Please consider.


