Return-Path: <ola.redell@retotech.se>
Received: from mailrelay12.public.one.com (mailrelay12.public.one.com
	[195.47.247.212])
	by mail.openembedded.org (Postfix) with ESMTP id 68012600BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=retotech.se; s=20140924;
	h=from:subject:date:message-id:to:mime-version:content-type:
	content-transfer-encoding;
	bh=aKlw3byzdINAgzVsvNU0Fy3sJbsWxwjn/YtGfdgHi1g=;
	b=RacetL7uHS/L8BDuA4pvToSzH50WNGRxHzEJVexsme4PNvX+VcazFCNJSWy6SPTlcxf8Q26ni4XTU
	eaWoptVmKmkCGRNDTgwuV5miHNU4Uuct3KJt3wRBRJvCsjXCQKOXP3HQX6hcXWwl15ZvPx3MdfNIZ9
	OrOrRJXTGYaekKEE=
X-HalOne-Cookie: 686cddffa8ab5ab4023cf7439a0552ea3fd2f2b6
X-HalOne-ID: 4d5705a4-d1c8-11e6-bac9-b82a72cffc46
Received: from [192.168.1.3] (unknown [81.230.13.64])
	by smtpfilter4.public.one.com (Halon) with ESMTPSA
	id 4d5705a4-d1c8-11e6-bac9-b82a72cffc46;
	Tue, 03 Jan 2017 15:21:30 +0000 (UTC)
From: Ola Redell <ola.redell@retotech.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <80e2a281-3a69-3ea6-e46a-01b56acc947a@retotech.se>
Date: Tue, 3 Jan 2017 16:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: questions on patching
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
X-List-Received-Date: Tue, 03 Jan 2017 15:21:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I am a bit new to sending in patches to a list like this and 
specifically to OE-core, so I need a bit of guidance.

I have a fix for a bug I found in Jethro in the kernel.bbclass and I 
have tested my fix there (update-alternatives needs a full path also 
when removing an alternative). Now, the bug is around in many different 
branches (laverne, krogoth and master for sure) but that particular 
patch will only apply to Jethro.

I can make a patch for master but would have problems testing it 
thoroughly there without spending quite a bit of time (which I don't 
have at the moment).

Easy questions:
How should I proceed?
How do I know what branches are actively maintained and for which 
patches are welcome?

I should have asked these questions before sending my earlier patch for 
the kernel-module-split.bbclass since this holds for that too.

Thanks,
Ola




