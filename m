Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Jun 2014 18:23:08 UTC
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 460E26FEEF
	for <openembedded-core@openembedded.org>;
	Mon, 16 Jun 2014 18:23:08 +0000 (UTC)
Received: (qmail 1992 invoked by uid 1003); 16 Jun 2014 18:16:28 -0000
Received: from unknown (HELO ?10.16.32.86?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Jun 2014 18:16:28 -0000
Message-ID: <539F347B.70604@balister.org>
Date: Mon, 16 Jun 2014 11:16:27 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@openembedded.org, Saul Wold <sgw@linux.intel.com>
X-Enigmail-Version: 1.6
Subject: [daisy]Update python-native recipe
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
X-List-Received-Date: Mon, 16 Jun 2014 18:23:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Can you add 2335a8ed3748e687e7f34f21f27f8e4029d1e26b to daisy?

https://github.com/openembedded/openembedded-core/commit/2335a8ed3748e687e7f34f21f27f8e4029d1e26b

This should help anyone building packages that need to include Python.h
from the native sysroot.

I need this in oe-core/daisy before I can ask for zeroc-ice in
meta-oe/daisy.

Philip

