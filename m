Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC636EE30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 10:38:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2HAcHbx029204; Mon, 17 Mar 2014 10:38:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 80OGXMv5ZraM; Mon, 17 Mar 2014 10:38:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2HAcAnT029200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 17 Mar 2014 10:38:12 GMT
Message-ID: <1395052685.3808.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Mar 2014 10:38:05 +0000
In-Reply-To: <1395048338-25754-1-git-send-email-Martin.Jansa@gmail.com>
References: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
	<1395048338-25754-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCHv2] report-error: Allow to upload reports automatically
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
X-List-Received-Date: Mon, 17 Mar 2014 10:38:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-17 at 10:25 +0100, Martin Jansa wrote:
> * useful when distro wants to collect build statistics from
>   all users/developers without any manual interaction from them
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/report-error.bbclass    | 103 ++++++++++++++++++++++++++++++++++-
>  meta/conf/local.conf.sample.extended |  20 +++++++
>  2 files changed, 121 insertions(+), 2 deletions(-)

I get worried about this as people could (rightly) be very nervous about
the system sharing information with a remote server without their
knowledge. Adding in this functionality makes it look as if that is the
intent of the system.

This is why there was a two step process, first to save out the data and
second to have the user upload it (once they'd looked at what it was
sharing).

Does anyone else have thoughts on this?

Cheers,

Richard




