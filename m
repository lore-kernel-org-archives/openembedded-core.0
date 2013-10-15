Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CA7536CABC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:50:06 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VVySG-0001Qw-AI from Paul_Woegerer@mentor.com ;
	Mon, 14 Oct 2013 23:50:08 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Oct 2013 23:50:06 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Tue, 15 Oct 2013 07:50:04 +0100
Message-ID: <525CE59B.4050600@mentor.com>
Date: Tue, 15 Oct 2013 08:50:03 +0200
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <525C13C0.4020805@mentor.com> <1381768366.19281.64.camel@empanada>
In-Reply-To: <1381768366.19281.64.camel@empanada>
X-OriginalArrivalTime: 15 Oct 2013 06:50:06.0801 (UTC)
	FILETIME=[C8861C10:01CEC972]
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: lttng-modules may trigger deadlock in the timekeeping subsystem with Linux <= 3.10.13, <= 3.11.2
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
X-List-Received-Date: Tue, 15 Oct 2013 06:50:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 10/14/2013 06:32 PM, Tom Zanussi wrote:
> On Mon, 2013-10-14 at 17:54 +0200, Woegerer, Paul wrote:
>> lttng-modules 2.3.2 contains preprocessor-code that makes sure that
>> building of lttng-modules fails for the unlucky combinations of kernel
>> and lttng-modules. The problem is when we update our lttng-modules 2.3.0
>> to 2.3.2 then we would have lttng-modules failing to build for our qemu*
>> MACHINEs.
>>
>> Any recommendations on how we should address this ?
> Probably just get Bruce to update linux-yocto-3.10 to 3.10.14, 

That would be the ideal solution.

--
Paul

>
> Tom
>
>> Many thanks,
>> Paul
>>
>


-- 
Paul Woegerer, SW Development Engineer
Sourcery Analyzer <http://go.mentor.com/sourceryanalyzer>
Mentor Graphics, Embedded Software Division


