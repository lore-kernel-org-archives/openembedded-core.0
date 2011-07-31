Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QnbYy-0002If-DA
	for openembedded-core@lists.openembedded.org;
	Sun, 31 Jul 2011 21:20:36 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QnbUl-0002Zl-PR from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 31 Jul 2011 12:16:15 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 31 Jul 2011 12:16:15 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Sun, 31 Jul 2011 12:16:14 -0700
Message-ID: <4E35A9F1.701@mentor.com>
Date: Sun, 31 Jul 2011 12:16:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311807353.git.tom_rini@mentor.com>	<7954213.WCcvt5c9xE@perseus>
	<4E3496FB.7050605@mentor.com> <1651296.NY6EmKFV0b@perseus>
In-Reply-To: <1651296.NY6EmKFV0b@perseus>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Jul 2011 19:16:15.0608 (UTC)
	FILETIME=[5173AF80:01CC4FB6]
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
X-List-Received-Date: Sun, 31 Jul 2011 19:20:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/30/2011 05:56 PM, Khem Raj wrote:
> On Saturday, July 30, 2011 04:42:51 PM Tom Rini wrote:
>> On 07/30/2011 10:33 AM, Khem Raj wrote:
>>> On Wednesday, July 27, 2011 03:56:46 PM Tom Rini wrote:
>>>> This comes from oe.dev which had this set for arm-linux only.  Bump PR
>>>> since this changes how builds happen.
>>>
>>> if you are clubbing them in right site files then this variable is for
>>> deciding what serial API(termios or termio or sgtty) to use its not
>>> dependent on libc imo.
>>
>> Where do you think it should go?  common-linux?
> yes

k, I'll v2 just this patch, tomorrow.

-- 
Tom Rini
Mentor Graphics Corporation


