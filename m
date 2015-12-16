Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 00F696FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 20:18:34 +0000 (UTC)
Received: (qmail 18311 invoked by uid 1003); 16 Dec 2015 20:18:35 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.110.59)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Dec 2015 20:18:34 -0000
To: =?UTF-8?Q?Marcus_M=c3=bcller?= <marcus.mueller@ettus.com>,
	openembedded-core@lists.openembedded.org
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
From: Philip Balister <philip@balister.org>
Message-ID: <5671C71A.7050206@balister.org>
Date: Wed, 16 Dec 2015 15:18:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Wed, 16 Dec 2015 20:18:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Ping. Marcus works with me and he is nagging me about this.

On 09/22/2015 01:44 PM, Marcus Müller wrote:
> ---
>  oe-init-build-env | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 6fee5f7..b7e2918 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -45,7 +45,7 @@ fi
>  OEROOT=`readlink -f "$OEROOT"`
>  export OEROOT
>  . $OEROOT/scripts/oe-buildenv-internal && \
> -     $OEROOT/scripts/oe-setup-builddir && \
> +     TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
>       [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
>  unset OEROOT
>  unset BBPATH
> 

