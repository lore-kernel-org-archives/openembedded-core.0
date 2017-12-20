Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12F7371A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 11:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5D230183B8;
	Wed, 20 Dec 2017 12:05:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9-ab1MlJ1-_3; Wed, 20 Dec 2017 12:05:10 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4BE4A18383;
	Wed, 20 Dec 2017 12:05:10 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 370FC1A058;
	Wed, 20 Dec 2017 12:05:10 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B9F91A069;
	Wed, 20 Dec 2017 12:05:10 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 20 Dec 2017 12:05:10 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 1F05718F9;
	Wed, 20 Dec 2017 12:05:10 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id EBD6B9C0AD; Wed, 20 Dec 2017 12:05:09 +0100 (CET)
Date: Wed, 20 Dec 2017 12:05:09 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171220110509.tg5amoi3fafimafx@axis.com>
Mail-Followup-To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
	<20171204153001.enqgfe27iapaoftl@axis.com>
	<CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
	<CAJTo0LYemQ16EavmwCLa4PYZQHbg12BSDgiCEZomx1YSRV7Rwg@mail.gmail.com>
	<20171218110602.ppicezmskdv5emkq@axis.com>
	<CAJTo0LaHRrqqXp6S5oni-mGVnBZvUYX68VUQd8EsemyLV3rM9g@mail.gmail.com>
	<CAJTo0LY5CfVtFwiFHU476GrOU2y2WCb6r+tH+wkL1ecqAQJbEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY5CfVtFwiFHU476GrOU2y2WCb6r+tH+wkL1ecqAQJbEQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Dec 2017 11:05:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-12-18 12:00 +0000, Burton, Ross wrote:
> Just pushed ross/elf with this change.  The next obvious step is to turn
> lib/oe/qa.py into a new lib/oe/elf.py which has a better API and includes
> the stripped function.

Great; I've adapted my changes on top of yours and tested it a
bit. I've published what I have on github for now, if you want to
take a look. Is this along the lines of what you want?

 https://github.com/olof/poky-contrib/compare/olof/elf
 https://github.com/olof/poky-contrib/compare/ross/elf...olof/elf

(Let me know if you prefer me to send it as draft patches to the
list instead.)

(Btw, I didn't know about Kaitai before, but I like the idea of
declarative binary parsing a lot :))

-- 
olofjn

