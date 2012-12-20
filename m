Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TljOf-0001BI-Dm
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:55:01 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so3550649oag.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 08:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IPO7gxQ1P2yP1j0pZqjsoX6YdUeW8yZCJJuYpuvqPZU=;
	b=pMp7LraXXW/jblHaV6zq2+7Cpz8QXijOxCwvfT/rarPVOe32g8eWOm1COlI+jsq+3I
	xYdk2N00215zBWztdTvUUsMTCe3ychLc1OSmX0L9hFL64cWpR0OYvYXFdcWHjYTOkwsX
	VGy87KgjB9tRz/6M2avf5tn7JJFFPQ9PtcIMVdLr/SKNPV7k9H5Oz+qk1buS2BumBFPv
	NRY/JlHD85OjJ7+Mk68CV9zMhSvi3SIJXqK3oW1QJML4Z5GNfwImk3DOsGnd4hbnfos4
	TewFA9tsjfXo5XykBlH6tpQaE4iHcrlIA0n3qoe/Fd8utEQlzvGpKcTebQyqsOtIdfwb
	hM+Q==
MIME-Version: 1.0
Received: by 10.60.172.178 with SMTP id bd18mr8658469oec.133.1356021616258;
	Thu, 20 Dec 2012 08:40:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 08:40:16 -0800 (PST)
In-Reply-To: <CAJTo0La3aruvPrxHh1yAdq5WwcZyPWkcCFuCAB9mYSNio66_bQ@mail.gmail.com>
References: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
	<1356016878.24487.187.camel@phil-desktop>
	<CAJTo0Lb5Z67naXx-pFWd_ksEP5SYpd0qnDzv801UO9MpLB1PdQ@mail.gmail.com>
	<50D33B07.7020203@intel.com>
	<CAJTo0La3aruvPrxHh1yAdq5WwcZyPWkcCFuCAB9mYSNio66_bQ@mail.gmail.com>
Date: Thu, 20 Dec 2012 14:40:16 -0200
X-Google-Sender-Auth: 7C5k_cHmcnN30xKHOGJ-dYHiIJs
Message-ID: <CAP9ODKoN+_=LZCtZxEgHUw=tyEPsV0S3pM9uqpi1ZFfEDXNjFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: have postinstalls run at do_rootfs time
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
X-List-Received-Date: Thu, 20 Dec 2012 16:55:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 2:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 December 2012 16:21, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> How do they handle the cross-compiling issue? They cannot run the native
>> pango-querymodules on a cross-compiled shared object. It will fail.
>
> Sure, they don't have that problem.  But for us, any package that
> ships pango modules could use qemu to generate it's modules files.
>
> It was mainly an interesting comparison of packaging strategy.

And the speed boost in first boot and the possibility to use read-only
rootfs is worth the qemu overhead I think :-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


