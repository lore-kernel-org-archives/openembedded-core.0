Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC42B65C8A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84GIDae009746; Fri, 4 Sep 2015 17:18:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o2kcPOuNr6kP; Fri,  4 Sep 2015 17:18:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84GHwlk009728
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Sep 2015 17:18:09 +0100
Message-ID: <1441383478.24871.190.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 04 Sep 2015 17:17:58 +0100
In-Reply-To: <CAJTo0LZwA3rQBt1Ga8q4vamV6qVBHDCJFMAQjd+aLXTj8k9+EA@mail.gmail.com>
References: <CAGrhNMy9tDeSecYg3avrzem+tZt0Sh3mmOrG6J2JqBhaj-C53g@mail.gmail.com>
	<CAJTo0LZwA3rQBt1Ga8q4vamV6qVBHDCJFMAQjd+aLXTj8k9+EA@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Remove oprofileui-server
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
X-List-Received-Date: Fri, 04 Sep 2015 16:18:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-04 at 16:59 +0100, Burton, Ross wrote:
> On 4 September 2015 at 10:05, Felipe Tonello <eu@felipetonello.com>
> wrote:
>         oprofileui-server is obsolete since it uses legacy OProfile's
>         'opcontrol'  commands to record a session, instead of operf.
>         It
>         doesn't work on fido builds.
> >
>         Anyone familiar with the code base can tell if it is too much
>         work to
>         update it to use operf?
>
> Yes, its known that it's broken (bug 7054).
>
> It hopefully isn't too much work to update it,

It just needs someone with some glib knowledge to look at it, its
straight forward enough. I did get part way through it before realising
my glib knowledge is lacking (conversion of some sync code to become
async) and I haven't had the time :(.

Cheers,

Richard
 




