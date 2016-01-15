Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3109B73177
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FBBtHr015358; Fri, 15 Jan 2016 11:12:24 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XdhLI8n7gjI7; Fri, 15 Jan 2016 11:12:24 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FBCJWX015405
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 11:12:21 GMT
Message-ID: <1452856339.28375.139.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 11:12:19 +0000
In-Reply-To: <06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 15 Jan 2016 11:12:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-14 at 18:29 -0800, Robert Yang wrote:
> There are a lot of binary packages have files in /etc/, but only a
> few
> of them have set CONFFILES, more than 180 packages are not set in a
> world build.  So treat all the files in /etc/ as CONFFILES as Debian
> does:
> - All the files in /etc/ are CONFFILES
> - Move the file out of /etc/ if it is not a conffile
> - If /etc/foo can't be moved out, and is changed during
>   runtime, then create a symlink /etc/foo -> /var/foo
> 
> [YOCTO #8436]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf |    1 +
>  1 file changed, 1 insertion(+)

We have discussed this before and we decided that setting CONFFILES
globally seemed like a bad idea?

What has changed since the last discussion?

Cheers,

Richard

