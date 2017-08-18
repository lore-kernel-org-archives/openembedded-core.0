Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4DEEF7857B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:53:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7I9rbEA023839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 18 Aug 2017 10:53:38 +0100
Message-ID: <1503050017.32591.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 10:53:37 +0100
In-Reply-To: <20170816111355.11347-1-adrian.ratiu@ni.com>
References: <20170816111355.11347-1-adrian.ratiu@ni.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 18 Aug 2017 10:53:38 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: Re: [PATCH] oe/path.py: copyhardlinktree: don't overwrite existing symlinks
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
X-List-Received-Date: Fri, 18 Aug 2017 09:53:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-16 at 14:13 +0300, Ioan-Adrian Ratiu wrote:
> Starting with tar>=1.26 the default behaviour when extracting is to
> overwrite symlinks and a '-h' flag was added for tar to follow them.
> 
> The primary use case for this is to allow ${DEPLOY_DIR_IPK/RPM/DEB}
> to
> be symlinks and avoid copyhardlinktree replacing those symlinks with
> a
> normal directory.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/lib/oe/path.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Does the -h option exist for tar < 1.26?

Cheers,

Richard

