Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9F37869C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 14:53:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0DErft4025936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 13 Jan 2018 14:53:42 GMT
Message-ID: <1515855221.29722.159.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan McGregor <danismostlikely@gmail.com>, Ross Burton
	<ross.burton@intel.com>
Date: Sat, 13 Jan 2018 14:53:41 +0000
In-Reply-To: <CACS+7ZT154sQztbhuaCXEB16UBeoEp8L=SsekOBpx5NkshH+Ag@mail.gmail.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
	<20180108160021.4715-6-ross.burton@intel.com>
	<CACS+7ZT154sQztbhuaCXEB16UBeoEp8L=SsekOBpx5NkshH+Ag@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] m4: merge two .inc files
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
X-List-Received-Date: Sat, 13 Jan 2018 14:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-12 at 11:30 -0600, Dan McGregor wrote:
> On 8 January 2018 at 10:00, Ross Burton <ross.burton@intel.com>
> wrote:
> > -EXTRA_OECONF += "--without-libsigsegv-prefix"
> > +inherit autotools texinfo
> > +
> > +SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
> > +           file://ac_config_links.patch \
> > +           file://remove-gets.patch \
> > +           "
> > +
> > +SRC_URI_append_class-target = "file://0001-Unset-
> > need_charset_alias-when-building-for-musl.patch"
> There's no space here, so it breaks with meta-clang enabled. It only
> works right now as-is because SRC_URI ends with whitespace.
> 
> I think it should be:
> SRC_URI_append_class-target = "
> file://0001-Unset-need_charset_alias-when-building-for-musl.patch"

I've pushed a tweak to fix that.

Cheers,

Richard

