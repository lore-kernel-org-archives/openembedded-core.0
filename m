Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCF0C60721
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4B7321830E;
	Mon,  4 Dec 2017 16:30:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gQ_KR-AZUPYd; Mon,  4 Dec 2017 16:30:02 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 10681182EC;
	Mon,  4 Dec 2017 16:30:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 964731E083;
	Mon,  4 Dec 2017 16:30:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AE3A1E082;
	Mon,  4 Dec 2017 16:30:01 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  4 Dec 2017 16:30:01 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 7E1BF3325;
	Mon,  4 Dec 2017 16:30:01 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 7194C9C0AD; Mon,  4 Dec 2017 16:30:01 +0100 (CET)
Date: Mon, 4 Dec 2017 16:30:01 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171204153001.enqgfe27iapaoftl@axis.com>
Mail-Followup-To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Mon, 04 Dec 2017 15:30:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-12-04 12:36 +0000, Burton, Ross wrote:
> You might be interested in some of the patches I've got sitting in
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mutb
> specifically around "Add new ELF parser".  This adds a fully-featured
> Python ELF parser to lib/oe which could be used to inspect the binaries the
> way file does, but without having to call and parse the output of file.

Oh, that's awesome. Please disregard v1 of my patch series, and
I'll try to adapt package.bbclass and lib/oe/package.py to make
use of your changes and see what happens. Thanks!

-- 
olofjn

