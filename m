Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RElBY-0003Vh-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 19:04:41 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:58:54 -0700
Received: by wwf22 with SMTP id 22so2596516wwf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:58:52 -0700 (PDT)
Received: by 10.216.229.41 with SMTP id g41mr3061774weq.62.1318611532696;
	Fri, 14 Oct 2011 09:58:52 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o7sm15234147wbh.8.2011.10.14.09.58.50
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:58:51 -0700 (PDT)
Message-ID: <4E986A49.2090700@intel.com>
Date: Fri, 14 Oct 2011 09:58:49 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318472103.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1318472103.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.
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
X-List-Received-Date: Fri, 14 Oct 2011 17:04:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2011 07:22 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> This patch merged from Wind River Linux, it fix a potential '/' issue for
> qt4-x11-free.
>
> [yocto bug id: 1671]
>
> The following changes since commit b92b776d56e64a437181de9bc76f8dcc8e15a5f8:
>    Richard Purdie (1):
>          meta-yocto: Catch up with xserver and mesa upgrades/rename
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/qt4_trailingslash
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/qt4_trailingslash
>
> Wenzong Fan (1):
>    qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.
>
>   meta/recipes-qt/qt4/qt4.inc |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
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



