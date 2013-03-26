Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UKQHP-0000rC-53
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 10:34:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q9HquJ029243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 02:17:52 -0700 (PDT)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 26 Mar 2013 02:17:52 -0700
Message-ID: <515167BF.10305@windriver.com>
Date: Tue, 26 Mar 2013 17:17:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1364286013-25970-1-git-send-email-anders.roxell@gmail.com>
In-Reply-To: <1364286013-25970-1-git-send-email-anders.roxell@gmail.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH] initscripts: RDEPENDS sed to remove "sed: command not found".
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
X-List-Received-Date: Tue, 26 Mar 2013 09:34:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/26/2013 04:20 PM, anders.roxell@gmail.com wrote:
> From: Anders Roxell <anders.roxell@enea.com>
>
> Log:
> /etc/rcS.d/S37populate-volatile.sh: line 13: sed: command not found
> /etc/rcS.d/S37populate-volatile.sh: line 152: sed: command not found
> /etc/rcS.d/S37populate-volatile.sh: line 152: sed: command not found
>
> Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> ---
>   meta/recipes-core/initscripts/initscripts_1.0.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 649e182..bfd3d28 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r140"
> +PR = "r141"
>   
>   INHIBIT_DEFAULT_DEPS = "1"
>   
> @@ -39,6 +39,7 @@ KERNEL_VERSION = ""
>   
>   inherit update-alternatives
>   DEPENDS_append = " update-rc.d-native"
> +RDEPENDS_${PN} = " sed"
>   
>   ALTERNATIVE_PRIORITY = "90"
>   ALTERNATIVE_${PN} = "functions"

busybox also provides sed if CONFIG_SED is enabled.
I'm wondering whether it's necessary to insert dependency here.
If so, then I think other packages which provide init scripts may also 
rdepend on 'busybox' or 'coreutils' which provide basic commands like 
'chown' or 'sed'.

Best Regards,
Chen Qi


