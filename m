Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PuihA-0003Ws-8a for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 10:50:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p229mjeK019164
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Mar 2011 09:48:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19120-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2011 09:48:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p229mdFb019158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Mar 2011 09:48:41 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299055045-8096-2-git-send-email-raj.khem@gmail.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
Date: Wed, 02 Mar 2011 09:48:37 +0000
Message-ID: <1299059317.26736.10132.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 09:50:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-02 at 00:37 -0800, Khem Raj wrote:
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index 92c4930..a5e6782 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.sqlite.org"
>  SECTION = "libs"
>  PRIORITY = "optional"
>  DEPENDS = "readline ncurses tcl-native"
> -DEPENDS_virtclass-native = "tcl-native"
> +DEPENDS_virtclass-native = "tcl-native ncurses-native"
>  LICENSE = "PD"

This missing DEPENDS entry is deliberate since it increases the
bootstrap time for pseudo-native yet sqlite works fine without curses
support.

I assume some kind of failure triggered this update, what was it?

Cheers,

Richard



