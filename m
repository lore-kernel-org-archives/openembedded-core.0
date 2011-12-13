Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RaVis-0003Ox-NM for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 18:00:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RaVcB-0001YW-JW for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:54:03 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:54:03 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:54:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 13 Dec 2011 20:52:35 +0400
Message-ID: <jc7vut$8c2$1@dough.gmane.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-5-git-send-email-dbaryshkov@gmail.com>
	<1323793676.24417.165.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <1323793676.24417.165.camel@phil-desktop>
Subject: Re: [PATCH 5/9] Move check that all installed files are shipped into insane.bbclass
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
X-List-Received-Date: Tue, 13 Dec 2011 17:00:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 08:27 PM, Phil Blundell wrote:
> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>> +def packages_qa_unshipped_files(d):
>> +    skip = (d.getVar('INSANE_SKIP_${PN}', True) or "").split()
>> +    if "unshipped" in skip:
>> +        return False

Hmm. This really should be "return True". Should I send the fixed 
version of this patch or this change will be picked by appliers?

>
> 	[...]
>
>> +    if not packages_qa_unshipped_files(d):
>> +        shipped_sane = False
>>
>> -    if not walk_sane or not rdepends_sane:
>> +    if not walk_sane or not rdepends_sane or not shipped_sane:
>>           bb.fatal("QA run found fatal errors. Please consider fixing them.")
>
> Is that really what you want?
>
> p.


-- 
With best wishes
Dmitry



