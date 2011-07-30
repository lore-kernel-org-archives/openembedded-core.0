Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QnJtn-0006wc-Sl
	for openembedded-core@lists.openembedded.org;
	Sun, 31 Jul 2011 02:28:56 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QnJAl-0001ZK-7F from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 16:42:23 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 30 Jul 2011 16:42:09 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Sat, 30 Jul 2011 16:42:08 -0700
Message-ID: <4E3496C5.60707@mentor.com>
Date: Sat, 30 Jul 2011 16:41:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311807353.git.tom_rini@mentor.com>	<9242177.qDpCW2S6UF@perseus>	<1312051187.3497.9.camel@lenovo.internal.reciva.com>
	<3203108.rdKDhXfA9V@perseus>
In-Reply-To: <3203108.rdKDhXfA9V@perseus>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 30 Jul 2011 23:42:09.0949 (UTC)
	FILETIME=[4C912CD0:01CC4F12]
Subject: Re: [PATCH 1/9] sudo: Drop sudo_cv_uid_t_len from site files
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
X-List-Received-Date: Sun, 31 Jul 2011 00:28:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/30/2011 02:03 PM, Khem Raj wrote:
> On Saturday, July 30, 2011 07:39:47 PM Phil Blundell wrote:
>> On Sat, 2011-07-30 at 10:25 -0700, Khem Raj wrote:
>>> On Wednesday, July 27, 2011 03:56:45 PM Tom Rini wrote:
>>>> We were just setting this to the assumed default.  If anything, this
>>>> belongs in the libc files if we must set it.
>>>
>>> uid_t is not a libc controlled define. Its kernel controlled (though
>>> kernel- headers)
>>
>> No, that's incorrect.  The uid_t that applications see is controlled by
>> libc and decoupled from __kernel_uid_t.  There is logic in glibc to
>> convert between types if necessary.
> 
> uclibc passes on whatever kernel defines it to. rethinking, probably libc is 
> ok for it.

And again, this is a "if we feel we must".  This patch just drops it
from the files.

-- 
Tom Rini
Mentor Graphics Corporation


