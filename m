Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEE96D37F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:45:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAB9jMdX028799; Mon, 11 Nov 2013 09:45:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lb2-F6a_8Qq1; Mon, 11 Nov 2013 09:45:22 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAB9jH7q028796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 11 Nov 2013 09:45:18 GMT
Message-ID: <1384163113.22454.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hans =?ISO-8859-1?Q?Beck=E9rus?= <hans.beckerus@gmail.com>
Date: Mon, 11 Nov 2013 09:45:13 +0000
In-Reply-To: <CAFyqS9q_HMp+WDgcxQ9QeoDtDP3JCmpWwLSu5NVH+unqyCQ4GA@mail.gmail.com>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted> <527D0A44.7020005@windriver.com>
	<1383929419.2345.11.camel@ted>
	<1383931424.5378.131.camel@dvhart-mobl4.amr.corp.intel.com>
	<CAAQYJAv9BxmjsskLP+-26b=HkRWpLYxzsmzQVyo-norREhSUOA@mail.gmail.com>
	<1384037896.22454.5.camel@ted>
	<CAFyqS9q_HMp+WDgcxQ9QeoDtDP3JCmpWwLSu5NVH+unqyCQ4GA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Mon, 11 Nov 2013 09:45:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2013-11-11 at 09:06 +0100, Hans Beckérus wrote:
> I am having some trouble with these patches :( The new approach is
> using the '-n' flag to the 'cp' command.
> That is not supported on our SuSE11 based system. To be honest, I do
> not know how portable '-n' is?
> Some system have it, others seems to provide '-u' instead. I guess by
> removing '-n' part of the performance gain is lost?
> Would it be possible to test for error from the 'cp' command and if it
> fails try '-u' instead (and cache the result)? Or maybe
> even better, make this configurable in local.conf (or the distro) for
> the build platforms that does not support  '-n' but can
> instead fall-back to using '-u'. From what I can tell most systems
> support  one or the other, but never both.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=276b9df3588ecd438c3e2f502d56cd6b9fb24676

Thankfully the above works just as well. I used -n to get rid of an
error, then added -l for efficiency. We can get away just with -l.

Cheers,

Richard



