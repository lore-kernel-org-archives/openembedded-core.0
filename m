Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1QVGQr-00044K-JE for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 07:08:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1QVG97-0006Kd-7j for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 06:50:05 +0200
Received: from 99-57-141-118.lightspeed.sntcca.sbcglobal.net ([99.57.141.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 06:50:05 +0200
Received: from raj.khem by 99-57-141-118.lightspeed.sntcca.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 06:50:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jun 2011 21:45:16 -0700
Message-ID: <isurst$thf$1@dough.gmane.org>
References: <1307733731-3693-1-git-send-email-anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 99-57-141-118.lightspeed.sntcca.sbcglobal.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
In-Reply-To: <1307733731-3693-1-git-send-email-anders@chargestorm.se>
Subject: Re: [PATCH] perl-native: fix download url
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
X-List-Received-Date: Sat, 11 Jun 2011 05:08:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 12:22 PM, Anders Darander wrote:
> Signed-off-by: Anders Darander<anders@chargestorm.se>
> ---
>   meta/recipes-devtools/perl/perl-native_5.12.3.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
> index cbb4e78..1751516 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
> @@ -9,7 +9,7 @@ PR = "r2"
>   LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>                       file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>
> -SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
> +SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \
>              file://Configure-multilib.patch \
>              file://perl-configpm-switch.patch \
>              file://parallel_build_fix_1.patch \

I think while you are at it switch the url to use
www.cpan.org/src

-Khem



