Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tp2vK-0002yD-5M
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 21:22:29 +0100
Received: by mail-oa0-f50.google.com with SMTP id n16so10585462oag.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Dec 2012 12:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fLHdMPiuR2FuTCtNC/6ft92y6FHwtdy1Nv5UEB832QI=;
	b=O/iqX+1ZsoPKGfEDippHp1a397LA/aZRddkMRkA19BP3zLOLuuJeBzDGIjVgxrio+h
	zpQToEy5EHlYtXaksidGKi1AsJauucxPuzgvCUaowXHWJ7YmRGv7McqEncAeiTiEUT1W
	oNplYke0s68xVPNDOKZSJk12gYokSHNiNCrIAnm3q0qaGO9xPlSyloSKtGCli7dj3luI
	a7TWl/gag1OFAO7kMvPdglTvUBt9UVhtIIscO3MmuxgC81J1vCj/DYmA5gK0nDr0PrO5
	Sk2dieqPqNnlMv+QKbGKgq0+i7lN3RqDX7yV2SNbq2uHu0CnajdQFObLagpu5jASFZ8j
	QPhw==
MIME-Version: 1.0
Received: by 10.60.171.201 with SMTP id aw9mr18861414oec.126.1356811647683;
	Sat, 29 Dec 2012 12:07:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Sat, 29 Dec 2012 12:07:27 -0800 (PST)
In-Reply-To: <14597559.apOXRQSfRu@ll-pc>
References: <14597559.apOXRQSfRu@ll-pc>
Date: Sat, 29 Dec 2012 18:07:27 -0200
X-Google-Sender-Auth: 197KeSPJg93-k-V3dfLzfOPgL8g
Message-ID: <CAP9ODKrVuLGDVUPC+co_oxVRfxnamRCnLhSe4wJp-WU3HVGiuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Yi Qingliang <niqingliang2003@gmail.com>
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
X-List-Received-Date: Sat, 29 Dec 2012 20:22:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 29, 2012 at 1:09 PM, Yi Qingliang <niqingliang2003@gmail.com> wrote:
>
> When using poky,  I got following problem:
>
> WARNING: The free inode of /dev/md127 is running low (0.000K left)
> ERROR: Immediately abort since the disk space monitor action is
> "ABORT"!
> ERROR: Unknown event: <bb.event.DiskFull object at 0x47dbed0>
>
> the disk is  a raid partition, and fs format is reiserfs, the 'statvfs' call
> in bitbake got a zero f_favail.
>
> I don't know it is feature of reiserfs, or bug of reiserfs driver, or python's
> problem.
>
> Any idea?

I had a similar problem when using btrfs. You can find the bug at
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3609

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


