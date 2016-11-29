Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F47160291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAT0WgdQ010382; Tue, 29 Nov 2016 00:32:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2v-TkJWfYVLS; Tue, 29 Nov 2016 00:32:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAT0UmHH010358
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Nov 2016 00:30:49 GMT
Message-ID: <1480379448.28508.223.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>, Andre McCurdy
	<armccurdy@gmail.com>
Date: Tue, 29 Nov 2016 00:30:48 +0000
In-Reply-To: <CABcZAN=QjzMYd9my-xyOA-=12Mpv6bOvAS2a8shBSxyZFqZ5cQ@mail.gmail.com>
References: <1480371801-21467-1-git-send-email-armccurdy@gmail.com>
	<CABcZAN=QjzMYd9my-xyOA-=12Mpv6bOvAS2a8shBSxyZFqZ5cQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: squash whitespace when printing BUILDCFG_VARS
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
X-List-Received-Date: Tue, 29 Nov 2016 00:32:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-11-28 at 16:53 -0700, Christopher Larson wrote:
> 
> On Mon, Nov 28, 2016 at 3:23 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > TUNE_FEATURES for ARM targets typically contains a lot of
> > whitespace
> > due to refactoring in OE 2.1:
> > 
> >   http://git.openembedded.org/openembedded-core/commit/?id=f774b44f
> > a007a2a756ada892ede832b1251d940c

I'm wondering if we should take back some of the whitespace changes
that commit made...

Cheers,

Richard

