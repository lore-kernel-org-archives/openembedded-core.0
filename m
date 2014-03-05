Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCA86C8BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 09:21:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s259LbHB005577; Wed, 5 Mar 2014 09:21:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rpsXQrJ5eseS; Wed,  5 Mar 2014 09:21:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s259LU1L005570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 5 Mar 2014 09:21:32 GMT
Message-ID: <1394011283.31845.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Wed, 05 Mar 2014 09:21:23 +0000
In-Reply-To: <c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 09:21:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-05 at 17:18 +0800, Chong Lu wrote:
> Some packages do not link successfully using shared libraries.
> When link something to libfl.so, we will get this:
> 
> 	libfl.so: undefined reference to `yylex'
> 
> So we only build static libraries to fix this issue.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  .../files/flex-not-to-build-shared-libraries.patch | 39 ++++++++++++++++++++++
>  meta/recipes-devtools/flex/flex.inc                |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch

Why aren't the shared libraries working? Which packages show this
problem? Is this not a problem in the recipes using the shared
libraries?

At the very least this patch needs more explanation but I don't like the
idea.

Cheers,

Richard


