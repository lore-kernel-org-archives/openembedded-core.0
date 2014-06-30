Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E35E9601A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 22:00:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5UM0KIv014224; Mon, 30 Jun 2014 23:00:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yduyUaZHu9wQ; Mon, 30 Jun 2014 23:00:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5UM0HJD014221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 30 Jun 2014 23:00:18 +0100
Message-ID: <1404165610.6362.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?St=E9phane?= Cerveau <scerveau@connected-labs.com>
Date: Mon, 30 Jun 2014 23:00:10 +0100
In-Reply-To: <1404138195-14158-1-git-send-email-scerveau@connected-labs.com>
References: <1404138195-14158-1-git-send-email-scerveau@connected-labs.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH] vala: should not depend on gtk+
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
X-List-Received-Date: Mon, 30 Jun 2014 22:00:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-06-30 at 16:23 +0200, Stéphane Cerveau wrote:
> Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
> ---
>  meta/recipes-devtools/vala/vala.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
> index a8927d7..a9e5a57 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
>  Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
>  SECTION = "devel"
> -DEPENDS = "glib-2.0 dbus gtk+"
> +DEPENDS = "glib-2.0 dbus"
>  BBCLASSEXTEND = "native"
>  DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
>  HOMEPAGE = "http://vala-project.org"

Really we should probably backport:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=27c2cbbdb14d65caef1faafbfea063d6744f4e70

?

Cheers,

Richard


