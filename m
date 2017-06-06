Return-Path: <jan.kiszka@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0E277DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 10:30:55 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v56AUu9J001739
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 12:30:56 +0200
Received: from md1f2u6c.ww002.siemens.net ([146.254.78.13])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v56AUtVw025266
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 12:30:56 +0200
Resent-From: Jan Kiszka <jan.kiszka@siemens.com>
Resent-To: openembedded-core@lists.openembedded.org
Resent-Date: Tue, 6 Jun 2017 12:30:55 +0200
Resent-Message-ID: <917ee22b-4a20-3287-d7b9-9a199d6ca0d1@siemens.com>
Resent-User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1
	Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
To: Martin Kelly <mkelly@xevo.com>, <openembedded-core@lists.openembedded.org>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
Date: Tue, 6 Jun 2017 12:11:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
In-Reply-To: <4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 06 Jun 2017 10:30:57 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-01 02:17, Martin Kelly wrote:
> On 05/02/2017 01:41 AM, Martin Kelly wrote:
>> On 04/30/2017 08:28 AM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> The upstream init script uses SIGUSR2 to terminate that daemon because
>>> SIGTERM is ignored. As the killproc function does not support specifying
>>> a signal, switch to start-stop-daemon. Drop the retry loop because
>>> SIGUSR2 is lethal for agent.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Thanks! I noticed this bug and was planning to look into it, but it
>> looks like you found the issue first! This was bringing shutdowns to a
>> crawl for me.
> 
> I just noticed, I think we need to fix the same bug in the systemd
> service script too.

Does this block this patch, or should this be done in a separate one? I
noticed that it's still not merged.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

