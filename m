Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QSUb2-00089M-47
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 15:39:33 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QSUXu-0005ac-B4 from Tom_Rini@mentor.com ;
	Fri, 03 Jun 2011 06:36:14 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 3 Jun 2011 06:36:14 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Fri, 3 Jun 2011 06:36:13 -0700
Message-ID: <4DE8E349.50607@mentor.com>
Date: Fri, 3 Jun 2011 06:36:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1307097655.2529.250.camel@phil-desktop>
In-Reply-To: <1307097655.2529.250.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 03 Jun 2011 13:36:14.0145 (UTC)
	FILETIME=[3545FB10:01CC21F3]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite: remove dependency on tcl-native
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
X-List-Received-Date: Fri, 03 Jun 2011 13:39:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 06/03/2011 03:40 AM, Phil Blundell wrote:
> Older versions of sqlite required tclsh at compile time but this is no longer
> the case with recent 3.7.x.
> 
> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003653.html
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  meta/recipes-support/sqlite/sqlite3.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index d8ef8dc..939df14 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -2,8 +2,8 @@ DESCRIPTION = "An Embeddable SQL Database Engine"
>  HOMEPAGE = "http://www.sqlite.org"
>  SECTION = "libs"
>  PRIORITY = "optional"
> -DEPENDS = "readline ncurses tcl-native"
> -DEPENDS_virtclass-native = "tcl-native"
> +DEPENDS = "readline ncurses"
> +DEPENDS_virtclass-native = ""
>  LICENSE = "PD"
>  
>  inherit autotools pkgconfig


-- 
Tom Rini
Mentor Graphics Corporation


