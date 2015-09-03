Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 946F876FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 19:10:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 99CBA3C88695
Message-ID: <1441307448.2977.27.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2015 20:10:48 +0100
In-Reply-To: <55E87F31.9010707@windriver.com>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<55E87F31.9010707@windriver.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/9] Fixes for a distro with a merged /usr
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
X-List-Received-Date: Thu, 03 Sep 2015 19:10:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 12:11 -0500, Mark Hatle wrote:
> On 9/3/15 9:58 AM, Joshua Lock wrote:
> > I've been playing around with building a distro with a merged
> > /usr[1] and
> > the following series fixes several issues I ran across in OE core
> > metadata.
> 
> everything in '/' linked to '/usr/' or everything in '/usr/' linked
> down to '/'?
> 
> (I've seen both implementations... just curious which one you are
> trying.)

The latter, as per [1]. That is /bin, /lib and /sbin are symlinked into
/usr.

Cheers,

Joshua

1. https://wiki.freedesktop.org/www/Software/systemd/TheCaseForTheUsrMe
rge/

