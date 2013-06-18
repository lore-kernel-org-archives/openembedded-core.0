Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 092A76A8C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 20:12:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5IKCwJA024735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 13:12:58 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 13:12:58 -0700
Message-ID: <51C0BF49.7050603@windriver.com>
Date: Tue, 18 Jun 2013 15:12:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1371583280-4333-1-git-send-email-Randy.MacLeod@windriver.com>
In-Reply-To: <1371583280-4333-1-git-send-email-Randy.MacLeod@windriver.com>
Subject: Re: [PATCH] nostromo: make SRC_URI work for multilib builds.
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
X-List-Received-Date: Tue, 18 Jun 2013 20:12:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/13 2:21 PM, Randy MacLeod wrote:

Wrong list.  This should have gone to the oe-devel list, and been tagged with 
[networking] in the subject.

Also one thing below:

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> index e66676e..f729e6a 100644
> --- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> +++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205afd8d36938"
>
> -SRC_URI = "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
> +SRC_URI = "http://www.nazgul.ch/dev/nostromo-${PV}.tar.gz \

You can also use '${BPN}' to refer to the original recipe name, not the multilib 
name.

--Mark

>              file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
>              file://nhttpd.conf \
>              file://volatiles \
>


