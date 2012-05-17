Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SV0QA-00039B-8n
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 15:07:10 +0200
Received: by pbbrq2 with SMTP id rq2so2236885pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5FlcYYi41bV5ELV3BhRTzrARNcVufAg8MSVitaV9stY=;
	b=K7cka+RXBI8XeBh8NsaXkcYw3K7gB0NjnKoUGEJTQTgLapXegQsgOUkKQr8LNVkKL2
	mQ9lrXTwUGn9c769wVzH7nP2FEQnEaJdkFdcm89cK1YR6uzsqns7MG6RQSGsk3OB4UoZ
	CneQQTla84PB5hh91sGkaV+sqdqWJWh+CqUIuOFe+rpIC1pWkwnbt4B9lYs0etTxo+Iv
	KM6qiqiQEZB/0rECINJ87e3haMapouHcUJ/6LVCCBkylp7Kz+tIrZw1b+laTgDRXfECt
	L+gNodDE4oeofaosXB+gEtELwfCyUFk95DoikBO6HtnOXH7rMyOs2NKCDy8ntflWsJrD
	er5Q==
MIME-Version: 1.0
Received: by 10.68.225.104 with SMTP id rj8mr27312428pbc.135.1337259426932;
	Thu, 17 May 2012 05:57:06 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Thu, 17 May 2012 05:57:06 -0700 (PDT)
In-Reply-To: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
Date: Thu, 17 May 2012 08:57:06 -0400
Message-ID: <CADkTA4PvPLPe=GvK=p3An2kqOsYbPm1G04Z9nOhQat_GgB65OQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Florin Sarbu <flocirel@gmail.com>
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
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
X-List-Received-Date: Thu, 17 May 2012 13:07:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 17, 2012 at 6:09 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Today i ran into an issue that Florin Sarbu signaled sometime last week. It
> seems like do_patch crashes while compiling linux 3.0:

The tools fixes are in place for this, can you send your full configuration ?
i.e. what layers, their head commits, and machine config.

Bruce

>
> ERROR: Logfile of failure stored in:
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
> Log data follows:
> | Branch meta-temp set up to track remote branch meta from origin.
> | git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc
> | Deleted branch meta-temp (was 620917d).
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> line 434: yocto/standard/beagleboard-standard.scc: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> line 436: yocto/standard/beagleboard-standard.scc: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> line 437: yocto/standard/beagleboard-standard.scc: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> line 438: yocto/standard/beagleboard-standard.scc: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> line 441: yocto/standard/beagleboard-standard.scc: No such file or directory
> | readlink: missing operand
> | Try `readlink --help' for more information.
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> | /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function failed:
> do_patch (see
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
> for further information)
> | p/sysroots/i686-linux/usr/bin/scc: line 399:
> yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> |
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> line 399: yocto/standard/beagleboard-standard: No such file or directory
> | ERROR. Could not find an excutable target for yocto/standard/base
> | ERROR. Could not locate meta series for yocto/standard/beagleboard
> | ERROR. Could not modify yocto/standard/base
> NOTE: package
> linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
> task do_patch: Failed
>
> I didn't have time to understand were is the source of this problem but i
> suspect that is a sever-sided issue as this was reproducible yesterday even
> if i didn't change anything in layers.
>
> @g
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


