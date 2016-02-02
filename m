Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 393 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Feb 2016 13:33:07 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id E6960771F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:33:07 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id u12DQXVV005576
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 14:26:33 +0100
Received: from [139.16.76.217] (MD1FZU9C.ww002.siemens.net [139.16.76.217])
	by mail2.sbs.de (8.15.1/8.15.1) with ESMTP id u12DQW9M016206
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 14:26:32 +0100
To: openembedded-core@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56B0AE88.3090103@siemens.com>
Date: Tue, 2 Feb 2016 14:26:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Tue, 02 Feb 2016 13:33:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi everybody

I noticed an inconsistency in oe-core regarding the variable: FULL_OPTIMIZATION

In bitbake.conf the variable is defined as follows:

    FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"

But if I look into the documentation.conf it tells me the following:

    FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2'."

I'm not sure if the documentation is wrong or if the default set in bitbake.conf is incorrect.
Maybe somebody can shed some light on this.

Regards
Pascal

