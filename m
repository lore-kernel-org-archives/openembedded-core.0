Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2C80C60034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 17:16:05 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id 9087E8E774
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:16:05 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:16:05 +0100 (CET)
Message-ID: <55119BD5.8060002@topic.nl>
Date: Tue, 24 Mar 2015 18:16:05 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Subject: Not selecting <old version of package> as installing it would break existing dependencies
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
X-List-Received-Date: Tue, 24 Mar 2015 17:16:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

After upgrading a library to a newer version, for example, something 
called libdvbsi++ from 0.3.6 to 0.3.7, running opkg upgrade outputs the 
following cryptic error message:

Not selecting libdvbsi++1 0.3.6 as installing it would break existing 
dependencies.

Adding "-V2" to opkg upgrade expands that with the following message:

opkg_prepare_upgrade_pkg: Package libdvbsi++1 (0.3.7-r2.0) installed in 
root is up to date.

So apparently it knows about the later version, so why complain about 
the old one?

There is only one package that (r)depends on that lib (enigma2). Nothing 
else needs it.

This often happens with other packages as well. Is this a bug in opkg, 
or is it trying to tell us we're doing something wrong?


-- 
Mike Looijmans

