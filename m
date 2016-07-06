Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id C846960119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 18:22:38 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160706182226966_0484;
	Wed, 06 Jul 2016 18:22:26 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [99.240.204.5] (port=51692 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bKrUY-0005ZH-Hp; Wed, 06 Jul 2016 14:24:10 -0400
Date: Wed, 6 Jul 2016 14:21:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <577D4AF7.8040302@mlbassoc.com>
Message-ID: <alpine.LFD.2.20.1607061419520.2200@localhost.localdomain>
References: <alpine.LFD.2.20.1607061252280.599@localhost.localdomain>
	<577D4AF7.8040302@mlbassoc.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how to bbappend(?) to u-boot-fw-utils to add a custom /etc/fw_env.config??
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
X-List-Received-Date: Wed, 06 Jul 2016 18:22:39 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Jul 2016, Gary Thomas wrote:

,,, snip ...

> I do something like this in my machine layer, in a .u-boot-fw-utils_%.bbappend
> file:
>
> ====================================================================
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> SRC_URI += "file://fw_env.config"
>
> do_install_append() {
>    install -d ${D}${sysconfdir}
>    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
> }
>
> PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> ====================================================================
>
> Yes, this "installs" the same file twice, but it does what you
> need, it installs the desired file in the correct place. And, yes,
> it's too bad that this "info" is kept in two completely different
> recipes.

  that is, pretty much, line for line what i came up with as well. as
you suggest, it just seems ... sloppy.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


