Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SUcuB-00089C-RK
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:00:36 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B6CF0F811F0; Wed, 16 May 2012 05:50:35 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 174BFF811E1;
	Wed, 16 May 2012 05:50:35 -0600 (MDT)
Message-ID: <4FB3948B.9090609@mlbassoc.com>
Date: Wed, 16 May 2012 05:50:35 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: X server failing on PowerPC
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
X-List-Received-Date: Wed, 16 May 2012 12:00:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

When built from a recent OE-core using GCC 4.7.x, the X server
fails on PowerPC targets.  Filed as Poky/Yocto bug #2460, it boils down
to a sequence of code like this:

    void *ptr;
    switch(XX) {
       case a:
          define_some_structure A;
          ptr = &A;
          break;
       case b:
          define_some_structure B;
          ptr = &B;
          break;
    }
    call_some_function(ptr);

I didn't explore how this messes up, just that it does when compiled
on PowerPC with GCC 4.7.x.  Note that it works fine on ARM (and I assume
x86 as well)

Is this even legal C?  even if it works [has worked] for 20+ years?

Should I propose my patch? I'm only interested in xserver-kdrive_1.7.99.2,
but I think this probably affects all X server instances.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


