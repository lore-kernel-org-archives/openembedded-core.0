Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 108FD7FBBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:25:24 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id n17so1066065ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aqjakJAYC9/88dgr66i7Un7w7+n5T2YOCNqsWktrwns=;
	b=DALs2y9GiAo7AP0Oze2jQVDRXcgt8Zg52me1UOpAKmOoxGMfB2laEmbh/MNroeoDLh
	D37eIq37N56gx2wvMTEU/mdCKrhHhQXukBsK0G8/0fVRYzf81LHi7WFAn+R3b+WnI8sC
	0ajvSPh2Lw04D/SYFNZsWqMW+gk6hRAXNUMQMXJ9RqsP3cVz94FfpG9arD2+o9NU4ST3
	T3ZrUiUq42HraMYfjS1r74BOpFtXiFq2rxFR6mMQJBTfiEFo+Ij4KXBeaYvFnQ5+dhQt
	vPNwE7xO7m2XDxj1bKOo3lkj4PTLKkusk7GNKHk2PF63NuGJuwNPn7OEPsUe7rkpNXgP
	FBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aqjakJAYC9/88dgr66i7Un7w7+n5T2YOCNqsWktrwns=;
	b=S4+OuGlZJh6W0gTmn7WjSToGpW+PU6ho00G/ZJEuR/3ynvPkB/Qo/bReLlhu25z52/
	1NMqZi/SSe9koMe+XhRbC/MUnsFCorSSKKTIyqNBtW9lc6FS0ULhDX0tmc8tx1d604Px
	EkuG/ZvMmXH7gpFidy20ovpdpn8wjtFbw6J5RT2r46jcG5/vVhsNvMmwAVhr2FdUuEFf
	/XdZ0Dmzyu4h2mCe8fhn+ZvVvJF0IqeXIZRIfvdC2vdzncpIz1jQDHERGPW2qkLrh9Of
	Q9oYSFB4d+0TVC3HcOxcJCzIixXIK4U85iQTBZodmaI2WUkb4mMO985qW3r69r7jTl0Y
	+Jdg==
X-Gm-Message-State: APjAAAXp76XbyrzxN50V4pmgd81zYx19LsOVy5Jxx7VYMwIpgudOKSEm
	Jp6ZRm7JMt6oVl3HRB3UmSXeoRsM8b+q9qfEEDk=
X-Google-Smtp-Source: APXvYqwcl9KaQKVqWcK+jH7JiZnjqQAW3GRaUdZHtNc3tXvvb/S0DDf5JTtb5fHhIBgUscib642PMQku8PQqfVOxZNo=
X-Received: by 2002:a6b:b744:: with SMTP id h65mr2958826iof.192.1572344726070; 
	Tue, 29 Oct 2019 03:25:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Tue, 29 Oct 2019 03:25:25
	-0700 (PDT)
In-Reply-To: <8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
	<CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
	<47af37ed-25aa-65aa-cea7-febfada814f7@gmail.com>
	<CAA=hcWQ8xjT03MC9MQPXgFVB04ZdbE5=Nd8LOE=6w308r44kGg@mail.gmail.com>
	<e91e63ef-9da5-3110-17d2-6f78bf09c904@gmail.com>
	<CAA=hcWTF5GVrEQ6WtjgLoHovrtyNKUUt_aHYpiaQ9pzHtqt7nQ@mail.gmail.com>
	<8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 29 Oct 2019 21:25:25 +1100
Message-ID: <CAA=hcWTucG_LwdAPBX4AA3wAv44Y-h3zqEMn9af8pWEQQFG8tg@mail.gmail.com>
To: Ferry Toth <fntoth@gmail.com>
Cc: public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org,
	openembedded-core@lists.openembedded.org
Subject: Re: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Tue, 29 Oct 2019 10:25:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ferry,

On 10/29/19, Ferry Toth <fntoth@gmail.com> wrote:
>
> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/conf/machine/edison.conf
>
> And there is the max size!

Are you able to run u-boot to start kernel in the large size 64 MB?

Thank you.

Kind regards,

- jh

