Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 577 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Mar 2018 06:57:02 UTC
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 35F5578979
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1921; q=dns/txt; s=iport;
	t=1520319425; x=1521529025;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=4E6sySDffGSilwDeEctnCzBJw6T000MgglnoPvjdDCo=;
	b=aH84iQRUqL79m8nbb0MS8Yp9GLRZHPESV+JJVtfpuyeSAatQnTZYq5P4
	4q+uOPA8c6slmGX2u3ZCs5dHZGyDg1WqegPTZQnWjusGcRABTqMz/AGm+
	N+4qk2WnsXVXmJpLGJFe+d7dE7jhLhv040FgfzqyJmtcLsNSO0HwHbnyj I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BbAgBPOJ5a/4YNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnAojmyNBIFbJ4EWlkkKGAuEPk8CgnghOBQBAgEBAQEBAQJ?=
	=?us-ascii?q?rJ4UjAQEBAwEBATYCNAsFCwsSBi4nASEOBhOFEwgQqmiIaYImhS2CLoM9NYJ4g?=
	=?us-ascii?q?y4BBIdbBI5xi3YJhlSFf4ZhjEOJfYcsAgQLAhkBgS41IYFSTSMVOoJDCYIoHII?=
	=?us-ascii?q?cHzeMbQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.47,430,1515456000"; d="scan'208";a="79303862"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 06:47:26 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id w266lP66023040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 6 Mar 2018 06:47:26 GMT
Date: Mon, 5 Mar 2018 22:47:25 -0800 (PST)
From: Victor Kamensky <kamensky@cisco.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1so6ZxGFD-9BOH_g0jO=Zu0wOP1r9+2SdQ5dZGc34uaoVQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1803052231250.22668@sjc-ads-6991.cisco.com>
References: <1520286611-27418-1-git-send-email-kamensky@cisco.com>
	<CAMKF1so6ZxGFD-9BOH_g0jO=Zu0wOP1r9+2SdQ5dZGc34uaoVQ@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] systemtap: supports mips starting with version 3.1
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
X-List-Received-Date: Tue, 06 Mar 2018 06:57:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hi Khem,

On Mon, 5 Mar 2018, Khem Raj wrote:

> On Mon, Mar 5, 2018 at 1:50 PM, Victor Kamensky <kamensky@cisco.com> wrote:
>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ---
>>  meta/recipes-kernel/systemtap/systemtap_git.inc | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> index c938760..d122359 100644
>> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
>> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> @@ -15,8 +15,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>>             file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
>>             "
>>
>> -# systemtap doesn't support mips
>> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel).*-linux'
>> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
>>
>
> Looks ok. Can we enable mipsel as well ?

Above expression, effectively 'mips.*-linux', does match 'mipsel' as well, 
does not it? It matches mips64.

I did test basic systemtap operations on qemumips, and
qemumips64 machines, worked ok to me. I noticed some small quirks 
but they were similar to one that arm machine has. I am not saying
that MIPS support in systemtap is perfect, it is new architecture
for systemtap after all, there could be some bugs. But I believe
it is good enough to be enabled in OE.

I don't see any easy virtual mipsel based machine so I cannot test
it right away. But I don't see a reson why it would not work in LE
mode.

Thanks,
Victor

>>  S = "${WORKDIR}/git"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

