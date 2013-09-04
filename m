Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9198F6BDAA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 07:00:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r84705Ng007261
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2013 00:00:05 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 4 Sep 2013 00:00:03 -0700
Message-ID: <5226DA72.8010709@windriver.com>
Date: Wed, 4 Sep 2013 15:00:02 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <cover.1378276893.git.rongqing.li@windriver.com>
	<c4888f2e74ac1e1a20ea6907d982f208a0bd556d.1378276893.git.rongqing.li@windriver.com>
In-Reply-To: <c4888f2e74ac1e1a20ea6907d982f208a0bd556d.1378276893.git.rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd-compat-units: do not create runlevel command
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
X-List-Received-Date: Wed, 04 Sep 2013 07:00:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2013 02:56 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> It seems strange that runlevel always returns 1, we should create
> a runlevel link to systemctl if systemd is installed.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd-compat-units.bb |    5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> index 9b4a8a4..c47c14b 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -21,11 +21,6 @@ do_install() {
>   	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/system
>   	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
>   	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.wants/
> -
> -	# hack to make old style sysvinit postinsts succeed
> -	install -d ${D}${bindir}
> -	echo "echo 1" > ${D}${bindir}/runlevel
> -	chmod 0755 ${D}${bindir}/runlevel


In fact, I am not sure what they are fixing, if these codes are still using,
I will think other methods to make runlevel work

-Roy



>   }
>
>   SYSTEMD_DISABLED_SYSV_SERVICES = " \
>

-- 
Best Reagrds,
Roy | RongQing Li

