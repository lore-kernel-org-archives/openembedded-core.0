Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB256A36E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 07:02:36 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 May 2013 00:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,756,1363158000"; d="scan'208";a="247514892"
Received: from unknown (HELO [10.255.12.48]) ([10.255.12.48])
	by AZSMGA002.ch.intel.com with ESMTP; 28 May 2013 00:02:30 -0700
Message-ID: <51A45684.6020803@linux.intel.com>
Date: Tue, 28 May 2013 16:02:28 +0900
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1369719531.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1369719531.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] switch to using busybox instead of tinylogin
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
X-List-Received-Date: Tue, 28 May 2013 07:02:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2013 02:39 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following changes since commit 21089515bd18ba18e86ec8f72ff8141b9fb1dea8:
>
>    ref-manual: Added xmlto and dblatex packages for docs (2013-05-22 17:23:41 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/tinylogin-busybox
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tinylogin-busybox
>
> Chen Qi (2):
>    packagegroup-core-boot: use busybox as the default login manager
>    busybox: enable login/password commands by default
>
As Otavio suggested, these need to be re-ordered.

Does this all work correctly without the need to use "setuid" of the 
busybox binary, it seems we currently are doing setuid for the busybox 
binary since we include SUID app, but what would happen to tinylogin if 
we remove that?

Sau!

>   meta/recipes-core/busybox/busybox-1.20.2/defconfig |   26 ++++++++++----------
>   .../packagegroups/packagegroup-core-boot.bb        |    2 +-
>   2 files changed, 14 insertions(+), 14 deletions(-)
>

