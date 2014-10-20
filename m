Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDCCC65CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:23:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9K3NAsD009269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 20:23:10 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 19 Oct 2014 20:23:09 -0700
Message-ID: <5444801F.3060009@windriver.com>
Date: Mon, 20 Oct 2014 11:23:11 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <1413424950-14820-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1413424950-14820-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: rpm needs gnupg to do signature
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
X-List-Received-Date: Mon, 20 Oct 2014 03:23:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

-R

On 10/16/2014 10:02 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> rpm needs gnupg to do signature, otherwise the below error:
>
>      $ rpm -v --addsign m4-1.4.16-r4.0.x86_64.rpm
>      Enter pass phrase:
>      error: Could not exec gpg: No such file or directory
>      $
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/rpm/rpm_5.4.14.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> index fb8a507..78a880a 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> @@ -335,6 +335,7 @@ RDEPENDS_${PN} = "base-files run-postinsts"
>   RDEPENDS_${PN}_class-native = ""
>   RDEPENDS_${PN}_class-nativesdk = ""
>   RDEPENDS_${PN}-build = "file bash perl"
> +RRECOMMENDS_${PN}_class-target = "gnupg"
>
>   RDEPENDS_python-rpm = "${PN}"
>
>

-- 
Best Reagrds,
Roy | RongQing Li

