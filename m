Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1223565DBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 09:16:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4C9GjEl010553; Mon, 12 May 2014 10:16:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d78trsXHCip0; Mon, 12 May 2014 10:16:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4C9Gfji010544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 12 May 2014 10:16:42 +0100
Message-ID: <1399886194.31891.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Mon, 12 May 2014 10:16:34 +0100
In-Reply-To: <208DBEF5-0367-4F27-93BD-CBB4FC23FBF6@linaro.org>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
	<7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
	<916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
	<536C77D5.6040205@linux.intel.com>
	<6B7D9F99-5867-416B-9A97-426E3B495A52@dominion.thruhere.net>
	<51490BD6-0BCB-4422-9620-8D4FFAD3791F@dominion.thruhere.net>
	<1399630567.31891.84.camel@ted>
	<CAP0W-Rn5PU7NxYWCKZ59R_oqHDfkRt3xEayhzfhyP-1D6OVtjw@mail.gmail.com>
	<1399631039.31891.85.camel@ted>
	<CAP0W-R=dx1GNAfXkR-SDyB6JxYBYuiD7BSZ20KiB-UZQBmkrgw@mail.gmail.com>
	<208DBEF5-0367-4F27-93BD-CBB4FC23FBF6@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Mon, 12 May 2014 09:16:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-05-12 at 10:15 +0200, Koen Kooi wrote:
> So 'git-replacement-native' is broken without the git-perl patches
> anyway, I'm not going to look into that issue any longer.

$ bitbake git-replacement-native
[---build---]
$ ./tmp/sysroots/x86_64-linux/usr/bin/git -c core.fsyncobjectfiles=0
clone -s -n /xxx/sources/git2/git.yoctoproject.org.prelink-cross.git/
test
Cloning into 'test'...
done.

So at least for some of us, this does work before and then no longer
works after your patches.

But thanks for the help in resolving this, its really much appreciated
and I'll keep it in mind next time I get a bug report from you.

Cheers,

Richard



