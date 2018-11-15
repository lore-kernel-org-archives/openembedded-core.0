Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9BBA6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:23:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAF9NLsg014209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 15 Nov 2018 09:23:23 GMT
Message-ID: <d7b9e550f8628efc13616d92344089dbfd234ec9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 09:23:21 +0000
In-Reply-To: <579d70f86c017ddc17bc9dfd071361a53e4b0f26.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<579d70f86c017ddc17bc9dfd071361a53e4b0f26.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 8/8] busybox: add coreutils to RDEPENDS of busybox-ptest
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
X-List-Received-Date: Thu, 15 Nov 2018 09:23:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 10:02 +0800, Chen Qi wrote:
> busybox's echo test cases needs 'od' command to have '-t' option
> support. However, our busybox disable it by default by not setting
> CONFIG_DESKTOP. CONFIG_DESKTOP affects many busybox utilities. So
> add coreutils to RDEPENDS of busybox-ptest.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 3 +++
>  1 file changed, 3 insertions(+)

This means any build of busybox will now also build coreutils which
isn't really desirable.

If there any way to just enable the -t option to od without all the
other changes? Has this been mentioned to upstream busybox?

Cheers,

Richard


