Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 55FDF6079E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 22:43:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9BMhEJH023712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 11 Oct 2018 23:43:15 +0100
Message-ID: <c46665dfe4ea4432c8c7a13e172a8ebc90a4c51d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 23:43:14 +0100
In-Reply-To: <1539267354-26753-1-git-send-email-liu.ming50@gmail.com>
References: <1539267354-26753-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Cheuk Wing Leung <cwleung@kth.se>
Subject: Re: [PATCH] python3: set PYTHONHOME for nativesdk
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
X-List-Received-Date: Thu, 11 Oct 2018 22:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 16:15 +0200, liu.ming50@gmail.com wrote:
> From: Cheuk Wing Leung <cwleung@kth.se>
> 
> commit c5629268b0f8ae0a425c98337d13e8dc83107e13:
> [
>     python: set PYTHONHOME for nativesdk
> 
>     This ensures that the nativesdk python functions correctly
> without needing to
>     set PYTHONHOME in the sdk environment setup script.
> ]
> 
> it's also needed for python3.
> 
> Signed-off-by: Cheuk Wing Leung <cwleung@kth.se>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I think its this which is causing breakage:


https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step3b


https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step2b


https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step1b

Cheers,

Richard


