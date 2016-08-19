Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 392 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Aug 2016 14:17:11 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 80E857708A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:17:11 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 58D6B3BF05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:10:39 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <c1f61bbb-02ac-2ae8-9016-55a00ff71a15@pseudoterminal.org>
Date: Fri, 19 Aug 2016 16:10:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: Why are verbose makefiles enabled by default in cmake bbclass ?
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
X-List-Received-Date: Fri, 19 Aug 2016 14:17:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

in a project, I'd like to disable verbose makefiles (the bbclass sets 
CMAKE_VERBOSE_MAKEFILE to 1), since the log output becomes very large, 
and finding compiler errors becomes more difficult. I think there is no 
problem in overriding the default in my recipe. However, I wonder if 
there was a specific reason for setting CMAKE_VERBOSE_MAKEFILE to 1 in 
the cmake.bbclass, or if this was just preference. Any ideas?


