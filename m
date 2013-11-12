Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 393196D593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 10:24:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACANtQt007721; Tue, 12 Nov 2013 10:23:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sAz4jF7lR9rN; Tue, 12 Nov 2013 10:23:55 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACANpGt007718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Nov 2013 10:23:53 GMT
Message-ID: <1384251828.1143.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lei Liu <layliu@gmail.com>
Date: Tue, 12 Nov 2013 10:23:48 +0000
In-Reply-To: <1384162062-30319-2-git-send-email-layliu@gmail.com>
References: <no> <1384162062-30319-2-git-send-email-layliu@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Fix grep pattern when mklibs collects executables in rootfs
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
X-List-Received-Date: Tue, 12 Nov 2013 10:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-11 at 17:27 +0800, Lei Liu wrote:
> From: Lei Liu <lei.liu2@windriver.com>
> 
> File command in some version could print extra space between
> "LSB" and "executable" - it causes mklibs can't find any executables
> using grep "LSB executable".  Fix the grep pattern to catch
> multiple spaces.
> 
> Signed-off-by: Lei Liu <lei.liu2@windriver.com>
> ---
>  meta/classes/image-mklibs.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

I've queued this but please put the area name in the short line of the
commit in future ("image-mklibs: " in this case).

Cheers,

Richard


