Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF7D078504
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 18:42:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8DIg8Yb017568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Sep 2017 11:42:08 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 11:42:07 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1505315706-8937-1-git-send-email-mark.hatle@windriver.com>
	<1505315706-8937-2-git-send-email-mark.hatle@windriver.com>
	<CAP9ODKofch41F2YHW4TB==fN8KKUFiEPuPD9C1_agABc3JwOnQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0367e0b1-b1a0-1ef9-3448-7f567c2ca0f3@windriver.com>
Date: Wed, 13 Sep 2017 13:42:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKofch41F2YHW4TB==fN8KKUFiEPuPD9C1_agABc3JwOnQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: Add default FILESYSTEM_PERMS_TABLES
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
X-List-Received-Date: Wed, 13 Sep 2017 18:42:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/13/17 12:57 PM, Otavio Salvador wrote:
> On Wed, Sep 13, 2017 at 12:15 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> If FILESYSTEM_PERMS_TABLES was not defined, the default was selected by the
>> packages.bbclass.  This made it difficult for a recipe or layer to 'append'
>> to the default.
>>
>> Copy the default into the bitbake.conf, allowing future _append and += style
>> actions.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> 
> Couldn't package.bbclass one to be dropped?
> 
> 

Yes, I didn't do it at present because I was worried it could affect someone and
it's after feature freeze.

If RP is not concerned about this, I can create a V2 that also removes the piece
of package.bbclass.

--Mark

