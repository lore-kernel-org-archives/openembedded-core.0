Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 1126 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Aug 2017 10:23:57 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 65418785F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:23:56 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v7IA5BM0003161
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 18 Aug 2017 12:05:11 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id v7IA5APD030506
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 Aug 2017 12:05:10 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
Date: Fri, 18 Aug 2017 12:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503048946.32591.0.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 18 Aug 2017 10:23:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

OK thank You, so please merge it into these branches.

Regards,
Andrej

On 08/18/2017 11:35 AM, Richard Purdie wrote:
> On Fri, 2017-08-18 at 08:26 +0200, Andrej Valek wrote:
>> Yes, for actual branch is not required. But for branches like krogoth
>> and morty, where HOSTTOOLS is not implemented, is this necessary.
> 
> Lets just apply this to krogoth/morty then...
> 
> Cheers,
> 
> Richard
> 

