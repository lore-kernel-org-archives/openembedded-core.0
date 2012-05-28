Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZ0Tr-000836-Q3
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:59:32 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 28 May 2012 06:48:08 -0700
Received: by qcmv28 with SMTP id v28so1440057qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 06:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=kTkivZmS+aKg+KloQIeWBA6zMuGXlmm7CohUbVhZE1I=;
	b=M/5OkwXJSgCO0xMovuZJZXWcZYOgylv2zKnCcPYny3PHWba2Qr31nNBtX9FRXSVbAF
	DeS+MaaDJ1GCtmDTurBmZZnnlzmpafCvr1+1tLN0BKZw3X2LJT0ytwhZ7psPs97HVcsX
	5dbfaBwZffe+A8LcVgO5A/seJpAyjgfg6hRK0MqI7dCMkm4guOOwEVF7yn4aGTZousqO
	ag0RUwhoQfX0576WyHPZqb6KEkRE8DWY3MRr6KfiIcdiZbjzt6UbpLOiZzFxY1Nn8MRP
	FkkiGhfXfSeJgRoicCLFVL9roOKYerOJ0FNzxJJsSHo7XklmigaT639gQepN6+dDrW35
	uwSg==
Received: by 10.224.44.136 with SMTP id a8mr8359791qaf.34.1338212887107; Mon,
	28 May 2012 06:48:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.162.12 with HTTP; Mon, 28 May 2012 06:47:46 -0700 (PDT)
In-Reply-To: <1338212677.20169.75.camel@ted>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>
	<1338212677.20169.75.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 May 2012 14:47:46 +0100
Message-ID: <CAJTo0LZH4W=kkUtOHowG9F4E0QG-NH00NNZoSd4N3buAoRwTTQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk5wtV6OiqhFgfuEKpaHm20qcE6SxZpVMRvXHxCQqsJvURp2VDFOHpZGK0gF1/2csOIYqmJ
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 28 May 2012 13:59:32 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2012 14:44, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> Is there a good reason why these shouldn't be always ran when building dbus?
>
> Well, we're cross compiling so it depends how they're written and
> whether they can run in a cross environment. We've also taken steps to
> reduce our build time so if these need something like perl or python,
> adding those into the dependency chain is problematic.
>
> I'm open to ideas here but so far they've not been useful so are likely
> disabled.

I guess the overhead of setting up a qemu just to run the tests is a
bit excessive. :)

Ross


