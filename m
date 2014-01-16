Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DC2DA6B8C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:27:14 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so3357852wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 01:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kODsKX9Ac1K62qjUKQAC3RVAeopcPJVuqw27UY4lU0Q=;
	b=f2Jv3ZjlJlltLFSNHAz0JS6V2j8Kj7KP/XfBMxyCD49BHuDAd1RIJk5LAfwyo8WJD0
	RMxENfQwVEyhq8Yh/B8vn06blWjwN0Yatadcpw/MJwOyz8VtDKYAgAd1t6xztLnNO7yq
	5E/hrFipnxJsF8xRCeemagpgTnj1PUBC3nBFhyzqJqnY+GOtW4rFRO0kXoRlT9rs5SG4
	QqcQhiQgGWETGfpuBnmLNMMaIIrWQOQYqPsHLQL0y7LzfTkZbw0Py2W8ybrHU1FPZWMW
	mM4MscwIg4HuW8/Kox+yprmAQvkYzoaYF2SccMmSPpqFf4fZ4S9VP42oZnBfPEmDiXrW
	d0zg==
X-Gm-Message-State: ALoCoQnJOnENdEZlQx6EGEZbH7Ls0+BJRuR2hN7venwJ0/3Tk08vriKrfNel6gMhVYVuOID+Nq3v
X-Received: by 10.180.21.166 with SMTP id w6mr6906318wie.31.1389864433869;
	Thu, 16 Jan 2014 01:27:13 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id gd5sm32600837wic.0.2014.01.16.01.27.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jan 2014 01:27:13 -0800 (PST)
Message-ID: <52D7A5F0.6090501@linaro.org>
Date: Thu, 16 Jan 2014 10:27:12 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>
In-Reply-To: <CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Thu, 16 Jan 2014 09:27:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2014 12:22 PM, Otavio Salvador wrote:
>
>
>
> On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <koen.kooi@linaro.org
> <mailto:koen.kooi@linaro.org>> wrote:
>
>     I've limited it to 64bit targets, but to be honest debug splitting
>     doesn't make sense for grub since it won't run in your rootfs and
>     attaching gdb is pretty much impossible.
>
>     Signed-off-by: Koen Kooi <koen.kooi@linaro.org
>     <mailto:koen.kooi@linaro.org>>
>
>
> I'd prefer to remove the debug systems than skip the split. What others
> think?

I'm not sure what you mean by that, do you mean using 
INHIBIT_PACKAGE_STRIP or something else?

regards,

Koen

>
>     ---
>       meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb> | 5 +++++
>       1 file changed, 5 insertions(+)
>
>     diff --git a/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>     b/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>     index 1796e7f..bc79cfa 100644
>     --- a/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>     +++ b/meta/recipes-bsp/grub/grub_git.bb <http://grub_git.bb>
>     @@ -51,8 +51,13 @@ do_configure_prepend() {
>       do_install_append () {
>           install -d ${D}${sysconfdir}/grub.d
>           install -m 0755 ${WORKDIR}/40_custom
>     ${D}${sysconfdir}/grub.d/40_custom
>     +
>       }
>
>
> Please remove this.
>
>     +# debugedit chokes on 64 bit platforms
>     +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 = "1"
>     +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 = "1"
>     +
>       RDEPENDS_${PN} = "diffutils freetype"
>       FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
>
>     --
>     1.8.4.2
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750



-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

