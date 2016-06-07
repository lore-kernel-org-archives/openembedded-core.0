Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87341770A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 03:33:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u573XfHZ013949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Jun 2016 20:33:41 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 6 Jun 2016 20:33:40 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1464336009.git.jussi.kukkonen@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57564093.2040404@windriver.com>
Date: Tue, 7 Jun 2016 11:33:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1464336009.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH 0/1] Fix image creation problems (WRT dosfstools)
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
X-List-Received-Date: Tue, 07 Jun 2016 03:33:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/27/2016 04:08 PM, Jussi Kukkonen wrote:
> This fixes the image build issues that were a result of my dosfstools
> upgrade, sorry for not testing that one properly.
>
> This was the first time I even looked at the image generation code,
> would appreciate review from Robert or someone else more familiar
> with it. There are alternative solutions (like silencing the warning
> from mcopy), but this seemed like an ok one to me.

Sorry, I'm on paternity leave from May. 27 to Jun. 10, this is fine to me.

// Robert

>
> I've pushed this commit on top of the branch with the dosfstools
> upgrade, let me know if you'd rather have this sort of things
> separately.
>
> Thanks,
>    Jussi
>
>
>
> The following changes since commit 265c2d710ce6941f6ddae3aa699bf1e9c13aa156:
>
>    libgpg-error: Upgrade 1.21 -> 1.22 (2016-05-26 15:39:14 +0300)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib jku/gnupg-mirror-plus-upgrades
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gnupg-mirror-plus-upgrades
>
> Jussi Kukkonen (1):
>    image-live.bbclass: Tweak rounding up sector count
>
>   meta/classes/image-live.bbclass | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>

