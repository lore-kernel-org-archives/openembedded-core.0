Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3D42B60722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:12:19 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id wq6so101708779pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 08:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Ki0Ie8D1LRvqdlAr/8YtJbDYzMDD4BGAfHZmp25qx5Y=;
	b=BSO4SOt7woPGogFK8qRKtrG6+6edTjs4PeTif6Fhkt/9D1gwOK1hcUPkDTF4INVOxQ
	1DXXB+IJwwQkK1Hkik0uE06VY+VWTxceZ0KJbFyq2KuU7I4odEH8qm0A9W1nBi4LJahz
	WZ+cw1wq2HITDMNN6jSL3C0/4zOifj8spO1sTl2fboAzn9B0Nxbzhu7m20qEbyhtBcfb
	7bZs2CgHZ7Nd34z4voGIQyCdQBsz0aXWI27KVlwv6H09tJ4QhMPFehZ4EaB+9bYgm/MK
	87LJd8bUUVbKWlQg0Ash8Blj8AYN2A+TB9i4cdOSqy6kaa6w56mSBrWfNbnNK4m2J9WK
	hGmQ==
X-Received: by 10.66.190.66 with SMTP id go2mr28823199pac.114.1450714340027;
	Mon, 21 Dec 2015 08:12:20 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:6441:8ddb:f01a:d29b?
	([2601:202:4000:1239:6441:8ddb:f01a:d29b])
	by smtp.googlemail.com with ESMTPSA id
	b26sm35696594pfd.6.2015.12.21.08.12.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 08:12:18 -0800 (PST)
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
	<5671D1FE.7010306@collabora.co.uk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <567824D6.6050106@gmail.com>
Date: Mon, 21 Dec 2015 08:12:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5671D1FE.7010306@collabora.co.uk>
Subject: Re: [PATCH][jethro][fido][ 00/15] Libxml2: multiple security fixes
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
X-List-Received-Date: Mon, 21 Dec 2015 16:12:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 12/16/2015 01:05 PM, Joshua Lock wrote:
> Hi Armin,
> 
> On 05/12/15 19:35, Armin Kuster wrote:
>> Each CVE is an independant patch so they can be easily merged to other
>> distros
>> and/or stable branches.
> 
> As others have mentioned elsewhere I think this would be much nicer if
> each patch was added to the SRC_URI in the same commit which introduces
> the patch.
> 
> In addition, I believe it would also make sense to have 2 patches for
> the same CVE applied at once?
> 
> Ideally this series would be 11 patches, each of which updated SRC_URI
> and added the patch files to fix a single CVE.
> 

That make sense to me.

> What do you think? 

I will have more free time soon so I can rend the series in a few days.

I am more than happy to take this series and make the
> suggested change (11 commits, each editing SRC_URI) myself before
> requesting my fido-next branch be merged?

- armin
> 
> Thanks,
> 
> Joshua
> 
>> I have included two previous CVE's sent for jethro which can be ignored.
>> I put the CVE's in order as there where fixed upstream.
>>
>> Armin Kuster (15):
>>    libxml2: security fix CVE-2015-7941-1
>>    libxml2: security fix CVE-2015-7941-2
>>    libxml2: security fix CVE-2015-8317
>>    libxml2: security fix CVE-2015-7942
>>    libxml2: security fix CVE-2015-7942-2
>>    libxml2: security fix CVE-2015-8317
>>    libxml2: security fix CVE-2015-7498
>>    libxml2: security fix CVE-2015-7497
>>    libxml2: security fix CVE-2015-7499-1
>>    libxml2: security fix CVE-2015-7499-2
>>    libxml2: depend fix security issue CVE-2015-7500
>>    libxml2: security fix CVE-2015-7500
>>    libxml2: security fix CVE-2015-8242
>>    libxml2: security fix CVE-2015-5312
>>    libxml2: multiple security fixes.
>>
>>   meta/recipes-core/libxml/libxml2.inc               |  14 +++
>>   ...-2015-5312-Another-entity-expansion-issue.patch |  39 ++++++
>>   ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch |  40 ++++++
>>   ...00-Fix-memory-access-error-due-to-incorre.patch | 131
>> +++++++++++++++++++
>>   ...2015-8035-Fix-XZ-compression-support-loop.patch |  38 ++++++
>>   ...42-Buffer-overead-with-HTML-parser-in-pus.patch |  49 ++++++++
>>   ...n-name-parsing-at-the-end-of-current-inpu.patch | 138
>> +++++++++++++++++++++
>>   ...ssing-entities-after-encoding-conversion-.patch |  89 +++++++++++++
>>   ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch |  88 +++++++++++++
>>   ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch |  43 +++++++
>>   ...top-parsing-on-entities-boundaries-errors.patch |  39 ++++++
>>   ...leanup-conditional-section-error-handling.patch |  56 +++++++++
>>   ...ror-in-previous-Conditional-section-patch.patch |  35 ++++++
>>   ...iation-of-overflow-in-Conditional-section.patch |  39 ++++++
>>   ...ng-early-on-if-encoding-conversion-failed.patch |  42 +++++++
>>   15 files changed, 880 insertions(+)
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch
>>
>>   create mode 100644
>> meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch
>>
>>
> 

