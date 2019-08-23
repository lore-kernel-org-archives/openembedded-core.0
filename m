Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBCF37F344
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 09:16:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N9FuAo016508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 02:16:33 -0700
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 23 Aug 2019 02:16:07 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1565945781-19433-1-git-send-email-yi.zhao@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <7d197365-521a-2da6-ce4a-933eb665dd9b@windriver.com>
Date: Fri, 23 Aug 2019 17:16:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565945781-19433-1-git-send-email-yi.zhao@windriver.com>
X-Originating-IP: [128.224.162.136]
Subject: Re: [PATCH] screen: add /etc/screenrc as global config file
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
X-List-Received-Date: Fri, 23 Aug 2019 09:16:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping..

The /etc/screenrc exists in other distributions as the default config file.


//Yi


On 8/16/19 4:56 PM, Yi Zhao wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   meta/recipes-extended/screen/screen_4.6.2.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/screen/screen_4.6.2.bb b/meta/recipes-extended/screen/screen_4.6.2.bb
> index 24ec751..21b476d 100644
> --- a/meta/recipes-extended/screen/screen_4.6.2.bb
> +++ b/meta/recipes-extended/screen/screen_4.6.2.bb
> @@ -35,10 +35,11 @@ inherit autotools texinfo
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
>   
> -EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
> +EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 --with-sys-screenrc=${sysconfdir}/screenrc \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
>   
>   do_install_append () {
> +	install -D -m 644 ${S}/etc/etcscreenrc ${D}/${sysconfdir}/screenrc
>   	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
>   		install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
>   	fi

