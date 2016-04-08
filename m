Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 013BA6057B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 06:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u386vJ41000591; Fri, 8 Apr 2016 07:57:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kqp1FN_vMA0g; Fri,  8 Apr 2016 07:57:19 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u386vGIc000588
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 8 Apr 2016 07:57:17 +0100
Message-ID: <1460098636.23253.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Graydon, Tracy" <tracy.graydon@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Apr 2016 07:57:16 +0100
In-Reply-To: <1460047375-20395-1-git-send-email-tracy.graydon@intel.com>
References: <1460047375-20395-1-git-send-email-tracy.graydon@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] meta/conf/distro/include/distro_alias.inc
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
X-List-Received-Date: Fri, 08 Apr 2016 06:57:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-07 at 09:42 -0700, Graydon, Tracy wrote:
> Update the distro_alias.inc file to include updated/new packages.
> 
> This is required for the Yocto-2.1 release.
> 
> Signed-off-by: Graydon, Tracy <tracy.graydon@intel.com>
> ---
>  meta/conf/distro/include/distro_alias.inc | 31
> +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> index c8f9395..51869d5 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -9,13 +9,17 @@
>  #
>  # Please keep this list in alphabetical order.
>  #
> +DISTRO_PN_ALIAS_pn-alsa-lib = "Debian=alsa-lib Ubuntu=alsa-lib
> Fedora=alsa-lib"

I though that we didn't add these for *every* entry, only where the
names differ?

Cheers,

Richard

