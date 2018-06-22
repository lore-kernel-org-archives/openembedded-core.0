Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48728783B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 01:30:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5M1UJrh017256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 18:30:20 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 21 Jun 2018 18:30:18 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1528772440.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <58c3bbc6-f8e6-c1f0-2b84-39ac0a4d482a@windriver.com>
Date: Fri, 22 Jun 2018 09:33:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1528772440.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH V3 0/1] oeqa/runtime/cases/selftest.py: rename to _selftest.py
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
X-List-Received-Date: Fri, 22 Jun 2018 01:30:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

I've tested this patch with `oe-selftest -r runtime_test', and the 
result is correct.

Best Regards,
Chen Qi

On 06/12/2018 05:08 PM, Chen Qi wrote:
> Changes in V3:
> * Also rename selftest.json to _selftest.json to avoid runtime_test.py failure in oe-selftest.
> * Fixed a typo (sato -> full-cmdline)
>
> Changes in V2:
> * Fix to depend on _selftest.Selftest.test_install_package.
>
>
> The following changes since commit fe6e6231441188c3ffe52ef5811a8f30d29ea952:
>
>    local.conf.sample: update libsdl mentions to libsdl2 (2018-06-07 08:53:19 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/rename_selftest
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rename_selftest
>
> Chen Qi (1):
>    oeqa/runtime/cases/selftest.py: rename to _selftest.py
>
>   .../lib/oeqa/runtime/cases/{selftest.json => _selftest.json}          | 0
>   meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py}    | 2 +-
>   meta/lib/oeqa/selftest/cases/runtime_test.py                          | 4 ++--
>   3 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-selftest/lib/oeqa/runtime/cases/{selftest.json => _selftest.json} (100%)
>   rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (94%)
>


