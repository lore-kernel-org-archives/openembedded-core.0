Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhqxI-0006iH-0O
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:33:56 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QhqtQ-00022D-Co from Tom_Rini@mentor.com ;
	Fri, 15 Jul 2011 15:29:56 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 15 Jul 2011 15:29:56 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 15 Jul 2011 15:29:55 -0700
Message-ID: <4E20BF61.3020901@mentor.com>
Date: Fri, 15 Jul 2011 15:29:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
	<4E20BE2C.3060103@linux.intel.com>
In-Reply-To: <4E20BE2C.3060103@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jul 2011 22:29:56.0199 (UTC)
	FILETIME=[B9412770:01CC433E]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:33:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/15/2011 03:24 PM, Saul Wold wrote:
> On 07/15/2011 03:03 PM, Tom Rini wrote:
>> These are 'side ports' of current oe.dev versions.  PR is kept in sync
>> but we drop out the target recipes in order to punt on potential perl
>> problems.
>>
>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>> ---
>>   .../help2man/help2man-native_1.36.4.bb             |   26
>> ++++++++++++++++++++
>>   .../help2man/help2man-native_1.38.2.bb             |   24
>> ++++++++++++++++++
>>   2 files changed, 50 insertions(+), 0 deletions(-)
>>   create mode 100644
>> meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
>>   create mode 100644
>> meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
>>
> 
> Why do we need both versions?  Can't we just use the most current?

For the "I want no GPLv3" crowd.  This is a little more clear in oe.dev
where we also build for the target but yes, different legal departments
have different GPLv3 concerns so I think it makes sense in this case still.

-- 
Tom Rini
Mentor Graphics Corporation


