Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>)
	id 1Ucl0W-0003LH-8c; Thu, 16 May 2013 01:21:17 +0200
Received: by mail-vb0-f54.google.com with SMTP id f12so914037vbg.27
	for <multiple recipients>; Wed, 15 May 2013 16:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=NfIGT3+xgMxWDi9Mbha7xHZg9itTne5Ppniaxb2tKgg=;
	b=keijYDaS8ElF4wHUq/SoXW8ou86DPF3fpPX+xWtxx5FyG6Gi5XUQbYA5lUWZfvp2JB
	tfMgKvMp/RtMT4wPCZdPaSUjRtIvKPbH7r7HCJ+ixuoPG9Q8pa19RDWMnZT0u9nQiLNP
	FZV+YDLBRsXdx2wYa+THZ63eL32BQhK9Y4vwfCuevLjszxdKXOG+kNs5liZtpHWau30a
	40gagBAhs+ngxtZ6YVBrTHkes/bVfM1CCKtqf5mNjBJEhQ6XFDXyrFWsktRzcqkPRGGI
	XoDADt6pJxfZZ1rg39x/BRzJLXJeh7BTU0BT1SDFEtad4rBlSDlLzftqb7TeZeTZcco9
	8lsQ==
X-Received: by 10.52.66.78 with SMTP id d14mr5330093vdt.111.1368658982360;
	Wed, 15 May 2013 16:03:02 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Wed, 15 May 2013 16:02:42 -0700 (PDT)
In-Reply-To: <1368650024.18324.102.camel@ted>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 16 May 2013 00:02:42 +0100
X-Google-Sender-Auth: iaPBWCVO3j2o-kle83l_tueWrxM
Message-ID: <CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Wed, 15 May 2013 23:21:37 -0000
X-List-Received-Date: Wed, 15 May 2013 23:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 May 2013 21:33, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

>
> (e.g. when I include
> meta-raspberrypi, it changes the psplash logo, regardless of whether I'm
> building for the pi).
>
> In many ways the bbappend is too easy and encourages anti-social
> behaviour. I would recommend bouncing meta-rpi as being non yocto
> project compatible due to the psplash issue if it were to apply which it
> has not.
>

I noticed the psplash logo when building a qemu image with
meta-raspberrypi included, will look into fixing it so it only goes
into MACHINE="raspberrypi" builds. Copying in yocto@ and Andrei as
this is raspberrypi related.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


