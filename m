Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Sep 2019 16:07:11 UTC
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 93F4A6BCDC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=642; q=dns/txt; s=iport;
	t=1567786033; x=1568995633;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=GzSiVlgCe4v9uEwcAmwE4sUQSLNBCf7j3xNc3MNunr4=;
	b=eCCBBtyTICYHvwRWsEOhxFPch0sOJLr/PnVJeYgWXr58ua+baEz3uOA4
	phHCmNZ8W3c5W3bwkNI9twzZ7Hxg6elpxvqFeHjXOeSlLX2/ybtrUIDrg
	9msNZtBiXxovbmcgyNXZ/GT+AVI9M39zguQFRZAY1tLcHE+bwyROxVAI+ s=;
X-IronPort-AV: E=Sophos;i="5.64,473,1559520000"; d="scan'208";a="16397436"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	06 Sep 2019 16:00:03 +0000
Received: from [10.63.15.136] ([10.63.15.136]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id x86G02gR009861
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 6 Sep 2019 16:00:03 GMT
To: Ross Burton <ross.burton@intel.com>, "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20190904104144.3530-1-dzagorui@cisco.com>
	<91c7e151-9b37-9017-365c-a0fb3a0402fa@intel.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <f71a860b-2b01-41db-786f-ffd56876483b@cisco.com>
Date: Fri, 6 Sep 2019 19:00:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <91c7e151-9b37-9017-365c-a0fb3a0402fa@intel.com>
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.136, [10.63.15.136]
X-Outbound-Node: aer-core-2.cisco.com
Subject: Re: [PATCH] gzip: add nativesdk support
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
X-List-Received-Date: Fri, 06 Sep 2019 16:07:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/4/19 2:01 PM, Ross Burton wrote:
> On 04/09/2019 11:41, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at 
> Cisco) via Openembedded-core wrote:
>> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> 
> Can you check your mailer configuration, as the From: is the mailing 
> list, not your email address.  This means the patch doesn't get your 
> authorship.

This is OE mailing list specific issue, we can't fix it unfortunately.

This was discussed multiple times before:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280394.html

Richard, do you have any updates on this issue?

Thanks,
Ruslan

