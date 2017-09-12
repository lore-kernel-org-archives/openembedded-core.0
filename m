Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 052A277AB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 09:45:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8C9jTQo002577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 12 Sep 2017 10:45:32 +0100
Message-ID: <1505209529.18640.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 10:45:29 +0100
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Will Newton <willn@resin.io>
Subject: Re: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 09:45:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-09-11 at 15:28 -0300, Otavio Salvador wrote:
> This improves the Go support on OE-Core.
> 
> We are trying to port as much as possible work done by Matt on
> meta-golang back to OE-Core and also to avoid carrying old releases
> as
> there is no need to support more versions of Go toolchain.
> 
> This fixes issues in existing support as well as add support for SDK
> generation which supports Go.

https://autobuilder.yocto.io/builders/nightly-no-x11/builds/471/steps/BuildImages/logs/stdio

ERROR: go-dep-0.3.0-r0 do_package_qa: QA Issue: /usr/lib/go/src/github.com/golang/dep/vendor/github.com/pelletier/go-toml/test.sh contained in package go-dep-dev requires /bin/bash, but no providers found in RDEPENDS_go-dep-dev? [file-rdeps]
ERROR: go-dep-0.3.0-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: go-dep-0.3.0-r0 do_package_qa: Function failed: do_package_qa

Should be easy to fix hopefully!

Cheers,

Richard



