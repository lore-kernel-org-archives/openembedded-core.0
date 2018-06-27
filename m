Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DE96975097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 13:41:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5RDferQ011917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 27 Jun 2018 14:41:41 +0100
Message-ID: <1a82c8b1f2ca319f1d4ddd740c2231d4dfb3f88d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Samuli Piippo <samuli.piippo@qt.io>,
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2018 14:41:40 +0100
In-Reply-To: <20180626075951.25183-1-samuli.piippo@qt.io>
References: <20180626075951.25183-1-samuli.piippo@qt.io>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] glib: remove unnecessary dependency to DISTRO_FEATURES
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
X-List-Received-Date: Wed, 27 Jun 2018 13:41:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-26 at 10:59 +0300, Samuli Piippo wrote:
> Since DISTRO_FEATURES was expanded in the comments, it created
> task dependency to the full content of DISTRO_FEATURES, instead
> of just the x11 used below. This prevented reuse of sstate-cache
> when unrelated feature flags were changed.
> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, good catch!

Cheers,

Richard

