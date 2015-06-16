Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id F02557413A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:33:19 +0000 (UTC)
Received: (qmail 17023 invoked by uid 1003); 16 Jun 2015 11:33:19 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@71.171.14.12)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Jun 2015 11:33:19 -0000
Message-ID: <5580097E.1000607@balister.org>
Date: Tue, 16 Jun 2015 07:33:18 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433189842-17654-1-git-send-email-philip@balister.org>
	<1433189842-17654-2-git-send-email-philip@balister.org>
In-Reply-To: <1433189842-17654-2-git-send-email-philip@balister.org>
Subject: Re: [PATCH 2/2] packagegroup-core-tools-profile.bb: Remove oprofile.
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
X-List-Received-Date: Tue, 16 Jun 2015 11:33:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ping

On 06/01/2015 04:17 PM, Philip Balister wrote:
> Oprofile functions duplicate perf. Since perf is easier to use drop oprofile
> from the core-tools-profile package.
> 
> Also, the oprofile-ui package opens a port on the device. removing this
> package reduces a possible security issue for devices with profiling tools.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 6f4842f..80f5933 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -19,15 +19,12 @@ PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'sys
>  RRECOMMENDS_${PN} = "\
>      perf \
>      trace-cmd \
> -    kernel-module-oprofile \
>      blktrace \
>      ${PROFILE_TOOLS_X} \
>      ${PROFILE_TOOLS_SYSTEMD} \
>      "
>  
>  PROFILETOOLS = "\
> -    oprofile \
> -    oprofileui-server \
>      powertop \
>      latencytop \
>      "
> 

