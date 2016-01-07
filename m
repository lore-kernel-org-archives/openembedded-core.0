Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 429436E668
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 10:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u07AuhPE016689; Thu, 7 Jan 2016 10:57:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wng2JZyctoQb; Thu,  7 Jan 2016 10:57:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u07Av6LF016697
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 7 Jan 2016 10:57:08 GMT
Message-ID: <1452164226.7598.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2016 10:57:06 +0000
In-Reply-To: <40d0365cec15c63a1f77e9aa43fb4022f62e0f66.1452152689.git.liezhi.yang@windriver.com>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<40d0365cec15c63a1f77e9aa43fb4022f62e0f66.1452152689.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] run-postinsts: can't be allarch
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
X-List-Received-Date: Thu, 07 Jan 2016 10:57:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-06 at 23:45 -0800, Robert Yang wrote:
> The dependencies chain:
> run-postinsts -> update-rc.d.bbclass -> initscripts -> update
> -alternatives.
> 
> The update-alternatives is provided by opkg-utils which is not
> allarch.
> 
> This caused a problem:
> $ bitbake lib32-core-image-minimal
> 
> Both lib32-opkg-utils and opkg-utils would be built, but opkg-utils
> shouldn't, this patch can fix the problem.
> 
> [YOCTO #8879]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Removing allarch isn't the correct way to fix this, we need to figure
out what is going wrong and fix multilib.

Cheers,

Richard

