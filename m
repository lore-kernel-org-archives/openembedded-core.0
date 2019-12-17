Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id A62206BA11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 15:05:34 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id b19so3255370wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 07:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ZBhIQs/EPmWDeE3td3dxUsRg2X10TYWX+gKXOR26iDQ=;
	b=DYZoQ3AyCDlUCU2zBs7g09IuK705jTQWEhuAvBf6fP+T3UU8LUZgubziZkrFpqVqCX
	PJKACgpjfZpMjQIf/nC+gkmPqWf3Uat8UWSLBHZvZuxGci9X3NfEFOQ/2MaJ6WzsaQ+m
	tex2OJIpjIDF0eaMMKRoqvDt4viMpzsD9UM/6LKpdMBwgND5XODXH9bZ+XNh9e9oR+bX
	uunLFPoiGhz50STfuO71gAptDokKNyk/Z+laQ8b4y/AP13uoO+/u7YciWE4c8dzSqDKm
	6gix8fMhnSnhASYSaYuLLdiiTlQ+yEwab4luRzbUFL4yw1/dupdyloNhSr1fOihUQ1Cf
	s1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ZBhIQs/EPmWDeE3td3dxUsRg2X10TYWX+gKXOR26iDQ=;
	b=KbGcjq0H9+khytMMtnKF6ihTGPbU5/gqshAyp6L2hWIGsOMZd7QHeQzWTzxj3Xte2p
	YapXaR1GmDngiqSy7yksL1YP40vKN32cJKBMtlaYsMpwFJDDFdSUxRobZXu1bEDBAhN/
	gd/hBMAOM7sObRZUA1pyG1ubdYU5rZqaHi5/gfEwFd8nczjOtRONBnFYNeCh1ewDPuP9
	eAlzYM7AaKyQYXOiYO46pW01Vaz4qKVS4DmGbgLgey2uI34STtd94P9ALT/QsYrEB6fa
	/iB9d/n7oknErHQKQAD7B9mTuOXSWe+WhfVLZz0Ss7DS2q9bHV/H3hXNmACsQd+UHNH3
	I76g==
X-Gm-Message-State: APjAAAUOZf0hKK98/e92+PYfZ0AB3V/09+f6+PEfnKSXHTZmsyvIKbJb
	mQUm4Q5htGUzHBwi0kkKQ0A/+Qp+
X-Google-Smtp-Source: APXvYqzFfBzJn/4NByiWr9iuqvdZ2KQGJFXz13XxltbI32m7pWACnjgTVSZnpCt06TPY1UdeOu2nkw==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr5775195wma.72.1576595134534; 
	Tue, 17 Dec 2019 07:05:34 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	b16sm26314190wrj.23.2019.12.17.07.05.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 07:05:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Dec 2019 16:05:32 +0100
To: tsc@openembedded.org
Message-ID: <20191217150532.zsonh4qrwlooxglq@jama>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: OpenEmbedded TSC Meeting Minutes 2019-12-16
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
X-List-Received-Date: Tue, 17 Dec 2019 15:05:35 -0000
X-Groupsio-MsgNum: 132623
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m44zzhcasbjg4a6t"
Content-Disposition: inline

--m44zzhcasbjg4a6t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

OpenEmbedded Technical Steering Committee (TSC) Meeting Minutes 2019-12-17
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Meeting was held in #oe-tsc on Freenode; channel access public.

Present:
- Richard Purdie (RP)
- Joshua Watt (JPEW)
- Martin Jansa (JaMa)
- Bruce Ashfield (zeddii)
- Paul Eggleton (bluelightning)

Summary:
- reproducible builds, hashequiv and security-flags will be enabled
  in default nodistro builds
- nobody really likes using new SPDX indentifiers in LICENSE variables
  but we still might be interested to do that

Full meeting log
----------------
16:33 < JPEW> Reminder: TSC meeting today at 10PM UTC
16:38 <+RP> JPEW: Paul won't be able to make it unfortunately
16:38 <+RP> JPEW: did we have agenda items?
16:38 < JPEW> RP: None on the wiki
23:00  * RP is here FWIW
23:01 <+RP> I actually rushed back as I've been without the computer for a =
few hours
23:01 < zeddii> I'm willing to dial in!
23:01 <+RP> zeddii: its irc based here isn't it?
23:02 < zeddii> oh.
23:02 < zeddii> right
23:02  * zeddii takes off his corporate hat
23:02 < JPEW> Is there anything to discuss?
23:02 <+RP> zeddii: I kind of prefer calls now but I can see the pros/cons
23:02 <+RP> I guess one topic is defaults for nodistro in OE-Core
23:03  * JaMa waves
23:03 <+RP> and there is the removal discussion re: the layer index. We don=
't have a specific proposal to consider
23:04 <+RP> Unfortunately Paul can't make it today due to holiday commitmen=
ts :(
23:04 < zeddii> was the supported build host question more of a yocto discu=
ssion ?
23:04 <+RP> Since we have four of us, I would like to solcit opinions on re=
producible builds by default for no distro and hash equiv by default
23:05 <+RP> zeddii: yes, although we could consider that from a general OE =
standpoint too
23:05 < JaMa> There was also OE-TSC mentioned in meta-python2 thread http:/=
/lists.openembedded.org/pipermail/openembedded-devel/2019-December/203383.h=
tml but the discussion stalled and it's not clear if we need to make some d=
ecision or not
23:06 <+RP> JaMa: From my memories of that thread I think its also unclear
23:07 <+RP> So, first question - should nodistro have reproducible builds e=
nabled by default? Any strong opinions?
23:07 <+RP> I'd highlight that enabling it makes hashequiv more effective
23:07 < JPEW> RP: Ya, If we do hashequiv by default, that reproducible shou=
ld also be by default
23:07 <+RP> and Poky is now doing this by default. In many ways I think it =
makes sense as a default for all users out the box
23:07 < JaMa> I think yes, we should enable as much "useful-to-have" option=
s in nodistro config as possible
23:08 <+RP> It also reduces support load in some ways as we can assume that=
 configuration on the most part
23:08 < zeddii> agreed
23:08 <+RP> ok, that sounds like we're all in agreement :)
23:08 <+RP> Second question - local hash equiv server on by default?
23:09 <+RP> I'd also propose yes. Its the future and we want people using it
23:09 < zeddii> I=E2=80=99d agree with that. to get mileage on it, it needs=
 to be opt-out .. or things will linger forever.
23:09 <+RP> In local mode its fairly useful/stable now. We're seeing some i=
ssues on a 40 worker setup with a common server on the autobuilder which is=
n't a default use
23:10 <+RP> I'd really like to have a standard config we have people using =
so people use what we test
23:10 < JPEW> RP: Agreed
23:10 <+RP> Having it "in staging" in -next was half killing me
23:10 < JaMa> I've enabled it for most of my local builds last week and hav=
en't seen any significant difference (for better or worse), I agree it's fu=
ture and should be enabled by default (to get better test coverage by every=
body)
23:11 <+RP> Obviously people can configure these things out, its the defaul=
t we're talking about
23:11 < JPEW> Are the AB builds that khem does nodistro?
23:11 <+RP> That sounds like an agreement. I will look into patches and pro=
pose them. Its just helpful to have a general guidance for it
23:13 <+RP> JPEW: no, they use poky
23:13 <+RP> we do run a nodistro test build there
23:13 <+RP> but not for meta-oe
23:13 < JPEW> RP: OK
23:13 <+RP> How much of OE we can test on the autobuilder remains to be see=
n...
23:14 < JPEW> RP: Ya fair enough, I was just curious
23:14 <+RP> With SWAT disbanded and only a small number of people working o=
n fixing the autobuilder issues that come up we have real challenges with t=
he build failures we have
23:15 <+RP> Its a YP issue but ideas very welcome on how to improve things =
as it obviously affects OE too
23:15 -!- bluelightning [~paul@pdpc/supporter/professional/bluelightning] h=
as joined #oe-tsc
23:15 <+RP> bluelightning: hi, I thought you weren't here!
23:16 < bluelightning> RP: people are still packing for our trip, I thought=
 I'd check in :)
23:16 < JPEW> I forgot to ask, is anyone recording this?
23:16 <+RP> JPEW: I have logs
23:16 < JaMa> I have logs as well
23:16 < JPEW> Ok
23:16 <+RP> bluelightning: quick summary, we decided nodistro should defaul=
t to hashequiv and repro builds
23:17 < bluelightning> RP: ok, sounds reasonable
23:17 <+RP> any of the other topics anyone wants to discuss?
23:17 < JaMa> RP: what about security_flags.inc? I thought it's already inc=
luded by default, but seems it isn't
23:17 <+RP> JaMa: I'd love to include it too and reduce the delta
23:18 < JPEW> Are there specific reasons it isn't?
23:18 <+RP> poky and the autobuilder has long tested these things so the co=
re should be ok. Other layers may run into issues, but, I think its probabl=
y time to sort this out
23:19 < bluelightning> took a while to get things to build well with it IIR=
C, that was a long time ago though
23:19 < JaMa> nodistro tests of meta-oe and other layers were IIRC also inc=
luding this for a while, so shouldn't be terrible
23:19 <+RP> JPEW: Its easy for me to decide to push something into poky, ch=
anging nodistro traditionally causes much more friction
23:19 < JaMa> my world builds still include it as well
23:19 <+RP> JaMa: given that I think its a sign we should make it the defau=
lt then
23:19 <+RP> JPEW: those flags can increase the binary size a bit iirc
23:22 < JaMa> just for record, the tags we agreed on last meeting for bitba=
ke and openembedded-core repo were pushed today
23:22 <+RP> So, we also add security flags to nodistro?
23:22 <+RP> JaMa: thanks for sorting that out and sorry for the delay! :)
23:22 < JaMa> I vote yes for security flags
23:22 < JPEW> Yes, I think that makes sense
23:24 <+RP> I did just think of a thorny topic - SPDX license identifiers
23:24 <+RP> I keep trying to forget about this one :/
23:25 < JaMa> adding them to files or changing the values in LICENSE variab=
les?
23:25 <+RP> Do we switch the LICENSE field to use the SPDX identifier?
23:26 <+RP> JaMa: As a general policy I think we're moving to add the licen=
se identifier field in code rather than the old license boilerplate which g=
ets corrupted/outdated
23:26 < JaMa> I don't have strong opinion about this one, we're still deali=
ng with a lot of packages which just say "LGPL" :(
23:26 <+RP> the LICENSE field one I'm torn on. I like our IDs and SPDX has =
changed at least once
23:26 < JPEW> I actually already though they were supposed to be SPDX
23:27 <+RP> JPEW: We have GPLv2, SPDX is GPL-2.0-only
23:27 <+RP> or GPL-2.0-or-later
23:28 <+RP> (instead of our GPLv2+)
23:28 < JaMa> RP: the maping between these will still be enabled, just the =
value in migrated recipes will prefer to be the "canonical" form?
23:28 < JPEW> RP: Ah, right. I recall that now.
23:28 <+RP> JaMa: no doubt we'd still have to have the mappings
23:28 <+RP> As I said, I'm torn on this one
23:29 <+RP> but SPDX is effectively the standard
23:29 < bluelightning> I'm not terribly keen FWIW
23:29 < JaMa> sounds like more work than gain, but I guess most of the reci=
pes can be "migrated" with simple sed calls
23:29  * bluelightning -> out
23:29 < bluelightning> bye all
23:29 <+RP> bluelightning: safe travels!
23:29 < JaMa> bb bluelightning=20
23:30 < JPEW> What is the advantage to using SPDX?
23:30 -!- bluelightning [~paul@pdpc/supporter/professional/bluelightning] h=
as quit [Quit: Konversation terminated!!!111]
23:30 < JaMa> brb daughter is crying
23:30 <+RP> JPEW: ultimately the code license headers would match the licen=
se field and there would be only one value consistently
23:30 <+RP> shows support around the standard too
23:31 <+RP> JPEW: in general I'm  in favour of supporting SPDX if/where we =
can
23:32 <+RP> license handling is something we need to do better at and is a =
potential selling point of the project
23:32 <+RP> we don't need to make a decision on this one today but it is so=
mething to think about as OE could do with showing some leadership IMO arou=
nd licensing
23:32 < JaMa> as long as it's not mandatory and doesn't need all recipes to=
 be changed at the same time I'm not against it
23:33 < JPEW> Is is even possible to make it some sort of rolling change?
23:33 <+RP> JPEW: yes, we mainly need to decide if we're aiming for that
23:34 <+RP> I do prefer our own identifiers and there is a small worry upst=
ream might change again (but unlikely now GNU are on board)
23:34 <+RP> If anyone has other topics please chime in. I'm just asking que=
stions I have kind of queued up! :)
23:34 < JPEW> Why do you like ours better?
23:34 < zeddii> fewer-dashes :D
23:34 <+RP> JPEW: GPLv2 looks neater
23:35 < JaMa> agreed, SPDX are rather long
23:35 <+RP> I know why GNU wanted the other version
23:38 < JaMa> FWIW: here is the list https://spdx.org/licenses/ we already =
use the identifiers from version 3.0 and older in quite a few places (e.g. =
GPL-2.0 instead of GPLv2)
23:40 <+RP> JaMa: Right, we probably should at least standardise to SPDX or=
 our own format
23:41 < JaMa> on separate topic, is there still strong objection to use 4 s=
paces for shell task indentation in oe-core for consistency with python tas=
ks? I'm still willing to migrate the recipes
23:42 < JPEW> The mix was always a little weird to me, but I don't know why=
 it was done that way
23:42 <+RP> JaMa: Compromise and allow it but don't migrate everything but =
just new code?
23:43 < JPEW> Sounds reasonable to me. I think that's documented in the OE =
style guide?
23:44 < JaMa> RP: migarting it incrementally is fine and once there is sign=
ificant portion on 4 spaces I would volunteer to migrate the rest
23:44 <+RP> JaMa: I really don't want to mess the history with bulk respaci=
ng patches :(
23:44 <+RP> JaMa: it will be a particular pain for stable maintainer
23:45 < JaMa> RP: especially at the end of release cycle it makes IMHO most=
 sense (e.g. when backports from dunfell to zeus are much more rare) and ba=
ckports from the next one to dunfell will apply cleanly)
23:45 <+RP> JaMa: This was why we originally decided not to change it but t=
he other layers, etc.
23:45 < JaMa> RP: not to mess with git blame?
23:46 <+RP> JaMa: its one of my concerns, yes
23:46 < JPEW> Alright, I have Christmas program 3 of 4 to attend, so I'll h=
ave to leave now.
23:46 < JaMa> I'm still just being triggered by functions which mix tabs an=
d spaces (and for people with tab size !=3D 8 it completely messes the inde=
ntation) and this is still happening
23:47 <+RP> JaMa: well, there is one in sstate.bbclass I know I'm aware of
23:47 <+RP> JPEW: thanks!
23:47 <+RP> JaMa: sounds like we'd better table this one for another day :/
23:49 < JaMa> meta/recipes-support/libpcre/libpcre_8.43.bb has tabs followe=
d by spaces as well
23:49 < JaMa> db, curl, ..
23:50 < JaMa> if my grep was correct, then tab followed by spaces is in the=
se: meta/recipes-bsp/formfactor/formfactor_0.0.bb meta/recipes-bsp/grub/gru=
b-efi_2.04.bb meta/recipes-bsp/keymaps/keymaps_1.0.bb meta/recipes-bsp/liba=
cpi/libacpi_0.2.bb meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb meta/recipes-bsp=
/pciutils/pciutils_3.6.2.bb meta/recipes-connectivity/bind/bind_9.11.13.bb =
meta/recipes-connectivity/neard/neard_0.16.bb=20
23:50 < JaMa> meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb meta/r=
ecipes-connectivity/openssl/openssl_1.1.1d.bb meta/recipes-connectivity/ppp=
/ppp_2.4.7.bb meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb meta/=
recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb meta/recipes-core=
/dbus/dbus_1.12.16.bb meta/recipes-core/dbus/dbus-test_1.12.16.bb meta/reci=
pes-core/expat/expat_2.2.9.bb=20
23:50 < JaMa> meta/recipes-core/gettext/gettext_0.19.8.1.bb meta/recipes-co=
re/ifupdown/ifupdown_0.8.22.bb meta/recipes-core/images/build-appliance-ima=
ge_15.0.0.bb meta/recipes-core/initscripts/initscripts_1.0.bb meta/recipes-=
core/libxml/libxml2_2.9.9.bb meta/recipes-core/sysvinit/sysvinit_2.96.bb me=
ta/recipes-devtools/autoconf/autoconf_2.69.bb meta/recipes-devtools/e2fspro=
gs/e2fsprogs_1.45.4.bb=20
23:50 < JaMa> meta/recipes-devtools/flex/flex_2.6.4.bb meta/recipes-devtool=
s/gnu-config/gnu-config_git.bb meta/recipes-devtools/i2c-tools/i2c-tools_4.=
1.bb meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb meta/recipes-devt=
ools/perl/libxml-parser-perl_2.44.bb meta/recipes-devtools/rpm/rpm_4.14.2.1=
=2Ebb meta/recipes-devtools/tcltk/tcl_8.6.9.bb meta/recipes-devtools/valgri=
nd/valgrind_3.15.0.bb=20
23:50 < JaMa> meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb meta/reci=
pes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb meta/recipes=
-extended/cronie/cronie_1.5.5.bb meta/recipes-extended/diffutils/diffutils_=
3.7.bb meta/recipes-extended/gawk/gawk_5.0.1.bb meta/recipes-extended/less/=
less_551.bb meta/recipes-extended/man-db/man-db_2.8.7.bb meta/recipes-exten=
ded/mdadm/mdadm_4.1.bb=20
23:50 < JaMa> meta/recipes-extended/parted/parted_3.2.bb meta/recipes-exten=
ded/sed/sed_4.7.bb meta/recipes-extended/slang/slang_2.3.2.bb meta/recipes-=
extended/tcp-wrappers/tcp-wrappers_7.6.bb meta/recipes-extended/xinetd/xine=
td_2.3.15.bb meta/recipes-extended/zip/zip_3.0.bb meta/recipes-gnome/epipha=
ny/epiphany_3.34.1.bb meta/recipes-gnome/librsvg/librsvg_2.40.20.bb meta/re=
cipes-graphics/mx/mx-1.0_1.4.7.bb=20
23:50 < JaMa> meta/recipes-graphics/wayland/wayland_1.17.0.bb meta/recipes-=
graphics/xorg-lib/pixman_0.38.4.bb meta/recipes-kernel/dtc/dtc_1.5.1.bb met=
a/recipes-kernel/linux/kernel-devsrc.bb meta/recipes-kernel/make-mod-script=
s/make-mod-scripts_1.0.bb meta/recipes-kernel/modutils-initscripts/modutils=
-initscripts.bb meta/recipes-kernel/perf/perf.bb meta/recipes-kernel/system=
tap/systemtap-uprobes_git.bb=20
23:50 < JaMa> meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb meta/recipes-sato=
/matchbox-keyboard/matchbox-keyboard_0.1.1.bb meta/recipes-sato/pcmanfm/pcm=
anfm_1.3.1.bb meta/recipes-sato/puzzles/puzzles_git.bb meta/recipes-sato/we=
bkit/webkitgtk_2.26.2.bb meta/recipes-support/apr/apr_1.7.0.bb meta/recipes=
-support/apr/apr-util_1.6.1.bb meta/recipes-support/attr/acl_2.2.52.bb meta=
/recipes-support/curl/curl_7.67.0.bb=20
23:50 < JaMa> meta/recipes-support/db/db_5.3.28.bb meta/recipes-support/lib=
gpg-error/libgpg-error_1.36.bb meta/recipes-support/libpcre/libpcre_8.43.bb=
 meta/recipes-support/lzo/lzo_2.10.bb meta/recipes-support/shared-mime-info=
/shared-mime-info_1.10.bb meta-skeleton/recipes-skeleton/service/service_0.=
1.bb
23:51 < JaMa> meta/classes/autotools.bbclass meta/classes/binconfig.bbclass=
 meta/classes/buildhistory.bbclass meta/classes/cmake.bbclass meta/classes/=
cross-canadian.bbclass meta/classes/distutils.bbclass meta/classes/image-li=
ve.bbclass meta/classes/kernel.bbclass meta/classes/kernel-grub.bbclass met=
a/classes/kernel-yocto.bbclass meta/classes/module.bbclass meta/classes/mul=
tilib_header.bbclass=20
23:51 < JaMa> meta/classes/rootfs-postcommands.bbclass meta/classes/staging=
=2Ebbclass meta/classes/toolchain-scripts.bbclass meta/classes/useradd.bbcl=
ass meta/classes/utils.bbclass
23:52 < JaMa> meta/conf/distro/include/tclibc-glibc.inc meta/recipes-core/g=
libc/glibc-package.inc meta/recipes-core/ncurses/ncurses.inc meta/recipes-d=
evtools/apt/apt-package.inc meta/recipes-devtools/autoconf/autoconf.inc met=
a/recipes-devtools/gcc/gcc-9.2.inc meta/recipes-devtools/gdb/gdb-8.3.1.inc =
meta/recipes-devtools/git/git.inc meta/recipes-devtools/m4/m4-1.4.18.inc me=
ta/recipes-devtools/perl/perl-ptest.inc=20
23:52 < JaMa> meta/recipes-devtools/pseudo/pseudo.inc meta/recipes-devtools=
/qemu/qemu.inc meta/recipes-extended/bash/bash.inc meta/recipes-extended/cu=
ps/cups.inc meta/recipes-extended/shadow/shadow.inc meta/recipes-extended/s=
udo/sudo.inc meta/recipes-extended/sysstat/sysstat.inc meta/recipes-graphic=
s/clutter/clutter-1.0.inc meta/recipes-graphics/cogl/cogl-1.0.inc meta/reci=
pes-graphics/mesa/mesa.inc=20
23:52 < JaMa> meta/recipes-graphics/mx/mx.inc meta/recipes-sato/rxvt-unicod=
e/rxvt-unicode.inc meta/recipes-support/attr/attr.inc meta/recipes-support/=
icu/icu.inc meta/recipes-support/libcap-ng/libcap-ng.inc
23:52 < JaMa> sorry :/ so it's not so rare..

--m44zzhcasbjg4a6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXfjuvAAKCRA3VSO3ZXaA
HFvkAKCkDBDd5cyILhqa+iyugGf+alwf5wCfciHHkh5CtYrXO/BRgeTANIMm0qA=
=CkNm
-----END PGP SIGNATURE-----

--m44zzhcasbjg4a6t--
