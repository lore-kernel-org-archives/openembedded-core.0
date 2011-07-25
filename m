Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlR4Y-0002Gd-1y
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:44:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PJe1v6000924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:40:01 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 25 Jul 2011 12:40:00 -0700
Message-ID: <4E2DC68F.9010604@windriver.com>
Date: Mon, 25 Jul 2011 14:39:59 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>	<1311357628.2344.153.camel@rex>
	<4E29BE22.5060002@mentor.com> <4E2DBC30.9070808@windriver.com>
	<4E2DC535.9030406@mentor.com>
In-Reply-To: <4E2DC535.9030406@mentor.com>
Subject: Re: [PATCH 5/3] conf/machine/include: Start to fill out architecture specific tune include files and tune features
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
X-List-Received-Date: Mon, 25 Jul 2011 19:44:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/25/11 2:34 PM, Tom Rini wrote:
> On 07/25/2011 11:55 AM, Mark Hatle wrote:
>> On 7/22/11 1:14 PM, Tom Rini wrote:
>>> On 07/22/2011 11:00 AM, Richard Purdie wrote:
>>>> These changes revolve around the idea of tune features. These are represented by
>>>> 'flag' strings that are included in the TUNE_FEATURES variable.
>>>>
>>>> Any string included in TUNE_FEATURES should also add a TUNEVALID[<name>] entry so
>>>> we can know which flags are available in TUNE_FEATURES and have documentation about
>>>> what the flags do. We will add sanity code to error if flags are listed in
>>>> TUNE_FEATURES but are not documented in TUNEVALID.
>>>>
>>>> A given tune configuration will want to define one or more predetermined sets of
>>>> _FEATURE flag lists. These are defined in the form TUNE_FEATURES_tune-<name>.
>>>> For defined tune configuation, <name> should be added to the AVAILTUNE list so that
>>>> we can determine what tune configurations are available. Flags cannot be used in this
>>>> case as with TUNEVALID since its useful to be able to build up tune lists from other
>>>> TUNE_FEATURES_tune-yyy options.
>>>>
>>>> A given tune configuration may also define PACKAGE_EXTRA_ARCHS_tune-<name> and
>>>> BASE_LIB_tune-<name> to control the multilib location. All options can be overridden
>>>> by the distro or local user configuration.
>>>>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> As a specific nit, we can't use x86_64 in OVERRIDES (using the normal
>>> mechanism need base_contains(...).  Can we switch to calling it amd64
>>> ala Debian/Ubuntu?  Aside from that, as I told Mark the other day, this
>>> looks good to me.
>>>
>>
>> I actually prefer "x86-64" I think that is a reasonable compromise between the
>> x86_64 naming and the need to not use "_".
> 
> That causes other problems, no?  Top of my head would be that deb/ipk
> doesn't allow a dash in that field.  Could be mistaken tho...
> 

I expect the packaging system to have to have change the fields to suite their
specific needs.  I know I have search/replace items similar to that in RPM
because there are constructs that RPM doesn't support that deb and ipk do.

--Mark


