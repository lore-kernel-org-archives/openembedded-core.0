Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrDKa-0006IU-Gp
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 21:21:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 12:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173324564"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 12:09:51 -0700
Message-ID: <5005B87F.8000408@linux.intel.com>
Date: Tue, 17 Jul 2012 12:09:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342551849-18372-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1342551849-18372-1-git-send-email-yao.zhao@windriver.com>
Subject: Re: [PATCH v2] dbus-glib: fix compile error when enable-tests
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
X-List-Received-Date: Tue, 17 Jul 2012 19:21:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 12:04 PM, Yao Zhao wrote:
> test-service-glib-include-glib-only.patch: fixes the compiling failure
> that test-service-glib.c includes glib/gquark.h not glib.h directly.
>

I hope that you will re-submit the unit test packaging also, that will 
be good to have.


> [YOCTO #2762]
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>   .../test-service-glib-include-glib-only.patch      |   13 +++++++++++++
>   meta/recipes-core/dbus/dbus-glib.inc               |    4 +++-
>   2 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
>
> diff --git a/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
> new file mode 100644
> index 0000000..e0bc0c6
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
> @@ -0,0 +1,13 @@

This is missing a patch header, Upstream-Status and Signed-off-by:

Sau!

> +diff --git a/test/core/test-service-glib.c b/test/core/test-service-glib.c
> +index 3355890..7291f35 100644
> +--- a/test/core/test-service-glib.c
> ++++ b/test/core/test-service-glib.c
> +@@ -11,7 +11,7 @@
> + #include <string.h>
> + #include <glib/gi18n.h>
> + #include <glib-object.h>
> +-#include <glib/gquark.h>
> ++#include <glib.h>
> +
> + #include "my-object.h"
> + #include "my-object-subclass.h"
> diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
> index da2845a..f554ce8 100644
> --- a/meta/recipes-core/dbus/dbus-glib.inc
> +++ b/meta/recipes-core/dbus/dbus-glib.inc
> @@ -11,7 +11,9 @@ DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
>   DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
>
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
> -           file://no-examples.patch"
> +           file://no-examples.patch \
> +           file://test-service-glib-include-glib-only.patch \
> +"
>
>   inherit autotools pkgconfig gettext
>
>



