Received: from mail-lb0-f172.google.com ([209.85.217.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsSs5-0007x2-Mf
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 07:41:28 +0100
Received: by mail-lb0-f172.google.com with SMTP id y2so127143lbk.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 22:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=XPYtOo+q2InfCCyvHzwRBpUyTQb/rTwUScvNAQ6ZwYU=;
	b=U8dc2WLGPOJfXNJ64HeWolms92yyfjx4GEzx/FTbTwo1lJxLgPW8FEQ/fLuZzDlEp7
	TAYpcRdiaLLzwiKGgbeE02ifY644IgjU95gpDPjcLmbdkJStb5clqPOp8BDBT7Z6LuYo
	9FVITAFDvXNDoaAogsBkXKrDq4ypGu28+2ty65PcxduMjXiGZ5KE1rLPPKMbRsdaaNIA
	f0AmsHEPAGOWq51gg7nRVHr5QPrZ1bbqzkP1MLfujM3lXAp16t5EhzznZlZyfFFW2UhO
	QQDSe5mqM6jjRwMCQlHkHNghp8OTzjcZU8NEFsGX+VdI2BAlfQLohhlxXcEB99LEYDiT
	QiiQ==
X-Received: by 10.152.122.39 with SMTP id lp7mr60717287lab.0.1357626363324;
	Mon, 07 Jan 2013 22:26:03 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id iw6sm4109117lab.2.2013.01.07.22.26.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 22:26:02 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsSdL-0005Ud-VT; Tue, 08 Jan 2013 08:26:00 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: cristian.iorga@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:25:55 +0200
Message-Id: <1357626356-21074-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: bluez-hcidump update
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
X-List-Received-Date: Tue, 08 Jan 2013 06:41:29 -0000

Before making bluez-hcidump automake-1.13 compatible, I'd like
it to update it to latest version. I made the trivial patch already.
It builds without problems, but someone able to do so should test
if it's fully functional. I'm worried about possible runtime
dependencies (latest version of main bluez package is documented
to be fully functional with kernel >= 3.5 only)


 - ML


