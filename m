Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AA9A26F83E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 22:22:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s37MMPES000796; Mon, 7 Apr 2014 23:22:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xI6nKtnG6ojl; Mon,  7 Apr 2014 23:22:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s37MMHsm000791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 7 Apr 2014 23:22:18 +0100
Message-ID: <1396909331.24597.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 07 Apr 2014 23:22:11 +0100
In-Reply-To: <20140407210549.GI3370@denix.org>
References: <1396324451-26983-1-git-send-email-denis@denix.org>
	<20140406224639.GD3370@denix.org> <5342C918.5030307@linux.intel.com>
	<20140407210549.GI3370@denix.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev-extraconf: update mount.sh to use /run/media instead of /media
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
X-List-Received-Date: Mon, 07 Apr 2014 22:22:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-04-07 at 17:05 -0400, Denys Dmytriyenko wrote:
> I understand the timing concern and am fine waiting another week for when 1.7 
> window opens.
> 
> But I'm slightly confused as to since when OE-Core is concerned about breaking 
> bbappends in other layers? I guess some layers are not created equal, eh? :)

The question is more one of timing. I don't think its reasonable that we
break things like that between -rc2 and -rc3 of 1.6 without a better
reason...

I'm even nervous changing the sstate checksums but I think the CONFFILES
change does warrant that for example.

Cheers,

Richard




