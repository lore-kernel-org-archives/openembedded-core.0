Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1REkn3-0002Yf-4J
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:39:21 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:33:33 -0700
Received: by wwn22 with SMTP id 22so1016437wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:33:32 -0700 (PDT)
Received: by 10.227.24.8 with SMTP id t8mr3036978wbb.72.1318610012150;
	Fri, 14 Oct 2011 09:33:32 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id es10sm15125324wbb.4.2011.10.14.09.33.30
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:33:31 -0700 (PDT)
Message-ID: <4E986458.3040402@intel.com>
Date: Fri, 14 Oct 2011 09:33:28 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318312278-24520-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1318312278-24520-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] bluez4: Add ending quote of FILES_${PN}-dbg
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
X-List-Received-Date: Fri, 14 Oct 2011 16:39:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2011 10:51 PM, Noor, Ahsan wrote:
> From: Noor Ahsan<noor_ahsan@mentor.com>
>
> * .debug directory was being moved in bluez4 package. Although we have asked to move it in bluez4-dbg package but as FILES_${PN}-dbg was not having ending quote, .debug folder was not being moved to correct directory in packages-split.
>
> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
> ---
>   meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> index 5c170c1..420a525 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> @@ -30,4 +30,4 @@ FILES_${PN}-dbg += "\
>     ${libdir}/bluetooth/plugins/.debug \
>     ${libdir}/*/.debug \
>     ${base_libdir}/udev/.debug \
> -
> +  "
Merged into OE-Core

Thanks
	Sau!



