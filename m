Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R8A8Q-0004JN-0F for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:18:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R8A39-0000Lj-O8 for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:12:43 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 14:12:43 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 14:12:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 26 Sep 2011 16:11:37 +0400
Message-ID: <j5pq7d$epu$1@dough.gmane.org>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Subject: Re: [PATCH 01/10] default-provider: also define a default provider for gconf-native
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
X-List-Received-Date: Mon, 26 Sep 2011 12:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Please delay this patch for a while. Now I get the following warning in 
my build logs (If someone can tell me where the problem lies, that would 
help).

ERROR: Trying to resolve runtime dependency gconf resulted in 
conflicting PREFERRED_PROVIDER entries being found.
The providers found were: 
['/home/users/mitya/OE/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf-dbus_705.bb', 
'virtual:native:/home/users/mitya/OE/setup-scripts/sources/openembedded-core/meta/recipes-gnome/gnome/gconf-dbus_705.bb']
The PREFERRED_PROVIDER entries resulting in this conflict were: 
['PREFERRED_PROVIDER_gconf = gconf-dbus', 
'PREFERRED_PROVIDER_gconf-native = gconf-dbus-native']
NOTE: multiple providers are available for runtime gconf 
(gconf-dbus-native, gconf-dbus, gconf)
NOTE: consider defining a PREFERRED_PROVIDER entry to match gconf


On 09/23/2011 11:46 PM, Dmitry Eremin-Solenikov wrote:
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> ---
>   meta/conf/distro/include/default-providers.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index d51ac64..6e281cc 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -22,6 +22,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
>   PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
>   PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
>   PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
> +PREFERRED_PROVIDER_gconf-native ?= "gconf-dbus-native"
>   PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
>   PREFERRED_PROVIDER_libgcc ?= "libgcc"
>   PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"




