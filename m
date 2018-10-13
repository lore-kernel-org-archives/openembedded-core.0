Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1F2779BAE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 10:29:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9DATjj8012245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 13 Oct 2018 11:29:46 +0100
Message-ID: <f50185f96f49dd8e3e094549bcccdb9c100adbd0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Sat, 13 Oct 2018 11:29:45 +0100
In-Reply-To: <CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
	<CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
	<CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Sat, 13 Oct 2018 10:29:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-10-13 at 02:15 +0200, Martin Jansa wrote:
> Hi,
> 
> sorry for delay, I was first testing a bit more specific fix:
> DEPENDS_append_libc-glibc = "${@bb.utils.contains('PTEST_ENABLED',
> '1', '', ' virtual/libc-locale', d)}"
> 
> but unfortunately this nor your shorter version work.
> 
> and it's reproducible without the multilib enabled as well:
> 
> ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
> ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]

What is also puzzling me is that we're not seeing this in OE-Core on
the autobuilders. We recently merged much better warning summary code
so we should see this quite clearly in its output and we're not...

I'm not sure what that means but it suggests there is something going
on here we're not quite seeing...

Cheers,

Richard



