Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1U2G9P-0001lG-BF
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 08:07:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r146pkC6018455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Feb 2013 22:51:46 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 3 Feb 2013 22:51:45 -0800
Message-ID: <510F5A82.7040403@windriver.com>
Date: Mon, 4 Feb 2013 14:51:46 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
References: <3826> <1359960483-19864-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1359960483-19864-1-git-send-email-yanjun.zhu@windriver.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2PATCH] pulseaudio_2.1: Remove the dependence of fftw. Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 07:07:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Saul

Sorry. The title is wrong. Please ignore this email.
I will resend this patch.

Thanks a lot.
Zhu Yanjun

On 02/04/2013 02:48 PM, yanjun.zhu wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 6633e38..2fed4f9 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -40,6 +40,7 @@ EXTRA_OECONF = "\
>   		--disable-openssl \
>   		--disable-xen \
>   		--with-database=simple \
> +		--without-fftw \
>   "
>   
>   PARALLEL_MAKE = ""



