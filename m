Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4E41A6CC86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 17:00:07 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1D7A6F811F0; Mon, 14 Oct 2013 11:00:09 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 41F75F8119A;
	Mon, 14 Oct 2013 11:00:08 -0600 (MDT)
Message-ID: <525C2320.8000502@mlbassoc.com>
Date: Mon, 14 Oct 2013 11:00:16 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: kmod packaging question
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
X-List-Received-Date: Mon, 14 Oct 2013 17:00:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm having some issues with the 'kmod' package.  In particular,
the package claims:
   commit b4bc0a7f1b90a51e26d6ab74d964ff81cfe05904
   Author: Khem Raj <raj.khem@gmail.com>
   Date:   Tue Jan 31 00:34:01 2012 -0800

     kmod: Add recipes

     kmod is replacement for module-init-tools

     (From OE-Core rev: 716606f5446534e48b45fcc017e8bbdfe7f15e26)

     Signed-off-by: Khem Raj <raj.khem@gmail.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

But is is really a "replacement"?  I know that there is a provides
which makes the build happy, but unless you explicitly install the
kmod package into your image, you don't end up with all of the module
tools.  The main missing piece is 'depmod' - the rest seem to come
from busybox, not kmod.

I ran into this when trying to run 'opkg upgrade' which sucked in
some new kernel modules and found that 'depmod' was not installed.

Did I miss something?

n.b. this was tested using Poky/Yocto 0fc8317c6385eb1ed69ca4522ee6424c456dbb92
which is a few days old.  I've not checked the very latest master (yet).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

