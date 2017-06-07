Return-Path: <jan.kiszka@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id B04C0781AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:34:59 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v57GYtG6010455
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 7 Jun 2017 18:34:55 +0200
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v57GYtFL032334;
	Wed, 7 Jun 2017 18:34:55 +0200
To: Martin Kelly <mkelly@xevo.com>, "Burton, Ross" <ross.burton@intel.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1ea261d3-014e-4819-c9d3-2de695313f52@siemens.com>
Date: Wed, 7 Jun 2017 18:34:55 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Wed, 07 Jun 2017 16:35:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-07 18:33, Martin Kelly wrote:
> On 06/07/2017 09:08 AM, Burton, Ross wrote:
>>
>> On 6 June 2017 at 18:28, Martin Kelly <mkelly@xevo.com
>> <mailto:mkelly@xevo.com>> wrote:
>>
>>     I sent a separate patch for fixing the systemd issue, so I think we
>>     can merge the two patches separately (they're both needed):
>>
>>     https://patchwork.openembedded.org/patch/140355/
>>     <https://patchwork.openembedded.org/patch/140355/>
>>
>>     Neither of our patches have been merged yet.
>>
>>
>> Sorry, somehow slipped through the net.
>>
>> This patch doesn't apply as it's been corrupted by the mailer.  Please
>> use git-send-email instead of copy/pasting (I've managed to apply it
>> manually as it's a simple patch this time).
>>
>> Ross
>>
> 
> Which patch are you referring to? I used git send-email for the systemd
> patch, and it applies just fine for me on OE-core master (using patch -p1).

Wasn't you, was mine. :)

Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

