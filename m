Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EBEE96EADD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 12:29:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1ECTT8c010244; Fri, 14 Feb 2014 12:29:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 90yzi1A4hljG; Fri, 14 Feb 2014 12:29:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1ECTP89010239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 14 Feb 2014 12:29:27 GMT
Message-ID: <1392380959.14081.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Xudong.zhu" <xudong.zhu@windriver.com>
Date: Fri, 14 Feb 2014 12:29:19 +0000
In-Reply-To: <1392348604-4134-2-git-send-email-xudong.zhu@windriver.com>
References: <1392348604-4134-1-git-send-email-xudong.zhu@windriver.com>
	<1392348604-4134-2-git-send-email-xudong.zhu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tar: fix a build error introduced by 1.27
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
X-List-Received-Date: Fri, 14 Feb 2014 12:29:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-02-14 at 11:30 +0800, Xudong.zhu wrote:
> From: "Xudong.zhu" <xzhu@windriver.com>
> 
> --same-order option cannot be used with -c the latest
> tar version 1.27.
> To fix this, drop the -s from -ps if -c exists.
> 
> [YOCTO #5823]
> 
> Signed-off-by: Xudong.zhu <xzhu@windriver.com>
> ---
>  meta/classes/libc-package.bbclass     |    8 ++++----
>  meta/classes/package.bbclass          |    2 +-
>  meta/classes/populate_sdk_deb.bbclass |    2 +-
>  meta/classes/staging.bbclass          |    2 +-
>  meta/lib/oe/path.py                   |    2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)

This patch is not against master, this was fixed a while ago?

Cheers,

Richard


