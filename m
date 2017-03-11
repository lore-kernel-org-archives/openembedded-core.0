Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 29A0E71AE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 07:50:08 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170311075008417_0685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 23:50:08 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=39146 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cmbms-0002FJ-6R for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 02:50:02 -0500
Date: Sat, 11 Mar 2017 02:49:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703110243360.16676@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: couple ambiguities/errors(?) in rootfs-postcommands.bbclass
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
X-List-Received-Date: Sat, 11 Mar 2017 07:50:09 -0000
Content-Type: text/plain; charset=US-ASCII


  perusing rootfs-postcommands.bbclass ...

  * very first comment says, "Zap the root password if debug-tweaks
    feature is not enabled". should that not more properly say, "Zap
    an *empty* root password ..." for clarity?

  * further down:

    # We want this to run as late as possible, in particular after
    # systemd_sysusers_create and set_user_group
      ^^^^^^^^^^^^^^^^^^^^^^^ ?

    i see no such routine, should this say "systemd_create_users"?

  i'll submit a patch to tweak the above and anything else i notice,
feel free to throw in other suggestions while i'm there.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


