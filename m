Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 57C2B6E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:13:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0TDDC1m031856; Wed, 29 Jan 2014 13:13:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kQ18Xy7vJX5f; Wed, 29 Jan 2014 13:13:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0TDD8s9031853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 29 Jan 2014 13:13:10 GMT
Message-ID: <1391001183.24655.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laszlo Papp <lpapp@kde.org>
Date: Wed, 29 Jan 2014 13:13:03 +0000
In-Reply-To: <CAOMwXhNLza+hr=Df7dYfQh33wgWezHFtc5Grs9p1vUMiNkHx3w@mail.gmail.com>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999973.24655.64.camel@ted>
	<CAOMwXhNLza+hr=Df7dYfQh33wgWezHFtc5Grs9p1vUMiNkHx3w@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 13:13:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 12:59 +0000, Laszlo Papp wrote:
> On Wed, Jan 29, 2014 at 12:52 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:

> > By having a default of /home/root/ we can catch software that has issues
> > with relocation of that.
> 
> I am not sure what you mean. Could you please elaborate?

As you mention, "/root" is more standard. It therefore becomes hard to
spot software that assumes this rather than using the directory we
configure it to if the default is also /root.

By having a slightly more unusual default choice, we quickly find the
software that doesn't adapt to our variable.

> > Having the writeable user data in one directory like this is useful
> for several classes of embedded style devices.
> 
> Could you please provide any examples?

One that springs to mind is the Sharp Zaurus series of PDAs have
separate /home partitions in flash. You can reflash a new rootfs without
overwriting the user config data.

> > So to be honest I don't see a pressing reason to change this.
> 
> I do, because the earlier it is done, the fewer users that may have
> incompatible changes. As the time goes ahead, more and more users will
> stick to it as "default". I believe this means those who do not care
> about proper Unix separation.

Its been like this for years and seems to work perfectly fine for
people. You can configure it just fine. As I said previously, I see no
pressing reason to change it.

Cheers,

Richard




