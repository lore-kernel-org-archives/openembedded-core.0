Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1997E71FC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 13:53:23 +0000 (UTC)
Received: from [216.82.241.196] by server-4.bemta-8.messagelabs.com id
	BD/49-27904-3D7B4645; Thu, 13 Nov 2014 13:53:23 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-7.tower-46.messagelabs.com!1415886802!35766148!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3552 invoked from network); 13 Nov 2014 13:53:23 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-7.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	13 Nov 2014 13:53:23 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Thu, 13 Nov 2014 07:53:19 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 13 Nov 2014 07:53:21 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 13 Nov 2014 14:53:19 +0100
Message-ID: <5464B7C6.8070205@digi.com>
Date: Thu, 13 Nov 2014 14:53:10 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1413799988-50345-1-git-send-email-javier.viguera@digi.com>
In-Reply-To: <1413799988-50345-1-git-send-email-javier.viguera@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [daisy][PATCH] file: add wrapper to nativesdk-file
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
X-List-Received-Date: Thu, 13 Nov 2014 13:53:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping (hopefully to be included in daisy point release 1.6.2)

-
Regards,

Javier Viguera


On 20/10/14 12:13, Javier Viguera wrote:
> Backport commit 69a3ab3 to 'daisy' which uses a different version of
> file package.
>
> Author of the original patch: Hongxu Jia <hongxu.jia-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
>
> Signed-off-by: Javier Viguera <javier.viguera-i7dp0qKlBMg@public.gmane.org>
> ---
>   meta/recipes-devtools/file/file_5.16.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/file/file_5.16.bb b/meta/recipes-devtools/file/file_5.16.bb
> index 46dbf88f8db0..a15d952e3de6 100644
> --- a/meta/recipes-devtools/file/file_5.16.bb
> +++ b/meta/recipes-devtools/file/file_5.16.bb
> @@ -32,5 +32,9 @@ do_install_append_class-native() {
>   		--magic-file ${datadir}/misc/magic.mgc
>   }
>
> +do_install_append_class-nativesdk() {
> +	create_cmdline_wrapper ${D}/${bindir}/file \
> +		--magic-file ${datadir}/misc/magic.mgc
> +}
>
>   BBCLASSEXTEND = "native nativesdk"
>


