Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 348 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Apr 2018 08:35:50 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 8D91C60279
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 08:35:50 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id E93A53F3E6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 10:30:01 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <6c43a914-cf60-6d05-766c-1c1bfc92d13e@pseudoterminal.org>
Date: Sat, 14 Apr 2018 10:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
Subject: dropping commerical flags in mpg123 and lame recipes
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
X-List-Received-Date: Sat, 14 Apr 2018 08:35:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The lame and mpg123 can be built only if the commercial flag is whitelisted.

However, the remaining mp3 patents expired in December, and no more 
royalties exist. This is why in GStreamer, the mpg123 and lame plugins 
were moved from -ugly to -good.

So, can we drop the commercial flag in mpg123 and lame?


