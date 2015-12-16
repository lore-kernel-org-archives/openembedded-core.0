Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id EE6D373186
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:32:14 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 54ADCF811D7; Wed, 16 Dec 2015 08:32:15 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B7D3DF81188;
	Wed, 16 Dec 2015 08:32:14 -0700 (MST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <56717A07.2010100@mlbassoc.com>
	<CAJTo0LYaTqK1BOQZLNxK2Sxg6bA_hx=m-XLUQSWwuv9YymgVdw@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56718408.9080607@mlbassoc.com>
Date: Wed, 16 Dec 2015 08:32:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYaTqK1BOQZLNxK2Sxg6bA_hx=m-XLUQSWwuv9YymgVdw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Error building glib
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
X-List-Received-Date: Wed, 16 Dec 2015 15:32:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-12-16 08:10, Burton, Ross wrote:
>
> On 16 December 2015 at 14:49, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     Using master as of 2015-12-16 (f1f3716776078d68bd9e3734bca881a486dc2ea3)
>     I get this error:
>
>     ERROR: Command Error: exit status: 1  Output:
>     Applying patch allow-deprecated.patch
>
>
> Looks like you have a layer with a bbappend for glib-2.0, as master's glib-2.0 doesn't have that patch:

I didn't think to look for that.  Oh the perils of % in recipe names.

Thanks

>
> SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://configure-libtool.patch \
>             file://fix-conflicting-rand.patch \
>             file://add-march-i486-into-CFLAGS-automatically.patch \
>             file://glib-2.0-configure-readlink.patch \
>             file://run-ptest \
>             file://ptest-paths.patch \
>             file://uclibc.patch \
>             file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
>             file://allow-run-media-sdX-drive-mount-if-username-root.patch \
>    file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
>    file://0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch \
>             file://Enable-more-tests-while-cross-compiling.patch \
>            "
>
> In fact that revision isn't a poky or oe-core commit.
>
> The problem is that allow-deprecated.patch is patching generated files.  Remove all hunks that touch Makefile.in.
>
> Ross

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

