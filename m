Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 860C971AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 06:42:38 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161031064238559_0486
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 06:42:38 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=55778 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c16Ii-00016I-6c for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2016 02:42:32 -0400
Date: Mon, 31 Oct 2016 02:41:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610310237330.8165@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: any way to simply list the layers that contributed to final image?
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
X-List-Received-Date: Mon, 31 Oct 2016 06:42:39 -0000
Content-Type: text/plain; charset=US-ASCII


  in order to drag in a bunch of python modules to my
core-image-minimal, i added various layers just to play it safe:

BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/poky/meta \
  /home/rpjday/oe/dist/layers/poky/meta-poky \
  /home/rpjday/oe/dist/layers/poky/meta-yocto-bsp \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-webserver \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-networking \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-python \
  /home/rpjday/oe/dist/layers/meta-cloud-services \
  /home/rpjday/oe/dist/layers/meta-cloud-services/meta-openstack \
  /home/rpjday/oe/dist/layers/meta-virtualization \
  "

in the end, is there a way to list just those layers that actually
contributed recipes?

  i know i can run:

  $ bitbake-layers show-recipes

to see where *all* recipes would come from, but that's overly verbose.
is there a shortcut?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


