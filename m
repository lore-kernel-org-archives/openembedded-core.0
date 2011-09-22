Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R6iz4-0004o5-Pp for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 15:06:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R6itv-0000Xp-OW for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 15:01:15 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 15:01:15 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 15:01:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 22 Sep 2011 17:00:11 +0400
Message-ID: <j5fbi7$opp$1@dough.gmane.org>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>	<CAP9ODKqwxc7TcZhgNtuZfan_Kbdn2hJ7UELfy=BeFtGS3iGKGQ@mail.gmail.com>	<j5f9i0$9uf$1@dough.gmane.org>
	<95C58349-35C4-4027-BDEA-7841ED3B4A16@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <95C58349-35C4-4027-BDEA-7841ED3B4A16@dominion.thruhere.net>
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Thu, 22 Sep 2011 13:06:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2011 04:35 PM, Koen Kooi wrote:
>
> Op 22 sep. 2011, om 14:25 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>
>> On 09/18/2011 02:23 AM, Otavio Salvador wrote:
>>> I have sent this in July and it was nacked. See at
>>> https://github.com/OSSystems/oe-core/commit/5c53cbf951a11ed92fb2ad0837991db256c11489
>>
>> Answering the original question by Saul:
>> A possible better question is why perf-dbg is getting generated and what's in it?
>>
>> perf and perf-dbg are generated to contain perf tool if it's not directly enabled (AFAIK), but you can compile it by running make in tools/perf. It has some additional depends (like binutils-dev, elfutils-dev, news-dev, etc., so it's not enabled by default. Probably we should enable it though.
>
> the oe core kernel.bbclass builds perf by default

according to kernel.bbclass: "perf must be enabled in individual kernel 
recipes"

-- 
With best wishes
Dmitry




