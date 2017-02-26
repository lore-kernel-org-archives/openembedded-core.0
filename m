Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 529AD771DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 11:58:42 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170226115841399_0684;
	Sun, 26 Feb 2017 11:58:41 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=44012 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1chxTH-0005L3-2X; Sun, 26 Feb 2017 06:58:35 -0500
Date: Sun, 26 Feb 2017 06:58:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <alpine.LFD.2.20.1702260626400.21279@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1702260645400.23011@localhost.localdomain>
References: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
	<CABcZANnv7=zxZ7MNT4kDPKxScTYkJa44qAxt5Lvfc-L4=-Kb0A@mail.gmail.com>
	<CABcZAN=X+O23y=utG3iBvsdPNo1g9qM7H2JAT1PUpt-R=AYCBg@mail.gmail.com>
	<alpine.LFD.2.20.1612191246350.4848@localhost.localdomain>
	<CABcZANnkk64RWAw4vHVc92QXQmuaBXD9yK0x95u2fw=SOh7jUQ@mail.gmail.com>
	<alpine.LFD.2.20.1702260626400.21279@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a few questions about "COMPATIBLE_MACHINE" variable
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
X-List-Received-Date: Sun, 26 Feb 2017 11:58:43 -0000
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 Feb 2017, Robert P. J. Day wrote:

... big snip ...

> is there a style guide entry for proper use of COMPATIBLE_MACHINE?
> having the manuals make suggestions that are potentially confusing
> to inexperienced users seems like a bad idea.

  for fun, i did a quick grep in the oe-core layer:

meta/conf/documentation.conf:COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more target machines with which a recipe is compatible."
meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86$)"
meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE = "(qemux86$)"
meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
meta/recipes-kernel/linux/linux-yocto_4.4.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
meta/recipes-kernel/linux/linux-yocto-dev.bb:COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86$)"
meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
meta/recipes-kernel/linux/linux-dummy.bb:#COMPATIBLE_MACHINE = "your_machine"
meta/recipes-kernel/linux/linux-yocto_4.9.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
meta/recipes-kernel/linux/linux-yocto_4.1.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
meta/recipes-kernel/linux/linux-yocto_4.8.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb:COMPATIBLE_MACHINE = "(qemux86$)"
meta/classes/base.bbclass:    need_machine = d.getVar('COMPATIBLE_MACHINE')
meta/classes/base.bbclass:            raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))

  so as long as i understand correctly the re.match() anchoring, some
of the above assignments can definitely be tightened up with no change
in behaviour, correct? not saying i'm going to run off and submit a
patch for that, since i rather like chris' suggestion that the
matching be tightened up to catch inadvertently sloppy matching, as
long as that doesn't break all kinds of stuff.

  thoughts?

rday

p.s. hey, COMPATIBLE_HOST seems to work the same way, so it seems
there would be no value in appending ".*" to the end of any choice so,
for example:

  argp-standalone_1.3.bb:COMPATIBLE_HOST = ".*-musl.*"

could be more simply written as:

  argp-standalone_1.3.bb:COMPATIBLE_HOST = ".*-musl"

yes?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


