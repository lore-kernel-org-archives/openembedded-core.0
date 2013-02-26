Received: from mail1.bemta8.messagelabs.com ([216.82.243.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Javier.Viguera@digi.com>) id 1UAOW4-0001Fi-9D
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:40:42 +0100
Received: from [216.82.241.196:13729] by server-9.bemta-8.messagelabs.com id
	1D/2E-32481-2CFEC215; Tue, 26 Feb 2013 17:24:18 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-7.tower-46.messagelabs.com!1361899457!28658811!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.8.6; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16628 invoked from network); 26 Feb 2013 17:24:18 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-7.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	26 Feb 2013 17:24:18 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Tue, 26 Feb 2013 11:24:14 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.297.1; Tue, 26 Feb 2013 11:24:17 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Tue, 26 Feb 2013 18:24:15 +0100
Message-ID: <512CEFBE.4010901@digi.com>
Date: Tue, 26 Feb 2013 18:24:14 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1361372957-38860-1-git-send-email-javier.viguera@digi.com>
In-Reply-To: <1361372957-38860-1-git-send-email-javier.viguera@digi.com>
Subject: Re: [PATCH] base-files: fix 'dash' expanding '\n'
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
X-List-Received-Date: Tue, 26 Feb 2013 17:40:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I just saw this patch i sent last week was pushed to 
openembedded-core/poky *master* branches. Thanks for that.

But in my development i am using stable 'danny' branches.

Any chance that this patch gets cherry-picked to 'danny' on 
openembedded-core and poky repos?

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


On 02/20/2013 04:09 PM, Javier Viguera wrote:
> Dash's 'echo' command expands '\n' by default, so the '\n' is not
> included in the '/etc/issue' file.
>
> Use 'printf' for portability between different shells.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>
> Probably also worth to be cherry-picked to 'danny' branch.
>
>   meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 6a3db50..e7a9d82 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -129,7 +129,7 @@ do_install_basefilesissue () {
>   			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
>   			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
>   		fi
> -		echo "\n \l" >> ${D}${sysconfdir}/issue
> +		printf "\\\n \\\l\n" >> ${D}${sysconfdir}/issue
>   		echo >> ${D}${sysconfdir}/issue
>   		echo "%h"    >> ${D}${sysconfdir}/issue.net
>   		echo >> ${D}${sysconfdir}/issue.net
>



