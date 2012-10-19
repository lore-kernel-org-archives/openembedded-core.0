Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TPI3v-0004PH-7Q
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 21:16:51 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so507736lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 12:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=uF+PE8foaQkkInqqOxG2f90UMnFksW8yp9Z36tLh8oc=;
	b=O5A2a04Ir2fAV2N0RR4c82MKg5P3wJyeQuThYTwFCmq3bAfpZYp0EsNgeLX8XSM7zT
	duqz2JQxyj+TRP2qL0yVNBgRE6XoeAqnp7hGlbc1aoHV8Utr7IRxuDXJEV8p1+AmObbq
	Fmw23kQq5woMOPj3k6oNwSB5sx2aNyK1ADO9eN43W92htr3M3fg2a6wa3olw9e1u2gP+
	2HEqRBdF9Ctw89a/qItGAezdBeb9DXLhDeKWeNW2DDYxChzQgFEfTagYQr2DziQfMAMM
	UG2bp/hM2bRueF5PlWCxnSIe8FUQqpb8VHlcjZOt1g8uhJgFDSpSN7/DNisoz/Axj3i+
	8ZLg==
Received: by 10.152.108.42 with SMTP id hh10mr1937839lab.4.1350673410148; Fri,
	19 Oct 2012 12:03:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Fri, 19 Oct 2012 12:03:09 -0700 (PDT)
In-Reply-To: <20121019183301.GA17013@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
	<20121019165738.GC14620@mcrowe.com>
	<CABcZANkCuggDC-rmqBA=N3GaWqTYWAPr+9eOoECiTSGVVgQN7A@mail.gmail.com>
	<20121019183301.GA17013@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Oct 2012 12:03:09 -0700
X-Google-Sender-Auth: CBHYvR2p_B7TOabQ8i6YMXvNAfo
Message-ID: <CABcZAN=CsirVoiVEnYGwVDMP3QGTi+jz-gjO_Y9RkwqAVX_hLw@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 19:16:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 19, 2012 at 11:33 AM, Mike Crowe <mac@mcrowe.com> wrote:
> Thanks for your reply.
>
> After correcting ${LSBNATIVESTRING} to ${NATIVELSBSTRING} that worked!
>
> I'm still somewhat baffled as to why that one doesn't require PATH but
> the general one does but that no longer matters to me.

The file://.* in the other one dose a replacement of the full url
contents, so you have to add back the directory component. The other
one I showed you just does a search/replace on the leading component,
leaving the rest alone.
-- 
Christopher Larson


