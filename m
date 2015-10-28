Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 03F3276102
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 23:48:55 +0000 (UTC)
Received: (qmail 10989 invoked by uid 1003); 28 Oct 2015 23:48:54 -0000
Received: from unknown (HELO ?10.16.32.95?)
	(philip@opensdr.com@207.114.172.147)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	28 Oct 2015 23:48:54 -0000
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56315EE5.3070100@balister.org>
Date: Wed, 28 Oct 2015 16:48:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
Subject: Native patch appears broken on Fedora 21
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
X-List-Received-Date: Wed, 28 Oct 2015 23:48:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I've been chasing an annoying build failure in a clients u-boot recipe.

One of the patches adds an executable python script to the u-boot tools
directory and runs it as part of the build.

With recent master on a Fedora 20 system, it works.

Recent master on Fedora 21, the script does not end up marked as
executable so build fails.

After much thinking and poking and remembering how this is supposed to
work I get the brilliant idea to copy the patch binary from the F20
machine to the F21 machine. Problem goes away.

Something is weird here, I can't believe this is the only patch in the
system that marks a file executable and runs it, but maybe it is.

Versions of patch.

F20 GNU patch 2.7.1
F21 GNU patch 2.7.5

Looking at the patch changelog didn't help.

Anyone have any ideas what to do about this?

Philip

