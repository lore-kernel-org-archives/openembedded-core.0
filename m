Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Jan 2015 09:43:16 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.15])
	by mail.openembedded.org (Postfix) with ESMTP id 5242271F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 09:43:16 +0000 (UTC)
Received: from [216.82.249.131] by server-15.bemta-12.messagelabs.com id
	E5/A0-02699-1B12EB45; Tue, 20 Jan 2015 09:36:49 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-15.tower-28.messagelabs.com!1421746608!37993964!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23694 invoked from network); 20 Jan 2015 09:36:49 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-15.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	20 Jan 2015 09:36:49 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Tue, 20 Jan 2015 03:36:47 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Tue, 20 Jan 2015 03:36:47 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Tue, 20 Jan 2015 10:36:45 +0100
Message-ID: <54BE21A5.1090705@digi.com>
Date: Tue, 20 Jan 2015 10:36:37 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [Dizzy backport] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Tue, 20 Jan 2015 09:43:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Toolchains/SDK generated with Dizzy have the problem this commit fixes.

So could this be cherry-picked to Dizzy?

It applies just fine, there is no need to rework it.

-
Regards,

Javier Viguera


On 01/12/14 17:36, Ross Burton wrote:
> If any part of Python gets installed in a SDK, we need to ensure that all of
> Python gets installed to avoid replacing python in the environment with a
> minimal package set.
>
> Signed-off-by: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>   meta/recipes-devtools/python/python_2.7.3.bb |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
> index 50c751e..7f13e22 100644
> --- a/meta/recipes-devtools/python/python_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
> @@ -161,6 +161,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
>   # manual dependency additions
>   RPROVIDES_${PN}-core = "${PN}"
>   RRECOMMENDS_${PN}-core = "${PN}-readline"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
>   RRECOMMENDS_${PN}-crypt = "openssl"
>   RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
>
>

