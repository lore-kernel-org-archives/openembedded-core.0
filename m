Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC31731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:54:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5HDsvwU015005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 06:54:57 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 17 Jun 2016 06:54:56 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1466170741.git.pkj@axis.com>
	<37d008cb22d350306d7d41e66f97e9106fb0c2a0.1466170741.git.pkj@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <81df273b-5287-b262-fcf2-d8d39b9d343d@windriver.com>
Date: Fri, 17 Jun 2016 08:54:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <37d008cb22d350306d7d41e66f97e9106fb0c2a0.1466170741.git.pkj@axis.com>
Subject: Re: [PATCH 1/4] documentation.conf: Add information about USERADD varaibles
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
X-List-Received-Date: Fri, 17 Jun 2016 13:54:59 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/17/16 8:41 AM, Peter Kjellerstedt wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/documentation.conf | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index c0025f5..38639d5 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -452,8 +452,12 @@ UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
>  UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
>  USE_DEVFS[doc] = "When building images, specifies to populate or not /dev. This variable defaults to '1' (leave directory empty, surely because devtmpfs do the job). Set it to '0' to use makedevs (or consider using a custom file with IMAGE_DEVICE_TABLES)."
>  USER_CLASSES[doc] = "List of additional classes to use when building images that enable extra features."
> +USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files."

I think the description is incorrect.  Specifically:

...values are not defined in files/passwd and files/group files.

should be

...values are not defined in the USERADD_UID_TABLES and USERADD_GID_TABLES.

> +USERADD_GID_TABLES[doc] = "Specifies a password file to use for obtaining static group identification (gid) values when the OpenEmbedded build system adds a group to the system during package installation."
>  USERADD_PACKAGES[doc] = "When a recipe inherits the useradd class, this variable specifies the individual packages within the recipe that require users and/or groups to be added."
>  USERADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the useradd command if you wish to add a user to the system when the package is installed."
> +USERADD_UID_TABLES[doc] = "Specifies a password file to use for obtaining static user identification (uid) values when the OpenEmbedded build system adds a user to the system during package installation."
> +USERADDEXTENSION[doc] = "When set to 'useradd-staticids', causes the OpenEmbedded build system to base all user and group additions on a static passwd and group files found in BBPATH."

again, here I think we need to clarify "static passwd and group" to refer to the
USERADD_UID_TABLES and USERADD_GID_TABLES or someone might not understand that
is what is needed.

>  
>  #W
>  
> 


