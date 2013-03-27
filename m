Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UKlyD-00005T-VJ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 09:44:34 +0100
Received: by mail-ve0-f169.google.com with SMTP id d10so3139384vea.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=o7gb3bx0Hi0e4cY3j03vGh+qxXXFTCVP0buzHyKCZkg=;
	b=AKrknnqkTQ9DYWAXAszGdMveGWW0XvqqDJPytC5/IySQVynAF5GAvXw81uznk88EtG
	ReY/tpCf/Fm4M1hgdirKdFs4dlZxsnxD7xtEQZcnzBGS+/RvGT8jvNvYW5tcX/vlBf/f
	50cbE6KJuOFmoqfxsjNN7Nxcb0s3iEJzxMSHNEyiywDIYdwwjTgQQkxo75MRky6TcFJQ
	090Ec8YJK3Kz5L5RpR9+NgOAV3KN2+D3Ree4wy6sCTuwkt8TZMUrYm19IorsLin0tuMj
	W5oHtfhvtGLur7C49//X8Z8S3enKPmnyrAbA8U9zA1Fbv93busVYfiEXtIDUDCgH+0Do
	h+Ww==
MIME-Version: 1.0
X-Received: by 10.220.177.138 with SMTP id bi10mr18051310vcb.31.1364372852805; 
	Wed, 27 Mar 2013 01:27:32 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 27 Mar 2013 01:27:32 -0700 (PDT)
In-Reply-To: <CALbNGRQE4kGAmeXQ2TqfVqb4rFkQeQJua6COxBEvQNh-FbAKSg@mail.gmail.com>
References: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
	<CALbNGRQVd3yi7bEuCO_Yyh_RVnnfcB0k9yMG3jHg_BCF9=2Reg@mail.gmail.com>
	<1364298513.3097.75.camel@ted>
	<CALbNGRSvGR75F4-bg123eQhTFaM_ex9Rs=Hyo2-Y6o8m2v9w0Q@mail.gmail.com>
	<1364340556.28471.2.camel@ted>
	<CALbNGRQE4kGAmeXQ2TqfVqb4rFkQeQJua6COxBEvQNh-FbAKSg@mail.gmail.com>
Date: Wed, 27 Mar 2013 09:27:32 +0100
Message-ID: <CALbNGRTq6A9RoAdyHXeun_vhmsgEyRgV8wSY+xCdRsS7-BdPJA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
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
X-List-Received-Date: Wed, 27 Mar 2013 08:44:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2013 at 8:56 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Mar 27, 2013 at 12:29 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2013-03-26 at 15:28 +0100, Andreas M=C3=BCller wrote:
>>> On Tue, Mar 26, 2013 at 12:48 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> > On Tue, 2013-03-26 at 12:40 +0100, Andreas M=C3=BCller wrote:
>>> >> On Tue, Mar 26, 2013 at 11:32 AM, Burton, Ross <ross.burton@intel.co=
m> wrote:
>>> >> > On 25 March 2013 23:47, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com> wrote:
>>> >> >> fixes:
>>> >> >> | ERROR: Multiple .bb files are due to be built which each provid=
e virtual/gtk-update-icon-cache-native
>>> >> >> | (/home/Superandy/data/oe-core/sources/openembedded-core/meta/re=
cipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
>>> >> >> | virtual:native:/home/Superandy/data/oe-core/sources/openembedde=
d-core/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb).
>>> >> >> | This usually means one provides something the other doesn't and=
 should.
>>> >> >
>>> >> > NACK.
>>> >> >
>>> >> > The only way this can happen is if something is depending on
>>> >> > gtk+-native, as everything in oe-core (should) depends on
>>> >> > virtual/gtk-update-icon-cache:
>>> >> >
>>> >> > commit f07515096ea39e267cd3ebeea08cffbba1af07e0
>>> >> > Author: Ross Burton <ross.burton@intel.com>
>>> >> > Date:   Mon Mar 4 12:52:45 2013 +0000
>>> >> >
>>> >> >     default-providers: add default virtual provider for gtk-update=
-icon-cache
>>> >> >
>>> >> >     Use a virtual provider instead of a hard dependency so that if
>>> >> > gtk+-native is
>>> >> >     required in some configuration, this provider can be changed a=
nd then
>>> >> >     gtk+-native and gtk-update-icon-cache-native won't be both bui=
lt
>>> >> > and conflict in
>>> >> >     the sysroot.
>>> >> >
>>> >> > Presumably some application you've got is explicitly depending on
>>> >> > gtk+-native, probably for the icon cache handling.  It should drop
>>> >> > that build dependency and use the class instead.
>>> >> >
>>> >> > Your fix "works" but will cause file overwrite warnings in sysroot
>>> >> > when you actually do want a gtk+-native, for example if you do wan=
t to
>>> >> > build a native gtk+ application or some reason.
>>> >> >
>>> >> > Ross
>>> >> Why do we need two providers which need pinning doing exactly the sa=
me?
>>> >
>>> > I'd love to remove gtk+-native.
>>> >
>>> > The icon-cache-native gives about a 5% build speedup as it has a lot
>>> > less dependencies than gtk+-native so it is a good thing. We could fi=
x
>>> > things to coexist however unless there is a good reason to keep gtk
>>> > +-native around, we should switch things over. Things were therefore
>>> > left like this to provide gentle pressure to layers that are still us=
ing
>>> > gtk+-native.
>>> >
>>> > If there are valid cases where gtk+-native is still necessary we can
>>> > revisit this but we're not aware of any right now.
>>> >
>>> > Cheers,
>>> >
>>> > Richard
>>> The patch I sent was the attempt to take the first step for
>>> gtk-update-icon-cache-native.
>>> What I see from the tests is that there is no fallout using build time
>>> optimized gtk-update-icon-cache-native based on gtk3. There is no need
>>> for alternate providers here. OK the patch didn't replace
>>> virtual/gtk-update-icon-cache-native by gtk-update-icon-cache-native -
>>> but I could send V2 if the direction is agreed.
>>
>> So to be clear you're saying we don't need gtk+-native for any user
>> you're aware of? Can we remove the BBCLASSEXTEND for native in that
>> case?
>>
>>> If I remember correct there are other gtk-native parts used by the
>>> offline image creation. I don't know what we can replace by optimized
>>> native recipes (based on gtk3).
>>
>> I don't think any of the offline image pieces are using gtk+-native any
>> more...
>>
>> Cheers,
>>
>> Richard
> I will repeat my tests with complete remove of gtk+- native extension.
> If it works I will send a patch - otherwise drop a note.
>
In my environment I found the following references on gtk+-native:

meta-browser: chromium
openembedded-core: packagegroup-toolset-native
openembedded-core: sstate.bbclass
openembedded-core: seperatebuilddir.inc

I have no idea what the oe-core part is for. Since chromium never
built for me: Could the meta-browser friends check which part of
gtk+-native is required - or if replacing gtk+-native by
gtk-update-icon-cache-native is enough?

Andreas


