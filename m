Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6751560E79
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Apr 2014 12:08:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s36C8bj2009780; Sun, 6 Apr 2014 13:08:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NMDvmd8hsRYV; Sun,  6 Apr 2014 13:08:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s36C8WVO009762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 6 Apr 2014 13:08:34 +0100
Message-ID: <1396786107.24597.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 06 Apr 2014 13:08:27 +0100
In-Reply-To: <CANyK_8dPFDShPAvhYt+89j0Mr4fjzpeMt28HrwNAZrN8qfnS4w@mail.gmail.com>
References: <CANyK_8dPFDShPAvhYt+89j0Mr4fjzpeMt28HrwNAZrN8qfnS4w@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg-0.2.2 release
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
X-List-Received-Date: Sun, 06 Apr 2014 12:08:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 22:18 +0100, Paul Barker wrote:
> Hi all,
> 
> I've just released opkg-0.2.2 with the following bugfixes (issue
> numbers refer to the opkg issue list):
> 
> - Fix '--force-reinstall' flag so that it acts as an upgrade rather than
>   removing possibly critical packages before reinstall (issue 71)
> 
> - Symlinks are now correctly removed during package uninstall (issue 91)
> 
> - Fixed help and manual pages to reflect that shell globs not true regexps are
>   accepted by opkg (issue 107)
> 
> - The error message "no valid architecture" is no longer given when the
>   architecture of a package is valid but incompatible with the current system.
> 
> This is a bugfix only release with no other significant changes.
> 
> I have also rebased the patches against opkg in oe-core against the
> new release and checked that they still apply and that the result
> builds with recent oe-core master. The result was tested on qemuarm by
> running 'opkg update' against a package feed and installing a few new
> packages.

Thanks for checking this, it certainly helps and is appreciated!

> Do we want to try to get this in to the upcoming Yocto release or
> shall I delay the recipe upgrade until after the release? If you want
> it for the upcoming release I'll re-run my tests locally just to be
> sure it's looking good and then send a patch.

We're about to roll -rc3 so this is getting late in the cycle to change
the package manager. Having said that this sounds like bug fixes which
would be nice to have.

I think I'm leaning to not taking it right now as it is really too late
but I'm open to other views on this...

Cheers,

Richard



