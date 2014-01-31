Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 95CA96E988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:46:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0VFkJgB014858; Fri, 31 Jan 2014 15:46:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R1dYv7Jpjl1Y; Fri, 31 Jan 2014 15:46:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0VFkG2x014854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 31 Jan 2014 15:46:18 GMT
Message-ID: <1391183171.24655.283.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Fri, 31 Jan 2014 15:46:11 +0000
In-Reply-To: <1391160604-23629-6-git-send-email-david.nystrom@enea.com>
References: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
	<1391160604-23629-6-git-send-email-david.nystrom@enea.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 5/5] nativesdk-packagegroup-sdk-host: Add nativesdk-nss to default inclusion in host SDK
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
X-List-Received-Date: Fri, 31 Jan 2014 15:46:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-01-31 at 10:30 +0100, David Nyström wrote:
>                                                                                                                                                                                              Since shsignlibs is used from the nss postinstall hook. It should be 
> included in nativesdk to make offline rootfs construction possible.
> 
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>  meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index 09e0aef..693437e 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
>      nativesdk-makedevs \
>      nativesdk-smartpm \
>      nativesdk-postinst-intercept \
> +    nativesdk-nss \
>      "

Do we really want/need to add nativesdk-nss to every sdk build? :/

Cheers,

Richard


