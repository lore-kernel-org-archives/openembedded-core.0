Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE5B79B9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2104; q=dns/txt; s=iport;
	t=1539352984; x=1540562584;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=shZflLpVYvLvhSj/h2w70MM3rny8g0+6594E/ajK3DY=;
	b=GRqCxRjCOUIapzZo15b6jAqXaXWuexmHWpyE/cQ/Z6F2+cWkXUE2PEtu
	88TsinhhD5/CMo4bCd4d/jWw7qMtTg5xGmr29MuAjV4JLI28r0wdrLcFG
	N8Emy/SaBcBH5NrHaFaHOehLBL85XOIVfW16jZ+hXoEfmXvzWY2O432X6 g=;
X-IronPort-AV: E=Sophos;i="5.54,372,1534809600"; 
   d="scan'208";a="7192424"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2018 14:03:02 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id w9CE31b5010109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Oct 2018 14:03:02 GMT
To: "Burton, Ross" <ross.burton@intel.com>
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
From: Ruslan Bilovol <rbilovol@cisco.com>
Message-ID: <f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
Date: Fri, 12 Oct 2018 17:03:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-2.cisco.com
Cc: Andrii Bordunov <aborduno@cisco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why openembedded-core mailing list is now author of some patches?
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
X-List-Received-Date: Fri, 12 Oct 2018 14:03:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

[CCing more affected people]

On 10/12/2018 04:13 PM, Burton, Ross wrote:
> Ironically, this mail is From: Ruslan Bilovol via Openembedded-core.

:D

> 
> This is basically due to SPF, and people sending email from
> non-authoritive hosts.  Concrete example: Richard Purdie's mail comes
> from a machine which the linuxfoundation.org SPF records doesn't
> recognise as an authorised sender.

Hmm.. I've just sent an email from rbilovol@cisco.com to another Gmail
address, and Gmail says SPF checks passed:
  SPF:	PASS with IP 173.38.203.51
  DKIM:	'PASS' with domain cisco.com
  DMARC:	'PASS'

Does it mean oe-core mailing list's software is incorrectly configured,
or there is something else missing on @cisco.com side?

>   If mailing list software wasn't
> such a pain we could stop it doing that, but apparently it is.
> Another option would be to patch git to recognise a "via" From and use
> the Reply-to field.
> 
> We should have a pre-commit hook to be sure that any instances of this
> are caught and fixed before being pushed though.

Yes, that would be great.

Thanks,
Ruslan

> 
> Ross
> On Fri, 12 Oct 2018 at 14:08, Ruslan Bilovol via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
>>
>> Hi all,
>>
>> Looking at OE-core history, I see that in some cases
>> patch' author is incorrect, and actually is
>> set to openembedded-core@lists.openembedded.org:
>> http://git.openembedded.org/openembedded-core/log/?qt=author&q=openembedded-core%40lists.openembedded.org
>>
>> Moreover, in patchwork many of these patches are mapped
>> incorrectly to Andrii Bordunov who isn't actually
>> related to most of them:
>> https://patchwork.openembedded.org/project/oe-core/patches/?submitter=12919&state=*&q=&archive=both&delegate=
>>
>> So is something broken in OE mailing list/patchwork?
>>
>> Thanks,
>> Ruslan
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

