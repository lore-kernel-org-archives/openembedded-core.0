Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6F9719AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 02:03:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w58236h8000313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2018 19:03:06 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 7 Jun 2018 19:03:05 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <0c79440f-858d-f155-4cf1-250e79cdcd7c@windriver.com>
Date: Fri, 8 Jun 2018 10:03:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.161]
Subject: Re: [meta][PATCH 0/2] Add kernel-sample tests for runtime test
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
X-List-Received-Date: Fri, 08 Jun 2018 02:03:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping...


A bug has been created, but the patch hasn't been adapted.

bug 12774 : https://bugzilla.yoctoproject.org/show_bug.cgi?id=12774


We plan to add more tests about kernel in the next time.


If there is no objection, could you adapt my patch?


-- Hongzhi


On 2018年06月05日 10:32, Hongzhi.Song wrote:
> V4:
>   * add support for qemu by default
>
> V3:
>   * remove duplicated code
>
> V2:
>   * use shared function to replace similar code
>
> Hongzhi.Song (2):
>    meta runtime testcases: enable kernel-sample features for runtime
>      tests
>    Meta runtime cases: add testcases for kernel sample
>
>   meta/lib/oeqa/runtime/cases/ksample.py    | 213 ++++++++++++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto.inc |   3 +
>   2 files changed, 216 insertions(+)
>   create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py
>


