Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QnJFY-00066K-HF
	for openembedded-core@lists.openembedded.org;
	Sun, 31 Jul 2011 01:47:20 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QnJBP-0001aF-Jj from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 16:43:03 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 30 Jul 2011 16:39:57 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Sat, 30 Jul 2011 16:43:02 -0700
Message-ID: <4E3496FB.7050605@mentor.com>
Date: Sat, 30 Jul 2011 16:42:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311807353.git.tom_rini@mentor.com>	<d8f714075dcbe37ef21b17639f91a8faeb868bf1.1311807353.git.tom_rini@mentor.com>
	<7954213.WCcvt5c9xE@perseus>
In-Reply-To: <7954213.WCcvt5c9xE@perseus>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 30 Jul 2011 23:39:57.0983 (UTC)
	FILETIME=[FDE8C2F0:01CC4F11]
Subject: Re: [PATCH 2/9] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Sat, 30 Jul 2011 23:47:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/30/2011 10:33 AM, Khem Raj wrote:
> On Wednesday, July 27, 2011 03:56:46 PM Tom Rini wrote:
>> This comes from oe.dev which had this set for arm-linux only.  Bump PR
>> since this changes how builds happen.
> 
> if you are clubbing them in right site files then this variable is for
> deciding what serial API(termios or termio or sgtty) to use its not dependent 
> on libc imo.

Where do you think it should go?  common-linux?

-- 
Tom Rini
Mentor Graphics Corporation


