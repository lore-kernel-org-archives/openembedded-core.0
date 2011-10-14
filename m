Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1REksV-0002hn-LQ
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:44:59 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:39:12 -0700
Received: by wwf22 with SMTP id 22so2578210wwf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:39:11 -0700 (PDT)
Received: by 10.227.58.84 with SMTP id f20mr3679166wbh.9.1318610350861;
	Fri, 14 Oct 2011 09:39:10 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ek13sm15156195wbb.3.2011.10.14.09.39.08
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:39:10 -0700 (PDT)
Message-ID: <4E9865AB.3070804@intel.com>
Date: Fri, 14 Oct 2011 09:39:07 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318385789.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1318385789.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/2] Upgrade libfm/pcmanfm
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
X-List-Received-Date: Fri, 14 Oct 2011 16:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2011 07:20 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
> These 2 patches upgrade libfm and pcmanfm. Pls. help to review and pull.
>
> Thanks,
> Edwin
>
> The following changes since commit 0d8c8cf462e5df446669355b554b3d5fdc532a11:
>
>    mutter: update to 2.29.1 and fix SRC_URI (2011-10-07 11:35:50 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Zhai Edwin (2):
>    libfm: Upgrade to 0.1.16
>    pcmanfm: Upgrade to 0.9.9
>
>   .../pcmanfm/files/owl-window-menu.patch            |   53 ++++++++++----------
>   .../pcmanfm/{pcmanfm_0.9.8.bb =>  pcmanfm_0.9.9.bb} |    6 +-
>   .../libfm/libfm-0.1.14/use_deprecate_func.patch    |   13 -----
>   .../libfm/libfm-0.1.16/configure_fix.patch         |   19 +++++++
>   .../libfm/{libfm_0.1.14.bb =>  libfm_0.1.16.bb}     |    8 ++--
>   5 files changed, 52 insertions(+), 47 deletions(-)
>   rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.8.bb =>  pcmanfm_0.9.9.bb} (87%)
>   delete mode 100644 meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
>   create mode 100644 meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
>   rename meta/recipes-support/libfm/{libfm_0.1.14.bb =>  libfm_0.1.16.bb} (73%)
>

Merged into OE-Core

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



