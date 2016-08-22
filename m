Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Aug 2016 08:41:30 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.16])
	by mail.openembedded.org (Postfix) with ESMTP id 3263C731E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 08:41:30 +0000 (UTC)
Received: from [216.82.249.147] by server-16.bemta-12.messagelabs.com id
	F9/78-14081-C09BAB75; Mon, 22 Aug 2016 08:34:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRWlGSWpSXmKPExsXi5LtOQJd7565
	wgyU7rSzu/HzHbnHwwxRGByaPNVNPMnqc27iCMYApijUzLym/IoE14+H548wFtzgrNq+Yw9bA
	+Jm9i5GLQ0hgFaNEy/atTBDOYkaJh42/WLsYOTmEBeIlJixaBmaLCOhJfP/fCdXRySRxcOUzF
	pAEs0CUxKTZr8BsNqCiyZeeMIPYvALWEn9X7AezWQRUJbr2XmIDsUUFwiVWzoTo5RUQlDg58w
	mYzSngIdHwYSdQPQfQTHuJB1vLIMbLSzRvnQ02RkhAReLg0suMILYEUHzT5rPsELaJxMWru9k
	gbEOJ77O+sUDY0hJ7+xYyT2AUnoVk2yyEDbOQbFjAyLyKUaM4tagstUjX2FAvqSgzPaMkNzEz
	R9fQ0EgvN7W4ODE9NScxqVgvOT93EyMw9OsZGBh3MP754nuIUZKDSUmU16x1Z7gQX1J+SmVGY
	nFGfFFpTmrxIUYZDg4lCd5D23eFCwkWpaanVqRl5gCjECYtwcGjJMLLsAMozVtckJhbnJkOkT
	rFqMsxbfeDtUxCLHn5ealS4rynQWYIgBRllObBjYAlhEuMslLCvIwMDAxCPAWpRbmZJajyrxj
	FORiVhHl/gkzhycwrgdv0CugIJqAjrv/fDnJESSJCSqqBMdnJrF5vesr1rzp/TffUnb8bNkWX
	jUsmqdL47Epef9+u2nVBPLdP+RbctJtXqWizuDx0o2Wld8VJD14+wchb81s6NDTdy+OO5ipIh
	wR/i4hy+e5qEzn32u9f7xZMzDRQt7g3t/C+guHN4BefFzY6LGH8q/Lm3akE601HI+S3LU0rXd
	F9Z5GUEktxRqKhFnNRcSIAMlNSRAMDAAA=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-15.tower-29.messagelabs.com!1471854859!39555439!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11664 invoked from network); 22 Aug 2016 08:34:19 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-15.tower-29.messagelabs.com with SMTP;
	22 Aug 2016 08:34:19 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.301.0;
	Mon, 22 Aug 2016 03:34:16 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.301.0;
	Mon, 22 Aug 2016 10:34:12 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.20.1608181237130.2886@ca624034.mitel.com>
	<20160819201637.GO5342@bill-the-cat>
	<alpine.LFD.2.20.1608210955340.18845@localhost.localdomain>
	<20160821150452.GR5342@bill-the-cat>
	<alpine.LFD.2.20.1608211146290.20716@localhost.localdomain>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <47213dd7-8a1a-23a8-68a9-8e7c7452b9f6@digi.com>
Date: Mon, 22 Aug 2016 10:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608211146290.20716@localhost.localdomain>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: how can i add u-boot-fw-utils to my build without u-boot being part of the build?
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
X-List-Received-Date: Mon, 22 Aug 2016 08:41:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Robert,

On 21/08/16 17:51, Robert P. J. Day wrote:
>
>   i apologize for being clueless, but i'm still unclear on what i need
> to do here, and in my case, i'm going in the opposite direction.
>
>   currently, u-boot is being configured and compiled standalone -- not
> as part of OE. and that build works just fine, so i can grab whatever
> (little?) i need from that build to then add to an actual OE build so
> i can just add u-boot-fw-utils to an existing image.
>
>   as i read it, for an OE build of u-boot, i need to supply either
> UBOOT_MACHINE or UBOOT_CONFIG. so in this case, what would i do? my
> assumption until now is that i need to add to the OE build just enough
> to get the fw utils to build, and i'd do that by setting either of
> those variables. and i already have the appropriate fw_env.config file
> ready to go.
>
>   so what precisely do i need to do here?

Have you tried to override UBOOT_CONFIG in a u-boot-fw-utils bbappend?

Have a look at how we do that (using sandbox_defconfig) in meta-digi-arm:

https://github.com/digi-embedded/meta-digi/blob/jethro/meta-digi-arm/recipes-bsp/u-boot/u-boot-fw-utils_%25.bbappend

Hope this helps.

-- 
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

