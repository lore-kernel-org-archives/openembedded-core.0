Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGviu-00088V-Sm
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 19:48:36 +0200
Received: by wgbdq11 with SMTP id dq11so605972wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:mime-version
	:in-reply-to:references:date:delivered-to:message-id:subject:from:to
	:content-type; bh=6u+EfEuQBSIRs26LAKHKviQ7/TIO2443120bncd+R8I=;
	b=FM8oMUfR4UeuDzKClyLosvQY8xxPLRD6tqaRajDFZefYA68bThLFas3GfNUe1VyIqS
	RCiCVt8n++V3dxaVgdCxPmEjvAive6/eXqlQ9eHmkcgt0P+R7V0KFd5qF9BHyc8EWzVj
	gPEMvTGaq7Cgd3XUm4UoiSLCnuYowyv48JKvQM1N5wj5pz3vBaadcNyhkqstEz53LH4h
	LvZ+FpCJ34y3PjIGicBj7HlFyeNOYTOVhjNqylelKgjTZTkoXHU/G3r8iBbCVQoVCUhj
	h0S3FFdSlL1giuIrYFklg8yCBL+TKD+5asopwqas69L5hxXeuH4n+1ScZsXF6KNjx1nl
	h14Q==
Received: by 10.216.136.157 with SMTP id w29mr28949wei.148.1348680943192;
	Wed, 26 Sep 2012 10:35:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm33480719wib.0.2012.09.26.10.35.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 10:35:42 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 26 Sep 2012 19:35:50 +0200
Resent-Message-ID: <20120926173550.GA19337@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Received: by 10.64.49.71 with HTTP; Mon, 24 Sep 2012 03:52:16 -0700 (PDT)
In-Reply-To: <1348483380.8662.2.camel@ted>
References: <20120921112144.GE10268@jama.jama.net>
	<1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
	<1348333994-18026-2-git-send-email-Martin.Jansa@gmail.com>
	<1348482003.4654.12.camel@ted>
	<CA+chaQd0psd_sPVnixVH_e6RAO_5jqrj-5=S5cnd4rG+2rhwCA@mail.gmail.com>
	<1348483380.8662.2.camel@ted>
Date: Mon, 24 Sep 2012 12:52:16 +0200
Message-ID: <CA+chaQdYkLRac9-yaH7TThO-ALgHaUOB7=3WdrG9CL+U4SfkRA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Wed, 26 Sep 2012 17:48:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 12:43 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-09-24 at 12:26 +0200, Martin Jansa wrote:
>> On Mon, Sep 24, 2012 at 12:20 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Sat, 2012-09-22 at 19:13 +0200, Martin Jansa wrote:
>> >> * it doesn't make much sense with PV, because xserver-xorg-module-exa
>> >>   was introduced in
>> >>   http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver?id=1a666ee1cda3c0b74daba5881fc5f62e13deec66
>> >>   so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<= 1.11.2-r4)
>> >>   and (< 1.11.2) is not good enough
>> >>
>> >> * because we don't know how many PRINC are in BSP/DISTRO layers,
>> >>   then it's safer to RCONFLICTS with every older version then current
>> >>   EXTENDPKGV
>> >>
>> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >>
>> >> --
>> >>
>> >> * I haven't really tested this with IPK, since it was changed from
>> >>   RREPLACES to RCONFLICTS (because of RPM) and all my installed devices
>> >>   are already upgraded
>> >> ---
>> >>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> >> index 33f59fe..7513399 100644
>> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> >> @@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
>> >>
>> >>  RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>> >>  RDEPENDS_${PN}-xvfb += "xkeyboard-config"
>> >> -RCONFLICTS_${PN}-module-exa = "${PN} (< ${PV})"
>> >> +RCONFLICTS_${PN}-module-exa = "${PN} (< ${EXTENDPKGV})"
>> >>
>> >>  FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
>> >>  FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
>> >
>> > The original patch and this patch are wrong, this value should not be
>> > "floating". It should be spelt out explicitly so it doesn't change with
>> > the recipe version in future.:
>> >
>> > RCONFLICTS_${PN}-module-exa = "${PN} (< 1.11.2-r4)"
>>
>> So every layer with PRINC in xserver-xorg needs to add
>> RCONFLICTS_${PN}-module-exa = "${PN} (<
>> 1.11.2-rTHEIR_PR_AT_THE_TIME_OF_CHANGE) ?
>> What if there is more layers then one with PRINC and they don't know
>> about each other?
>
> There is a problem there, yes and we're on uncharted territory here. If
> people were using the PR service rather that trying to force package
> management problems into the core we wouldn't have this kind of problem.
>
> As a solution, how about appending something to PV? I don't like it but
> an artificial PV step should "resolve" this.

Why not RCONFLICT with every older version then current?

It's true that e.g. 1.11.2-r8 does not really conflict with 1.11.2-r7
(but r4 in most cases), but that should work.


