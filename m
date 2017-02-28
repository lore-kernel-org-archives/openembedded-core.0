Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id BE04072F97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:28:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170228102822762_0685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 02:28:22 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=46924 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cif0y-0006Jr-Tm for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 05:28:16 -0500
Date: Tue, 28 Feb 2017 05:28:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 10:28:25 -0000
Content-Type: text/plain; charset=US-ASCII


  here's a puzzler someone just presented me with ... given an
established OE build, and a way to download and install it to a remote
system, how would one set up root and/or non-root accounts and
passwords to then allow an *authorized* someone to log in to the
newly-installed system and configure it?

  as in, if the installed image contains a "root" account and default
password, there is the potential of someone sneaking in there in the
interval between installation and when the "authorized" user connects
to do the configuration, even if the first act of the authorized user
is to change the root password.

  my immediate reaction was to use SSH keys, where the
newly-installed system would require SSH logins, and would have to
match the corresponding private key.

  as an alternative, perhaps don't worry about such a situation, but
when the authorized user logs in for what is *supposed* to be the
first time, it will be flagged that someone else has already logged in
earlier, and a warning will be printed, "Previous login to root
detected, you have been compromised, please re-install!"

  i'm sure there are plenty of ways of doing this, anyone have any
pointers? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


