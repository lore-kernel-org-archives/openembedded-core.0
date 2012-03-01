Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S35lo-00061u-M2
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 14:10:08 +0100
Received: by wibhq12 with SMTP id hq12so336250wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 05:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.14.37 as permitted sender)
	client-ip=10.180.14.37; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.14.37 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.14.37])
	by 10.180.14.37 with SMTP id m5mr10308615wic.19.1330606899134 (num_hops
	= 1); Thu, 01 Mar 2012 05:01:39 -0800 (PST)
Received: by 10.180.14.37 with SMTP id m5mr8243716wic.19.1330606899056;
	Thu, 01 Mar 2012 05:01:39 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm41652053wib.1.2012.03.01.05.01.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 05:01:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330606209.31767.6.camel@ted>
Date: Thu, 1 Mar 2012 14:01:28 +0100
Message-Id: <69F3B512-D649-4412-9505-D16E64D4F00D@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
	<C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
	<1330602916.31767.3.camel@ted>
	<8F7AFDB0-51BE-4C02-AAEF-5C82EE7ED671@dominion.thruhere.net>
	<1330606209.31767.6.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlFumXj8n9q2gew4RkiMOuQG5+YzgMjkfaxzx5F0fpq8Ky96TjVF9FaHvH1KVvJSoiAuAAE
Subject: Re: [PATCH] libx11-trim/diet: Add RPROVIDES for libx11-dev
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
X-List-Received-Date: Thu, 01 Mar 2012 13:10:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 1 mrt. 2012, om 13:50 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-03-01 at 13:11 +0100, Koen Kooi wrote:
>> Op 1 mrt. 2012, om 12:55 heeft Richard Purdie het volgende geschreven:
>> 
>>> We have things that depend on libx11-dev, this patch ensures the -trim
>>> and -diet versions provide it. This resolves some multiple providers
>>> warnings.
>>> 
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> 
>>> Koen/Saul: This is how I think we should be fixing the libx11 issues...
>> 
>> I'm going to say something shockingly out of character: I think the
>> trim/diet/normal seperation should be done with DISTRO_FEATURES +
>> PACKAGECONFIG. Due to shlib naming the 3 recipes cannot coexist in the
>> feeds anyway.
> 
> I agree although in this case, PACKAGECONFIG should be enough. 
> 
> I propose we fix the immediate problem as per the patch and then look at
> converting to PACKAGECONFIG.

Agreed.

regards,

Koen


