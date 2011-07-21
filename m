Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qjiqx-0000Y5-Vw
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 04:19:08 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qjimz-0001qo-JY from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:15:01 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 20 Jul 2011 19:15:01 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 20 Jul 2011 19:15:00 -0700
Message-ID: <4E278BA1.5040406@mentor.com>
Date: Wed, 20 Jul 2011 19:14:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311213306.git.sgw@linux.intel.com>
	<4c15caba38740bfc1f30b8f0c2e0d857cb24b38b.1311213306.git.sgw@linux.intel.com>
In-Reply-To: <4c15caba38740bfc1f30b8f0c2e0d857cb24b38b.1311213306.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Jul 2011 02:15:01.0425 (UTC)
	FILETIME=[FF0FDA10:01CC474B]
Subject: Re: [PATCH 1/1] gettext: Use internal libxml to avoid host contamination
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
X-List-Received-Date: Thu, 21 Jul 2011 02:19:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/20/2011 06:58 PM, Saul Wold wrote:
> [YOCTO #1242]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 0b11a90..e95e674 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -32,6 +32,7 @@ EXTRA_OECONF += "--without-lispdir \
>                   --disable-native-java \
>                   --disable-openmp \
>                   --with-included-glib \
> +                 --with-included-libxml \
>                   --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
>                   --without-emacs \
>                   --without-cvs \

Better than just DEPENDS libxml2 ala oe.dev?

-- 
Tom Rini
Mentor Graphics Corporation


