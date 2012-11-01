Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TTwwe-00019D-3b
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 16:44:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA1FUr10015275
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2012 08:30:54 -0700 (PDT)
Received: from msp-dhcp22.wrs.com (172.25.34.22) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 1 Nov 2012 08:30:53 -0700
Message-ID: <509295B0.3000707@windriver.com>
Date: Thu, 1 Nov 2012 10:30:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1351755131-22192-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1351755131-22192-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] builder: Add password for user
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
X-List-Received-Date: Thu, 01 Nov 2012 15:44:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/12 2:32 AM, Saul Wold wrote:
> This is needed to allow openssh to work correctly for the Eclipse
> plugin to have access to the build appliance to view/modify recipes
> and lauch builds
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-graphics/builder/builder_0.1.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
> index 5c12c14..d46e960 100644
> --- a/meta/recipes-graphics/builder/builder_0.1.bb
> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
> @@ -18,7 +18,8 @@ inherit useradd
>   USERADD_PACKAGES = "${PN}"
>   USERADD_PARAM_${PN} = "--system --create-home \
>                          --groups video,tty,audio \
> -                       --user-group ${PN}"
> +                       --user-group ${PN} \
> +                       --password ${PN}"

The above won't work.  The password passed to --password, must be in encrypted 
in crypt(3) format.

--Mark

>
>   do_install () {
>   	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
>



