Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27C46755AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 12:27:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w77CRVkf005316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 7 Aug 2018 13:27:32 +0100
Message-ID: <4d55ef315e4570f85e6f63271e60e7ea7bf71e62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Aug 2018 13:27:31 +0100
In-Reply-To: <20180807093148.17801-4-hongl.fnst@cn.fujitsu.com>
References: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
	<20180807093148.17801-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] [PATCH] librepo:1.8.1 -> 1.9.0
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
X-List-Received-Date: Tue, 07 Aug 2018 12:27:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-07 at 17:31 +0800, Hong Liu wrote:
> Upgrade librepo from 1.8.1 to 1.9.0
> 
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/librepo/{librepo_1.8.1.bb => librepo_1.9.0.bb}
> | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/librepo/{librepo_1.8.1.bb =>
> librepo_1.9.0.bb} (93%)

This change causes the build to fail in do_patch with patch rejects...

Cheers,

Richard

