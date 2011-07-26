Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlkGu-0000AV-MZ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:14:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QlkCq-0003xG-As from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 09:10:04 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Jul 2011 09:07:20 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 26 Jul 2011 09:10:03 -0700
Message-ID: <4E2EE6D7.5040600@mentor.com>
Date: Tue, 26 Jul 2011 09:09:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311653945.git.josh@linux.intel.com>	<ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>	<1311692004.2344.259.camel@rex>
	<1311696239.2314.0.camel@scimitar>
In-Reply-To: <1311696239.2314.0.camel@scimitar>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 26 Jul 2011 16:07:20.0561 (UTC)
	FILETIME=[192C0610:01CC4BAE]
Subject: Re: [PATCH 1/1] classes/image_types: IMAGE_TYPES was missing some entries
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
X-List-Received-Date: Tue, 26 Jul 2011 16:14:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/26/2011 09:03 AM, Joshua Lock wrote:
> On Tue, 2011-07-26 at 15:53 +0100, Richard Purdie wrote:
>> On Mon, 2011-07-25 at 21:21 -0700, Joshua Lock wrote:
>>> Some of these entries are required by the GUI to enable the expected workflow
>>> of the ADT, namely a compressed rootfs image.
>>>
>>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>>> ---
>>>  meta/classes/image_types.bbclass |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> I've merged this since its obviously correct, we probably do need to
>> think about better ways to generate it though as Tom mentions...
> 
> Agreed, I'll add this to my to do list.

Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


