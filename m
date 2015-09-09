Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 967577423D;
	Wed,  9 Sep 2015 15:14:59 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so106950732igb.0;
	Wed, 09 Sep 2015 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ZmRFG1J9VNy1iZ+doJCVXKegXsPvSbs4p2PQsD2qjbo=;
	b=DeIVxQtItWc2IlA19o9XCLV2yZtWEkSS0UCoz2uP9CjGISGzSKXhZvWJEcbRpHD0W1
	vv2W/qjPgumLHdTzLPuDCbyjs17Ga1C7Vgpu5OEkSQtuu6dNLtGNuuosNYEf1Cue/XQZ
	sgaSKznfVaJAzunMTYRi4kIsRh/Z2CAjPL0WJ8RhsTr8iNVVuZBMOJY703sIM7gYmPgA
	2gCFduIO/kytM6VBw/+Pfr58MzpuRKVhjKyZNpoTo/mC936QV2efb1N1Z7fYDnyof3QJ
	3+TQSYPtTRvLdSY4Ox+q9En8RVYxM9I6U94tR5zv1G4UnBLw7Z2yEjJe6A3QZBGHyfrO
	fS5Q==
MIME-Version: 1.0
X-Received: by 10.50.43.193 with SMTP id y1mr49586003igl.64.1441811699356;
	Wed, 09 Sep 2015 08:14:59 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 9 Sep 2015 08:14:59 -0700 (PDT)
In-Reply-To: <20150909145531.GA2390@jama>
References: <20150908155801.GD2381@jama> <20150908170942.GE2381@jama>
	<CALbNGRQYuQrGc_3Bf0y5CVXHHb3uFDVaLgPcfeAKYCau7X1u2g@mail.gmail.com>
	<20150908231037.GH2381@jama>
	<CALbNGRTUBBBni8YGkpVx4=HQ97Lz8PzmZo129efUteXhYbEvFQ@mail.gmail.com>
	<20150909145531.GA2390@jama>
Date: Wed, 9 Sep 2015 17:14:59 +0200
Message-ID: <CALbNGRQ9px7rNf_uYdyynHcDAHHDr-vBbh0y8SAObnMcARbORA@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Sep 2015 15:15:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2015 at 4:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Sep 09, 2015 at 09:14:20AM +0200, Andreas M=C3=BCller wrote:
>> On Wed, Sep 9, 2015 at 1:10 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > On Tue, Sep 08, 2015 at 11:39:20PM +0200, Andreas M=C3=BCller wrote:
>> >> On Tue, Sep 8, 2015 at 7:09 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>> >> > ERROR: polkit-group-rule-datetime different signature for task do_c=
onfigure.sigdata between qemux86copy and qemuarm
>> >> > runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_p=
atch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.=
do_populate_sysroot:virtual:native'] to ['polkitpolkit-group-rule-datetime.=
bb.do_patch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.=
2.1.bb.do_populate_sysroot:virtual:native']
>> >> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-e=
xtended/polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea72=
3c466e0c5c88a09a50
>> >> I missed many of these - because I am not up to date on oe-core (did
>> >> not want to loose midori for my images) - will change that soon. For
>> >> this type of error: is it correct that it is caused by allarch recipe=
s
>> >> depending on machine/architecture specific recipes?
>> >
>> > close, the important part is few lines bellow:
>> >
>> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exte=
nded/polkit/polkit_0.113.bb.do_populate_sysroot
>> > with hash
>> > 284d6bbd28ea723c466e0c5c88a09a50
>> >  changed to
>> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exte=
nded/polkit/polkit_0.113.bb.do_populate_sysroot
>> > with hash
>> > 06cf7139c6588d047fa11444d88175ab
>> > Hash for dependent task polkitpolkit_0.113.bb.do_populate_sysroot
>> > changed from 284d6bbd28ea723c466e0c5c88a09a50 to
>> > 06cf7139c6588d047fa11444d88175ab
>> >
>> > so allarch recipe polkitpolkit-group-rule-datetime is depending on
>> > TUNE_PKGARCH-specific recipe polkit (on it's do_populate_sysroot task
>> > which is expected to be different for diferent TUNE_PKGARCHs)
>> >
>> So to fix we could
>>
>> 1. either remove dependencies or
>> 2. remove allarch or
>> 3. ??
>
> 3a) add such dependency to SIGGEN_EXCLUDERECIPES_ABISAFE if it's
> completely ABI safe (recipes depending on it shouldn't get rebuild after
> any changes to it)
> 3b) add such dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS to exclude it
> only for given recipe (in this case by saying that polkit-groups doesn't
> need rebuild when polkit recipe is changed in any way)
>
>> For e.g the polkit-groups 1 seems not possible what about package
>> feeds when removing allarch?
>
> I think in this case 3a) and 3b) don't apply as well, so easiest and
> safest option is 2), package feeds should survive that, because new
> package will have higher version (when PRserv is used) and also higher
> package arch priority (all is lowest). Even the sysroot should now
> survive ok, with new functionality which "uninstalls" staged file for
> unreachable stamps.
>
> Also polkit-groups build doesn't take very long, so we don't mind to
> build it once per TUNE_PKGARCH instead of building it as allarch only
> once but with unsafe deps.
>
Thanks a lot and I agree with removing allarch for this case. Hope I
have the courage to update oe-core this weekend :)

Ah - one further question for tests: The allarch signature change is
detected only when building multiple machines - correct?

Andreas

