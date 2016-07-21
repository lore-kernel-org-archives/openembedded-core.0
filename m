Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 262D36E667
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 13:51:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q8so6441716qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M8tcpMPRtREjBPEXfqQ71le4TYkSLSOwEjM6FjDaT5Y=;
	b=bGIdOZYUZnYZL/Ld1XCSCuPaS/wqOe/bUXoscXtA3hjsSZSpqoluEsE4jX6XVG1Srj
	nH0TkYBtCELQU/hDRe+dY7CeDc2HEfYrvXxpLB5BG2jpowwh137BLEa+DmnyOtBb+kZy
	jJjQqXL5EIQ0EY2bJibbyf/xgSzHGq682YqhTv34w2EMQAZfp7u18RHOqRkdTD53YYC0
	x85eJzP72Wlr/iC/JclzL29Sjq3NIwqyPIoAgps1uxu1FMyL67s8V3R24ofuP1fHM3A3
	tIb/KNlhZhruSsHXMnIn6jfaqpoLkWhpXSS9zIBZXpf0Yp0ViDms+6bwu1JnjMrW94oL
	Y9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M8tcpMPRtREjBPEXfqQ71le4TYkSLSOwEjM6FjDaT5Y=;
	b=JrNNtfEk+GtZkU4rQq4XkCPxwia9lAJGpDoXBE/9fTN85QQvTChFX7OIl4/188U816
	kyShXXtYvVMZXgjH5R6dHg2krYzow38rVpMhYi1WhACcPOj0WiVFZk6z8DSxr2/F1Ut9
	fEkDbDHO+vzWJRmbHEXex2o6yJA6UH7GGQLDIg+UShLSfFXmAudINZN6bo4zGcmDYOO5
	RRROMHeT8i+3ShpsSS8P4u2jmqUkwdQ1Dgg5KDF6Kem2HwK19R0Wi0mtx+vWrCEpxJfr
	4efBcU93RzRHFov/mVqPdR68WnDJKFZf6B7sRGpPy5JLp0pkd8jvRbLblVQqmBPqU2KI
	Z0jw==
X-Gm-Message-State: ALyK8tIrT8NYemgGp/dyDAjqM8lb8MVd1XVoWv6AxvIKADMZehv/DuQ3jA+Crr8lVT6CR+opH4ZlvkgKme6L7A==
X-Received: by 10.55.16.232 with SMTP id 101mr71879448qkq.151.1469109100300;
	Thu, 21 Jul 2016 06:51:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Thu, 21 Jul 2016 06:51:11 -0700 (PDT)
In-Reply-To: <CAP1eXm6yhgsweLn8x5w2J4j1y6_qJeeunOmmy1-HeEfo54TYOg@mail.gmail.com>
References: <CAP1eXm6yhgsweLn8x5w2J4j1y6_qJeeunOmmy1-HeEfo54TYOg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2016 06:51:11 -0700
Message-ID: <CAMKF1sq57qu8vFm6SGnJ=b=TKHa8GW5vRcyqOejAFbAR3VXt_g@mail.gmail.com>
To: "Oleg V. Kobrin" <oleg@portlab.ru>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot find the information on sdk
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
X-List-Received-Date: Thu, 21 Jul 2016 13:51:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 21, 2016 at 1:53 AM, Oleg V. Kobrin <oleg@portlab.ru> wrote:
> Good day!
>
> I am using the OE to build my application for Beaglebone Black, and it works
> fine, as I installed the sysrooted sdk on my machine and use it for build.
> The problem is that I need to add some libs (i.e. orbit2) to my project and
> cannot find the information how to add them to sysroot.

Did you generate the SDK yourself ? if you did then go to
layers.openembedded.org
and search for orbit2 you will find it in meta-gnome layer, so you
will then add meta-gnome to your
bblayers

git clone git://github.com/openembedded/meta-openembedded
bitbake-layers add-layer <path to meta-gnome inside meta-openembedded repo>

Add orbit2 to IMAGE_INSTALL

bitbake -cpopulate_sdk <your image>

Install this new SDK and it should have orbit2

>
> For now I have sdk installed in /usr/local/oecore-x86_64/sysroots/. The opkg
> is not working in the sdk environment - opkg list is empty.
>
> I see full sysroot with all the libraries in build/sysroots/x86_64-linux in
> my local OE directory, and it seems to be functional, but I have no idea how
> to transfer its contents to installed sysroot.
>
> Any help? Thank you!
>
> --
> _____________
> Oleg V. Kobrin
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

