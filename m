Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 79E6B789C8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 08:23:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w658NhfS025648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 5 Jul 2018 09:23:44 +0100
Message-ID: <df456e87b2e9b34cff9991b91c98717020bfb3c9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Thu, 05 Jul 2018 09:23:43 +0100
In-Reply-To: <CAP71Wjwy0T-s7-D+aRDRwcH+w0nBD0gSV_HN3hFi6qpYnWfnkw@mail.gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704200654.285-1-Martin.Jansa@gmail.com>
	<CAP71Wjwy0T-s7-D+aRDRwcH+w0nBD0gSV_HN3hFi6qpYnWfnkw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel-devicetree: Corrected normalize_dtb"
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
X-List-Received-Date: Thu, 05 Jul 2018 08:23:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-05 at 09:15 +0200, Nicolas Dechesne wrote:
> On Wed, Jul 4, 2018 at 10:07 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > 
> > This reverts commit 2e7f3b2b9318d1e5395ad58131eafb873f614326.
> > 
> > It was breaking quite common use case that the dtb files are in
> > some subdirectory and then kernel build fails to build them.
> > 
> > As reported by khem:
> > http://lists.openembedded.org/pipermail/openembedded-core/2018-July
> > /152578.html
> > me:
> > http://lists.openembedded.org/pipermail/openembedded-core/2018-July
> > /152579.html
> > on raspberrypi3 build:
> > 
> > make[3]: *** No rule to make target
> > 'arch/arm/boot/dts/dwc2.dtbo'.  Stop.
> > arch/arm/Makefile:345: recipe for target 'dwc2.dtbo' failed
> > make[2]: *** [dwc2.dtbo] Error 2
> > Makefile:146: recipe for target 'sub-make' failed
> > 
> > and trevor on the IRC:
> > 20:35:49 < tlwoerner> the recent
> > 2e7f3b2b9318d1e5395ad58131eafb873f614326 commit in oe-core seems to
> > cause dragonboard-410c's kernel to fail to build
> > 20:36:26 < tlwoerner> for the dragonboard-410c, KERNEL_DEVICETREE
> > is set to "qcom/apq8016-sbc.dtb" but the build failure is:
> > 20:36:37 < tlwoerner> *** No rule to make target
> > 'arch/arm64/boot/dts/dts/qcom/apq8016-sbc.dtb'.  Stop.
> > 20:36:44 < tlwoerner> i.e. the "qcom/" is getting removed
> > 20:37:08 < tlwoerner> oops!!
> > 20:37:33 < tlwoerner> wrong copy&paste, the actual error is:
> > 20:37:36 < tlwoerner> *** No rule to make target
> > 'arch/arm64/boot/dts/apq8016-sbc.dtb'.  Stop.
> > 20:37:53 < tlwoerner> i.e., the "qcom/" is being stripped out
> 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Thanks! As reported by Trevor, it's needed for meta-qcom..
> 
> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Just to note that I'm happy to take this but its based on top of
Martin's other patches and those look like they'll need a respin so
this will either have to wait or get rebased...

Cheers,

Richard

