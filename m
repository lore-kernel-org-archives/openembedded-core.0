Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQQhW-0002lL-Bt
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 00:10:10 +0200
Received: by laai10 with SMTP id i10so1666460laa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 15:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=t14NDmFIy9cYuxEmx816BszUJRmTeXkzBrwixWw5InM=;
	b=YidT993jzU5U8m4wnu8i9tc1N857nvtLh+sJr2QFpLPmuBJ3o9UMaCUXphX5p5K+X7
	1P6FnXet2mbOng1FWMv2IINph8v3Vc8rY5LKbQ2oSc7sy0TTzmJo/hyMsxoEon5bO6AG
	GJ1N7kBlxqUPo5C8tVStcKmX2keAP65shsSVaPT72k8rMpRHgAns1IxzqUvlHzlHxlxj
	vbzBqb/DkrTo9jx8oa767qkRcMOf/70aI47d4SlBBGwbsDuqVC8m4+/55naObQOE8dTB
	Rf6YqMMO7Llhb9MeNvVY8jyp23ZazgnBiPVL4Yr+CZnjSObZJpyaUYI3V07egy+HvYEy
	nuBA==
Received: by 10.112.86.101 with SMTP id o5mr3691498lbz.1.1336168823152; Fri,
	04 May 2012 15:00:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 14:59:52 -0700 (PDT)
In-Reply-To: <CAF6bG8djbQrRN5RoSPTdTha50qqEOp=CTxFk-AzWcprTvzO9+A@mail.gmail.com>
References: <CAF6bG8djbQrRN5RoSPTdTha50qqEOp=CTxFk-AzWcprTvzO9+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 14:59:52 -0700
Message-ID: <CAMKF1sr3__=2kd6UneGYb4-QyO7+J3-ATtkJUbbjA7NsGFsFjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting nonexistent files from debian.org not erroring but saving html-page as destination file, Was: [Patch] Update dpkg to one available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 22:10:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2012 at 12:49 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 4 May 2012 19:06, Saul Wold <sgw@linux.intel.com> wrote:
>> On 05/04/2012 04:29 AM, Marko Lindqvist wrote:
>>>
>>> =C2=A0I'm trying to make my first openembedded-core build. That failed =
due
>>> to dpkg-1.15.8.5 being not available for download any more.
>>>
>> This should be still available on our MIRROR.
>

Saul

actually with OE-Core I also hit similar problem and we need this patch

http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/misc=
&id=3D044dd59a6288064d7325a93684660443340c2460


