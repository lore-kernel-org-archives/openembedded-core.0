Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RChrl-0003Dl-MU
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 03:07:45 +0200
Received: by ywf7 with SMTP id 7so4613004ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Oct 2011 18:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qfPcOnylCbiojMx5M+w+Ted7qTbGSV3y9TekrAoc4uQ=;
	b=IyrFWLBNoUJ9vstWooXUfosjuFhacfV3gdVf6Uc4yFHg+uF/z/ecSOhEGDMZOh5pvo
	k4jUcNZdBV0IKq+hymCMzE1EORGv8eY73DQcuHymyyNBkd8KAowGE/pmphj77HeJzdnP
	VINB6BFt+CrVvCgzi3MlG6/ZBl249g9QGOFFk=
Received: by 10.68.28.4 with SMTP id x4mr25805310pbg.56.1318122126114; Sat, 08
	Oct 2011 18:02:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Sat, 8 Oct 2011 18:01:36 -0700 (PDT)
In-Reply-To: <4E907597.3090507@balister.org>
References: <4E907597.3090507@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Oct 2011 18:01:36 -0700
Message-ID: <CAMKF1soz1FCyCZwA2Oe14q2e=RrxVZmJ3iVjQ=-P+fUghRYP3g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils from meta-oe does build build
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
X-List-Received-Date: Sun, 09 Oct 2011 01:07:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 8, 2011 at 9:08 AM, Philip Balister <philip@balister.org> wrote:
> http://pastebin.com/M0Gw0Db2
>
> Basically, warnings are being treated as errors and the compile fails.

you might add  --disable-werror to EXTRA_OECONF
in meta-oe/recipes-devtools/binutils/binutils.inc

>
> Philip
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


