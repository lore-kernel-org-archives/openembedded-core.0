Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUm2Y-0001Of-Hx
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:45:50 +0200
Received: by wgbdr1 with SMTP id dr1so1046301wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 14:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N0p61v6aKtxYqYAwV4XXgPk/5sg6bt9s3TYiBAWhts0=;
	b=Tr9WDR8+1IVhKqFabzDGmC+6OFO+dLJwViurOaIbvbsLkvkQeP2kYj7XAoJWEQxy6Y
	eSCQ5U4TOPCpGEimRMFSWLiSGCfdF+4g/YpcoFQRv7lYhuvog12+MEt/yJ/tyaKuo57W
	AEzPcXgF7mgLyFi4G0Km5t/5GWENh2LTMOH8G/T6t0puWkecqVh/z/aMdqqmO8TNi7Ob
	DtUwuRZvMeSag+AcWmRfIqYp/+e+rZxxFthpII+qFTJo90NL6lJELpuLR+42rS4a06EJ
	fSLvqY3DbXha7TqBDcXs1xvlXzayUbniP0XY6P57ZslVsRIp3Tzk6WvlJorWkaG1eU6A
	PH/Q==
Received: by 10.180.81.66 with SMTP id y2mr44338894wix.22.1337204120299; Wed,
	16 May 2012 14:35:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Wed, 16 May 2012 14:34:50 -0700 (PDT)
In-Reply-To: <CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 14:34:50 -0700
Message-ID: <CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:45:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 1:59 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>
> Have it in oe-core allow for inclusion of it with other test utilities
> and easier to use for Yocto people. Why do you object in have it
> there?

if it can be said that its very common piece then it could go into OE-Core
but if its just for usability choosing a proper non OE-Core layer is
the right thing


