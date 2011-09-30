Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R9h3A-0007qe-FV
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:39:04 +0200
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Sep 2011 10:33:24 -0700
Received: by fxe23 with SMTP id 23so3052044fxe.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:33:23 -0700 (PDT)
Received: by 10.223.30.27 with SMTP id s27mr11663462fac.129.1317404003494;
	Fri, 30 Sep 2011 10:33:23 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id b10sm7584413fam.1.2011.09.30.10.33.20
	(version=SSLv3 cipher=OTHER); Fri, 30 Sep 2011 10:33:21 -0700 (PDT)
Message-ID: <4E85FD5E.7060305@intel.com>
Date: Fri, 30 Sep 2011 10:33:18 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317372422-7943-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1317372422-7943-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] atk: add patch to replace G_CONST_RETURN with const
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
X-List-Received-Date: Fri, 30 Sep 2011 17:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2011 01:47 AM, Martin Jansa wrote:
> * otherwise build fails when glib is 2.30.0 or newer (and G_DISABLE_DEPRECATED is enabled - like in atk)
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../atk/atk-1.32.0/remove.G_CONST_RETURN.patch     |  628 ++++++++++++++++++++
>   meta/recipes-support/atk/atk_1.32.0.bb             |    5 +-
>   2 files changed, 632 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
>
> diff --git a/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch b/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
> new file mode 100644
> index 0000000..0cdf041
> --- /dev/null
> +++ b/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
> @@ -0,0 +1,628 @@
> +Upstream-Status: Accepted
> +
> +Similar patch is already included in 2.0.1 and newer
> +http://ftp.gnome.org/pub/gnome/sources/atk/2.0/atk-2.0.1.news
> +

No Signed-off-by: in the patch header.

If the newer version of atk is available, why not update atk in oe-core 
to that version and not add this patch?

Is there a reason we can't update to 2.0.1 at this time?

Thanks
	Sau!


