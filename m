Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4EWE-0002xd-RE
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 19:15:03 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 10:02:56 -0700
Received: by obceq6 with SMTP id eq6so1412330obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 10:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=q0W2xOAcq0We9NyN1wvEiugI/tdmuXclJ1lRazhRS3g=;
	b=DXZxTQBKaWb62P5kwZ78ulfYNj1IPmrttUh7ewRlKRVUtOPXx2AlnhQVk9dIVmDYCp
	r+5dvsLf4Mv4Ga4byFw/15icbCdzUL4ONWDEmREckHLfi+NaSGEUPG6Co6cwdmtR0/03
	FNwOIweQVO/HuKKL9PEA/8y6wkdY7kVjvKICNu2b9bdMZ0E7yUKxKhI1lTQ4a7FH2j1i
	WfsfCT+IbXu8OBhVBuksvxDGy52DuIRFCEHkgXezUFignEhBzL34YjcpOcDzC8VFNtNQ
	1vxPcUVCoUfqQWmUWlzNM1PoKQR3hsqaRYUfSHAcKUBGZlIu3KiN9tuFRq0tDtaF8j45
	8RaQ==
Received: by 10.60.6.73 with SMTP id y9mr16509691oey.17.1345654976125; Wed, 22
	Aug 2012 10:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 10:02:35 -0700 (PDT)
In-Reply-To: <2181864.aYcJgUzL39@helios>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LYvK_Nbj-ThQRNGQxh6P1wZqzPmm0pGNYNGnTucQEV1ng@mail.gmail.com>
	<CAJTo0Lbhir=VLZZfeqn4UakxTkiFyeXK+zKfCtH2GMgrZ5aBpw@mail.gmail.com>
	<2181864.aYcJgUzL39@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 18:02:35 +0100
Message-ID: <CAJTo0LZ1bx42KgF0rBEijbesV-rwnOMVRFpEyRPW0mGiKx7FpA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQng0cunmCeJhIdg7hl7oZ+Pl1mkb/E+ycfLPrIEEC1n/PcHyEqlz3EmqljDRjlfZvbluXmh
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 17:15:03 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2012 17:45, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 22 August 2012 17:39:45 Burton, Ross wrote:
>> On 22 August 2012 17:18, Burton, Ross <ross.burton@intel.com> wrote:
>> > -9892 ./usr/lib/libts-1.0.so.0.0.0
>> > +8344 ./usr/lib/libts-1.0.so.0.0.0
>> >
>> > Now *this* is weird.
>
> Nothing off the top of my head, but is there any difference in the tslib
> configure/compile logs?

There's only one configure/compile log in temp...  It's below X in the
stack so shouldn't have rebuilt.

Ross


