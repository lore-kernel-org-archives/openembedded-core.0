Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjBck-000852-JT for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 16:22:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06FF7Em022075
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 15:15:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21013-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 15:15:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06FF0gR022056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 15:15:01 GMT
Message-ID: <1325862900.20759.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 15:15:00 +0000
In-Reply-To: <4F06F66D.8030703@mlbassoc.com>
References: <4F06F66D.8030703@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] webkit-gtk: Fix build
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
X-List-Received-Date: Fri, 06 Jan 2012 15:22:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 06:26 -0700, Gary Thomas wrote:
> This version (introduced in commit 663c893b084333ea9703079a9b056d74ffa5e2a3)
> can only build if GL support is present.  This change enables that support
> explicitly.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> index 9652953..6fcf3f1 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>                       file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>                       file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
>   -DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime 
> sqlite3"
> +DEPENDS = "virtual/libgl zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 \
> +           cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base \
> +           flex-native gperf-native perl-native-runtime sqlite3 \
> +"
>   DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
>    SRCREV_FORMAT = "source"


This patch is also corrupt and doesn't apply :(

Cheers,

Richard



