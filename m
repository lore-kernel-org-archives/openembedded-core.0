Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D51DA7018E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 17:33:01 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 66109A4A028
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:32:58 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8A142A4A026
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (91-66-224-184-dynip.superkabel.de
	[91.66.224.184]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:32:57 +0200 (CEST)
Date: Tue, 29 Jul 2014 19:32:51 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140729173251.GA9234@mail.itconsulting-heinold.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Problem with debian renaming and upgrade-path on dora
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
X-List-Received-Date: Tue, 29 Jul 2014 17:33:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have a problem to get a sane upgrade path for a library package which should be splitted
in to serval packages on dora.

The old package is called libfoo now the package gets split into libfoo libfoo-bar libfoo-set and so on.

Because of the debian renaming for libraries the PN-library package libfoo is renamed to libfoo3.

If we now want to upgrade from libfoo to libfoo3 oneway would be to use RREPLACE, but
the renaming wrapping is written at do_package into files, before all the other stuff
kicks in.

So all RREPLACES are renamed to libfoo3 too, making it impossible to get a REPLACE stanza for libfoo
into an ipk.

Bye Henning

