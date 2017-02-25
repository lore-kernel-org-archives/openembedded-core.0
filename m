Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 2432D72F7C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 15:30:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 400AB20950;
	Sat, 25 Feb 2017 10:30:55 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Sat, 25 Feb 2017 10:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	smtpout; bh=VrjuJygLp19siWVoAliHm/p43Ng=; b=F/w0wFAH8YOQ9q4nULeX
	LPSuTu2UAaUAzQ6XupvbsQEPazxyuXcL6wQqJr1ssYjBdYrODCTPZgxrHjoVl6Q5
	sgbFHkZgaH2Ir9tgHIQFQ8og8bmfTP634cFM80rztXVIsmrykLSkUbo7z1vdbJiA
	VcUX85/+9+eOhJGpeHyBWrg=
X-ME-Sender: <xms:L6OxWA8C-J-KLc6soRRsNbdt5zla2yHen8ybfKmEyMqWFs6uvdkgvQ>
X-Sasl-enc: +MV3pc77jItPCcUoDXVYka/y2IVuqnk2clX5OB0XB/sG 1488036654
Received: from laptop (unknown [192.40.95.5])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7E66A2459C;
	Sat, 25 Feb 2017 10:30:54 -0500 (EST)
Message-ID: <1488036652.2631.4.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 25 Feb 2017 17:30:52 +0200
In-Reply-To: <CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
References: <20170203070635.30804-1-tanuk@iki.fi>
	<CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
X-Mailer: Evolution 3.22.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Sat, 25 Feb 2017 15:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-22 at 14:48 +0000, Burton, Ross wrote:
> On 3 February 2017 at 07:06, Tanu Kaskinen <tanuk@iki.fi> wrote:
> 
> > Relase notes:
> > https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/
> > 
> 
> I'm seeing a new warning now:
> 
> WARNING: pulseaudio-10.0-r0 do_package_qa: QA Issue: ELF binary
> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/pulseaudio/10.0-r0/packages-split/pulseaudio-server/usr/bin/pulseaudio'
> has relocations in .text [textrel]
> 
> Would you be able to identify where this comes from?

I couldn't reproduce the problem. I don't get the warning, and "readelf
-d tmp/work/corei7-64-poky-linux/pulseaudio/10.0-r0/packages-
split/pulseaudio-server/usr/bin/pulseaudio | grep TEXT" returns
nothing.

My test was performed on a fresh poky clone with default configuration,
using command "bitbake pulseaudio". In addition to the default qemux86,
I tried with genericx86-64 and also intel-corei7-64 from meta-intel,
since your error message seemed to be from a corei7 build.

-- 
Tanu

https://www.patreon.com/tanuk

