Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZtPk-0000Oj-DA
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 01:34:24 +0200
Received: by pwi1 with SMTP id 1so1642722pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 16:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MBbHlaWqLEvMqmETENdlIPzBqb0cjA2PWUVPa7oq2Ak=;
	b=x4jKHM/UlSmpYPyEMHZ0SQVcHMddoGaXJrnSgjdohQaYZ9xwQ0nRd/03saeT2ywVrg
	5UxRQ/er7xGDqdeys1tr14o0FnECP35k0dOFHrbNe4XMsp+BPcfAJfYaBfCc4hyn0ti5
	d1JrNEqDW+IhKwKoMkRGy2ha/gV4T28BMWv44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=u0iglW+onwS3RcQasA8+x0B18O9O47MybeZlCfdB20w0pdtw7QQHaFeIRszaUg6+qM
	7dmk86c5y0AnOpWOvb7NXvJSuF34O1BjdeGUrHi4O9hAmpMsH4Gm34D3L6cIw+Oo19ll
	CsKWXVlceqHkq0OM0V55o8wj1QRmT4gx+p00M=
Received: by 10.142.250.9 with SMTP id x9mr559368wfh.178.1308871846898;
	Thu, 23 Jun 2011 16:30:46 -0700 (PDT)
Received: from [192.168.1.75] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l10sm1447054wfk.9.2011.06.23.16.30.46
	(version=SSLv3 cipher=OTHER); Thu, 23 Jun 2011 16:30:46 -0700 (PDT)
Message-ID: <4E03CCA5.3040600@gmail.com>
Date: Thu, 23 Jun 2011 16:30:45 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308763995.git.mark.hatle@windriver.com>
	<5c4ce64fb0bf1c4e8a5899e292917836953412d3.1308763995.git.mark.hatle@windriver.com>
In-Reply-To: <5c4ce64fb0bf1c4e8a5899e292917836953412d3.1308763995.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 01/40] resolveconf: Fix file owners
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
X-List-Received-Date: Thu, 23 Jun 2011 23:34:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2011 10:35 AM, Mark Hatle wrote:
> The file ownership of various configuration files needs to be set to root:root
> otherwise it inherits the user id of the build.
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> ---
>   .../resolvconf/resolvconf_1.48.bb                  |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb
> index cb8aaaf..507a233 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb
> @@ -11,7 +11,7 @@ AUTHOR = "Thomas Hood"
>   HOMEPAGE = "http://packages.debian.org/resolvconf"
>   DEPENDS = "bash"
>   RDEPENDS_${PN} = "bash"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
>
> @@ -27,6 +27,7 @@ do_install () {
>   	install -d ${D}${sysconfdir} ${D}${sbindir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
>   	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>   	cp -pPR etc/* ${D}${sysconfdir}/
> +	chown -R root:root ${D}${sysconfdir}/

you can also modify install command 3 lines above
--group=GROUP
--mode=MODE
--owner=OWNER
--preserve-timestamps

one of above options is what you need.

>   	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
>   	install -m 0644 README ${D}${docdir}/${P}/
>   	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/



