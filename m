Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABE170E22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Sep 2014 07:35:49 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 8B50A22780
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Sep 2014 09:35:49 +0200 (CEST)
Message-ID: <541E7FD4.4010105@pseudoterminal.org>
Date: Sun, 21 Sep 2014 09:35:48 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: waf.bbclass does not clean up properly
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
X-List-Received-Date: Sun, 21 Sep 2014 07:35:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

is there a reason why the waf bbclass does not call "./waf distclean" in 
a do_clean() function?
As a result, the out-of-tree build directory is around even after 
performing a bitbake -c clean or bitbake -c cleansstate call.

