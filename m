Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SXwKe-0005ss-Fj
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 17:21:36 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SXwAo-00083Z-4S>; Fri, 25 May 2012 17:11:26 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SXwAo-0004zw-1V>; Fri, 25 May 2012 17:11:26 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SXwAm-0000Xo-Ug
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 17:11:24 +0200
Date: Fri, 25 May 2012 17:11:24 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120525151124.GA31846@mail.familie-heinold.de>
References: <4FBF9C60.5030000@supergenesis.it>
MIME-Version: 1.0
In-Reply-To: <4FBF9C60.5030000@supergenesis.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: qt embedded enable plugin-gfx-powervr
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
X-List-Received-Date: Fri, 25 May 2012 15:21:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 25, 2012 at 04:51:12PM +0200, Stefano wrote:
> I see the latest version of qt embedded does not include the
> plugin-gfx-powervr. The latest qt4-embedded.inc is configured:
> 
> QT_CONFIG_FLAGS += " \
>   -embedded ${QT_ARCH} \
>   -qtlibinfix ${QT_LIBINFIX} \
>   -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc
>   -plugin-gfx-directfb \
>   -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
>   -qt-kbd-tty \
>   -DQT_KEYPAD_NAVIGATION \
>   "
> 
> but without -plugin-gfx-powervr. This is because powervr need
> -DQT_NO_QWS_CURSOR and  -DQT_WS_CLIENTBLIT?
> I'm trying to modify the recipes to include powervr pluging, i have
> add -plugin-gfx-powervr -DQT_NO_QWS_CURSOR -DQT_WS_CLIENTBLIT. But
> this operation need two patches
> https://github.com/prabindh/qt-configs/tree/master/qt4.8
> 
> Somebody know a good solution to get the possibility to compile this
> plugin?
> Thank's for your time.
> 
> -- 
> /Cordiali Saluti/
> *Stefano Stucchi
> *
> *Genesis srl*
> Via L. Manara 3/A
> 25126 Brescia

Hi,

are you sure you need the plugin? Koen mostly stated that the powervr plugin doesnt give much improvement.

Bye Henning


