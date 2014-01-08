Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 213376D2E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:56:08 +0000 (UTC)
Message-ID: <52CD9133.6070903@communistcode.co.uk>
Date: Wed, 08 Jan 2014 17:56:03 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: db failure due to libstdc++.so host contamination
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2014 17:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

do_compile.log: http://ix.io/9Ki

Speaking on IRC it seems that host systems with /usr/lib/libstdc++.so
present are failing to build db.

/usr/lib/libstdc++.so is present on at least archlinux in the gcc-libs
and gcc-multilibs package which is a fairly standard package to have
installed. The problem has appeared since commit
a484b35b818768487ff27cf06b8c5d4e128126af in oe-core.

Will try and find some time to do more debugging but if anyone sees any
tell tale signs then shout up.

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

