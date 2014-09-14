Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A976A6FC4C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 10:28:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8EASN3B004973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 03:28:26 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 14 Sep 2014 03:28:23 -0700
Message-ID: <54156DE2.3030802@windriver.com>
Date: Sun, 14 Sep 2014 18:28:50 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1410673076.git.Qi.Chen@windriver.com>
	<356ac4d5b582ba0c09633e4fbbd3da4f5f49a7e5.1410673076.git.Qi.Chen@windriver.com>
In-Reply-To: <356ac4d5b582ba0c09633e4fbbd3da4f5f49a7e5.1410673076.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH 1/1] systemd: fix to use ${libdir}
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
X-List-Received-Date: Sun, 14 Sep 2014 10:28:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2014 01:39 PM, Chen Qi wrote:
> We need to user ${libdir} instead of ${exec_prefix}/lib.
> Otherwise, we would neet do_install errors if multilib is enabled.

typo here.

Should be 'meet' instead of 'neet'.

V2 has been sent.

//Chen Qi

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_216.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
> index bd52891..331da99 100644
> --- a/meta/recipes-core/systemd/systemd_216.bb
> +++ b/meta/recipes-core/systemd/systemd_216.bb
> @@ -129,7 +129,7 @@ do_install() {
>   	fi
>   
>   	# Move libgudev back to ${rootlibdir} to keep backward compatibility
> -	[ ${rootlibdir} != ${exec_prefix}/lib ] && mv -t ${D}${rootlibdir} ${D}${exec_prefix}/lib/libgudev*
> +	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev*
>   
>           # Delete journal README, as log can be symlinked inside volatile.
>           rm -f ${D}/${localstatedir}/log/README
> @@ -241,7 +241,7 @@ FILES_${PN} = " ${base_bindir}/* \
>                   ${rootlibexecdir}/systemd/* \
>                   ${systemd_unitdir}/* \
>                   ${base_libdir}/security/*.so \
> -                ${exec_prefix}/lib/libnss_* \
> +                ${libdir}/libnss_* \
>                   /cgroup \
>                   ${bindir}/systemd* \
>                   ${bindir}/busctl \


