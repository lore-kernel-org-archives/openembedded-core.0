Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D235677389
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 13:32:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 05 Feb 2016 05:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,400,1449561600"; d="scan'208";a="43008021"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.21.144])
	by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2016 05:32:56 -0800
Message-ID: <1454679172.3210.10.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 05 Feb 2016 13:32:52 +0000
In-Reply-To: <1454672856-13680-3-git-send-email-ross.burton@intel.com>
References: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
	<1454672856-13680-3-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] glib-2.0: use the system libpcre
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
X-List-Received-Date: Fri, 05 Feb 2016 13:32:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-02-05 at 11:47 +0000, Ross Burton wrote:
> Instead of using the internal copy of libpcre, use one that we
> build.  Note that
> this requires libpcre enables Unicode properties.

We could do with a convention for documenting this kind of trap (where
a PACKAGECONFIG in foo requires one in bar). 

Maybe you could a comment here in this case?

Regards,

Joshua

> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-
> core/glib-2.0/glib.inc
> index dc88d19..7a6a4ce 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -31,6 +31,9 @@ inherit autotools gettext gtk-doc pkgconfig ptest-
> gnome upstream-version-is-even
>  
>  S = "${WORKDIR}/glib-${PV}"
>  
> +PACKAGECONFIG ??= "system-pcre"
> +PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-
> pcre=internal,libpcre"
> +
>  CORECONF = "--disable-dtrace --disable-fam --disable-libelf --
> disable-systemtap --disable-man"
>  
>  PRINTF = "--enable-included-printf=no"
> -- 
> 2.7.0
> 

