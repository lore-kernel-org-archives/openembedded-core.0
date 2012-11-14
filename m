Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TYdsc-0004p3-SG
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:23:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAEE9sZT005028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 06:09:54 -0800 (PST)
Received: from msp-dhcp30.wrs.com (172.25.34.30) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 14 Nov 2012 06:09:53 -0800
Message-ID: <50A3A633.2040801@windriver.com>
Date: Wed, 14 Nov 2012 08:09:55 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<ced593109000abdca328d606f02ced75f30a9ca5.1352871028.git.sgw@linux.intel.com>
In-Reply-To: <ced593109000abdca328d606f02ced75f30a9ca5.1352871028.git.sgw@linux.intel.com>
Subject: Re: [PATCH 2/9] builder: Add password for user
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
X-List-Received-Date: Wed, 14 Nov 2012 14:23:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/12 11:32 PM, Saul Wold wrote:
> This is needed to allow openssh to work correctly for the Eclipse
> plugin to have access to the build appliance to view/modify recipes
> and lauch builds
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-graphics/builder/builder_0.1.bb |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
> index 5c12c14..7ac531c 100644
> --- a/meta/recipes-graphics/builder/builder_0.1.bb
> +++ b/meta/recipes-graphics/builder/builder_0.1.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "New user to do specific job"
>   DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
>   SECTION = "x11"
> -PR = "r4"
> +PR = "r5"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
>
> @@ -18,7 +18,8 @@ inherit useradd
>   USERADD_PACKAGES = "${PN}"
>   USERADD_PARAM_${PN} = "--system --create-home \
>                          --groups video,tty,audio \
> -                       --user-group ${PN}"
> +                       --user-group ${PN} \
> +                       --password .gLibiNXn0P12"

This should work, but can you add a comment that indicates the plain-text for 
the password?

--Mark

>   do_install () {
>   	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
>



