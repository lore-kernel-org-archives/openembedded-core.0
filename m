Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>)
	id 1SKFLb-0008FB-3e; Tue, 17 Apr 2012 22:49:59 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 03973A6229;
	Tue, 17 Apr 2012 22:40:29 +0200 (CEST)
Date: Tue, 17 Apr 2012 22:40:28 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120417224028.5f80ebd7@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: meta-chromium
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
X-List-Received-Date: Tue, 17 Apr 2012 20:49:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

we have pushed the begining of our (Eukr=E9a Electromatique's team and
especially Denis) work to get Chromium to build with OpenEmbedded Core
to : git://github.com/eukrea/meta-chromium.git
https://github.com/eukrea/meta-chromium

For the moment it's only tested on ARMv7 platforms (i.MX515 and i.MX535
based) where it seems robust and quite fast on most of the HTML5 tests
we ran (only WebGL doesn't yet work).

Feel free to send patches to improve the recipes and add support for
other platforms.

TODO :
- enable WebGL with OpenGL ES support
- support other platforms than armv7
- merge with meta-mozilla to create a meta-browser layer

Eric


