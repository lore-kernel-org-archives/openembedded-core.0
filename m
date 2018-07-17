Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B273789E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:56:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6H9uQfO010658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 17 Jul 2018 10:56:28 +0100
Message-ID: <d7ac17b0f69098f3cb4235705e3b5c569e3ee04d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 10:56:26 +0100
In-Reply-To: <20180717033554.7096-1-hongl.fnst@cn.fujitsu.com>
References: <20180717033554.7096-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] sqlite3:3.23.1 -> 3.24.0
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
X-List-Received-Date: Tue, 17 Jul 2018 09:56:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-17 at 11:35 +0800, Hong Liu wrote:
> Upgrade sqlite3 from 3.23.1 to 3.24.0.
> 
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb}
> | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb =>
> sqlite3_3.24.0.bb} (59%)

pseudo-native doesn't build with this which makes me wonder how you
tested it?

Cheers,

Richard

