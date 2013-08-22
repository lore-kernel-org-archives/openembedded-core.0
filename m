Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id B90576B927
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 06:53:24 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so1397073pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dTch0fGIC32XC29UQISQx8tSu4za84iuKlNtK1DqoAY=;
	b=CE1pGgXXeqWgLQYDJytFnk3+nCxnZ2P2JhtjyShdzSa1kzkyDCr2n4lshgYtR3cu+l
	DrN7JLMNWtj0Ed390SZ8+ctkuKgqdcu19kEf0anl2JUI1dqqA5/7zmtYOmFUEuEvwQ7l
	mwsmrIoZOen+8lsnPq8x6Vi5SnkDaB/gGGHxgRJBe8YdHuXnmklhZCgWF4ZctbcPPizu
	b8JppbqiddF1Gmg5DRPBQk3woz5gU8bW4Cr15AN/R4tXOpJsxx+NHevfSm+0ZHr5C+CD
	oIMGzc2lidqzM0ojLYpJ0y9KoOun2ZryGevhCah8dp1kVYnFrjLdrOYi+8Tun1FOI67Z
	LIkw==
X-Received: by 10.68.237.3 with SMTP id uy3mr3765012pbc.155.1377154405687;
	Wed, 21 Aug 2013 23:53:25 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id x8sm12817006pbb.39.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 23:53:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
Date: Wed, 21 Aug 2013 23:53:21 -0700
Message-Id: <A2E1A02F-46EC-46D0-BD79-B1B5837D3275@gmail.com>
References: <cover.1377008073.git.sgw@linux.intel.com>
	<1377009976.25999.98.camel@ted>
	<CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1508)
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/25] Final Review and ACK
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
X-List-Received-Date: Thu, 22 Aug 2013 06:53:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 20, 2013, at 8:06 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> Thanks for merging the patches but one change, the poky.conf change
> (http://patchwork.openembedded.org/patch/55893/), has not been merged.

thats poky specific patch not related to OE-Core as such, poky ml is =
more appropriate for this
patch=

