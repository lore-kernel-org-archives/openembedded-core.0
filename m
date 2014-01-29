Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DBD056002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 17:36:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0THa0HQ009568; Wed, 29 Jan 2014 17:36:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QZddHseW-hiG; Wed, 29 Jan 2014 17:36:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0THZth6009564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 29 Jan 2014 17:35:57 GMT
Message-ID: <1391016950.24655.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Date: Wed, 29 Jan 2014 17:35:50 +0000
In-Reply-To: <1391005066-15501-1-git-send-email-noor_ahsan@mentor.com>
References: <1391005066-15501-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcgroup: Add bison-native and flex-native in depends
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
X-List-Received-Date: Wed, 29 Jan 2014 17:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 19:17 +0500, Noor, Ahsan wrote:
> From: Noor <noor_ahsan@mentor.com>
> 
> * libcgroup require native packages for bison and flex. Added those
>   in its DEPENDS.
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta/recipes-core/libcgroup/libcgroup_0.38.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.38.bb b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
> index 8bd0ead..711229f 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_0.38.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.38.bb

It appears we have version 0.41 in master. Could you send patches built
and tested against master please.

Cheers,

Richard


