Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U3213-0001f0-7G
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 11:14:17 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 621C8F811E0; Wed,  6 Feb 2013 02:58:19 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9B1D9F81199;
	Wed,  6 Feb 2013 02:58:18 -0700 (MST)
Message-ID: <5112293F.4080503@mlbassoc.com>
Date: Wed, 06 Feb 2013 02:58:23 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
	<5110DF13.7010502@mlbassoc.com>
	<CAP9ODKr6tGoU-jYdszVerCvMYn-gR4thnbL4WYnHroFw_ZUmjg@mail.gmail.com>
In-Reply-To: <CAP9ODKr6tGoU-jYdszVerCvMYn-gR4thnbL4WYnHroFw_ZUmjg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] netbase: split up in netbase and init-ifupdown
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 10:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-02-05 06:14, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 8:29 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2013-02-04 08:12, Constantin Musca wrote:
>>>
>>> - netbase should only include etc-rpc, etc-protocols, etc-services
>>> and the hosts file
>>> - the init script/configuration files should be in another package
>>> (init-ifupdown)
>>
>>
>> What is the benefit of such an intrusive change?
>> Why not just have the netbase recipe create a separate package?
>
> Many images use different network managers so ifupdown might not be
> need; thus the split. Is it what you're concerned about?

The massive renames and new recipe.  I think it should be possible
to split the ifup/ifdown functions and keep the 'netbase' recipe.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


