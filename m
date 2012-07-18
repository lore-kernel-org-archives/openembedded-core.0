Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SrJW7-0007dw-7Z
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 03:57:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6I1k9HP016842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jul 2012 18:46:09 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 17 Jul 2012 18:46:09 -0700
Message-ID: <50061508.6040400@windriver.com>
Date: Wed, 18 Jul 2012 09:44:40 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1342510138-21888-1-git-send-email-sen.zhang@windriver.com>
	<5005B1CC.1020907@linux.intel.com>
In-Reply-To: <5005B1CC.1020907@linux.intel.com>
X-Originating-IP: [128.224.162.230]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] grub: two backported patch for bug 2777
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 01:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

On 07/18/2012 02:41 AM, Saul Wold wrote:
>> The first patch is not exactly the same as upstream, since the upstream commit
>> contains a lot of trivial aesthetic edits.
>>
> Why can't it be the same, then we don't need to carry it?

The code base has changed, so we need to amend the patch anyway. That
would bring more confusion than to just cherry pick the bits that we
need, I think.

When grub is updated from 1.99 to 2.0, the patch can be simply dropped.

>> The second patch is taken from debian instead of directly from upstream, since
>> the code base has changed.
>>
>> Jesse Zhang (2):
>>    grub: fix grub-mkconfig_lib install dir
>>    grub: fix error stating the root device
>>
>>   .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  203 +++++++++++++++-----
>>   .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ++++++
>>   meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
>>   3 files changed, 217 insertions(+), 53 deletions(-)
>>   create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
>>
> 
> This patch set may need to be rebased based on the new automake 1.12.x updated.

Just saw the updates. I will test again and send v2.

Thanks.

jesse


