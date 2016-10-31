Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A32BB71AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:58:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9V8wppc022811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 01:58:51 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Oct 2016 01:58:50 -0700
To: "Junxian.Xiao" <Junxian.Xiao@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1477903377-19397-1-git-send-email-Junxian.Xiao@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5aab623a-7ac6-e8ae-e8d4-cd57332ceb35@windriver.com>
Date: Mon, 31 Oct 2016 16:58:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477903377-19397-1-git-send-email-Junxian.Xiao@windriver.com>
Subject: Re: [PATCH] apache2: include .load files in modules.d
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
X-List-Received-Date: Mon, 31 Oct 2016 08:58:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Junxian,

This should go into openembedded-devel@lists.openembedded.org

Please see README in each layer of meta-openembedded to see how to
send patches.

// Robert

On 10/31/2016 04:42 PM, Junxian.Xiao wrote:
> Issue: LIN8-5007
>
> According to other linux distributes like ubuntu, the modules
> are usually included by 'LoadModule' command in *.load files
> in mods-enable directory, and *.conf files in this directory
> are for special configurations for each module.
>
> The stucture of the files tree is not the same in yocto, so this
> may be not the rule that we must follow. But still add *.load to
> be compatible with customer's normal usage habits.
>
> Signed-off-by: Junxian.Xiao <Junxian.Xiao@windriver.com>
> ---
>  .../recipes-httpd/apache2/apache2_2.4.16.bb        |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> index 4aacff1..52127c2 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> @@ -81,6 +81,7 @@ do_install_append() {
>
>      # Ensure configuration file pulls in conf.d and modules.d
>      printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
> +    printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
>      printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
>      # match with that is in init script
>      printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
>

