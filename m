Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBItY-0006G5-Ue
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 06:15:49 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:10:12 -0700
Received: by bke5 with SMTP id 5so1466022bke.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:10:11 -0700 (PDT)
Received: by 10.223.88.197 with SMTP id b5mr534278fam.143.1317787811324;
	Tue, 04 Oct 2011 21:10:11 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id n18sm496423fah.2.2011.10.04.21.10.09
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:10:10 -0700 (PDT)
Message-ID: <4E8BD89F.70306@intel.com>
Date: Tue, 04 Oct 2011 21:10:07 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317370299.git.lei.mei@intel.com>
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/4]Recipe upgrades
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
X-List-Received-Date: Wed, 05 Oct 2011 04:15:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2011 01:16 AM, Mei Lei wrote:
> This commit includes some recipes upgrade: curl,diffutils,dropbear.
> And update the distro_tracking_fields.inc
>
> Thanks,
> Lei
>
> The following changes since commit 96241de59fdf548ae0f80cc9e4668f9ba11924ef:
>    Matthew McClintock (1):
>          Fix flac build on e500mc cores
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/upgrade-0928
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-0928
>
> Mei Lei (4):
>    curl: Upgrade from 7.21.7 to 7.22.0
>    diffutils: Upgrade from 3.0 to 3.2.
>    dropbear: Upgrade from 0.52 to 0.53.1
>    distro_tracking_fields.inc: Update upgrade information
>
>   .../conf/distro/include/distro_tracking_fields.inc |   25 +++++++++--------
>   .../configure.patch                                |    0
>   meta/recipes-core/dropbear/dropbear.inc            |    1 +
>   .../dropbear/dropbear/allow-nopw.patch             |   14 +++++-----
>   .../dropbear-0.53.1-static_build_fix.patch         |   29 ++++++++++++++++++++
>   .../urandom-xauth-changes-to-options.h.patch       |   11 ++++---
>   meta/recipes-core/dropbear/dropbear_0.52.bb        |    6 ----
>   meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 ++++
>   .../{diffutils_3.0.bb =>  diffutils_3.2.bb}         |    4 +-
>   .../curl/{curl_7.21.7.bb =>  curl_7.22.0.bb}        |    4 +-
>   10 files changed, 66 insertions(+), 34 deletions(-)
>   rename meta/recipes-core/dropbear/{dropbear-0.52 =>  dropbear-0.53.1}/configure.patch (100%)
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
>   delete mode 100644 meta/recipes-core/dropbear/dropbear_0.52.bb
>   create mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
>   rename meta/recipes-extended/diffutils/{diffutils_3.0.bb =>  diffutils_3.2.bb} (84%)
>   rename meta/recipes-support/curl/{curl_7.21.7.bb =>  curl_7.22.0.bb} (92%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into master with the md5sum fix by Richard

Thanks
	Sau!



