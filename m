Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S5uzw-0000ke-Do
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 09:16:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Mar 2012 00:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="119337699"
Received: from unknown (HELO [10.255.15.127]) ([10.255.15.127])
	by orsmga002.jf.intel.com with ESMTP; 09 Mar 2012 00:07:44 -0800
Message-ID: <4F59BA50.3010309@linux.intel.com>
Date: Fri, 09 Mar 2012 00:07:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331175070-12257-1-git-send-email-obi@opendreambox.org>
	<4F5926DC.2030705@opendreambox.org>
In-Reply-To: <4F5926DC.2030705@opendreambox.org>
Subject: Re: [PATCH][RFC] bitbake.conf: use empty SRC_URI by default
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
X-List-Received-Date: Fri, 09 Mar 2012 08:16:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2012 01:38 PM, Andreas Oberritter wrote:
> On 08.03.2012 03:51, Andreas Oberritter wrote:
>> * Otherwise, recipes that only append to SRC_URI instead of
>>    overwriting it will get the full path of the recipe written
>>    into the Source: field of the package.
>>
>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>> ---
>> * I haven't tested this yet, I don't know whether there
>>    are any caveeats. What's the purpose of having ${FILE}
>>    in there, anyway?
>
> Richard, did you commit this by accident? In the meantime I've started a
> clean build with this patch applied and noticed eglibc-locale failing,
> because opkg-build complains about a missing "Source" field.
>
Agreed, this seems to have been committed by accident, we see the same 
failures on the Autobuilder.

Sau!

> Regards,
> Andreas
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


