Return-Path: <daniel.elstner@kdab.com>
Received: from mail.kdab.com (mail.kdab.com [188.40.50.12])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5656E3EC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 17:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.kdab.com (Postfix) with ESMTP id 43BCE14813D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 18:50:14 +0100 (CET)
X-Virus-Scanned: by amavisd-new at kdab.com
Received: from mail.kdab.com ([127.0.0.1])
	by localhost (mail.kdab.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56Z0NYaHiSyq
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 18:50:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.kdab.com (Postfix) with ESMTP id 5BC5F14813BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 18:50:13 +0100 (CET)
Message-ID: <1391449812.24134.6.camel@deimos>
From: Daniel Elstner <daniel.elstner@kdab.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2014 18:50:12 +0100
Organization: KDAB
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Backport request: "icecc: Add dummy python version of set_icecc_env"
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
X-List-Received-Date: Mon, 03 Feb 2014 17:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I'm using dora and have recently adopted Icecream to speed up my build
times.  Unfortunately, icecc.bbclass breaks with the pslash recipe in a
way that is not easily worked around.

The problem has already been fixed in master, though:

icecc: Add dummy python version of set_icecc_env

        Bitbakes prepend mechanism for the tasks disregards the type of
        the function. Thus bitbaking recipes using python functions for
        configure, compile or install steps fail due to the missing
        python version of set_icecc_env. Assuming that icecc doesn't
        need to be used in such situations adding a dummy python version
        of set_icecc_env fixes this.
        
        Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
        Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Simply cherry-picking this commit made things work for me.  It would be
great if it could be backported to dora.

Cheers and thanks,
-- 
Daniel Elstner | daniel.elstner@kdab.com | Software Engineer
KDAB (Deutschland) GmbH & Co KG, a KDAB Group company
Tel. Germany +49-30-521325470, Sweden (HQ) +46-563-540090
KDAB - Qt Experts - Platform-independent software solutions


