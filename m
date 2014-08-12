Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F47D60EFA;
	Tue, 12 Aug 2014 05:54:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7C5seu1029241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Aug 2014 22:54:40 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 22:54:39 -0700
Message-ID: <53E9AC1E.20908@windriver.com>
Date: Tue, 12 Aug 2014 13:54:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20140812051548.15823.qmail@f4mail-235-216.rediffmail.com>
In-Reply-To: <20140812051548.15823.qmail@f4mail-235-216.rediffmail.com>
Subject: Re: [oe] Error: package not found in the base feeds (genericx86_64 x86_64 noarch any all)
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
X-List-Received-Date: Tue, 12 Aug 2014 05:54:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I can't see the format in the your email, please send it in plain text if possible.

And for your questions:

* where liburiparser1 is coming from
It is a debian style name, the so is liburiparser.so.1 (note the "1" in
the end) so the pkg name is liburiparser1, please see the debian.bbclass
for more info.

* For the errors:
Error: liburiparser1 not found in the base feeds

Did you run bitbake liburiparser ?

And which package RDEPENDS on liburiparser ?

// Robert

On 08/12/2014 01:15 PM, Himanshu Pandey wrote:
> Hi,
> I am constantly getting error:Error: liburiparser1 not found in the base feeds (genericx86_64 x86_64 noarch any all). My receipe name is liburiparser_0.8.0.bb. So from where liburiparser1 is coming from. Very surprising for me.
> For each and every package it is giving the same error i.e. package not found in the base feeds&nbsp;&nbsp;(genericx86_64 x86_64 noarch any all).
> My liburiparser receipe is as follows:
> DESCRIPTION = "uriparser is a strictly RFC 3986 compliant URI parsing library."HOMEPAGE = "http://uriparser.sf.net"SECTION = "base"PR="r10"LICENSE = "BSD"LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"SRC_URI = "http://ncu.dl.sourceforge.net/project/uriparser/Sources/0.8.0/uriparser-${PV}.tar.bz2"SRC_URI[md5sum] = "77601f52ab91c0e100fc5d783d9c1ee5"SRC_URI[sha256sum] = "1dd9f9779d8f17822bd7d68ba042fd67779b6e4ccf162bd3c9d0ff19a8ba9bf7"
> S = "${WORKDIR}/uriparser-0.8.0"
> EXTRA_OECONF= "--disable-test --disable-doc"
> inherit autotools
> do_compile() {&nbsp; &nbsp; &nbsp; &nbsp; oe_runconf&nbsp; &nbsp; &nbsp; &nbsp; oe_runmake}do_install() {&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}/usr/lib&nbsp; &nbsp; &nbsp; &nbsp; install -d ${STAGING_INCDIR}/uriparser/&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ./include/uriparser/*.h ${STAGING_INCDIR}/uriparser/&nbsp; &nbsp; &nbsp; &nbsp; install -m 644 ${S}/.libs/*.so* ${D}/usr/lib/}PACKAGES =+ "liburiparser"FILES_liburiparser += "${D}${libdir} ${D}${libdir}/liburiparser.so&nbsp;${D}${libdir}/liburiparser.so.1 ${D}${libdir}/liburiparser.so.1.*"BBCLASSEXTEND = "native"
>
> Please help to resolve the same.
> Regards,Himanshu
>

