Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Raadq-0002JZ-2M for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 23:16:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RaaX9-0003C0-Qk for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 23:09:11 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 23:09:11 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 23:09:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 14 Dec 2011 02:07:44 +0400
Message-ID: <jc8idq$j9d$1@dough.gmane.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-9-git-send-email-dbaryshkov@gmail.com>
	<1323805698.25491.12.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <1323805698.25491.12.camel@ted>
Subject: Re: [PATCH 9/9] libatomic-ops: drop directory with documentation to remove QA warning
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
X-List-Received-Date: Tue, 13 Dec 2011 22:16:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 11:48 PM, Richard Purdie wrote:
> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>> ---
>>   .../pulseaudio/libatomics-ops_1.2.bb               |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
>> index 184c167..f81aeb6 100644
>> --- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
>> +++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
>> @@ -26,5 +26,6 @@ ARM_INSTRUCTION_SET = "arm"
>>   inherit autotools pkgconfig
>>
>>   do_install_append() {
>> -	mv ${D}${datadir}/libatomic_ops ${D}${datadir}/libatomic-ops || true
>> +	# those contain only docs, not necessary for now.
>> +	rm -rf ${D}${datadir}/libatomic_ops || true
>>   }
>
> Shouldn't we move that to docdir/${PN}?

I'm thinking another way: why is the recipe called libatomicS-ops (note 
the S) if the upstream source is named as libatomc_ops (so it should 
become libatomic-ops). Then documentation will land in the proper place 
after the mv command which is currently in place.

-- 
With best wishes
Dmitry



