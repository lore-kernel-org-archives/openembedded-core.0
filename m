Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TwVPv-0001xY-9E
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 11:12:51 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 12671D22E9; Sat, 19 Jan 2013 10:57:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2A4FDD22CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 10:56:50 +0100 (CET)
Message-ID: <50FA6DDB.8000302@linaro.org>
Date: Sat, 19 Jan 2013 10:56:43 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1358587215-23952-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1358587215-23952-1-git-send-email-mike.looijmans@topic.nl>
Subject: Re: [PATCH] pulseaudio: Pulseaudio DEPENDS on libjson
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
X-List-Received-Date: Sat, 19 Jan 2013 10:12:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 19.01.2013 10:20, mike.looijmans@topic.nl pisze:
> From: MiLo <milo-software@users.sourceforge.net>
> 
> The configure script tests for libjson's presence. The missing dependency
> becomes apparent when building without x11 or gnome.
> 
> Signed-off-by: MiLo <milo-software@users.sourceforge.net>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 6633e38..1fcc07c 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc

> -DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
> +DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool libjson \

You use other version than 2.1 - right?

10:56 hrw@puchatek:pulseaudio$ cat pulseaudio_2.1.bb
require pulseaudio.inc

PR = "r15"

DEPENDS += "libjson gdbm speex libxml-parser-perl-native"



