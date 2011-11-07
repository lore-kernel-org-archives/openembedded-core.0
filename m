Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNWvK-0005Ex-Hs
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 22:40:11 +0100
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 13:32:51 -0800
Received: by mail-pz0-f44.google.com with SMTP id 32so448144pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 13:32:52 -0800 (PST)
Received: by 10.68.72.73 with SMTP id b9mr2412844pbv.100.1320701571969;
	Mon, 07 Nov 2011 13:32:51 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id a4sm5015473pbl.11.2011.11.07.13.32.50
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 13:32:51 -0800 (PST)
Message-ID: <4EB84E7F.603@intel.com>
Date: Mon, 07 Nov 2011 13:32:47 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EB8225D.6000804@intel.com>
	<1320700315-11952-1-git-send-email-eric@eukrea.com>
	<1320700315-11952-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1320700315-11952-2-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 2/2] dbus: fix install for virtclass-nativesdk
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
X-List-Received-Date: Mon, 07 Nov 2011 21:40:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2011 01:11 PM, Eric Bénard wrote:
> * 46e6c3fa8034b12d178d605f3f5d7efe69671a13 changed do_install
> which now fails for nativesdk (chown messagebus leads to no
> such user)
> * tested by building meta-toolchain-qte and running the generated
> sdk
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   meta/recipes-core/dbus/dbus.inc |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index caa781c..99b2fc7 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -105,4 +105,8 @@ do_install_virtclass-native() {
>   	# dbus-glib-native and dbus-glib need this xml file
>   	./bus/dbus-daemon --introspect>  ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
>   }
> +
> +do_install_virtclass-nativesdk() {
> +	autotools_do_install
> +}
>   BBCLASSEXTEND = "native nativesdk"


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


