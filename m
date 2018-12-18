Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 223427BFAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 03:08:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI38RXj014900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 19:08:28 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 19:08:27 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1545101991.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <73748ae8-f16a-43f9-0fac-d62e43b471cf@windriver.com>
Date: Tue, 18 Dec 2018 11:13:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1545101991.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] package.bbclass: Don not hide cpio's error
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
X-List-Received-Date: Tue, 18 Dec 2018 03:08:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sorry, the subject should be:

package.bbclass: Do not hide cpio's error

Fixed it in the repo.

// Robert

On 12/18/18 11:00 AM, Robert Yang wrote:
> The following changes since commit 20aea61385e1a53ac245353899277ba20104ed2f:
> 
>    gcc: Drop 7.3 since 8.2 is working fine for us (2018-12-15 17:10:44 +0000)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/package
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/package
> 
> Robert Yang (1):
>    package.bbclass: Don not hide cpio's error
> 
>   meta/classes/package.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

