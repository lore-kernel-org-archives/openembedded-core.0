Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE7DD705D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:03:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6OE3EqB027198
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 07:03:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 07:03:13 -0700
Message-ID: <53D11221.9070704@windriver.com>
Date: Thu, 24 Jul 2014 09:03:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406187862-2819-1-git-send-email-stefan@agner.ch>
In-Reply-To: <1406187862-2819-1-git-send-email-stefan@agner.ch>
Subject: Re: [PATCH] shadow-securetty: add freescale lpuart
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
X-List-Received-Date: Thu, 24 Jul 2014 14:03:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

We should probably be setting up the securetty file in a machine specific way.

Doing it generically just pollutes the file with more stuff a specific user 
won't want.

(Note, you aren't the first to do this.. so right now it's probably the best 
answer, but we should fix this in the future.)

--Mark

On 7/24/14, 2:44 AM, Stefan Agner wrote:
> Add Freescale lpuart tty's (ttyLPx) to securetty. Freescale Vybrid
> devices running upstream kernel use this driver.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>   meta/recipes-extended/shadow/files/securetty | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
> index 0b1629f..d919993 100644
> --- a/meta/recipes-extended/shadow/files/securetty
> +++ b/meta/recipes-extended/shadow/files/securetty
> @@ -137,6 +137,14 @@ ttymxc3
>   ttymxc4
>   ttymxc5
>
> +# Freescale lpuart ports
> +ttyLP0
> +ttyLP1
> +ttyLP2
> +ttyLP3
> +ttyLP4
> +ttyLP5
> +
>   # Standard serial ports, with devfs
>   tts/0
>   tts/1
>


