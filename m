Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C55AF6CF10
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 14:16:50 +0000 (UTC)
Message-ID: <52CD5DCE.5050003@communistcode.co.uk>
Date: Wed, 08 Jan 2014 14:16:46 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: db compile failure
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
X-List-Received-Date: Wed, 08 Jan 2014 14:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On latest master I am running into the following failure:

http://ix.io/9Kh

I'm also getting a _lot_ of warnings like these:

WARNING: The recipe eglibc-locale is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:

/home/jack/Work/oe-core.git/test-build/tmp-eglibc/deploy/ipk/core2/eglibc-localedata-el-gr_2.18-r0_core2.ipk
   Matched in manifest-core2-eglibc-locale.deploy-ipk

/home/jack/Work/oe-core.git/test-build/tmp-eglibc/deploy/ipk/core2/eglibc-binary-localedata-wae-ch_2.18-r0_core2.ipk

Can anyone shed any light, it seems as though the something is getting
it's wires crossed somewhere...

I haven't yet tried wiping the tmp folder but I could as a last resort.

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

