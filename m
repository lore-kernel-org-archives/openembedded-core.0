Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QiSLz-0008Sw-RB
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 16:29:56 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QiSI5-0005pF-EH from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 07:25:53 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 17 Jul 2011 07:23:55 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Sun, 17 Jul 2011 07:25:52 -0700
Message-ID: <4E22F0EC.7000603@mentor.com>
Date: Sun, 17 Jul 2011 07:25:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 17 Jul 2011 14:23:55.0436 (UTC)
	FILETIME=[28E956C0:01CC448D]
Subject: Re: [PATCH] gdk-pixbuf(-native): Fix build by disabling introspection
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
X-List-Received-Date: Sun, 17 Jul 2011 14:29:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/16/2011 03:48 PM, Andreas Mueller wrote:
> Error message was:
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/g-ir-compiler  --includedir=. GdkPixbuf-2.0.gir -o GdkPixbuf-2.0.typelib
> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
> | error parsing file GdkPixbuf-2.0.gir: Failed to parse included gir GLib-2.0
> | make[4]: *** [GdkPixbuf-2.0.typelib] Error 1
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Sounds like gnome.bbclass is out of sync and we need both
--enable-introspection=no and --disable-scrollkeeper.

-- 
Tom Rini
Mentor Graphics Corporation


