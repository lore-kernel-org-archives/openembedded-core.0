Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4394E6B678
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 21:12:39 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so1254482obb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Snbt1cU7G8yU4KJllvM0j20m12+eiwOs2DdBX2WPUPw=;
	b=kL5UnVeq4NJB2Ks/cqxmf47VbUMC8h3vt+QYCx7qkqyTVJk2pHq3dq85Qs7IA+eoj1
	kG/fpRbeAgBxqKt+Qr9EU1KV2prMFWcmHvUbGrcgkN6GGTxJb70L/LGhDpylFVjs/qaI
	WA3EKEd2DDog/C9XBtHLd2kDxq5TIx0LaJtFq7xk7U1DMSEMkIoOTBchsFgqQyv0zQ9q
	3mmllxT/rJz/Tt8j/+OY/6Wr+BK9A3TtQuTO+S40nV+yLeCbRa8wG8CHpJ5AaD+4pw+D
	w+YClcZ0vf8lWlp+b+3MGaKppheb9mm/eAWUmb24o2b324xIlP60aIWWk6nV9E5vLRiM
	ds5g==
MIME-Version: 1.0
X-Received: by 10.182.246.74 with SMTP id xu10mr7574122obc.23.1379711560313;
	Fri, 20 Sep 2013 14:12:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 20 Sep 2013 14:12:40 -0700 (PDT)
In-Reply-To: <E78BBE677EB9144B8F0A0A29674CD5338ED47A955F@SRV-VS06.TELEVIC.COM>
References: <E78BBE677EB9144B8F0A0A29674CD5338ED47A955F@SRV-VS06.TELEVIC.COM>
Date: Fri, 20 Sep 2013 18:12:40 -0300
X-Google-Sender-Auth: qKnpT0McVDem_r9lriMMYkA8olI
Message-ID: <CAP9ODKrcLyHPW+TskFgbaa_9LnZphCSREmWfvi_ABxdyNBiAgA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Vanhauwaert Wouter <W.Vanhauwaert@televic.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: Re: [meta-freescale] imx53qsb and gst-fsl-plugin
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
X-List-Received-Date: Fri, 20 Sep 2013 21:12:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 20, 2013 at 6:49 AM, Vanhauwaert Wouter
<W.Vanhauwaert@televic.com> wrote:
...
> ERROR: Function failed: do_package_ipk
> ERROR: Logfile of failure stored in: /opt/git/poky/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.6-r0/temp/log.do_package_write_ipk.21959
> ERROR: Task 3655 (/opt/git/poky/meta/recipes-graphics/mesa/mesa_9.1.6.bb, do_package_write_ipk) failed with exit code '1'
...

This is an error seems to be in OE-Core/Poky and not in meta-fsl-arm.
I am adding the openembedded-core mailing list in Cc.

I started a build to try to reproduce it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

