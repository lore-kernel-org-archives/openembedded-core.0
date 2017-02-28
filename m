Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 58CAC72F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:29:35 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170228092900940_0684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:29:00 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=45914 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cie5X-0001EC-EA for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 04:28:55 -0500
Date: Tue, 28 Feb 2017 04:28:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702280418370.32325@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: is there, somewhere, a compendium of user/group/account-related features in OE?
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
X-List-Received-Date: Tue, 28 Feb 2017 09:29:36 -0000
Content-Type: text/plain; charset=US-ASCII


  colleague recently asked for a summary of OE utilities/features that
support customizing the users/groups/passwords/etc. when creating an
image, and i realized in short order that there is quite a lot of
that.

  i see .bbclass files:

    * extrausers.bbclass
    * useradd_base.bbclass
    * useradd.bbclass
    * useradd-staticids.bbclass

  i see various variables:

    * EXTRA_USERS_PARAMS
    * USERADD_PARAM
    * GROUPADD_PARAM
    * GROUPMEMS_PARAM

  i see utilities related to IMAGE_FEATURES:

    * ROOTFS_POSTPROCESS_COMMAND +=
      '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks',
      'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'

the list just goes on and on ... i'll ask if there is, somewhere, a
"users and groups" guide for OE, but i'm pretty sure there isn't so i
guess i'll have to whip one up.

  another users/groups query coming shortly, but this one will be far
more specific.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


