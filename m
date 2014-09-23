Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6377C71551
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJEn8r007744; Tue, 23 Sep 2014 20:14:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nsbQJm1fUbtg; Tue, 23 Sep 2014 20:14:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJElSi007740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 23 Sep 2014 20:14:48 +0100
Message-ID: <1411499689.15825.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 23 Sep 2014 20:14:49 +0100
In-Reply-To: <541CA88D.7010902@linux.intel.com>
References: <1409320119-25825-1-git-send-email-net147@gmail.com>
	<CANwerB1ifwVuZdixcEpOBNeKX6C-o-p6Vr1fPZrZ1A33eBD_CA@mail.gmail.com>
	<541CA88D.7010902@linux.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] qemu: Explicitly disable libiscsi, its not in DEPENDS
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
X-List-Received-Date: Tue, 23 Sep 2014 19:14:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-09-19 at 17:05 -0500, Saul Wold wrote:
> On 09/18/2014 02:45 AM, Jonathan Liu wrote:
> > On 29 August 2014 23:48, Jonathan Liu <net147@gmail.com> wrote:
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> ---
> >>   meta/recipes-devtools/qemu/qemu.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> >> index 2702986..472988d 100644
> >> --- a/meta/recipes-devtools/qemu/qemu.inc
> >> +++ b/meta/recipes-devtools/qemu/qemu.inc
> >> @@ -26,7 +26,7 @@ SRC_URI_append_class-native = "\
> >>       file://fix-libcap-header-issue-on-some-distro.patch \
> >>       "
> >>
> >> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
> >> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
> >>
> >>   EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
> >>                                  "
> >> --
> >> 2.0.3
> >>
> >
> > Ping.
> >
> 
> Ok, I see what seems to have happened the patch is in OE-Core's Daisy 
> branch but did not make the leap into Poky's Daisy brach along with a 
> couple of other patches.  I am trying to reconcile this between my 
> oecore/daisy-next and poky/daisy-next for testing.
> 
> Hope to have this straightened out next week.

I fixed the branches being out of sync if that helps...

Cheers,

Richard


