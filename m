Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A0DB773B6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 12:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2CChoo5024036; Thu, 12 Mar 2015 12:43:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Uxsp-bX-yi_w; Thu, 12 Mar 2015 12:43:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2CChYEQ024022
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2015 12:43:46 GMT
Message-ID: <1426164214.9114.105.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Mar 2015 12:43:34 +0000
In-Reply-To: <CAJTo0LbtbqvHgJG9i6zdY+YcBU70dHJhVFE=fBX=k46ty8N8=g@mail.gmail.com>
References: <cover.1426140850.git.liezhi.yang@windriver.com>
	<418f6d2d447b8719d99dd9819cf13e213dc5c62a.1426140850.git.liezhi.yang@windriver.com>
	<CAJTo0LbtbqvHgJG9i6zdY+YcBU70dHJhVFE=fBX=k46ty8N8=g@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tar: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Thu, 12 Mar 2015 12:43:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-03-12 at 12:16 +0000, Burton, Ross wrote:
> On 12 March 2015 at 06:14, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>         +acpaths = "-I ./m4"
>
> Why does this only happen on tar?  Why is it safe to pass just -I ./m4
> when the detected list that you're overriding is effectively -I ./m4
> -I ./tests?
>
> Would it be better to just make all include paths relative to ${S}
> when generating the acpaths?

We tried that. Subconfigures break:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/autotools.bbclass?id=3c58f92d46e32c40b80575f14e0f6f66c9920c66

Cheers,

Richard


