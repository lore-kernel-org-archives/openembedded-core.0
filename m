Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D13B783AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 14:41:59 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i12so71576pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8se3PxDhqYyyIUSvHOrwd1BkL37cCVJ0UndLHD/g0lY=;
	b=RPyQ/K8EHddgzMVjnQaL0H1rwhCFnrxjTmhfWcQ6aQZ9qMFcvk/CKlekTUL5CELyn7
	qenPoJbffPlMY801/BDkEsFGHMgOtUu/lc/yyunZY1/TXQm+Ue8WOVpEOmaagJpu5A+R
	tTjUdSqjlp9Onox5yyt2tnr2VZ12AggTps3iAzp6NK1zfFu3J3FpcqLOWfr6vPzShTtB
	us3GT8zn8ZvaHXH30OFWJXjVrkHQj/sPOiZxOsYZEe7nDD/s9iK/kRm1z8BoxEpuqXV2
	hbUo0dcwrSwPcJW+hyWhpUvdeS3tSH+x3J74FDM3a6heTRUF+OgnjUnrFHO0n7/6+Lyj
	jK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8se3PxDhqYyyIUSvHOrwd1BkL37cCVJ0UndLHD/g0lY=;
	b=LX1j9+j2Qk/N/sd0YkvSDcU0XMHjyw4cVxUH/vzYxKdBwjD1xD+PwhBxzLkOTeaj+T
	qJqreU1WVgDWjtFoSEC1oEn/xnZ8pMLKSQyTm1QTvm/S9PjY3ZyCmx8lZPKXxFcVhca5
	923FRnpH7RaD4yJWeTUg/Ozxybv0PzvXkmP7bfDY/NJdDOBZXJ7G6GrVC3uozOQ/M0jN
	d9+dEL1F6gYGVv13wh9vud+mI9bEAWtx5149kO0VqRN5L/NU7UhvR7vut2ldmRBEvGYs
	vpnY4bKWrDktQvEs402Ha/qnyYx20lzBNtJJtNDJCjpZcw1oNHC7Wrmv4yYiCn4DW2Ty
	xlCA==
X-Gm-Message-State: AHYfb5jCo8DzzZTBmmpFEZr3U5Y7tSxHPIG3q7FWDtYMFDDWk38SUbDa
	YXMu9I/56r55A3b8AQwVOEQ8xhVG6A==
X-Received: by 10.84.138.129 with SMTP id 1mr10236964plp.223.1503067320551;
	Fri, 18 Aug 2017 07:42:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 18 Aug 2017 07:41:29 -0700 (PDT)
In-Reply-To: <fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2017 07:41:29 -0700
Message-ID: <CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Aug 2017 14:41:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 18, 2017 at 3:53 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 08/18/2017 08:56 AM, Khem Raj wrote:
>
>> I was trying nodejs and it seems its also broken by this openssl
>> upgrade. Meta-oe alone has amost 50 recipes that are broken. there are
>> hundreds of other layers.
>> Many large packages in external layers are now broken, and the fact
>> that openssl10
>> is almost useless since some package will pull in openssl11 and cause
>> conflicts. This
>> is not a a good solution at least it seems to early for release. It
>> might take a bit for packages to get working with openssl11, We should
>> have carefully thought and considered postponing using it as default
>> until next release ( april 2018). Its fine to keep it in if needed but
>> keep openssl 1.0 as default preferred version, I don't think whole
>> ecosystem is ready for it and we don't have man power to fix
>> everything. This alone has a potential to make
>> October release quite weak as far as external layers are concerned
>
>
> FWIW, nodejs from meta-oe does build just fine with openssl10 dependency.

no it doesnt try building nodejs-native.

 So
> it's not exactly useless. And no one has established how many of the other
> 50 packages can be fixed by either doing that, or updating them to latest
> upstream releases.

Thats not going to solve everything. Neither does pointing to fedora patches.

>
> I'll send a patch that renames openssl10 recipe back to openssl and sets
> that as a preferred version, so anyone can experiment with 1.1 without
> widespread breakage.
>
> But at the start of next development cycle this will be reverted back; no
> more complaining then please, we have to do this at some point, and just
> after a new cycle has started is as good time as it gets.

Just putting random deadlines is not going to solve this, there has to
be some look
at upstream packages and other distros switching to openssl11 and
dropping openssl10
completely. People have fielded products to support and they need some
assurance of
forward path, their ecosystem might involve a lot larger package set
then just oe-core.

