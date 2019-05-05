Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 05 May 2019 18:28:38 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id DE5C87C51E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 18:28:38 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 62DB7C3312
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 20:23:14 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <71a00e2c-0b65-f6c3-ae57-34a70a6f208e@pseudoterminal.org>
Date: Sun, 5 May 2019 20:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Subject: Status of meson cross compilation files in the SDK
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
X-List-Received-Date: Sun, 05 May 2019 18:28:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Last I've checked, deploying meson cross compilation files with a Yocto 
SDK is tricky because that meson file has to be generated during SDK set 
up and because meson assumes that environment variables like $CC refer 
to the native host compiler.

Has anything changed? I have some bits of code here that use meson, and 
cross compiling them with the SDK has been difficult at best.


