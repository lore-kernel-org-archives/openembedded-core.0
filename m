Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0293E719A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:18:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0TMIU8b016501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 29 Jan 2018 22:18:31 GMT
Message-ID: <1517264310.3090.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Derek Straka <derek@asterius.io>, openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 22:18:30 +0000
In-Reply-To: <1517262541-8719-1-git-send-email-derek@asterius.io>
References: <1517262541-8719-1-git-send-email-derek@asterius.io>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 22:18:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-01-29 at 16:49 -0500, Derek Straka wrote:
> Rebased:
>   - python/01-use-proper-tools-for-cross-build.patch
>   - python/fix-makefile-for-ptest.patch
>   - python/parallel-makeinst-create-bindir.patch
> 
> Removed Upstreamed Patch:
>   - python/Don-t-use-getentropy-on-Linux.patch
> 
> Updated license checksum for changes in the copyright date.  The
> license
> terms remain unchanged
> 
> Added an extra do_compile item to create the native pgen that no
> longer
> gets compiled by default
> 
> Update the json manifest with the latest dependency set
> 
> Signed-off-by: Derek Straka <derek@asterius.io>

Your patch was merged into master so if there are tweaks they need to
be in a patch against master now please.

Cheers,

Richard

