Return-Path: <Tudor.Florea@enea.com>
X-Greylist: delayed 863 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Apr 2016 17:20:02 UTC
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.36])
	by mail.openembedded.org (Postfix) with ESMTP id AC3D6606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 17:20:02 +0000 (UTC)
Received: from 1asZ5m-0002Vp-Un by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Tudor.Florea@enea.com>) id 1asZ5m-0002WM-Vf
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2016 10:05:38 -0700
Received: by emcmailer; Tue, 19 Apr 2016 10:05:38 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Tudor.Florea@enea.com>) id 1asZ5m-0002Vp-Un
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2016 10:05:38 -0700
Received: from [IPv6:fda8:8b75:6fa6:1000:fd30:2bf4:e5ca:d126] (192.168.15.34)
	by smtp.enea.com (172.21.1.208) with Microsoft SMTP Server id
	14.3.294.0; Tue, 19 Apr 2016 19:05:38 +0200
From: Tudor Florea <tudor.florea@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <57166561.7020006@enea.com>
Date: Tue, 19 Apr 2016 20:05:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
X-Originating-IP: [192.168.15.34]
X-Outbound-IP: 192.36.1.72
X-Env-From: Tudor.Florea@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: rpm generation question
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
X-List-Received-Date: Tue, 19 Apr 2016 17:20:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

As part of our test infrastructure we're attempting to install ptest
packages (and execute the tests accordingly).
Attempting to install ptest for valgrind fails with this error:

error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
provides /this/is/a/bogus/interpreter/name

smart install valgrind-ptest-3.11.0-r0.1@ppce500mc
Loading cache...
Updating cache...
###############################################################################
[100%]

Computing transaction...

 error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
provides /this/is/a/bogus/interpreter/name


This is most probably caused by the file shell_badinterp contained in
this package having the following contents:

#! /this/is/a/bogus/interpreter/name

true

Does anyone have an idea how to get rid of this error?
More specific: How can I exclude dependency on
"/this/is/a/bogus/interpreter/name" for an rpm package?

Thank you very much.
  Tudor.


