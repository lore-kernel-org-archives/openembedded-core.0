Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C88E361086
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 15:22:17 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl14so5144646pab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=7XBqS319RyKWdFJYPV1MofINvt38bQBJVam4Mcj0rB8=;
	b=XQJ6QBwi5AquRVscCtUqmQGw7mAeeu96Z7Ow8Avlu78dHeTz3XXhrOSpbwyNLxd6ho
	qhLKpsjNvfp6ZEOyq74DriePA4qhSKDcRE8hYmQiTu5r6dEwKJZTsVQh3Lkmz3n+LIox
	J2EeOKEjiuiIkV7l5rkrGOxpe0bx6skN6fGTXHDZJLxg8tgGz3rLzHU53y3qp8HsJwOw
	2xwKfvz3PJvaqj3oic0SKdSMrzUQ3eBzC3LqJvENhYW7i8r1ERaRumo9p7g9ZkH8Spgy
	9TSIgnTCOSN8iYTpfAINrFLXD3KapiM0dN0+dSlVnEnkz/CiHvoriD0cmzNx0wQmytJy
	xBMg==
X-Received: by 10.66.169.42 with SMTP id ab10mr24621341pac.14.1372692138973;
	Mon, 01 Jul 2013 08:22:18 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qp4sm22748153pbc.41.2013.07.01.08.22.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 08:22:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZT=jktkc4+MURMzO1Vn9BcyzaaHcZTz_LmAHb5fpF27A@mail.gmail.com>
Date: Mon, 1 Jul 2013 08:22:05 -0700
Message-Id: <3010645D-C618-4642-BF4B-27CD8988B4E4@gmail.com>
References: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
	<C234ACE8-19BD-4AA8-A45C-C2F712BFA4ED@gmail.com>
	<CAJTo0LZT=jktkc4+MURMzO1Vn9BcyzaaHcZTz_LmAHb5fpF27A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: =?iso-8859-1?Q?V=EDctor_MV?= <v.mayoralv@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: apr: Add EXTRA_OECONF += "apr_cv_mutex_recursive=yes"
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
X-List-Received-Date: Mon, 01 Jul 2013 15:22:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 1, 2013, at 7:46 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 1 July 2013 15:30, Khem Raj <raj.khem@gmail.com> wrote:
>> to prepate the patch for review and instead of putting it in =
EXTRA_OECONF
>> add it to CACHED_CONFIGUREVARS
>=20
> If it's going to do to CACHED_CONFIGUREVARS then the same series
> should also remove the mention of this variable in
> meta/site/powerpc32-linux too...
>=20
> (one day I'll start a big prune of the site values, moving the
> non-architecture-specific values to generic files)

that will be a good work. many a times these values in common files step =
on each other when building different packages
containing those contentious ones in recipes would be good.

>=20
> Ross


