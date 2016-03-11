Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0066E6B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2B98pGm017983; Fri, 11 Mar 2016 09:08:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZIHw52maXxwR; Fri, 11 Mar 2016 09:08:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2B98nLP017980
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Mar 2016 09:08:50 GMT
Message-ID: <1457687329.2804.250.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Hongxu Jia
	<hongxu.jia@windriver.com>
Date: Fri, 11 Mar 2016 09:08:49 +0000
In-Reply-To: <CAJTo0LZGEEq3LQV-83A1vJE7hfVwsPWOmXk1nX1E7G0JiskSPA@mail.gmail.com>
References: <cover.1457681854.git.hongxu.jia@windriver.com>
	<26a6e7fd40f8c0be2464f802c41eecb06bc818c0.1457681854.git.hongxu.jia@windriver.com>
	<CAJTo0LZGEEq3LQV-83A1vJE7hfVwsPWOmXk1nX1E7G0JiskSPA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python3: fix do_configure check platform triplet error
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
X-List-Received-Date: Fri, 11 Mar 2016 09:08:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-11 at 09:04 +0000, Burton, Ross wrote:
> 
> On 11 March 2016 at 07:40, Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
> > For p1022ds bsp, the MULTIARCH is powerpc-linux-gnuspev1 and
> > python3 did not recognize the extra 'v1' which caused python3
> > configure error for the platform triplet.
> > 
> Forgive me for dry-by commenting without a lot of clue about this,
> but doesn't that suggest instead that the C function to emit the
> triplets is in fact wrong?

Following the links does give more context. The "bad" triplet is
actually coming from gcc and Hongxu's original patch did change gcc to
"fix" it. Unfortunately it does so at the risk of other problems to
gcc.

The gcc-cross recipes aren't working entirely correctly at the moment
and its just good luck (and sstate) which are meaning things do
actually work out.

The trouble is that changing gcc right now to fix this properly isn't
something we can easily do. So this patch might be the right short term
workaround.

Cheers,

Richard

