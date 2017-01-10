Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2906079E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 07:32:21 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id j18so52208598ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 23:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=CPXm82O/yzbuzavvrnzQugy4py3vcZLMcnoY/vF2L70=;
	b=WQXLQnqBj7KPiyDz31uj8I+AS1/psLm8wE4kzGg06kErqTgTVxcm5eUpWS3De9jS6t
	9XeuUTe4d+/ZTq7z4KHljq8Q3n35jOPsiX4jtBTEGsBU0ELVWIW6sBxZ4WbcFRrnSk1m
	8zol029o/qwL+kldWYM9s9F1jEdgPfnJKRWKyeWmnM9myZ5rgC3P5LfHHQjDlIIUB3Mz
	OtEGD9vP7zSscz5jiSJ8pvH4vSQ+Zfgvp30yUjXvxzcyVo1oxcvnDtmEvj95eTHzsMP3
	9fUhXlQbatQsvckL3Xc0Hr5yx9nXMbaGNNduGKXgykm9EgTAotE2totFd4rjQhHMXxeM
	s8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=CPXm82O/yzbuzavvrnzQugy4py3vcZLMcnoY/vF2L70=;
	b=dhsF51nj/t71f5afHV3OuCeroBXVqYKTulnyAcsVMmJ4iq3kF4PBkFtHztedzqif6z
	GBoegRQMBm07w94iSVZC9abRCsEEo3DXcBnac9Bhegdaf20QvBvauxKGEJbrrXESz47R
	saVil6kCROv6kJZD5+p1ROHPunSPkLAuRfHhrSQcj+b+tkUXgYy60/6Vqw4VVHWm3ui+
	uuAkim4hlak8k8WP1ePAYn+7RGTR/44quBP6QWufB/kOM5doFdkvt6p68ot/WqhnA5E1
	n0GiFst+RWd5/fSD9RCeZKjx1oKWK1Pi95JJkulPm8/+q4h8Qeqo+psX0yjFKn7emruq
	uz6w==
X-Gm-Message-State: AIkVDXJqdnqh40QL9t3Ycps2ub/cz3GsTgtX0vkm7fxSEnTEqnrhV1EUvOZWO4/JAKfbjrjD
X-Received: by 10.107.164.147 with SMTP id d19mr1994113ioj.79.1484033542341;
	Mon, 09 Jan 2017 23:32:22 -0800 (PST)
Received: from pohly-mobl1 (p57A56084.dip0.t-ipconnect.de. [87.165.96.132])
	by smtp.gmail.com with ESMTPSA id
	g186sm7766117itb.4.2017.01.09.23.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jan 2017 23:32:21 -0800 (PST)
Message-ID: <1484033538.2137.108.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Tue, 10 Jan 2017 08:32:18 +0100
In-Reply-To: <1484020254.65791.27.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
	<1482961124.106950.55.camel@ranerica-desktop>
	<1483524116.28169.33.camel@intel.com>
	<1484020254.65791.27.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Tue, 10 Jan 2017 07:32:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-09 at 19:50 -0800, Ricardo Neri wrote:
> On Wed, 2017-01-04 at 11:01 +0100, Patrick Ohly wrote:
> > On Wed, 2016-12-28 at 13:38 -0800, Ricardo Neri wrote:
> > > >  do_install_class-target() {
> > > > -    OVMF_DIR_SUFFIX="X64"
> > > > -    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
> > > > -        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
> > > > -    fi
> > > > +    # Traditional location.
> > > >      install -d ${D}${datadir}/ovmf
> > > > +    install -m 0755 ${WORKDIR}/ovmf/OVMF.fd ${D}${datadir}/ovmf/bios.bin
> > > 
> > > Now that I think about it. Installing here does not sever any purpose.
> > > Thus, I think this can be removed by perhaps doing do_install[noexec] =
> > > "1"
> > 
> > I was trying not to break traditional usage patterns. If we keep the
> > "bios" runqemu parameters, then we should also keep the bios.bin file.
> 
> I think OVMF is not a traditional recipe. There are two use cases to
> ponder. 1) a Yocto Project disk image wants to include OVMF along with
> qemu to run a VM from the YP image. 2) we want to run a YP image in a
> host system. I am not sure if someone is interested in 1) and I think
> your use case and LUV's is 2). I think that putting things in the deploy
> directory makes more sense because, as you said, these images will be
> written to. I reckon the the "bios" parameters in runqemu should look
> there. This is not a must for this patchset but something nice to have.

Okay, so let's remove that "traditional location" already in this patch
set. I still want to keep the "bios" parameters in runqemu (because they
might have some other uses), but for OVMF, the only supported approach
will be via the "ovmf" parameters and the deploy directory.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




