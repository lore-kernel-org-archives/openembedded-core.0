Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Txcys-0002WC-MH
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 13:29:37 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1TxcPf-0003aP-RV from Fahad_Usman@mentor.com ;
	Tue, 22 Jan 2013 03:53:11 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Jan 2013 03:53:11 -0800
Received: from [137.202.156.99] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Tue, 22 Jan 2013 11:53:09 +0000
Message-ID: <50FE7DA2.4020101@mentor.com>
Date: Tue, 22 Jan 2013 16:53:06 +0500
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1358808282-11495-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1358808282-11495-1-git-send-email-sgw@linux.intel.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 22 Jan 2013 11:53:11.0331 (UTC)
	FILETIME=[0D77AF30:01CDF897]
Cc: Chris Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] blktrace: add back do_install method
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
X-List-Received-Date: Tue, 22 Jan 2013 12:29:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2013 03:44 AM, Saul Wold wrote:
> The recent change to blktrace removed the do_install method,
> since this recipe does not use autotools it needs to specifiy
> a do_install activity.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-kernel/blktrace/blktrace_git.bb | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
> index 80cb14c..a318f0e 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> @@ -6,7 +6,7 @@ DEPENDS = "libaio"
>   
>   SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
>   
> -PR = "r5"
> +PR = "r6"
>   PV = "1.0.5+git${SRCPV}"
>   
>   SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=git \
> @@ -20,3 +20,9 @@ EXTRA_OEMAKE = "\
>       'LDFLAGS=${LDFLAGS}' \
>   "
>   PARALLEL_MAKE = ""
> +
> +do_install() {
> +	oe_runmake ARCH="${ARCH}" prefix=${prefix} \
> +		mandir=${mandir} DESTDIR=${D} install
> +}
> +
Hi Saul,
Thanks for correcting my mistake.

Regards,
Fahad


