Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 587 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Oct 2018 13:07:11 UTC
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id A8E7179B42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=589; q=dns/txt; s=iport;
	t=1539349633; x=1540559233;
	h=from:subject:to:cc:message-id:date:mime-version:
	content-transfer-encoding;
	bh=3cCKnBj4/QiJ+snwXxwgL2Pzj87pCrBevYwRULqmBvk=;
	b=dV/2xLQcK84eMtCx5u1M3V3R0MUXvIbp0LXgOx20tH9xp+3oaRBrBRcA
	gwYcveedM5WVb725RSf/4XezQA+1peNpSoiYMH15V5zPbRmWMUct2PfIS
	R2THMbfm5TjCBsXT75COIHqJt7A0+0EAvkqXwe82TnYCr8Tc0RG5grdU+ g=;
X-IronPort-AV: E=Sophos;i="5.54,372,1534809600"; 
   d="scan'208";a="7187579"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2018 12:57:24 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTPSA id w9CCvNWW002042
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Oct 2018 12:57:24 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
Date: Fri, 12 Oct 2018 15:57:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-4.cisco.com
Cc: Andrii Bordunov <aborduno@cisco.com>
Subject: Why openembedded-core mailing list is now author of some patches?
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
X-List-Received-Date: Fri, 12 Oct 2018 13:07:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

Looking at OE-core history, I see that in some cases
patch' author is incorrect, and actually is
set to openembedded-core@lists.openembedded.org:
http://git.openembedded.org/openembedded-core/log/?qt=author&q=openembedded-core%40lists.openembedded.org

Moreover, in patchwork many of these patches are mapped
incorrectly to Andrii Bordunov who isn't actually
related to most of them:
https://patchwork.openembedded.org/project/oe-core/patches/?submitter=12919&state=*&q=&archive=both&delegate=

So is something broken in OE mailing list/patchwork?

Thanks,
Ruslan

