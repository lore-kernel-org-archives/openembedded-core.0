Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TpKe9-0005np-3l
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Dec 2012 16:17:56 +0100
Received: by mail-pa0-f44.google.com with SMTP id hz11so6778133pad.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Dec 2012 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=PchaZF87xDamQbXZVvKfHbOBaIXsMLqoUGv9oZTXyjk=;
	b=OaRnHT9edjiNjO0vC+o2b0Vsz4ndfvaBkXcYwrckzf2AH6VxjH2neqNk2bAykZ2S7Q
	KSOhmXWYYunJrRhejC4U+yFad71wH0GuDoyjJey+D3O+KnKfpsegNZgJS/2SiQ0yEvfK
	vgmTZSEK9to3PEi/oacp8wREPkkqOP6SIi3jYwodbGsF9Cs41nx2hp4m+ThqfR0YwT3a
	UaX44F1hfzcQs7d2nO4ZwrwUngGidszvj5z1NsBlQnoSnnP2rh34WpSe8iijXsMu+uf0
	WRVSISN3EyC9S9Nak4DJnVCIERgc2ijQDPiRxism5Idi/5QVsBlnDNr6lhl4YhZ7BLFN
	cUiQ==
X-Received: by 10.66.82.230 with SMTP id l6mr114602768pay.12.1356879773957;
	Sun, 30 Dec 2012 07:02:53 -0800 (PST)
Received: from ll-pc.localnet ([112.3.235.206])
	by mx.google.com with ESMTPS id oi3sm23238496pbb.1.2012.12.30.07.02.50
	(version=SSLv3 cipher=OTHER); Sun, 30 Dec 2012 07:02:52 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 30 Dec 2012 23:01:23 +0800
Message-ID: <2102269.34dXU5iKec@ll-pc>
User-Agent: KMail/4.9.4 (Linux/3.6.10-1-ARCH; KDE/4.9.4; x86_64; ; )
In-Reply-To: <CAP9ODKrVuLGDVUPC+co_oxVRfxnamRCnLhSe4wJp-WU3HVGiuw@mail.gmail.com>
References: <14597559.apOXRQSfRu@ll-pc>
	<CAP9ODKrVuLGDVUPC+co_oxVRfxnamRCnLhSe4wJp-WU3HVGiuw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: disk space problem
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
X-List-Received-Date: Sun, 30 Dec 2012 15:17:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, December 29, 2012 06:07:27 PM Otavio Salvador wrote:
> On Sat, Dec 29, 2012 at 1:09 PM, Yi Qingliang 
<niqingliang2003@gmail.com> wrote:
> > When using poky,  I got following problem:
> > 
> > WARNING: The free inode of /dev/md127 is running low (0.000K left)
> > ERROR: Immediately abort since the disk space monitor action is
> > "ABORT"!
> > ERROR: Unknown event: <bb.event.DiskFull object at 0x47dbed0>
> > 
> > the disk is  a raid partition, and fs format is reiserfs, the 'statvfs'
> > call in bitbake got a zero f_favail.
> > 
> > I don't know it is feature of reiserfs, or bug of reiserfs driver, or
> > python's problem.
> > 
> > Any idea?
> 
> I had a similar problem when using btrfs. You can find the bug at
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3609

The only thing I can do is to disable the disk space motor.
I doubt it is some fs format's feature, but not bug.
If so, the bitbake should consider that.

> Regards,
> 
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


