Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6687977E16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37LrUxh005068; 
	Fri, 7 Apr 2017 22:53:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SK_N2kbs33ga; Fri,  7 Apr 2017 22:53:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37Lir1u004712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 22:44:54 +0100
Message-ID: <1491601493.17200.103.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 07 Apr 2017 22:44:53 +0100
In-Reply-To: <CAJ86T=WV75JhhcJXpdmHXn9WrEBT0F=oS6g-sk8JAApFYVp1xQ@mail.gmail.com>
References: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1491583311-1551-2-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJ86T=WV75JhhcJXpdmHXn9WrEBT0F=oS6g-sk8JAApFYVp1xQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] no-static-libs: Add entry for ncurses
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
X-List-Received-Date: Fri, 07 Apr 2017 21:53:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-07 at 10:42 -0700, Andre McCurdy wrote:
> On Fri, Apr 7, 2017 at 9:41 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Yes, the option to disable static libraries in boost really is
> boost or ncurses?

ncurses. Its been a long day, I'll tweak the commit message, thanks.

If anyone does know how to disable static libs in boost I'd be
interested to know how!

Cheers,

Richard


