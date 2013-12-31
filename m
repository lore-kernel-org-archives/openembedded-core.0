Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C042B6204F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:29:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBV1TrFC002849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Dec 2013 17:29:53 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 30 Dec 2013 17:29:53 -0800
Message-ID: <52C21E0F.7020400@windriver.com>
Date: Tue, 31 Dec 2013 09:29:51 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1388424165.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1388424165.git.tom.zanussi@linux.intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH 0/1][dora] - Fix for Bug 5403
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
X-List-Received-Date: Tue, 31 Dec 2013 01:29:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Tom,

Thanks, do we also need a patch for master ?

// Robert

On 12/31/2013 01:31 AM, Tom Zanussi wrote:
> This fixes a problem seen when accessing function params in systemtap
> on certain platforms, due to flaky debuginfo.
>
> Tested on the following machines with various systemtap scripts:
>
> qemuppc
> qemuarm
> qemux86
> qemux86-64
> crownbay
> nuc
>
> The following changes since commit 3cf2d232529c4fd6b58f87ddbf3df9d805e4180f:
>
>    libsoup-2.4: add intltool-native to DEPENDS (2013-12-20 09:29:05 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-bug-5403-dora
>    http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/systemtap-bug-5403-dora
>
> Tom Zanussi (1):
>    systemtap: Add --enable-prologues to configuration
>
>   meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

