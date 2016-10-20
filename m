Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 12EA271A00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 15:15:37 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161020151538190_0685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 08:15:38 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=46212 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxF48-0002Ne-3v for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2016 11:15:32 -0400
Date: Thu, 20 Oct 2016 11:14:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610201109590.5212@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how do i get "nativesdk-rpm-build-5.4.16-r0.x86_64_nativesdk.rpm" into the SDK?
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
X-List-Received-Date: Thu, 20 Oct 2016 15:15:39 -0000
Content-Type: text/plain; charset=US-ASCII


  ok, this one should be simple ... i ran:

$ bitbake -c populate_sdk core-image-minimal

then popped into tmp/deploy/rpm/x86_64_nativesdk to see the rpms
of interest to me:

nativesdk-rpm-5.4.16-r0.x86_64_nativesdk.rpm
nativesdk-rpm-build-5.4.16-r0.x86_64_nativesdk.rpm
nativesdk-rpm-common-5.4.16-r0.x86_64_nativesdk.rpm
nativesdk-rpm-libs-5.4.16-r0.x86_64_nativesdk.rpm

so far, so good.

  but if i pop into tmp/deploy/sdk and check the host.manifest file
for the generated SDK, i see references to only:

nativesdk-rpm x86_64-nativesdk 5.4.16
nativesdk-rpm-libs x86_64-nativesdk 5.4.16

is there a special setting to get the nativesdk-rpm-build into the SDK
as well? or am i just misunderstanding what i'm reading? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


