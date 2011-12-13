Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RaVct-0002jf-Hj for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:54:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RaVWD-0006j1-8d for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:47:53 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:47:53 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:47:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 13 Dec 2011 20:46:23 +0400
Message-ID: <jc7vj9$548$1@dough.gmane.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793374.24417.164.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <1323793374.24417.164.camel@phil-desktop>
Subject: Re: [PATCH 1/9] kernel.bbclass: compile kernel and modules in a single task
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
X-List-Received-Date: Tue, 13 Dec 2011 16:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 08:22 PM, Phil Blundell wrote:
> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>> -		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>> +		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>
> Why did you remove PARALLEL_MAKE?

Because PARALLEL_MAKE is already defined for do_compile() task

-- 
With best wishes
Dmitry



