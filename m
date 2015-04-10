Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1A33A605F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 05:18:06 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so10714566pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=wmIJ/slOdDm8UI+6siU0CiwNr4ASHkmc9uIEf8fBD0I=;
	b=ZYUXvde6aOYr5LbUij+6Su+UyKZXpxUB0Tz751qq3t011KvdqRg1Bl/rz8hzlYdcbi
	EsNixvRTN1j41llfVlWbWweqmzoEDJ2IbkyTpJZtY0+CnxY+lX+8H6ZDQtD/e3WwlXAv
	iIh+h6y2Ftoy+qejh3GhWYzaZQMPjvMYJzJGBET6k2zpJD7cI82hjKC+M0S7a/C5i/QS
	3lVPK+dp/VjCcVZQ6E/+gUKQ1t4m1dt3A6TmGWtPzz86DLPKeGV+eEo57YrzV6MrDpNa
	nNQUq5EjxT8WKFxNcgCa0XulriUMhQHJHLgzec4mvKKmB/iJ+O8CJUQmq4lrRFpXF1Xf
	IyFA==
X-Received: by 10.68.135.4 with SMTP id po4mr22642330pbb.12.1428643087989;
	Thu, 09 Apr 2015 22:18:07 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:4cec:29d1:bda8:6611?
	([2601:9:3580:84c:4cec:29d1:bda8:6611])
	by mx.google.com with ESMTPSA id f1sm772343pds.62.2015.04.09.22.18.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 22:18:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428574981.6976.7.camel@linuxfoundation.org>
Date: Thu, 9 Apr 2015 22:18:05 -0700
Message-Id: <6452ADE7-BA02-4AA5-8B77-677E86788DDD@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
	<fe627d2aeef3ed39caa98f73942c0f23ff2bf825.1428341478.git.raj.khem@gmail.com>
	<1428574981.6976.7.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/24] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Fri, 10 Apr 2015 05:18:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 9, 2015, at 3:23 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
>> use static storage class instead of extern for inline functions
>> and remove duplicate definitions as a result
>=20
> This says what this does but not why. Upstream-Status is also missing.
>=20

Fair enough, I have added some documentation in patch header and updated =
the patch on contrib branch here

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D815e7fc68563013749b5be4da6c137e7d3677308=

