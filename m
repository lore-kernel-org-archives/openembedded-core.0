Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UB6hX-0005QR-Fi; Thu, 28 Feb 2013 17:51:24 +0100
Received: by mail-vb0-f50.google.com with SMTP id ft2so208615vbb.37
	for <multiple recipients>; Thu, 28 Feb 2013 08:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dk6l/P3zzukxtCTUG2dxSuUGLAgg+isOg3OSfrHq0Mw=;
	b=jN4YYYkiiDcXZ0zCg3jrKQRAjQvQohKuYRijqIJPetMkCzMAyAQc9tgXUe6Z91HZ+P
	SdQDeMeBJ01xqTNlmWJSpCSlGGpfhpBgEZ86iDZ8ShLVNcPUdMSWQkb79vE85o2xF0wh
	Bj/c5acVubUqAGVv68hTrI7dLf+Cf9gs6vc/vBaNOI9Imv3xdkSyNoAiaS56CElnMhPt
	msOa6366U9tgBktg9DHSBdsVxfDb4mUx2GoDzqCRvkBVkr8wn4Z7DWjLBGVvfJmlQYWu
	t2OIY8fIhiXfCpVCtTJs8JjYZJRzgxjYSFUYGEx1CAVi2U7XHE7rB7oXT4jhonx+KVf/
	Sp2A==
MIME-Version: 1.0
X-Received: by 10.220.227.131 with SMTP id ja3mr1314603vcb.54.1362069300788;
	Thu, 28 Feb 2013 08:35:00 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Thu, 28 Feb 2013 08:35:00 -0800 (PST)
In-Reply-To: <20130228092539.GF8208@jama.dyndns-home.com>
References: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
	<20130228092539.GF8208@jama.dyndns-home.com>
Date: Thu, 28 Feb 2013 17:35:00 +0100
Message-ID: <CALbNGRQHkAsWLS13LrJWju+QdsUZnmjorsHYin+_7t8Pw8+SSg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: OE TSC minutes 12 February 2013
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 16:51:42 -0000
X-List-Received-Date: Thu, 28 Feb 2013 16:51:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 28, 2013 at 10:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I can explain some bits on this one.
>
> The main difference between xserver-nodm-init is not in this recipe
> itself but in stuff it's using to get things done:
> meta-oe version: xserver-common (includes settings for many MACHINEs),
> integrates with xinput-calibrator
>
> oe-core version: x11-common (uses formfactor to read MACHINE support,
> xinput-calibrator not used and not available in oe-core
>
> xinput-calibrator is now being reworked by Andreas

On Thu, Feb 28, 2013 at 5:16 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Thanks! Glad I don't have to dish out any beatings. ;)

Afraid of getting new beatings-canditate: Need a bit time on other
issues before I can taking care for xinput-calibrator :)

Andreas


