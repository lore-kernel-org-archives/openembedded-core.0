Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RzqOp-0004xU-GI
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 15:08:59 +0100
Received: by pbcum15 with SMTP id um15so1696026pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 06:00:39 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.241.39 as permitted sender) client-ip=10.68.241.39; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.241.39 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.241.39])
	by 10.68.241.39 with SMTP id wf7mr75062784pbc.128.1329832839058
	(num_hops = 1); Tue, 21 Feb 2012 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=e/pv3IU3L5+3y/sJi4xVk7l6N0T7AXBP5E1LGGXms3U=;
	b=ZeCq6EFiBorOISVEvWMprjNnPtQhKlBvNPcf9kAKpbbgGI4u8zH2+Vqy0Eh3Av0UXE
	a9k7o9EPhKAUWqaVVGbXyGIjaZ2LvOj6erCr/GU5GRMYOy/1CtLUsr/E2ypbrIUiUb/4
	vZ3ShqJyR6GPxs30kW4Bb6j2K2Ut7pwv+v1PI=
MIME-Version: 1.0
Received: by 10.68.241.39 with SMTP id wf7mr61961866pbc.128.1329832838951;
	Tue, 21 Feb 2012 06:00:38 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Tue, 21 Feb 2012 06:00:38 -0800 (PST)
In-Reply-To: <A3766F63-815A-4152-8E80-A9D8D742C947@dominion.thruhere.net>
References: <A3766F63-815A-4152-8E80-A9D8D742C947@dominion.thruhere.net>
Date: Tue, 21 Feb 2012 15:00:38 +0100
Message-ID: <CAAQYJAv++Om6Mi4MwdzpVjE8oEQ7abrrs3=LMey8uon77L4Yeg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fri2-noemgd build breakage with extra layers enabled
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
X-List-Received-Date: Tue, 21 Feb 2012 14:08:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 1:18 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> [posting this to oe-core since it involves a ton of non-'yocto' layers]
>
> Hi,
>
> I tried to build systemd-image for fri2-noemgd yesterday and the build fa=
iled in kexectools-klibc:
>
> NOTE: package kexec-tools-klibc-2.0.2-r4.0: task do_fetch: Started
> ERROR: Function failed: Fetcher failure for URL: 'file://pass-ld-options-=
through-gcc.patch'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_2010=
_x-eglibc/work/core2-angstrom-linux/kexec-tools-klibc-2.0.2-r4.0/temp/log.d=
o_fetch.30663
> Log data follows:| DEBUG: Trying PREMIRRORS
> | DEBUG: Trying Upstream
> | ERROR: Function failed: Fetcher failure for URL: 'file://pass-ld-option=
s-through-gcc.patch'. Unable to fetch URL from any source.
> NOTE: package kexec-tools-klibc-2.0.2-r4.0: task do_fetch: Failed
> ERROR: Task 2253 (/OE/tentacle/sources/meta-nslu2/recipes-kernel/kexec-to=
ols/kexec-tools-klibc_2.0.2.bb, do_fetch) failed with exit code '1'
>
> removing meta-nslu2 fixed it. Rerunning the build made it fail in a recip=
e from meta-handhelds. Removing that layer got the build going again. Does =
anyone have a clue why those layers would break fri2-noemgd builds? The oe-=
core qemu and meta-ti machines build fine.

The meta-nslu2 layers needs another cleaning after "kexec-tools: Remove ".
Khem, please remove klibc.bbclass as well.
Thanks

Andrea

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


