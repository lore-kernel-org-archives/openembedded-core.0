Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFByH-0004j1-TP
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:13:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2012 15:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149310492"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2012 15:03:50 -0700
Message-ID: <4F7B73C6.8080305@linux.intel.com>
Date: Tue, 03 Apr 2012 15:03:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1203240905540.4298@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203240905540.4298@oneiric>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH] PPP: Remove leftover reference to "nylon" distro from PPP recipe.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 22:13:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2012 06:07 AM, Robert P. J. Day wrote:
>
> Delete reference to what is apparently a remnant from the OE-core
> split, according to Paul Eggleton.
>
> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> index 6af0d42..ed815d3 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> @@ -55,7 +55,6 @@ do_install_append () {
>   CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
>   PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
>   FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd"
> -FILES_${PN}_nylon  = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${sbindir}/tdbread"
>   FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
>   FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
>   FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
>

Merged into OE-Core

Thanks
	Sau!


