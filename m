Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id BB7DA608BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 18:19:34 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id i57so2179301yha.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=+HVjnbiB4O+N7LE0mujrCduxCtrkQcj0g8roMjjH9W4=;
	b=hc6Us+3SWV6NMhcHbq8pWlPit4jB07ubLB037PDZuT1eQ/748jWj1T498Rb1PfzRgc
	WS2YvkPnwFtcpSD1ykFOzePu0EpLjvYAHrlNI6OQG3J1yxMN6RSmCaByXmByLgXCIVud
	kU4mCR9zQ3EfD+Q6fGiT/U4oykt0LcsAQaIKlPVtT7bWrBRCxt78LNhcSFG8oSSG9c4B
	y5yqc3wqiCLbBUH4zNvXoXH+SIwSvvW2M/Be91H92Cfs+6YNhyz/9neqNY3WVsdYmfH+
	gWHcVtUjTbKbQVD7R6o8nzN+vEs24vsUf0tuaYKY8xJfbxnrWLQU6lRU4spo9c9KwEdq
	iY7g==
MIME-Version: 1.0
X-Received: by 10.170.160.9 with SMTP id b9mr655020ykd.50.1414088375003; Thu,
	23 Oct 2014 11:19:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 23 Oct 2014 11:19:34 -0700 (PDT)
Date: Thu, 23 Oct 2014 16:19:34 -0200
X-Google-Sender-Auth: LXOeTFfnZjxQEw0pLpDoIYRlgbU
Message-ID: <CAP9ODKq2070AmmM9E4h+KWmnLM2k0H1uFG_VgD3Fg7EN2bM3BQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <saul.wold@intel.com>, "Burton, Ross" <ross.burton@intel.com>
Subject: [URGENT] Daisy is broken
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
X-List-Received-Date: Thu, 23 Oct 2014 18:19:47 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Today some backports were done in Daisy. It seems it had no test
before pushing the stuff to the Git repository as it fails with:

ERROR: Function failed: Fetcher failure for URL:
'file://Makefiles-ptest.patch'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
.../build/tmp/work/x86_64-linux/openssl-native/1.0.1j-r0/temp/log.do_fetch.9860

Looking at the commit it didn't remove the patches from source neither
added the new ones. No test done before pushing to the official tree.

Please fix it ASAP and be more careful next time, however pushed it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

