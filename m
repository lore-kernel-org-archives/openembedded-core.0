Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 639 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Feb 2016 20:38:19 UTC
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5C677184
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 20:38:19 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160224202739986_0684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 20:27:39 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [127.0.0.1] (port=53012 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1aYg3H-0005U6-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Feb 2016 15:28:51 -0500
Received: from 99.240.204.5 ([99.240.204.5]) by astoria.ccjclearline.com
	(Horde Framework) with HTTP; Wed, 24 Feb 2016 15:28:50 -0500
Message-ID: <20160224152850.164043qmdvkuzbeo@astoria.ccjclearline.com>
Date: Wed, 24 Feb 2016 15:28:50 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what is the priority of wildcarded .bbappend files?
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
X-List-Received-Date: Wed, 24 Feb 2016 20:38:22 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

   didn't immediately see this in the documentation anywhere, so what would
happen in the following situation? say i have a layer that has three
different versions of a recipe:

* recipe-1.0.bb
* recipe-1.1.bb
* recipe-1.2.bb

   if i want, i can extend each one with a .bbappend file:

* recipe-1.0.bbappend
* recipe-1.1.bbappend
* recipe-1.2.bbappend

   or if the same .bbappend file applies to all of them, i can just create
the wildcard file "recipe-1.%.bbappend". but can i do this?

* recipe-1.1.bbappend
* recipe-1.%.bbappend

such that the more specific match takes precedence, so that the 1.1 bbappend
file is used for that version, and the wildcard version is used for  
all others?
is this written down somewhere that i just missed it?

rday



