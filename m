Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDC3763CE;
	Wed,  9 Sep 2015 07:14:20 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so97765904igb.0;
	Wed, 09 Sep 2015 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=osVKaHJEaLFROP/dPYQp/8dbu+pgUHyWxSzTumJR2Vk=;
	b=pYC2KT1hyr+7w7obbw/q7BYKNBdhoOOL9DJmGA4yY3sPBfqY/vkVjUg6gMW150Y1Km
	96p/guyUCxNYLBlyNvCwKe79jK8KhoQ5vjGRQi0SSum1LjVnzZM3Gqhjk8EAHQ0hYxfr
	oaAPl+W9LEbDNqWTXTaGnAh+lSEclGKC82ULUOTEwDAvPVo/sA/e1RjuzLMCnCeY4b/+
	plbB373prm+1+8+hdgVFUbF1ckIG/fGBF0OYXSBhg2TuBP14rvFM4m59/9VunMUE7tZB
	EyxsDDKzjGS3AzNMVanbYePb47gj0uaR5lEnsSHm+ksXxpJeOfkByNSe2/5uYD61F8Zf
	0yMg==
MIME-Version: 1.0
X-Received: by 10.50.43.161 with SMTP id x1mr28671147igl.64.1441782860692;
	Wed, 09 Sep 2015 00:14:20 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 9 Sep 2015 00:14:20 -0700 (PDT)
In-Reply-To: <20150908231037.GH2381@jama>
References: <20150908155801.GD2381@jama> <20150908170942.GE2381@jama>
	<CALbNGRQYuQrGc_3Bf0y5CVXHHb3uFDVaLgPcfeAKYCau7X1u2g@mail.gmail.com>
	<20150908231037.GH2381@jama>
Date: Wed, 9 Sep 2015 09:14:20 +0200
Message-ID: <CALbNGRTUBBBni8YGkpVx4=HQ97Lz8PzmZo129efUteXhYbEvFQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, wrong PACKAGE_ARCHs 2015-09-08
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
X-List-Received-Date: Wed, 09 Sep 2015 07:14:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2015 at 1:10 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Sep 08, 2015 at 11:39:20PM +0200, Andreas M=C3=BCller wrote:
>> On Tue, Sep 8, 2015 at 7:09 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > ERROR: polkit-group-rule-datetime different signature for task do_conf=
igure.sigdata between qemux86copy and qemuarm
>> > runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_patc=
h', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.do_=
populate_sysroot:virtual:native'] to ['polkitpolkit-group-rule-datetime.bb.=
do_patch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1=
.bb.do_populate_sysroot:virtual:native']
>> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exte=
nded/polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea723c4=
66e0c5c88a09a50
>> I missed many of these - because I am not up to date on oe-core (did
>> not want to loose midori for my images) - will change that soon. For
>> this type of error: is it correct that it is caused by allarch recipes
>> depending on machine/architecture specific recipes?
>
> close, the important part is few lines bellow:
>
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/polkit/polkit_0.113.bb.do_populate_sysroot
> with hash
> 284d6bbd28ea723c466e0c5c88a09a50
>  changed to
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/polkit/polkit_0.113.bb.do_populate_sysroot
> with hash
> 06cf7139c6588d047fa11444d88175ab
> Hash for dependent task polkitpolkit_0.113.bb.do_populate_sysroot
> changed from 284d6bbd28ea723c466e0c5c88a09a50 to
> 06cf7139c6588d047fa11444d88175ab
>
> so allarch recipe polkitpolkit-group-rule-datetime is depending on
> TUNE_PKGARCH-specific recipe polkit (on it's do_populate_sysroot task
> which is expected to be different for diferent TUNE_PKGARCHs)
>
So to fix we could

1. either remove dependencies or
2. remove allarch or
3. ??

For e.g the polkit-groups 1 seems not possible what about package
feeds when removing allarch?

Andreas

