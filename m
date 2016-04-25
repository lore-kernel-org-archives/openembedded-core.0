Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE816E668
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 11:14:58 +0000 (UTC)
Received: from [172.16.1.4] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id CBE80237B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:14:57 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <571DFC30.10003@pseudoterminal.org>
Date: Mon, 25 Apr 2016 13:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: base_ , oe.utils , bb.utils confusion
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
X-List-Received-Date: Mon, 25 Apr 2016 11:15:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've noticed that the base_* functions have been compatibility wrappers 
for a while now.
What is confusing though is that some of the replacements are in 
bb.utils , others in oe.utils. For example, base_contains becomes 
bb.utils.contains, while base_conditional becomes oe.utils.conditional.
Is there any reason for this difference?

