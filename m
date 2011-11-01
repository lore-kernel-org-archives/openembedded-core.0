Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLM42-0002HL-Uf
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:40:11 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 14:34:02 -0700
Received: by faan26 with SMTP id n26so7282774faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 14:34:01 -0700 (PDT)
Received: by 10.223.87.211 with SMTP id x19mr3142655fal.8.1320183241463;
	Tue, 01 Nov 2011 14:34:01 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id d21sm1150003fac.4.2011.11.01.14.33.59
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 14:34:00 -0700 (PDT)
Message-ID: <4EB065C5.8070605@intel.com>
Date: Tue, 01 Nov 2011 14:33:57 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319793342.git.xiaofeng.yan@windriver.com>
	<6f0b96b7ef399fd7c78b2135a71b010e2613ae26.1319793342.git.xiaofeng.yan@windriver.com>
In-Reply-To: <6f0b96b7ef399fd7c78b2135a71b010e2613ae26.1319793342.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 2/2] libarchive: modify the status of updating
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
X-List-Received-Date: Tue, 01 Nov 2011 21:40:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2011 02:21 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> update to 2.8.5
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> index 1f3540e..12c8fc0 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -4615,7 +4615,10 @@ RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan<xiaofeng.yan@windriver.com>"
>   RECIPE_STATUS_pn-directfb = "red"
>   RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan<xiaofeng.yan@windriver.com>"
>
> -RECIPE_STATUS_pn-libarchive  = "red"
> +RECIPE_STATUS_pn-libarchive  = "green"
> +RECIPE_LATEST_VERSION_pn-libarchive = "2.8.5"
> ++RECIPE_LATEST_RELEASE_DATE_pn-libarchive = "Sept 3, 2011"
> ++RECIPE_LAST_UPDATE_pn-libarchive = "Oct 28, 2011"
>   RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan<xiaofeng.yan@windriver.com>"
>
>   RECIPE_STATUS_pn-xserver-kdrive  = "red"
This does not look right, there are extra + in the lines.

Sau!



