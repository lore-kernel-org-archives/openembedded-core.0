Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E10960103
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 10:34:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9UAXxmF005101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 30 Oct 2018 10:34:00 GMT
Message-ID: <2bfb241e4116d1e9da3776fcc2e76544c3a81ee0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabien Lahoudere <fabien.lahoudere@collabora.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2018 10:33:59 +0000
In-Reply-To: <5eb43bde3cf8f9d1a8937520c0baf91621ca8625.1540894302.git.fabien.lahoudere@collabora.com>
References: <5eb43bde3cf8f9d1a8937520c0baf91621ca8625.1540894302.git.fabien.lahoudere@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] archiver: Add xz support to compress sources
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
X-List-Received-Date: Tue, 30 Oct 2018 10:34:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-30 at 11:12 +0100, Fabien Lahoudere wrote:
> In order to be more efficient, we use xz as compression method
> to create GPL sources archives.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> ---
>  meta/classes/archiver.bbclass | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Patch looks good, just wondering if we want to switch the default
whilst we do this? I appreciate it breaks strict compatibility but it
may be an idea...

Cheers,

Richard


