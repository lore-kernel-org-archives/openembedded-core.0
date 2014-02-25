Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4786F18F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 07:59:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1P7xnLe025247; Tue, 25 Feb 2014 07:59:49 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NmQDK2mB7O1o; Tue, 25 Feb 2014 07:59:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1P7xkAI025243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 25 Feb 2014 07:59:47 GMT
Message-ID: <1393315179.31769.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2014 07:59:39 +0000
In-Reply-To: <CAMKF1speSb1EJmaqZomq6GZ41Zg5WmFd0+e0fXiJBUiGE_WPMQ@mail.gmail.com>
References: <1393194057-2364-1-git-send-email-mac@mcrowe.com>
	<CAMKF1speSb1EJmaqZomq6GZ41Zg5WmFd0+e0fXiJBUiGE_WPMQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.35.0
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
X-List-Received-Date: Tue, 25 Feb 2014 07:59:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-24 at 21:33 -0800, Khem Raj wrote:
> On Sun, Feb 23, 2014 at 2:20 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  meta/recipes-support/curl/curl_7.34.0.bb |   63 ------------------------------
> >  meta/recipes-support/curl/curl_7.35.0.bb |   61 +++++++++++++++++++++++++++++
> 
> can you generate patches with git format-patch -M ? makes renames
> detection better
> and patches are simple to review

Cristiana sent out a patch for the same upgrade about the same time and
I have to admit I took the other one since it was generated with -M and
I could review it more easily...

Cheers,

Richard


