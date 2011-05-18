Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMcSR-0001Hs-Ik
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:50:19 +0200
Received: by wye20 with SMTP id 20so1104433wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 01:47:22 -0700 (PDT)
Received: by 10.227.201.142 with SMTP id fa14mr1628069wbb.48.1305708442306;
	Wed, 18 May 2011 01:47:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s20sm836083wbh.6.2011.05.18.01.47.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 01:47:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110518081234.GB31650@sakrah.homelinux.org>
Date: Wed, 18 May 2011 10:47:16 +0200
Message-Id: <BE336ACD-3C70-4797-B667-9BC3ACCE153B@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<20110518074909.GA31650@sakrah.homelinux.org>
	<1305705436.3424.299.camel@rex>
	<20110518081234.GB31650@sakrah.homelinux.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 08:50:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 mei 2011, om 10:12 heeft Khem Raj het volgende geschreven:

> On (18/05/11 08:57), Richard Purdie wrote:
>> On Wed, 2011-05-18 at 00:49 -0700, Khem Raj wrote:
>>> I think we need to globalize libc variable like MACHINE or MULTIMACHINE
>>> and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
>>> in base.bbclass for sanity. Something like attached patch might be
>>> able to do it
>> 
>> Having assessed how many places in the system we'd need to make this
>> kind of change I'm now of the opinion its too great. I think
>> manipulating TMPDIR is a better cleaner solution and we should inject
>> this there...
> 
> hmmm ok. So we delete these definitions from tclibc-uclibc.inc
> 
> DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
> DEPLOY_DIR_append = "-uclibc"
> STAGING_DIR_TARGET_append = "-uclibc"
> STAGING_DIR_HOST_append = "-uclibc"
> SSTATE_MANIFESTS_append = "-uclibc"
> 
> and append define
> TMPDIR ?= "${TOPDIR}/tmp-${TCLIBC}"
> 
> should be enough

Like this: http://patches.openembedded.org/patch/4229/ ?


