Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 042076AC01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:19:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O9JDHV022598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 02:19:14 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 24 Oct 2014 02:19:13 -0700
Message-ID: <544A1990.2040900@windriver.com>
Date: Fri, 24 Oct 2014 17:19:12 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1413954957.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1413954957.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] shadow: fix pam configs for chpasswd, newusers
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
X-List-Received-Date: Fri, 24 Oct 2014 09:19:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Drop the patch - Mistaken Signatures.

Wenzong


On 10/22/2014 01:19 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Fix below errors while pam is enabled on target:
>
>    root@qemux86:~# newusers
>    newusers: PAM: Authentication failure
>    root@qemux86:~# chpasswd
>    chpasswd: PAM: Authentication failure
>
> The configs copied from "chgpasswd" which command works with pam.
>
> The following changes since commit 924da20c6f2f183fa7e930e4c3c6b14c090acbe5:
>
>    build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:38 +0200)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/shadow-pam
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/shadow-pam
>
> Wenzong Fan (1):
>    shadow: fix pam configs for chpasswd, newusers
>
>   meta/recipes-extended/shadow/files/pam.d/chpasswd |    2 ++
>   meta/recipes-extended/shadow/files/pam.d/newusers |    2 ++
>   2 files changed, 4 insertions(+)
>

