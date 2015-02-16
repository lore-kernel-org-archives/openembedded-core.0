Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 18B5960556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 10:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GA1aR6016296; Mon, 16 Feb 2015 10:01:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g3sN4jRF-XRK; Mon, 16 Feb 2015 10:01:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GA1MBh016269
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Feb 2015 10:01:34 GMT
Message-ID: <1424080882.25541.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Mon, 16 Feb 2015 10:01:22 +0000
In-Reply-To: <54DD55E2.6090709@windriver.com>
References: <cover.1414748681.git.hongxu.jia@windriver.com>
	<65b3eb26c24648674ec3deb4da87f4933c2c0f21.1414748681.git.hongxu.jia@windriver.com>
	<3627050.lDnyP7JDsZ@peggleto-mobl5.ger.corp.intel.com>
	<54DD55E2.6090709@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Mon, 16 Feb 2015 10:01:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-13 at 09:39 +0800, Hongxu Jia wrote:
> On 02/13/2015 12:46 AM, Paul Eggleton wrote:
> >> default_archs) +                new_pkg =
> >> >self._search_pkg_name_in_feeds(pkg, default_archs) or \ +
> >> >  self._search_pkg_provider_in_smart(pkg, default_archs) if not new_pkg:
> >> >                      err_msg = '%s not found in the base feeds (%s).\n' % \
> >> >                                (pkg, ' '.join(default_archs))
> > It took a long time to reply to this, my apologies. This patch looks OK but
> > Richard pointed out that it may have an impact on the speed of do_rootfs
> > because of the extra calls out to smart. Do you have any performance impact
> > figures?
> 
> Hi Paul,
> 
> The extra 'smart' calling takes 3-5 seconds for one search,
> but it will not do that for most packages, it goes into
> self._search_pkg_name_in_feeds first, if not found and then in to
> self._search_pkg_provider_in_smart, only if we have such as python3
> in the build session, it will take extra 3-5 seconds.

Could we test the time it takes to build core-image-sato-sdk before and
after this patch please?

Cheers,

Richard


