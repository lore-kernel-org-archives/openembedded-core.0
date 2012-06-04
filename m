Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SbWq3-0002H3-0p
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 14:56:51 +0200
Received: by dalh21 with SMTP id h21so5985029dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=c49DHNCKfilnJmJiy3niRhglc4dd5SSbYn5n4dmKGZ4=;
	b=JDOSXn8goJX8TE33+AoriEi5W+lwljAcBwbk4g2GwdI0jmlS8VGlCJIWHhtcmNXd0H
	ZRnD03KUsNRT5qHXXsXNd8Xjhd91NhECy7DrB1dMsqC2d6E0curC3TAqBW+a+bfaKiRQ
	2KgXZuvZKg402VvgdSbleYeDvsqi0yRKcOARgNO7HvDkr6WyFxLi9S1J3FIcTeOgUC9d
	emktofUY6RPegWzIKcD9s3hMzOigvxHT7RUa2/RdbCXhOicw91jYigv3HJZZiC4weQJI
	jBWHtZub4qiDKyIMwS5ymF5VWl/ZenlC3wzXU2GRPAk5HNw9TKcWG4aSyXdzizAbVMOs
	yxUw==
MIME-Version: 1.0
Received: by 10.68.130.35 with SMTP id ob3mr40031333pbb.40.1338813985270; Mon,
	04 Jun 2012 05:46:25 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Mon, 4 Jun 2012 05:46:25 -0700 (PDT)
In-Reply-To: <FFF09E3B-E9FB-4D8C-9CE7-65E014F04F2D@gmail.com>
References: <FFF09E3B-E9FB-4D8C-9CE7-65E014F04F2D@gmail.com>
Date: Mon, 4 Jun 2012 08:46:25 -0400
Message-ID: <CADkTA4N-+rHkOetxrkxdGtTx4Q2NE_wLxMPOinOWMnAxOKuFOQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] Creating a QEMU for Xilinx ARM for Zynq 7020 device
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
X-List-Received-Date: Mon, 04 Jun 2012 12:56:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 3:12 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote=
:
> Hi,
> =A0 =A0 I'd like to add support for qemuxarm and build a core-image-sato =
image, so that I can emulate the ARM processor on the Xilinx Zynq 7020 devi=
ce using Yocto.
>
> The sources for qemuxarm are located below:
>
> http://git.xilinx.com/?p=3Dqemu-xarm.git;a=3Dsummary
>
> I haven't done this before, so if someone could guide me as to what I sho=
uld do, and the recipes I should take a look at, it would be great!

I'd start from here:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-zynq/tree/README.qemu

Bruce

>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


