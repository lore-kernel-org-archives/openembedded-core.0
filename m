Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1ShMzC-0001fm-UQ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:38:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5KFReup001706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jun 2012 08:27:40 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 20 Jun 2012 08:27:39 -0700
Message-ID: <4FE1EBDF.8040703@windriver.com>
Date: Wed, 20 Jun 2012 11:27:27 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
	<6e8878c5f3598b60d364e2656af74e9f712770ca.1340201997.git.bruce.ashfield@windriver.com>
	<1472036.VpViiY8Ijl@helios>
In-Reply-To: <1472036.VpViiY8Ijl@helios>
Cc: saul.wold@intel.com, liang.li@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Wed, 20 Jun 2012 15:38:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-20 11:25 AM, Paul Eggleton wrote:
> On Wednesday 20 June 2012 10:31:40 Bruce Ashfield wrote:
>> From: Liang Li<liang.li@windriver.com>
>> ...
>> +EXTRA_OEMAKE = \
>> +		'-C ${S}/tools/perf \
>> +		O=${B} \
>> +		CROSS_COMPILE=${TARGET_PREFIX} \
>> +		ARCH=${ARCH} \
>> +		CC="${CC}" \
>> +		AR="${AR}" \
>> +		prefix=/usr \
>> +		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
>
> Coincidentally, I've just noticed that the current (kernel integrated) perf
> package can sometimes depend on gtk+/glib-2.0 or not depending on whether
> these are available when the kernel is built. Presumably NO_GTK2=1 above
> disables gtk+ support and thus would prevent this?

That was the plan. It hard disables it for now, and once we have
a more flexible package, we can add some optional dependencies and
features back into the equation.

Cheers,

Bruce

>
> Cheers,
> Paul
>



