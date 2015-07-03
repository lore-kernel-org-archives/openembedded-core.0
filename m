Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C8F1A73231
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 14:56:06 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <5596A293.8020606@communistcode.co.uk>
Date: Fri, 3 Jul 2015 15:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
Subject: SDK extract errors on master
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
X-List-Received-Date: Fri, 03 Jul 2015 14:56:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Built an SDK today on 7eb0abc5f4d971d9a511c93cfb2eb52b72e6f228 and when 
I tried to install it I got the following error:

Setting it up...ls: cannot access 
/home/jack/Work/build/openembedded/sdk/1/x86_64/environment-setup-*: No 
such file or directory

I have been messing about with the SDK install path and at one point it 
did spew out a load of files installed vs shipped warnings I assume due 
to a change of path and it getting upset about it, but since then I 
deleted the tmp directory and rebuilt a new SDK without warnings. 
However, both acted in the same way.

The SDK then sits without installing, seemingly stuck on: grep 
OECORE_NATIVE_SYSROOT, which I assume means it's looking for the 
(non-existant) environment file.

Any clues? Is this broken for anyone else?

Cheers,
Jack.

