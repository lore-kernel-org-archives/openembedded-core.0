Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Ri8rX-0008JV-2U
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:13:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q03I65lh020439
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jan 2012 10:06:05 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 Jan 2012 10:06:05 -0800
Message-ID: <4F03438F.3090702@windriver.com>
Date: Tue, 3 Jan 2012 12:06:07 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<09b1dc8bd886c8cd2a5d4085d8bb4b73ece1f5b0.1325571069.git.sgw@linux.intel.com>
	<1325592886.24417.350.camel@phil-desktop>
In-Reply-To: <1325592886.24417.350.camel@phil-desktop>
Subject: Re: [CONSOLIDATED PULL 012/113] base.bbclass: Allow buildstats to be optionally supplied
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
X-List-Received-Date: Tue, 03 Jan 2012 18:13:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/12 6:14 AM, Phil Blundell wrote:
> On Mon, 2012-01-02 at 22:18 -0800, Saul Wold wrote:
>> From: Mark Hatle<mark.hatle@windriver.com>
>>
>> Buildstats should be allowed to be optionally enabled.  It's
>> recommended that it be enabled via the USER_CLASSES setting.
>>
>> Alternatively it could be enabled via the INHERIT_DISTRO or
>> similar mechanism.
>>
>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>
> I don't think the short summary of this patch gives a very clear
> indication of what it's doing.  The terminology "optionally supplied"
> makes it sound as though you're talking about some sort of add-on data
> file which can be enabled.  Whereas, what the patch seems actually to be
> doing is removing the unconditional inherit of buildstats (i.e. turning
> it off for almost everyone who has it on today) and adding a suggestion
> in local.conf.sample as to how it might be turned on again.

Perhaps enabled is a better word then "supplied" in this case?

I didn't comment that it was removing the unconditional inherit as I thought 
that was obvious..

Saul -- can you change the short summary or should I resend it?

> (That said, I do think the intent of this patch is a good one; it's been
> a long-standing source of irritation to me that disabling buildstats is
> so awkward at present.)

This was causing a problem for me as well, thus the solution.  Seemed simply 
enough and beneficial.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



