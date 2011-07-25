Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlNjf-00075G-JQ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:10:27 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QlNfc-0007kX-Up from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:06:16 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Jul 2011 09:03:38 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 25 Jul 2011 09:06:16 -0700
Message-ID: <4E2D9476.5000905@mentor.com>
Date: Mon, 25 Jul 2011 09:06:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311352057.git.tom_rini@mentor.com>	<ea9bd3c17709ba37b964e4824e8818bcd4723135.1311352057.git.tom_rini@mentor.com>
	<1311609732.30326.247.camel@phil-desktop>
In-Reply-To: <1311609732.30326.247.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Jul 2011 16:03:38.0265 (UTC)
	FILETIME=[6A429890:01CC4AE4]
Subject: Re: [PATCH 1/8] siteinfo: Move certain samba entries to common-linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 16:10:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 09:02 AM, Phil Blundell wrote:
> On Fri, 2011-07-22 at 09:28 -0700, Tom Rini wrote:
>> Part of re-syncing with oe.dev, move samba_cv_HAVE_IFACE_* to common-linux
>>
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>>  meta/site/arm-linux           |    3 -
>>  meta/site/arm-linux-uclibc    |    3 -
>>  meta/site/armeb-linux         |    2 -
>>  meta/site/armeb-linux-uclibc  |    2 -
>>  meta/site/common-linux        |    5 +
>>  meta/site/mipsel-linux-uclibc |    3 -
>>  meta/site/powerpc-common      |  325 +++++++++++++++++++++++++++++++++++++++++
>>  meta/site/powerpc32-linux     |    3 -
>>  meta/site/sh-common           |    2 -
>>  9 files changed, 330 insertions(+), 18 deletions(-)
> 
> What's that massive powerpc-common hunk about?  It didn't seem obviously
> related to the subject of this patch.

Fall out from re-basing with Kumar's stuff applied, hence the v2 :)

-- 
Tom Rini
Mentor Graphics Corporation


