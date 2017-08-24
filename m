Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 3892478416
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:23:40 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v7OENd4e019610
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 24 Aug 2017 16:23:39 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v7OENcTl004021
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Aug 2017 16:23:38 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
	<c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
	<dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
	<1abbf9f3-8f0e-3fba-26f5-114f049cb977@siemens.com>
	<1503492285.32591.152.camel@linuxfoundation.org>
	<cda65980-6ae8-426d-72e3-0e016d9fe315@gmail.com>
	<f1547a4c-ad34-2b9d-955a-1c3047e61cbe@siemens.com>
	<1503584213.32591.192.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <8994061e-1012-1a4d-e6d7-47e978646841@siemens.com>
Date: Thu, 24 Aug 2017 16:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503584213.32591.192.camel@linuxfoundation.org>
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Thu, 24 Aug 2017 14:23:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I have seen your patch, but it is not fixing my described issue.
A command update-ca-certificates will be not available due to missing
native stuff.

Regards,
Andrej

On 08/24/2017 04:16 PM, Richard Purdie wrote:
> On Thu, 2017-08-24 at 12:38 +0200, Andrej Valek wrote:
>> What about enabling ASSUME_PROVIDED functionality also for nativesdk-
>> components?
> 
> That would mean something quite different, that the dependency was
> provided on the system the nativesdk package ended up running on?
> 
> Since I've spent the time to understand the problem, I wrote and sent
> out a patch which I think should address the issues you're seeing?
> 
> Cheers,
> 
> Richard
> 
> 

