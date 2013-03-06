Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1UD8wM-0006cz-1I
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 08:39:09 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UD8d8-0023vt-2M>; Wed, 06 Mar 2013 08:19:14 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1UD8d7-000f1K-TQ>; Wed, 06 Mar 2013 08:19:13 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1UD8d6-0004Ki-Ql
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 08:19:12 +0100
Date: Wed, 6 Mar 2013 08:19:12 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130306071912.GA16133@mi.fu-berlin.de>
References: <1362527733-3589-1-git-send-email-obi@opendreambox.org>
	<1362529925-13211-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH v2][RFC] chrpath.bbclass: strip common parent directories from rpath#
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
X-List-Received-Date: Wed, 06 Mar 2013 07:39:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I will try your patch on meta-java too, because later openjdk's vm had problem with
the rpath too, until khem made a patch.

Bye Henning


