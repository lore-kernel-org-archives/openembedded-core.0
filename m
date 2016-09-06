Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57ABA6612C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 06:11:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u866BDt3012213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Sep 2016 23:11:13 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 23:11:12 -0700
To: Joshua Lock <joshuagloe@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <941b617a-ba8e-7df6-8209-2dc564e94af8@windriver.com>
Date: Tue, 6 Sep 2016 14:11:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH v2 0/3] Python3 runqemu
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
X-List-Received-Date: Tue, 06 Sep 2016 06:11:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Thanks, I did some rough testing, they worked well.

// Robert

On 09/06/2016 04:32 AM, Joshua Lock wrote:
> This small series against master-next (as the python3 runqemu hasn't made it to
> master yet) fixes the new runqemu for a workflow of mine where I build on a
> headless machine and copy images locally to test them with runqemu.
>
> Changes since v1:
> * drop a patch to replace an ls -t call with Python's glob()
> * Fix and enhance reading STAGING_*_NATIVE from the bitbake environment, tested
>   with artefacts in a completely different path to the build path and invoking
>   with both the qemuboot.conf file as the arg to runqemu and the parent
>   directory.
>
> The following changes since commit 5b3ac3cd92d1f021c06b22eaa0e74ab8dfb22764:
>
>   kernel-module-split.bbclass: no need for running depmod (2016-09-05 17:45:53 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib joshuagl/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/runqemu
>
> Joshua Lock (3):
>   runqemu: fix typos
>   runqemu: assume artefacts are relative to *.qemuboot.conf
>   runqemu: better handle running on a host with different paths
>
>  scripts/runqemu | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 3 deletions(-)
>

