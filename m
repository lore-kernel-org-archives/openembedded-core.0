Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 56FDB71A40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2016 19:46:18 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161112194618935_0484
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2016 19:46:18 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=34418 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c5eFg-0007Fx-Th for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2016 14:46:12 -0500
Date: Sat, 12 Nov 2016 14:45:08 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611121436420.20479@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: WRL error: "Can't locate Config_heavy-target.pl in @INC" -- OE versus WRL
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
X-List-Received-Date: Sat, 12 Nov 2016 19:46:19 -0000
Content-Type: text/plain; charset=US-ASCII


  (note: this is actually an error i'm getting under wind river linux
8, i'm just curious as to why OE works just fine.)

  as mentioned, when trying to build a trivial hand-rolled perl recipe
under wind river linux 8, i'm getting:

| Can't locate Config_heavy-target.pl in @INC (@INC contains: ... long
path snipped ...) at
.../tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Config.pm
line 88.

  but building precisely the same recipe under regular OE (actually,
poky) works just fine. i did some searching, and found this:

https://patchwork.openembedded.org/patch/111047/

but i have no idea what it means. i also notice that the standard
bitbake.conf (which i haven't looked at in a while), now contains a
few more ASSUME_PROVIDED entries, including:

    hostperl-runtime-native \
    hostpython-runtime-native \

while the WRL version contains:

    perl-native-runtime \
    python-native-runtime \

i have no idea what to make of this. thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



