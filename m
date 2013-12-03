Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEEE26D83F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 00:57:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB30vTnV021869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2013 16:57:29 -0800 (PST)
Received: from [147.11.117.81] (147.11.117.81) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 2 Dec 2013 16:57:29 -0800
Message-ID: <529D2C6D.4010504@windriver.com>
Date: Mon, 2 Dec 2013 19:57:17 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
	<fe0e88c120d0d9b14b7b5169d822f2d7b0454012.1385728901.git.Qi.Chen@windriver.com>
In-Reply-To: <fe0e88c120d0d9b14b7b5169d822f2d7b0454012.1385728901.git.Qi.Chen@windriver.com>
X-Originating-IP: [147.11.117.81]
Subject: Re: [PATCH 06/18] xz: rdepend on bash
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
X-List-Received-Date: Tue, 03 Dec 2013 00:57:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-29 07:48 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Make xz explicitly rdepend on bash so that the rootfs task will
> not fail for the reason of implicit runtime bash dependency.
>
> [YOCTO #5555]

Can you explain why bash is needed?

A quick look just turned up:
xz-5.1.2alpha/src/scripts/xzgrep
#!/bin/sh
...

I know you're script looks at the .rpm files but
what puts the bash dependency in the rpm?

../Randy

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-extended/xz/xz_5.1.3alpha.bb |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/xz/xz_5.1.3alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
> index b49fbf7..4e07709 100644
> --- a/meta/recipes-extended/xz/xz_5.1.3alpha.bb
> +++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
> @@ -13,6 +13,8 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
>   SRC_URI[md5sum] = "bbb2daa876c87fb2cf9fe4590af9694e"
>   SRC_URI[sha256sum] = "9f94506e301d5b6863921bba861a99ba00de384dafb4e5f409679a93e41613d4"
>
> +RDEPENDS_${PN}_class-target = "bash"
> +
>   inherit autotools gettext
>
>   PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

