Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA0060557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 13:34:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1FDYFPU025678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Feb 2018 13:34:16 GMT
Message-ID: <1518701655.24236.146.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 13:34:15 +0000
In-Reply-To: <1518698953-23437-1-git-send-email-liu.ming50@gmail.com>
References: <1518698953-23437-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] license.bbclass: set do_bootimg recrdeptask on do_populate_lic
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
X-List-Received-Date: Thu, 15 Feb 2018 13:34:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-02-15 at 13:49 +0100, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> This is needed since the license_deployed_manifest task is referring
> the deployed licenses of the depends of do_bootimg task.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/license.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/license.bbclass
> b/meta/classes/license.bbclass
> index d353110..10d2279 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -679,6 +679,7 @@ do_rootfs[recrdeptask] += "do_populate_lic"
>  
>  IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
>  do_image[recrdeptask] += "do_populate_lic"
> +do_bootimg[recrdeptask] += "do_populate_lic"
>  
>  python do_populate_lic_setscene () {
>      sstate_setscene(d)

How old is this patch?

The recrdepends handling in bitbake changed recently and these kind of
older issues may have been a bitbake bug. Can you describe a test
scenario and check if master still needs this "fix"?

Cheers,

Richard


