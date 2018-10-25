Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 264DA75129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 09:25:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9P9PIaO028596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 25 Oct 2018 10:25:29 +0100
Message-ID: <b2dd231dcb644b0c97082d64abc7dfd703ef6d95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 10:25:17 +0100
In-Reply-To: <1540452055-22743-1-git-send-email-akuster808@gmail.com>
References: <1540452055-22743-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] os-release: add more variables to list
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
X-List-Received-Date: Thu, 25 Oct 2018 09:25:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-25 at 08:20 +0100, Armin Kuster wrote:
> If someone extends the OS_RELEASE_FIELDS in a bbappend, it will cause
> the hash to change which is
> caught by the yocto-check-layer
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/os-release/os-release.bb
> b/meta/recipes-core/os-release/os-release.bb
> index 7f3d9cb..88bf8f8 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -12,7 +12,7 @@ do_configure[noexec] = "1"
>  
>  # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
>  #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
> -OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
> +OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME BUILD_ID HOME_URL BUG_REPORT_URL SUPPORT_URL CPE_NAME"

I'm not sure I agree with this. It would usually be a policy decision,
e.g. a ditro config which would change this and you'd not be doing this
with a bbappend?

Cheers,

Richard


