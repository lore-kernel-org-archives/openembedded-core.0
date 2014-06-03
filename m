Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 908 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Jun 2014 11:57:56 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id AE3096FA39
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 11:57:56 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Wrn70-0005Tp-Gx for openembedded-core@lists.openembedded.org;
	Tue, 03 Jun 2014 13:42:38 +0200
Received: from 24-134-59-157-dynip.superkabel.de ([24.134.59.157])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 13:42:38 +0200
Received: from holger by 24-134-59-157-dynip.superkabel.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 13:42:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Holger Freyther <holger@freyther.de>
Date: Tue, 3 Jun 2014 11:42:25 +0000 (UTC)
Message-ID: <loom.20140603T134009-42@post.gmane.org>
References: <cover.1401781206.git.Qi.Chen@windriver.com>
	<cd4a352b664c2c15c0ad9ff7bc4e5870f2e0c941.1401781206.git.Qi.Chen@windriver.com>
	<1401786411.12440.54.camel@ted> <538D9363.2020006@windriver.com>
	<1401793095.12440.72.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.134.59.157 (Mozilla/5.0 (X11;
	Linux i686) AppleWebKit/537.36 (KHTML, like Gecko)
	Chrome/35.0.1916.114 Safari/537.36)
Subject: Re: [daisy][PATCH 1/1] systemd: do not use alloca() function in case of uclibc
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
X-List-Received-Date: Tue, 03 Jun 2014 11:58:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie <richard.purdie@...> writes:

Hi,

> Please just update that patch then rather than patching code that we've
> ready patched. Is this issue uclibc specific?

the usage of alloca is due me and killing a lot of malloc's in
the hot path of log handling. I am late to these patches
but my two cents would be that if you use uclibc you really
want to have alloca for the speed.


holger







