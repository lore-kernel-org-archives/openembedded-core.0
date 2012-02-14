Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RxKON-0000xc-SZ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 16:34:07 +0100
Received: by wibhq7 with SMTP id hq7so69210wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 07:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dLsb8+6wHnhJBB9dqiKc4OSoDo0V/XRNemYt0DptuAU=;
	b=j7NW+D4L1ggLdCEDKmcdj2cuqhtaAypsbRKmNMYCzH9LvOrFLS57clhBdCfPWXno/D
	dPdnseXb1XEvp1j0tdjnsUuFMnCvnZpmwISImF+TL3syi8CM6vUQRkRk5Sj2WdnsiTm4
	9/dIPkSGrc49iZrxn9uPZNGEuLnQfln++923U=
MIME-Version: 1.0
Received: by 10.180.96.8 with SMTP id do8mr4010697wib.21.1329233157396; Tue,
	14 Feb 2012 07:25:57 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Tue, 14 Feb 2012 07:25:57 -0800 (PST)
In-Reply-To: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
References: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
Date: Tue, 14 Feb 2012 16:25:57 +0100
Message-ID: <CAGiJk9cdvWsCRUoyjwfcquioOQmoou-RoDTz8J9rGckMsrbZfA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Eglibc related / libm issue
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
X-List-Received-Date: Tue, 14 Feb 2012 15:34:08 -0000
Content-Type: text/plain; charset=UTF-8

Copy & paste isn't really my thing...

2012/2/14 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Hi,
> currently building dependency depencies of Plasma Active dependency
> dependencies (this sentence may contain slight ironic content).
>
> One of the libraries wants the math.h library libm.
> Libm exists in my rootfs under /lib/libm-2.12.2.so, at /lib/libm.so.6
> the symlink that points to it and the other link at /usr/lib/libm.so.
> But for some reason configure can't find it and quits with this error:
>
> ac_cv_header_math_h=yes
> ...
> configure:14858: checking for ceil, floor and round in default libs
> configure:14900: checking for ceil, floor and round with -lm
> configure:14943: error: Could not find ceil, floor, round in default
> libs or with -lm
>
>
> Anyone knows what causes this, or how it could be resolved?
> --
> Regards
> Samuel



-- 
Regards
Samuel


