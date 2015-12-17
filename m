Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id C18406FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 13:19:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 17F07265487
To: ed.bartosh@linux.intel.com
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
	<20151217122121.GB30559@linux.intel.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <5672B673.5030400@collabora.co.uk>
Date: Thu, 17 Dec 2015 13:19:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151217122121.GB30559@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Thu, 17 Dec 2015 13:19:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ed,

On 17/12/15 12:21, Ed Bartosh wrote:
> Thank you for the patch! I like the change. It's a first step towards
> supporting bmaptool, which is in my TODO list.

No problem, I've been playing with bmaptool myself and that's what 
prompted the change.

> Would you be willing to write or modify wic test case to test this?

I'd be willing to do that, is there any documentation on the development 
of test cases?

I see meta/lib/oeqa/selftest/wic.py has a bunch of functions with 
@testcase decorators but I'm not familiar with how this should all fit 
together.

Regards,

Joshua

