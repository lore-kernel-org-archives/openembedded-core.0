Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEAE60912
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 12:11:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5KCHSQu003710; Thu, 20 Jun 2013 13:18:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nOtMlpaF1Kao; Thu, 20 Jun 2013 13:18:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5KCI0Q6003753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 20 Jun 2013 13:18:02 +0100
Message-ID: <1371730296.20823.231.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jackie.huang@windriver.com
Date: Thu, 20 Jun 2013 13:11:36 +0100
In-Reply-To: <1371726597-22194-1-git-send-email-jackie.huang@windriver.com>
References: <1371726597-22194-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxml2 CVE-2012-2807
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
X-List-Received-Date: Thu, 20 Jun 2013 12:11:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-20 at 19:09 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Multiple integer overflows in libxml2, as used in Google Chrome
> before 20.0.1132.43, on 64-bit Linux platforms allow remote attackers to
> cause a denial of service or possibly have unspecified other impact via unknown vectors.
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2807
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../libxml/libxml2/libxml2-fix-CVE-2012-2807.patch |   78 ++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.1.bb          |    1 +
>  2 files changed, 79 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
> 
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
> new file mode 100644
> index 0000000..f796ab7
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
> @@ -0,0 +1,78 @@
> +Attempt to address libxml crash.
> +
> +BUG=129930
> +Review URL: https://chromiumcodereview.appspot.com/10458051
> +
> +https://src.chromium.org/viewvc/chrome?view=rev&revision=142822
> +
> +2012-2807
> +Multiple integer overflows in libxml2, as used in Google Chrome
> +before 20.0.1132.43, on 64-bit Linux platforms allow remote attackers to cause \
> +a denial of service or possibly have unspecified other impact via unknown vectors.
> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2807
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>

No Upstream-Status field.

Cheers,

Richard


