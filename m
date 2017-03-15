Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6293F60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 10:44:47 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170315104447763_0685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 03:44:47 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=57148 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1co6Q5-0007Uf-Gb for openembedded-core@lists.openembedded.org;
	Wed, 15 Mar 2017 06:44:41 -0400
Date: Wed, 15 Mar 2017 06:44:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703150639340.8646@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what shell programming constructs can we count on in .bbclass files?
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
X-List-Received-Date: Wed, 15 Mar 2017 10:44:49 -0000
Content-Type: text/plain; charset=US-ASCII


  what shell (or level of POSIX compatibility) does one assume for
writing shell functions in .bbclass files?

  i'm looking at kernel-fitimage.bbclass and i see this:

  #
  # Step 7: Sign the image and add public key to U-Boot dtb
  #
  if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then

surely we don't still need to use that ugly "x" prefix hack for string
comparisons, do we?

  a bit further down:

  do_assemble_fitimage_initramfs() {
        if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
                test -n "${INITRAMFS_IMAGE}" ; then

would it not be equivalent to write that second test as:

  [ -n "${INITRAMFS_IMAGE}"]

and so on. what are we allowed to count on?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


