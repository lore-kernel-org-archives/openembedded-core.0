Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C4A4860644
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 13:58:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0LDw9YR017763; Tue, 21 Jan 2014 13:58:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5FZDCpHyn6Zg; Tue, 21 Jan 2014 13:58:09 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0LDvK5a017727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jan 2014 13:57:22 GMT
Message-ID: <1390312633.874.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Tue, 21 Jan 2014 13:57:13 +0000
In-Reply-To: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 21 Jan 2014 13:58:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
> Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.
> 
> Original behaviour:
> 
> INHIBIT_PACKAGE_STRIP: no strip, no debug split
> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
> 
> Behaviour after this patch:
> 
> INHIBIT_PACKAGE_STRIP: no strip, no debug split
> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/classes/package.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

FWIW this resulted in a failure on minnow:

http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/steps/BuildImages/logs/stdio

So we may have some fixing up to do before this change can be merged...

Cheers,

Richard


