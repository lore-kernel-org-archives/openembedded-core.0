Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 388827E7CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 07:59:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so1479273wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/IElcwX2KEZBX/GuwDtUAphh9rGE7KfX+fNw5fbgxwc=;
	b=XiRc+HNwaYFqW0HWppytsNcZSFzS1aiRGr3spzZcm16CwoOdX9QjtQPUhnsPIAVtQI
	TEjAd51g5JeAKNXPIieggmz3f8IoMSQWrS1e7b9pGjD8bADYykdtuSRN27+5hiPEjC+5
	ZjXL16JRa/UEgx8lq3Kxeq022mXo176jIfJ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/IElcwX2KEZBX/GuwDtUAphh9rGE7KfX+fNw5fbgxwc=;
	b=bogChbtv+sw+N1OvgqZA3Pgv2KUdla4i086UrVprDcSfzH9DeumkEZh6VjQ9/Pambk
	GS9FevfyRNNY3RoVPSxh/VKqvAZBmiNjQ9F/nfvyLbD10B0QAaZk6tWjlVfrHccdx0nX
	0BGDBJh/mUuqg1Zq/dQBbI/4OE+HZCueEI+db6iSn4Ip9FugphPuHqTje9COTwKAorFE
	1djkfumw4GSwG/lsz/PqliEMnDUiU1wjkNJb1JwaJveq8HAq59RdztkRYmS1zCy1enTb
	Rbr4cRYCNIwD8W9q/6zsejH6IVMQGZoENx+uHi2qNBbN82AMlJ15t1iIANvgPc8NW91r
	FazQ==
X-Gm-Message-State: APjAAAVXJArnQLQe8Rm3Qg45kaEnG0CVCR36P6SvomO1bOAwmp9j4AGE
	7EMWys4i3EePxAa5lNOAMbNcZxiQWX4=
X-Google-Smtp-Source: APXvYqxfOGir1iVzum0oPeuVilM2sh/rfYSqSVlHZGqN+Aw/wcPAab0dsCzV1vQNlVXCDvFVEZ9vcw==
X-Received: by 2002:adf:e2c3:: with SMTP id d3mr35153231wrj.314.1560499172833; 
	Fri, 14 Jun 2019 00:59:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g8sm1995940wme.20.2019.06.14.00.59.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 00:59:32 -0700 (PDT)
Message-ID: <f63dd1f0ac81c6f78df6ef07d3828ff1d963b889.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 08:59:30 +0100
In-Reply-To: <c4c94351-08c8-9547-ddfa-b2b118060c98@windriver.com>
References: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
	<fddad43f3c2052f390bddeb16fce29b30999b5d1.camel@linuxfoundation.org>
	<c4c94351-08c8-9547-ddfa-b2b118060c98@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] lttng-modules: Add git based recipe
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
X-List-Received-Date: Fri, 14 Jun 2019 07:59:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 10:33 +0800, He Zhe wrote:
> 
> On 6/12/19 8:36 PM, Richard Purdie wrote:
> > On Wed, 2019-06-12 at 19:12 +0800, zhe.he@windriver.com wrote:
> > > From: He Zhe <zhe.he@windriver.com>
> > > 
> > > The git based recipe is for those who want to build lttng-modules 
> > > with bleeding
> > > edge kernel, to avoid regularly backporting patches from
> > > upstream.
> > > 
> > > Note that PREFERRED_VERSION needs to be set to select the git
> > > recipe instead of
> > > the tar ball one.
> > > 
> > > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > > ---
> > > v2: Correct a typo in SOB in 0001
> > > v3: Use devupstream to make it more clean and clear
> > > 
> > >  meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb | 11
> > > ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > > b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > > index 70a6843..dfd166a 100644
> > > --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> > > @@ -11,7 +11,6 @@ inherit module
> > >  
> > >  COMPATIBLE_HOST =
> > > '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
> > >  
> > > -#
> > > https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
> > >  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> > >             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-
> > > not-en.patch \
> > >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > > @@ -34,3 +33,13 @@ python do_package_prepend() {
> > >          bb.warn("%s: no modules were created; this may be due to
> > > CONFIG_TRACEPOINTS not being enabled in your kernel." %
> > > d.getVar('PN'))
> > >  }
> > >  
> > > +BBCLASSEXTEND = "devupstream:target"
> > > +LIC_FILES_CHKSUM_class-devupstream =
> > > "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
> > > +DEFAULT_PREFERENCE_class-devupstream = "-1"
> > > +SRC_URI_class-devupstream = "git://git.lttng.org/lttng-
> > > modules;branch=master \
> > > +           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-
> > > not-en.patch \
> > > +           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > > +           "
> > > +SRCREV_class-devupstream = "${AUTOREV}"
> > > +PV_class-devupstream = "2.11.0-rc+git${SRCPV}"
> > > +S_class-devupstream = "${WORKDIR}/git"
> > OE-Core can't access the network by default so this will need to be
> > a
> > specific SRCREV which you can set to AUTOREV in local config if
> > that
> > makes sense.
> > 
> > I've sent a separate email to openembedded-architecture about a
> > better
> > syntax for some of this but that isn't anything wrong with this
> > patch,
> > more just the way devupstream works.
> 
> Thanks. I assumed this patch was on the way to be merged. But with
> Jonathan
> Rajotte-Julien's idea coming after your comment, I want to make sure
> if there's
> anything/update I should do for the patch.

We need two things tweaking, I think we need to incorporate Jonathan's
advice on which branch to use and also not use AUTOREV here by default.

Cheers,

Richard


