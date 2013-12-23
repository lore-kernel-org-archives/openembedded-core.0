Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE1FE610D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 02:05:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBN25hNB017208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Dec 2013 18:05:43 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 22 Dec 2013 18:05:42 -0800
Message-ID: <52B79A75.7070804@windriver.com>
Date: Mon, 23 Dec 2013 10:05:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1387453595-20914-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1387453595-20914-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [dora][PATCH] libsoup-2.4: add intltool-native to DEPENDS
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
X-List-Received-Date: Mon, 23 Dec 2013 02:05:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Thanks, I will add it to dora-next.

// Robert

On 12/19/2013 07:46 PM, Paul Eggleton wrote:
> The configure script looks for this; most of the time dependency chains
> ensure this is present but we need to be explicit or failures can
> occur.
>
> Reported by Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> (From OE-Core master rev: 22e45ed7d74ceb4a719e7b5889400c20ed4a0783)
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
> index ef8d439..1614a3d 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>
>   SECTION = "x11/gnome/libs"
>
> -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3"
> +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native"
>
>   # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
>   # by default but let it be easily disabled.
>

