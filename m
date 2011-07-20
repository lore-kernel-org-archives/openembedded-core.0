Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qjgta-000791-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 02:13:42 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QjgV4-0005Ii-7T from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:48:22 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 20 Jul 2011 16:46:07 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 20 Jul 2011 16:48:21 -0700
Message-ID: <4E276942.9080804@mentor.com>
Date: Wed, 20 Jul 2011 16:48:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>	<4E2706BA.2000600@linux.intel.com>
	<201107210114.00633.schnitzeltony@gmx.de>
In-Reply-To: <201107210114.00633.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 20 Jul 2011 23:46:07.0108 (UTC)
	FILETIME=[31CB4440:01CC4737]
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
X-List-Received-Date: Thu, 21 Jul 2011 00:13:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/20/2011 04:14 PM, Andreas Mueller wrote:
> On Wednesday, July 20, 2011 06:47:54 PM you wrote:
>> On 07/16/2011 03:48 PM, Andreas Mueller wrote:
>>> Error message was:
>>> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/g-ir-c
>>> | ompiler  --includedir=. GdkPixbuf-2.0.gir -o GdkPixbuf-2.0.typelib
>>> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
>>> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
>>> | error parsing file GdkPixbuf-2.0.gir: Failed to parse included gir
>>> | GLib-2.0 make[4]: *** [GdkPixbuf-2.0.typelib] Error 1
>>>
>>> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
>>> ---
>>>
>>>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    3 ++-
>>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
>>> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb index
>>> 8b6314f..e3f5977 100644
>>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
>>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
>>> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>>>
>>>   SECTION = "libs"
>>>   
>>>   DEPENDS = "libpng glib-2.0 jpeg"
>>>
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>   SRC_URI =
>>>   "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${
>>>   PV}.tar.gz \
>>>   
>>>              file://hardcoded_libtool.patch;patch=1 \
>>>
>>> @@ -26,6 +26,7 @@ LIBV = "2.10.0"
>>>
>>>   EXTRA_OECONF = "\
>>>   
>>>     --without-libtiff \
>>>     --with-libpng \
>>>
>>> +  --disable-introspection \
>>>
>>>   "
>>>   
>>>   FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
>>
>> Merged into oe-core
>>
>> There was a comment from Tom about gnome.bbclass, are you looking into
>> that?
> 
> On Sunday, July 17, 2011 04:25:48 PM Tom Rini wrote:
>> Sounds like gnome.bbclass is out of sync and we need both
>> --enable-introspection=no and --disable-scrollkeeper.
> 
> --enable-introspection=no: 
> I grepped around in oe-core for recipes with gobject-introspection disabled (did 
> not care of other layers - e.g meta-oe has its own gnome-bbclass with "--enable-
> introspection=no").

And it requires meta-oe to have its own copy of gnome.bbclass and to
make sure we don't get new recipes wrong in oe-core.

>  --disable-scrollkeeper: 
> Sorry but can anybody (e.g. Tom?) give a hint what this is about/for?

iirc "gnome" documentation stuff that's also wrong / not working in
certain cases.  I don't recall exactly but I'm pretty sure we did it
with good reason in oe.dev :)

-- 
Tom Rini
Mentor Graphics Corporation


