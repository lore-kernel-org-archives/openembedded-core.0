Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 13210778AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 19:13:45 +0000 (UTC)
Received: from [IPv6:2001:470:1f1b:476:ecae:cbdd:615e:1b52] (unknown
	[IPv6:2001:470:1f1b:476:ecae:cbdd:615e:1b52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: andrewsh)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B3DA5260AC1;
	Fri, 10 Mar 2017 19:13:45 +0000 (GMT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170309143139.2785-1-andrew.shadura@collabora.co.uk>
	<20170309143139.2785-2-andrew.shadura@collabora.co.uk>
	<CAJTo0LYuWM7i-snTJyJ5BPdeKRez_8WzTk5EhUbbfFXFTDrfsQ@mail.gmail.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <e4c9dcc1-c915-a44c-fe01-bf44f5299f19@collabora.co.uk>
Date: Fri, 10 Mar 2017 20:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYuWM7i-snTJyJ5BPdeKRez_8WzTk5EhUbbfFXFTDrfsQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] ghostscript: build and install libgs
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
X-List-Received-Date: Fri, 10 Mar 2017 19:13:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09/03/17 17:36, Burton, Ross wrote:
> On 9 March 2017 at 14:31, Andrew Shadura <andrew.shadura@collabora.co.uk>
> wrote:
> 
>> Build and install libgs library, which is a build dependency
>> of a few other libraries, such as libspectre.
>>
>> We don't want to ship the executable binaries, only the library and its
>> headers, hence oe_runmake install-so + rm -rf, not e.g. oe_libinstall.
>>
> 
> This does *way* more:
> 
> packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: PKGSIZE changed
> from 0 to 38856 (+100%)
>   * FILELIST: added "/usr/include/ghostscript/gdevdsp.h
> /usr/include/ghostscript/iapi.h /usr/lib/libgs.so
> /usr/include/ghostscript/gserrors.h /usr/include/ghostscript/ierrors.h"
> packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: RDEPENDS: added
> "ghostscript-lib"
> packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: FILELIST: added
> "/usr/include/ghostscript/gdevdsp.h /usr/include/ghostscript/iapi.h
> /usr/lib/libgs.so /usr/include/ghostscript/gserrors.h
> /usr/include/ghostscript/ierrors.h"
> packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: RRECOMMENDS:
> added "ghostscript-lib-dev"
> 
> That's all good.
> 
> packages/corei7-64-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed
> from 45465 to 0 (-100%)
>   * FILELIST: removed all items "/usr/share/man/de/man1/ps2pdf.1 ...
> /usr/share/man/man1/pdf2ps.1"
> 
> All the man pages disappeared
> 
> packages/corei7-64-poky-linux/ghostscript/ghostscript: PKGSIZE changed from
> 61037876 to 16376087 (-73%)
>   * FILELIST: removed "/usr/share/ghostscript/9.20/doc/index.html
> /usr/share/ghostscript/9.20/doc/gs.css
> /usr/share/ghostscript/9.20/lib/bjc610a0.upp ...
> /usr/share/ghostscript/9.20/doc/Make.htm /usr/share/ghostscript/9.20/lib/
> wrfont.ps"
> 
> Pretty much all of ghostscript disappeared.

Right. I'm probably removing way too much.

> packages/corei7-64-poky-linux/ghostscript/ghostscript: RDEPENDS: removed
> all items "cups-libimage (['>= 2.2.2']) glibc (['>= 2.25']) cups-lib (['>=
> 2.2.2']) libpng (['>= 1.6.28']) tiff (['>= 4.0.7']) fontconfig (['>=
> 2.12.1'])"
> 
> Was that the intention?  Having libgs sounds sensible but surely both
> should be packaged.

The intention was what I said, probably I misunderstood what the
original packages had, so I haven't noticed things disappearing.

Will investigate and resubmit.

-- 
Cheers,
  Andrew

