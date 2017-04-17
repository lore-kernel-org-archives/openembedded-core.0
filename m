Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 743AC71A88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 04:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3H4bNBA005734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Apr 2017 21:37:23 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 16 Apr 2017 21:37:22 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1491876119-195521-1-git-send-email-dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <2f2ca19a-5af9-aa71-23bc-c2d30ea43445@windriver.com>
Date: Mon, 17 Apr 2017 12:37:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491876119-195521-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.189]
Subject: Re: [PATCH] openssh: upgrade to 7.5p1
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
X-List-Received-Date: Mon, 17 Apr 2017 04:37:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.


On 2017年04月11日 10:01, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   .../openssh/{openssh_7.4p1.bb => openssh_7.5p1.bb}                    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/openssh/{openssh_7.4p1.bb => openssh_7.5p1.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> similarity index 97%
> rename from meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> index c8093d4..5b96745 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> @@ -29,8 +29,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>   
>   PAM_SRC_URI = "file://sshd"
>   
> -SRC_URI[md5sum] = "b2db2a83caf66a208bb78d6d287cdaa3"
> -SRC_URI[sha256sum] = "1b1fc4a14e2024293181924ed24872e6f2e06293f3e8926a376b8aec481f19d1"
> +SRC_URI[md5sum] = "652fdc7d8392f112bef11cacf7e69e23"
> +SRC_URI[sha256sum] = "9846e3c5fab9f0547400b4d2c017992f914222b3fd1f8eee6c7dc6bc5e59f9f0"
>   
>   inherit useradd update-rc.d update-alternatives systemd
>   


