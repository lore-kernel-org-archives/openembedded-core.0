Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RNTJH-0003lt-0i
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 18:48:39 +0100
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 09:42:06 -0800
Received: by wwf22 with SMTP id 22so5240218wwf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 09:42:05 -0800 (PST)
Received: by 10.227.58.17 with SMTP id e17mr29922125wbh.18.1320687725475;
	Mon, 07 Nov 2011 09:42:05 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id q30sm28503306wbn.17.2011.11.07.09.42.03
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 09:42:04 -0800 (PST)
Message-ID: <4EB8186A.4000807@intel.com>
Date: Mon, 07 Nov 2011 09:42:02 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Mon, 07 Nov 2011 17:48:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2011 10:52 AM, Paul Eggleton wrote:
> The following changes since commit f01fbc17b5d9bf9a227d64fe858014376cd19432:
>
>    avahi: fix useradd race condition (2011-11-03 14:48:42 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/fixes8
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes8
>
> Paul Eggleton (3):
>    allarch.bbclass: disable shlib and debug symbol processing
>    core-image-minimal-initramfs: force IMAGE_FSTYPES
>    qemugl: switch to new git repo
>
>   meta/classes/allarch.bbclass                       |    5 +++++
>   .../images/core-image-minimal-initramfs.bb         |    1 +
>   meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
>   3 files changed, 7 insertions(+), 1 deletions(-)
>
Merged into OE-Core with tweak to IMAGE_FSTYPES as suggested

Thanks
	Sau!



