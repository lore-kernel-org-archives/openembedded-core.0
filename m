Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA953608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NMPx5h019946; Wed, 23 Sep 2015 23:25:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fbVntXUjd3Td; Wed, 23 Sep 2015 23:25:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NMPkr6019931
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Sep 2015 23:25:57 +0100
Message-ID: <1443047146.19044.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 23 Sep 2015 23:25:46 +0100
In-Reply-To: <CAP9ODKpdpMK5jApg7cP3AQ70xEXoC3_V5i_mUGVqBVmTEcY-cw@mail.gmail.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
	<CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
	<5601A857.7060404@mlbassoc.com>
	<03ABB337-6070-4E3E-9D23-151E454481D4@gmail.com>
	<CAP9ODKrmkLw2NQ8SWtSxjXCoUi-Xzmo+4xP3rYmfgkLCPQgqvw@mail.gmail.com>
	<19D16A42-669F-4A59-A1ED-D05C26508E00@gmail.com>
	<CAP9ODKpdpMK5jApg7cP3AQ70xEXoC3_V5i_mUGVqBVmTEcY-cw@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Gary Thomas <gary@mlbassoc.com>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Wed, 23 Sep 2015 22:26:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-22 at 21:28 -0300, Otavio Salvador wrote:
> On Tue, Sep 22, 2015 at 8:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Sep 22, 2015, at 4:28 PM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> >>
> >> On Tue, Sep 22, 2015 at 8:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> its normal for build to use libraries from build host for native tools. If we want to abstract that
> >>> from host deps then creating a dependency on package-native is the way
> >>
> >> The point is this seems to be not deterministic. Sometimes this works,
> >> others it does not.
> >
> >
> > you can debug it by moving the dependency from default task to earlier or later task and see where its failing sometimes
> > some configure might run where we do not expect it to.
> 
> I cannot reproduce it locally, just in my autobuilder and now it does
> not fail anymore. Gary is the only one seeing it.

I think the way to reproduce this is to build gdk-pixbuf-native along
with harfbuzz-native and librsvg-native, then make a small change to the
gdk-pixbuf recipe that would cause it to rebuild, clean harfbuzz-native
and then build gdk-pixbuf.

I'm going to send out a patch which at least unblocked my own builds
when I ran into this locally.

Cheers,

Richard


