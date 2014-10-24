Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDB265E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:18:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O9IgOG010100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 02:18:42 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 24 Oct 2014 02:18:42 -0700
Message-ID: <544A1970.3020903@windriver.com>
Date: Fri, 24 Oct 2014 17:18:40 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1413941715.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1413941715.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/4] Clean host path in target scripts
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
X-List-Received-Date: Fri, 24 Oct 2014 09:18:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Drop the patches - Mistaken Signatures.

Wenzong

On 10/22/2014 09:46 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Clean host path for:
>
>    * /usr/bin/crossscripts/tclConfig.sh
>    * /usr/bin/isc-config.sh
>    * /usr/bin/bind9-config - hardlink to isc-config.sh
>    * /usr/bin/compile_et
>    * /usr/bin/mk_cmds
>    * /usr/bin/bashbug
>
> The following changes since commit 924da20c6f2f183fa7e930e4c3c6b14c090acbe5:
>
>    build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:38 +0200)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/clean-hostpath
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/clean-hostpath
>
> Wenzong Fan (4):
>    bash: clean host path in bashbug
>    e2fsprogs: clean host path in compile_et, mk_cmds
>    bind: clean host path in isc-config.sh
>    tcl: clean host path in tclConfig.sh
>
>   meta/recipes-connectivity/bind/bind_9.9.5.bb       |    7 +++++++
>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    6 ++++++
>   meta/recipes-devtools/tcltk/tcl_8.6.1.bb           |    1 +
>   meta/recipes-extended/bash/bash.inc                |    4 ++++
>   4 files changed, 18 insertions(+)
>

