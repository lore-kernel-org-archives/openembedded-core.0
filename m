Return-Path: <hugo.saldanha@aker.com.br>
X-Greylist: delayed 603 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Mar 2015 13:47:56 UTC
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 474E76AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:47:56 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Wed, 25 Mar 2015 10:47:40 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 25 Mar 2015 10:37:45 -0300
Date: Wed, 25 Mar 2015 10:40:27 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150325134027.GA19408@saldanha.aker.com.br>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: d3ca878c259c98dab9711b092908c214d1fd543e
X-AkerSMTPGW-MessageID: 375fffefd7bdd3ffffe86cc85c57e2eaa1b411ae-10o
Subject: initscripts + fsck.busybox problem
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
X-List-Received-Date: Wed, 25 Mar 2015 13:47:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi all,

Everytime my image boots, the following error message is printed:

fsck (busybox 1.23.1, 2015-03-14 10:13:03 BRT)

Invalid non-numeric argument to -C ("-y")

It seems that checkroot.sh script from initscripts package is
calling the command "fsck -C -y". checkfs.sh script, apparently not
installed by default, does the same. The problem is that busybox's fsck
needs an argument to -C option, which is not needed by util-linux and
e2fsprogs' versions of the tool.

Possible approaches that I can think of:

1) Fixing the scripts, maybe removing references to -C option
altogether.

2) Placing a RDEPENDS in initscripts' recipe.

What do you think about it?

-- 
		Hugo


