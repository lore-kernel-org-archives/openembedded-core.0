Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id CCF7071AB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 20:01:01 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 189so14734830iow.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Cu/GOHYjsn1SWwVONP2qhJzBqRyiiWarLRhfUza3NCk=;
	b=Eaw3L7QlH3WGmYgdLNlrNUiNrbvIDW5xEcructkL42eca92mDCxnjVUUvyHl0CEnrM
	Zp6qzBazJeBHNpRNMC+onC9bUL/BTbhYAnkfL7+t27I/4hAU4codRCOX39ZVLN5k7fvu
	2a9Jv7Q/n1BBIHkKVOwEy+REqCDFN6vUpiDTntMl/eOeUg9XncBa6YAg+mw4IvVu7y7C
	3ayIqRPKvQvmYVQo4/Q4ljL/Al6aZbthSwgDmKsCNOo4Ud/OiIe9PeXdTOL+i0I+PEuQ
	omF19IzRbAFBhZZVhNwDvLQ9HsRjHeM8qQzM/7N8/6fN6hAi8Mvk3/lYIHBZ1jwXbtb0
	d6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Cu/GOHYjsn1SWwVONP2qhJzBqRyiiWarLRhfUza3NCk=;
	b=oJdDe/BXXIx9wVit4YlQJ9ria6A7BmdjWUS3p5IKG1MyF9c9g09EG8yotIdXAJEGmT
	sKcpnaJoX6iuVqD9r/WD37wBCOTag1xmKURnIEI3ex+GlFvFqCdykVRbxVWS1pw6OmIM
	oWDACcGEmtx9ZC8vd6M8IdhSqKjjQMNTd7rTjScNX6gM0yzUgiuSCcNMpkk9aPl4PpH5
	GiBfOyLYQfw96KaAEz3RxplI82f3oTBWada8CTMMy0a3ESE7WmV+wIVW21nFxQ+mXGw2
	PMmT2T3whWATba/QdaP2zsetYyVXNVAL79vaCcNoFcwS6ORexLrswizyt0OBbncH3vhw
	78Bw==
X-Gm-Message-State: AJaThX4nOie7SkOp9qP5H4s2LeiH4cInpZrZ3hoXzQjORMh00qGTIIpl
	05jDve3qSVN/hp31FboBKgMEF299k5PFipJI48n27Q==
X-Google-Smtp-Source: AGs4zMaJUqqUsAouHalW4vD2e8d7tSHj/ST7wEvvebjH+ZLGmxO5zWLUGRhZ9xlOzY8jRW5AqUmQO3teqGXfYYaLVso=
X-Received: by 10.107.133.85 with SMTP id h82mr1713175iod.208.1510344062002;
	Fri, 10 Nov 2017 12:01:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 12:00:41 -0800 (PST)
In-Reply-To: <b60a8c60-671c-7fe4-e52b-c7b4ca058652@gmail.com>
References: <20171110155510.26427-1-ross.burton@intel.com>
	<20171110155510.26427-2-ross.burton@intel.com>
	<b60a8c60-671c-7fe4-e52b-c7b4ca058652@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 20:00:41 +0000
Message-ID: <CAJTo0LZSWeLfPmwYZoPfwk03G0nTH9kBhynVZpwhn5qsn8LOeQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] hostap-utils: remove obsolete driver
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
X-List-Received-Date: Fri, 10 Nov 2017 20:01:02 -0000
Content-Type: multipart/alternative; boundary="001a113fd83a4e0dde055da661e0"

--001a113fd83a4e0dde055da661e0
Content-Type: text/plain; charset="UTF-8"

No, hostap-utils is just the userspace bit of the prism driver, and depends
on wireless-tools.  I'll also reiterate that his hardware is a decade old.
It predates 802.11g...

Ross

On 10 November 2017 at 19:01, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 11/10/2017 07:55 AM, Ross Burton wrote:
> > HostAP is the user-space part of the Intersil Prism 2/2.5/3 wifi
> chipset.  It's
> > also a decade old and obsolete, so remove it from oe-core.
> Would it be beneficial to reference what replaced it ? I think its
> wireless-tools if I am not mistaken
>
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/conf/distro/include/distro_alias.inc          |   1 -
> >  meta/conf/distro/include/maintainers.inc           |   2 -
> >  meta/recipes-bsp/hostap/files/COPYING.patch        | 346
> ---------------------
> >  meta/recipes-bsp/hostap/files/hostap-fw-load.patch |  22 --
> >  meta/recipes-bsp/hostap/files/hostap_cs.conf       | 193 ------------
> >  .../hostap/files/hostap_cs.conf-upstream           | 191 ------------
> >  meta/recipes-bsp/hostap/files/hostap_cs.modalias   |  28 --
> >  meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  23 --
> >  ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch |  36 ---
> >  .../hostap/hostap-utils-0.4.7/ldflags.patch        |  27 --
> >  meta/recipes-bsp/hostap/hostap-utils.inc           |  27 --
> >  meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |   5 -
> >  12 files changed, 901 deletions(-)
> >  delete mode 100644 meta/recipes-bsp/hostap/files/COPYING.patch
> >  delete mode 100644 meta/recipes-bsp/hostap/files/hostap-fw-load.patch
> >  delete mode 100644 meta/recipes-bsp/hostap/files/hostap_cs.conf
> >  delete mode 100644 meta/recipes-bsp/hostap/files/
> hostap_cs.conf-upstream
> >  delete mode 100644 meta/recipes-bsp/hostap/files/hostap_cs.modalias
> >  delete mode 100644 meta/recipes-bsp/hostap/hostap-conf_1.0.bb
> >  delete mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-
> Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
> >  delete mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.
> patch
> >  delete mode 100644 meta/recipes-bsp/hostap/hostap-utils.inc
> >  delete mode 100644 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
> >
> > diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> > index 3b0411c3547..1a217daa390 100644
> > --- a/meta/conf/distro/include/distro_alias.inc
> > +++ b/meta/conf/distro/include/distro_alias.inc
> > @@ -138,7 +138,6 @@ DISTRO_PN_ALIAS_pn-gtk-sato-engine = "OpenedHand"
> >  DISTRO_PN_ALIAS_pn-gtk-icon-utils-native = "OSPDT"
> >  DISTRO_PN_ALIAS_pn-systemd-boot = "Ubuntu=systemd-boot
> Fedora=systemd-boot"
> >  DISTRO_PN_ALIAS_pn-hello-mod = "OE-Core"
> > -DISTRO_PN_ALIAS_pn-hostap-conf = "OE-Core"
> >  DISTRO_PN_ALIAS_pn-hwlatdetect = "OSPDT"
> >  DISTRO_PN_ALIAS_pn-icecc-create-env = "OE-Core"
> >  DISTRO_PN_ALIAS_pn-init-ifupdown = "Debian=ifupdown Ubuntu=ifupdown"
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 38789b217cd..856a6b763bf 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -262,8 +262,6 @@ RECIPE_MAINTAINER_pn-harfbuzz = "Maxin B. John <
> maxin.john@intel.com>"
> >  RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
> >  RECIPE_MAINTAINER_pn-help2man-native = "Hongxu Jia <
> hongxu.jia@windriver.com>"
> >  RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Jussi Kukkonen <
> jussi.kukkonen@intel.com>"
> > -RECIPE_MAINTAINER_pn-hostap-conf = "Maxin B. John <maxin.john@intel.com
> >"
> > -RECIPE_MAINTAINER_pn-hostap-utils = "Maxin B. John <
> maxin.john@intel.com>"
> >  RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <
> alexander.kanavin@intel.com>"
> >  RECIPE_MAINTAINER_pn-i2c-tools = "Maxin B. John <maxin.john@intel.com>"
> >  RECIPE_MAINTAINER_pn-icecc-create-env-native = "Alexander Kanavin <
> alexander.kanavin@intel.com>"
> > diff --git a/meta/recipes-bsp/hostap/files/COPYING.patch
> b/meta/recipes-bsp/hostap/files/COPYING.patch
> > deleted file mode 100644
> > index 05c70c92e5d..00000000000
> > --- a/meta/recipes-bsp/hostap/files/COPYING.patch
> > +++ /dev/null
> > @@ -1,346 +0,0 @@
> > -Upstream-Status: Inappropriate [other]
> > -
> > -diff -ruN hostap-conf-1.0-orig/COPYING hostap-conf-1.0/COPYING
> > ---- hostap-conf-1.0-orig/COPYING     1970-01-01 08:00:00.000000000 +0800
> > -+++ hostap-conf-1.0/COPYING  2010-12-09 16:36:48.000000000 +0800
> > -@@ -0,0 +1,340 @@
> > -+                GNU GENERAL PUBLIC LICENSE
> > -+                   Version 2, June 1991
> > -+
> > -+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
> > -+                       59 Temple Place, Suite 330, Boston, MA
> 02111-1307  USA
> > -+ Everyone is permitted to copy and distribute verbatim copies
> > -+ of this license document, but changing it is not allowed.
> > -+
> > -+                        Preamble
> > -+
> > -+  The licenses for most software are designed to take away your
> > -+freedom to share and change it.  By contrast, the GNU General Public
> > -+License is intended to guarantee your freedom to share and change free
> > -+software--to make sure the software is free for all its users.  This
> > -+General Public License applies to most of the Free Software
> > -+Foundation's software and to any other program whose authors commit to
> > -+using it.  (Some other Free Software Foundation software is covered by
> > -+the GNU Library General Public License instead.)  You can apply it to
> > -+your programs, too.
> > -+
> > -+  When we speak of free software, we are referring to freedom, not
> > -+price.  Our General Public Licenses are designed to make sure that you
> > -+have the freedom to distribute copies of free software (and charge for
> > -+this service if you wish), that you receive source code or can get it
> > -+if you want it, that you can change the software or use pieces of it
> > -+in new free programs; and that you know you can do these things.
> > -+
> > -+  To protect your rights, we need to make restrictions that forbid
> > -+anyone to deny you these rights or to ask you to surrender the rights.
> > -+These restrictions translate to certain responsibilities for you if you
> > -+distribute copies of the software, or if you modify it.
> > -+
> > -+  For example, if you distribute copies of such a program, whether
> > -+gratis or for a fee, you must give the recipients all the rights that
> > -+you have.  You must make sure that they, too, receive or can get the
> > -+source code.  And you must show them these terms so they know their
> > -+rights.
> > -+
> > -+  We protect your rights with two steps: (1) copyright the software,
> and
> > -+(2) offer you this license which gives you legal permission to copy,
> > -+distribute and/or modify the software.
> > -+
> > -+  Also, for each author's protection and ours, we want to make certain
> > -+that everyone understands that there is no warranty for this free
> > -+software.  If the software is modified by someone else and passed on,
> we
> > -+want its recipients to know that what they have is not the original, so
> > -+that any problems introduced by others will not reflect on the original
> > -+authors' reputations.
> > -+
> > -+  Finally, any free program is threatened constantly by software
> > -+patents.  We wish to avoid the danger that redistributors of a free
> > -+program will individually obtain patent licenses, in effect making the
> > -+program proprietary.  To prevent this, we have made it clear that any
> > -+patent must be licensed for everyone's free use or not licensed at all.
> > -+
> > -+  The precise terms and conditions for copying, distribution and
> > -+modification follow.
> > -+
> > -+                GNU GENERAL PUBLIC LICENSE
> > -+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> > -+
> > -+  0. This License applies to any program or other work which contains
> > -+a notice placed by the copyright holder saying it may be distributed
> > -+under the terms of this General Public License.  The "Program", below,
> > -+refers to any such program or work, and a "work based on the Program"
> > -+means either the Program or any derivative work under copyright law:
> > -+that is to say, a work containing the Program or a portion of it,
> > -+either verbatim or with modifications and/or translated into another
> > -+language.  (Hereinafter, translation is included without limitation in
> > -+the term "modification".)  Each licensee is addressed as "you".
> > -+
> > -+Activities other than copying, distribution and modification are not
> > -+covered by this License; they are outside its scope.  The act of
> > -+running the Program is not restricted, and the output from the Program
> > -+is covered only if its contents constitute a work based on the
> > -+Program (independent of having been made by running the Program).
> > -+Whether that is true depends on what the Program does.
> > -+
> > -+  1. You may copy and distribute verbatim copies of the Program's
> > -+source code as you receive it, in any medium, provided that you
> > -+conspicuously and appropriately publish on each copy an appropriate
> > -+copyright notice and disclaimer of warranty; keep intact all the
> > -+notices that refer to this License and to the absence of any warranty;
> > -+and give any other recipients of the Program a copy of this License
> > -+along with the Program.
> > -+
> > -+You may charge a fee for the physical act of transferring a copy, and
> > -+you may at your option offer warranty protection in exchange for a fee.
> > -+
> > -+  2. You may modify your copy or copies of the Program or any portion
> > -+of it, thus forming a work based on the Program, and copy and
> > -+distribute such modifications or work under the terms of Section 1
> > -+above, provided that you also meet all of these conditions:
> > -+
> > -+    a) You must cause the modified files to carry prominent notices
> > -+    stating that you changed the files and the date of any change.
> > -+
> > -+    b) You must cause any work that you distribute or publish, that in
> > -+    whole or in part contains or is derived from the Program or any
> > -+    part thereof, to be licensed as a whole at no charge to all third
> > -+    parties under the terms of this License.
> > -+
> > -+    c) If the modified program normally reads commands interactively
> > -+    when run, you must cause it, when started running for such
> > -+    interactive use in the most ordinary way, to print or display an
> > -+    announcement including an appropriate copyright notice and a
> > -+    notice that there is no warranty (or else, saying that you provide
> > -+    a warranty) and that users may redistribute the program under
> > -+    these conditions, and telling the user how to view a copy of this
> > -+    License.  (Exception: if the Program itself is interactive but
> > -+    does not normally print such an announcement, your work based on
> > -+    the Program is not required to print an announcement.)
> > -+
> > -+These requirements apply to the modified work as a whole.  If
> > -+identifiable sections of that work are not derived from the Program,
> > -+and can be reasonably considered independent and separate works in
> > -+themselves, then this License, and its terms, do not apply to those
> > -+sections when you distribute them as separate works.  But when you
> > -+distribute the same sections as part of a whole which is a work based
> > -+on the Program, the distribution of the whole must be on the terms of
> > -+this License, whose permissions for other licensees extend to the
> > -+entire whole, and thus to each and every part regardless of who wrote
> it.
> > -+
> > -+Thus, it is not the intent of this section to claim rights or contest
> > -+your rights to work written entirely by you; rather, the intent is to
> > -+exercise the right to control the distribution of derivative or
> > -+collective works based on the Program.
> > -+
> > -+In addition, mere aggregation of another work not based on the Program
> > -+with the Program (or with a work based on the Program) on a volume of
> > -+a storage or distribution medium does not bring the other work under
> > -+the scope of this License.
> > -+
> > -+  3. You may copy and distribute the Program (or a work based on it,
> > -+under Section 2) in object code or executable form under the terms of
> > -+Sections 1 and 2 above provided that you also do one of the following:
> > -+
> > -+    a) Accompany it with the complete corresponding machine-readable
> > -+    source code, which must be distributed under the terms of Sections
> > -+    1 and 2 above on a medium customarily used for software
> interchange; or,
> > -+
> > -+    b) Accompany it with a written offer, valid for at least three
> > -+    years, to give any third party, for a charge no more than your
> > -+    cost of physically performing source distribution, a complete
> > -+    machine-readable copy of the corresponding source code, to be
> > -+    distributed under the terms of Sections 1 and 2 above on a medium
> > -+    customarily used for software interchange; or,
> > -+
> > -+    c) Accompany it with the information you received as to the offer
> > -+    to distribute corresponding source code.  (This alternative is
> > -+    allowed only for noncommercial distribution and only if you
> > -+    received the program in object code or executable form with such
> > -+    an offer, in accord with Subsection b above.)
> > -+
> > -+The source code for a work means the preferred form of the work for
> > -+making modifications to it.  For an executable work, complete source
> > -+code means all the source code for all modules it contains, plus any
> > -+associated interface definition files, plus the scripts used to
> > -+control compilation and installation of the executable.  However, as a
> > -+special exception, the source code distributed need not include
> > -+anything that is normally distributed (in either source or binary
> > -+form) with the major components (compiler, kernel, and so on) of the
> > -+operating system on which the executable runs, unless that component
> > -+itself accompanies the executable.
> > -+
> > -+If distribution of executable or object code is made by offering
> > -+access to copy from a designated place, then offering equivalent
> > -+access to copy the source code from the same place counts as
> > -+distribution of the source code, even though third parties are not
> > -+compelled to copy the source along with the object code.
> > -+
> > -+  4. You may not copy, modify, sublicense, or distribute the Program
> > -+except as expressly provided under this License.  Any attempt
> > -+otherwise to copy, modify, sublicense or distribute the Program is
> > -+void, and will automatically terminate your rights under this License.
> > -+However, parties who have received copies, or rights, from you under
> > -+this License will not have their licenses terminated so long as such
> > -+parties remain in full compliance.
> > -+
> > -+  5. You are not required to accept this License, since you have not
> > -+signed it.  However, nothing else grants you permission to modify or
> > -+distribute the Program or its derivative works.  These actions are
> > -+prohibited by law if you do not accept this License.  Therefore, by
> > -+modifying or distributing the Program (or any work based on the
> > -+Program), you indicate your acceptance of this License to do so, and
> > -+all its terms and conditions for copying, distributing or modifying
> > -+the Program or works based on it.
> > -+
> > -+  6. Each time you redistribute the Program (or any work based on the
> > -+Program), the recipient automatically receives a license from the
> > -+original licensor to copy, distribute or modify the Program subject to
> > -+these terms and conditions.  You may not impose any further
> > -+restrictions on the recipients' exercise of the rights granted herein.
> > -+You are not responsible for enforcing compliance by third parties to
> > -+this License.
> > -+
> > -+  7. If, as a consequence of a court judgment or allegation of patent
> > -+infringement or for any other reason (not limited to patent issues),
> > -+conditions are imposed on you (whether by court order, agreement or
> > -+otherwise) that contradict the conditions of this License, they do not
> > -+excuse you from the conditions of this License.  If you cannot
> > -+distribute so as to satisfy simultaneously your obligations under this
> > -+License and any other pertinent obligations, then as a consequence you
> > -+may not distribute the Program at all.  For example, if a patent
> > -+license would not permit royalty-free redistribution of the Program by
> > -+all those who receive copies directly or indirectly through you, then
> > -+the only way you could satisfy both it and this License would be to
> > -+refrain entirely from distribution of the Program.
> > -+
> > -+If any portion of this section is held invalid or unenforceable under
> > -+any particular circumstance, the balance of the section is intended to
> > -+apply and the section as a whole is intended to apply in other
> > -+circumstances.
> > -+
> > -+It is not the purpose of this section to induce you to infringe any
> > -+patents or other property right claims or to contest validity of any
> > -+such claims; this section has the sole purpose of protecting the
> > -+integrity of the free software distribution system, which is
> > -+implemented by public license practices.  Many people have made
> > -+generous contributions to the wide range of software distributed
> > -+through that system in reliance on consistent application of that
> > -+system; it is up to the author/donor to decide if he or she is willing
> > -+to distribute software through any other system and a licensee cannot
> > -+impose that choice.
> > -+
> > -+This section is intended to make thoroughly clear what is believed to
> > -+be a consequence of the rest of this License.
> > -+
> > -+  8. If the distribution and/or use of the Program is restricted in
> > -+certain countries either by patents or by copyrighted interfaces, the
> > -+original copyright holder who places the Program under this License
> > -+may add an explicit geographical distribution limitation excluding
> > -+those countries, so that distribution is permitted only in or among
> > -+countries not thus excluded.  In such case, this License incorporates
> > -+the limitation as if written in the body of this License.
> > -+
> > -+  9. The Free Software Foundation may publish revised and/or new
> versions
> > -+of the General Public License from time to time.  Such new versions
> will
> > -+be similar in spirit to the present version, but may differ in detail
> to
> > -+address new problems or concerns.
> > -+
> > -+Each version is given a distinguishing version number.  If the Program
> > -+specifies a version number of this License which applies to it and "any
> > -+later version", you have the option of following the terms and
> conditions
> > -+either of that version or of any later version published by the Free
> > -+Software Foundation.  If the Program does not specify a version number
> of
> > -+this License, you may choose any version ever published by the Free
> Software
> > -+Foundation.
> > -+
> > -+  10. If you wish to incorporate parts of the Program into other free
> > -+programs whose distribution conditions are different, write to the
> author
> > -+to ask for permission.  For software which is copyrighted by the Free
> > -+Software Foundation, write to the Free Software Foundation; we
> sometimes
> > -+make exceptions for this.  Our decision will be guided by the two goals
> > -+of preserving the free status of all derivatives of our free software
> and
> > -+of promoting the sharing and reuse of software generally.
> > -+
> > -+                        NO WARRANTY
> > -+
> > -+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO
> WARRANTY
> > -+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT
> WHEN
> > -+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> > -+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
> EXPRESSED
> > -+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> > -+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK
> AS
> > -+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
> > -+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY
> SERVICING,
> > -+REPAIR OR CORRECTION.
> > -+
> > -+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
> WRITING
> > -+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> > -+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR
> DAMAGES,
> > -+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> ARISING
> > -+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT
> LIMITED
> > -+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED
> BY
> > -+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY
> OTHER
> > -+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> > -+POSSIBILITY OF SUCH DAMAGES.
> > -+
> > -+                 END OF TERMS AND CONDITIONS
> > -+
> > -+        How to Apply These Terms to Your New Programs
> > -+
> > -+  If you develop a new program, and you want it to be of the greatest
> > -+possible use to the public, the best way to achieve this is to make it
> > -+free software which everyone can redistribute and change under these
> terms.
> > -+
> > -+  To do so, attach the following notices to the program.  It is safest
> > -+to attach them to the start of each source file to most effectively
> > -+convey the exclusion of warranty; and each file should have at least
> > -+the "copyright" line and a pointer to where the full notice is found.
> > -+
> > -+    <one line to give the program's name and a brief idea of what it
> does.>
> > -+    Copyright (C) <year>  <name of author>
> > -+
> > -+    This program is free software; you can redistribute it and/or
> modify
> > -+    it under the terms of the GNU General Public License as published
> by
> > -+    the Free Software Foundation; either version 2 of the License, or
> > -+    (at your option) any later version.
> > -+
> > -+    This program is distributed in the hope that it will be useful,
> > -+    but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > -+    GNU General Public License for more details.
> > -+
> > -+    You should have received a copy of the GNU General Public License
> > -+    along with this program; if not, write to the Free Software
> > -+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> 02111-1307  USA
> > -+
> > -+
> > -+Also add information on how to contact you by electronic and paper
> mail.
> > -+
> > -+If the program is interactive, make it output a short notice like this
> > -+when it starts in an interactive mode:
> > -+
> > -+    Gnomovision version 69, Copyright (C) year name of author
> > -+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type
> `show w'.
> > -+    This is free software, and you are welcome to redistribute it
> > -+    under certain conditions; type `show c' for details.
> > -+
> > -+The hypothetical commands `show w' and `show c' should show the
> appropriate
> > -+parts of the General Public License.  Of course, the commands you use
> may
> > -+be called something other than `show w' and `show c'; they could even
> be
> > -+mouse-clicks or menu items--whatever suits your program.
> > -+
> > -+You should also get your employer (if you work as a programmer) or your
> > -+school, if any, to sign a "copyright disclaimer" for the program, if
> > -+necessary.  Here is a sample; alter the names:
> > -+
> > -+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
> program
> > -+  `Gnomovision' (which makes passes at compilers) written by James
> Hacker.
> > -+
> > -+  <signature of Ty Coon>, 1 April 1989
> > -+  Ty Coon, President of Vice
> > -+
> > -+This General Public License does not permit incorporating your program
> into
> > -+proprietary programs.  If your program is a subroutine library, you may
> > -+consider it more useful to permit linking proprietary applications
> with the
> > -+library.  If this is what you want to do, use the GNU Library General
> > -+Public License instead of this License.
> > diff --git a/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
> b/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
> > deleted file mode 100644
> > index 050bdc113c4..00000000000
> > --- a/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -
> > -#
> > -# Patch managed by http://www.holgerschurig.de/patcher.html
> > -#
> > -
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > ---- hostap-utils-0.2.4/hostap_fw_load~hostap-fw-load
> > -+++ hostap-utils-0.2.4/hostap_fw_load
> > -@@ -6,9 +6,9 @@
> > - # Firmware images for the card
> > - # TODO: could try to select correct firmware type automatically
> > -
> > --PRI=/etc/pcmcia/PM010102.HEX
> > --STA=/etc/pcmcia/RF010802.HEX
> > --PRISM2_SREC=/usr/local/bin/prism2_srec
> > -+PRI=/etc/pcmcia/pm010102.hex
> > -+STA=/etc/pcmcia/rf010804.hex
> > -+PRISM2_SREC=/usr/sbin/prism2_srec
> > -
> > - set -e
> > -
> > diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.conf
> b/meta/recipes-bsp/hostap/files/hostap_cs.conf
> > deleted file mode 100644
> > index 8dda82aad35..00000000000
> > --- a/meta/recipes-bsp/hostap/files/hostap_cs.conf
> > +++ /dev/null
> > @@ -1,193 +0,0 @@
> > -module "hostap_cs" opts "channel=3 iw_mode=2 essid=any ignore_cis_vcc=1"
> > -
> > -card "Actiontec 802CI2"
> > -  manfid 0x1668, 0x0101
> > -  bind "hostap_cs"
> > -
> > -card "AirWay 802.11 Adapter (PCMCIA)"
> > -  #version "AirWay", "802.11 Adapter (PCMCIA)"
> > -  manfid 0x0261, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Asus SpaceLink WL110"
> > -   manfid 0x02aa,0x0002
> > -   bind "hostap_cs"
> > -
> > -## handhelds.org bug 964
> > -card "Belkin F5D6060 Ethernet"
> > -   #version "PCMCIA", "11M WLAN Card v2.5", "ISL37300P", "RevA"
> > -   manfid 0x0274, 0x1612
> > -   bind "hostap_cs"
> > -
> > -card "Compaq 11Mbps Wireless PC Card"
> > -  manfid 0x028a, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Compaq WL100 11 Mbps Wireless Adapter"
> > -  manfid 0x0138, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Compaq HNW-100 11 Mbps Wireless Adapter"
> > -  manfid 0x028a, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "D-Link DWL-650"
> > -  version "D", "Link DWL-650 11Mbps WLAN Card"
> > -  bind "hostap_cs"
> > -
> > -card "D-Link DRC-650"
> > -  version "D", "Link DRC-650 11Mbps WLAN Card"
> > -  bind "hostap_cs"
> > -
> > -card "D-Link DCF660"
> > -  manfid 0xd601, 0x0005
> > -  bind "hostap_cs"
> > -
> > -card "Farallon SkyLINE"
> > -  version "INTERSIL", "HFA384x/IEEE"
> > -  bind "hostap_cs"
> > -
> > -card "HyperLink Wireless PC Card 11Mbps"
> > -  version "HyperLink", "Wireless PC Card 11Mbps"
> > -  bind "hostap_cs"
> > -
> > -# card "Intersil PRISM2 11 Mbps Wireless Adapter"
> > -#   manfid 0x0156, 0x0002
> > -#  bind "hostap_cs"
> > -
> > -card "LA4111 Spectrum24 Wireless LAN PC Card"
> > -  version "Symbol Technologies"
> > -  bind "hostap_cs"
> > -
> > -card "Linksys WPC11 11Mbps 802.11b WLAN Card"
> > -  version "Instant Wireless ", " Network PC CARD", "Version 01.02"
> > -  bind "hostap_cs"
> > -
> > -card "Linksys WCF11 11Mbps 802.11b WLAN Card"
> > -   manfid 0x0274, 0x3301
> > -   bind "hostap_cs"
> > -
> > -## handhelds.org bug #790
> > -card "Linksys Wireless CompactFlash Card WCF12"
> > -  manfid 0x028a, 0x0673
> > -  bind "hostap_cs"
> > -
> > -card "Linksys WLAN CF Card"
> > -  manfid 0x0274, 0x3301
> > -  bind "hostap_cs"
> > -
> > -card "NETGEAR MA701 Wireless CF Card"
> > -  manfid 0xd601, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Nortel Networks eMobility 802.11 Wireless Adapter"
> > -  manfid 0x01eb, 0x080a
> > -  bind "hostap_cs"
> > -
> > -card "PLANEX GeoWave GW-CF110"
> > -  version "PLANEX", "GeoWave/GW-CF110"
> > -  bind "hostap_cs"
> > -
> > -card "PROXIM LAN PC CARD HARMONY 80211B"
> > -  version "PROXIM", "LAN PC CARD HARMONY 80211B"
> > -  bind "hostap_cs"
> > -
> > -card "Proxim RangeLAN/DS"
> > -  version "PROXIM","RangeLAN-DS/LAN PC CARD"
> > -  manfid 0x0126, 0x8000
> > -  bind "hostap_cs"
> > -
> > -card "Safeway 802.11b Wireless Adapter"
> > -  manfid 0xd601, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "SAMSUNG 11Mbps WLAN Card"
> > -  version "SAMSUNG", "11Mbps WLAN Card"
> > -  bind "hostap_cs"
> > -
> > -# needs firmware upload via hostap_fw_load
> > -card "SanDisk ConnectPlus OEM (0MB)"
> > -   manfid 0xd601, 0x0010
> > -   bind "hostap_cs"
> > -
> > -# needs special activation (>=hostap 0.3.2 only) plus firmware upload
> > -card "SanDisk ConnectPlus w/ Memory"
> > -   version "SanDisk", "ConnectPlus"
> > -   manfid 0xd601, 0x0101
> > -   bind "hostap_cs" to 0
> > -#   bind "ide-cs" to 1
> > -
> > -card "Senao/Origo 80211b WLAN Card"
> > -   manfid 0x000b,0x7100
> > -   bind "hostap_cs"
> > -
> > -card "Sitecom WL-007 WLAN CF Card"
> > -  manfid 0xd601, 0x0004
> > -  bind "hostap_cs"
> > -
> > -card "SMC2632 802.11 (prism2) Card"
> > -  version "SMC", "SMC2632W", "Version 01.02", ""
> > -  bind "hostap_cs"
> > -
> > -card "SpeedStream SS1021 Wireless Adapter"
> > -  #version "Siemens", "SpeedStream Wireless PCMCIA"
> > -  manfid 0x02ac, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "ZCOMAX AirRunner/XI-300"
> > -  #version "ZCOMAX", "AirRunner/XI-300"
> > -  manfid 0xd601, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Zonet ZCF1100"
> > -  manfid 0x000b, 0x7100
> > -  bind "hostap_cs"
> > -
> > -card "Wireless LAN Adapter Version 01.02"
> > -   version "Wireless", "LAN Adapter", "Version 01.02"
> > -#   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Ambicom WL1100C 11Mbs Card 802.11b"
> > -  version "AmbiCom", "WL1100C 802.11b CF-Card", "2.2"
> > -  manfid 0xd601,0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Ambicom WL1100C 11Mbs Card 802.11b"
> > -  manfid 0xd601,0x0002
> > -  bind "hostap_cs"
> > -
> > -card "Sandisk Connect SDWCFB-000"
> > -  manfid 0xd601,0x0005
> > -  bind "hostap_cs"
> > -
> > -# Cards with Intersil firmware (Prism chipset)
> > -
> > -card "Linksys WPC11 11Mbps 802.11b WLAN Card"
> > -  version "The Linksys Group, Inc.", "Instant Wireless Network PC
> Card", "ISL37300P", "RevA"
> > -  bind "hostap_cs"
> > -
> > -card "Linksys CompactFlash Wireless Card"
> > -  version "Linksys", "Wireless CompactFlash Card"
> > -  bind "hostap_cs"
> > -
> > -card "ACTIONTEC PRISM Wireless LAN PC Card"
> > -  version "ACTIONTEC", "PRISM Wireless LAN PC Card"
> > -  bind "hostap_cs"
> > -
> > -card "Linksys WPC11 Version 3"
> > -  manfid 0x0274,0x1613
> > -  bind "hostap_cs"
> > -
> > -card "BENQ AWL100"
> > -  version "BENQ", "AWL100 PCMCIA ADAPTER"
> > -  bind "hostap_cs"
> > -
> > -card "Pretec WLAN"
> > -  version "Pretec", "CompactWLAN Card 802.11b", "2.5"
> > -  manfid 0x0156, 0x0002
> > -  bind "hostap_cs"
> > -
> > -card "TrendNet TEW PC16"
> > -  manfid 0x0274, 0x1601
> > -  bind "hostap_cs"
> > diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream
> b/meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream
> > deleted file mode 100644
> > index 5b7385a7cbb..00000000000
> > --- a/meta/recipes-bsp/hostap/files/hostap_cs.conf-upstream
> > +++ /dev/null
> > @@ -1,191 +0,0 @@
> > -device "hostap_cs"
> > -   class "network" module "hostap", "hostap_cs"
> > -
> > -card "Intersil PRISM2 Reference Design 11Mb/s WLAN Card"
> > -   version "INTERSIL", "HFA384x/IEEE"
> > -   bind "hostap_cs"
> > -
> > -card "Compaq WL100 11Mb/s WLAN Card"
> > -   manfid 0x0138, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Compaq WL200"
> > -   version "Compaq", "WL200_11Mbps_Wireless_PCI_Card"
> > -   bind "hostap_cs"
> > -
> > -card "EMTAC A2424i 11Mbps WLAN Card"
> > -   manfid 0xc250, 0x0002
> > -#   cis "cis/Emtac.dat"
> > -   bind "hostap_cs"
> > -
> > -card "Linksys WPC11 11Mbps WLAN Card"
> > -   version "Instant Wireless ", " Network PC CARD", "Version 01.02"
> > -   bind "hostap_cs"
> > -
> > -card "Linksys WPC11 Ver 2.5 11Mbps WLAN Card"
> > -   manfid 0x0274, 0x1612
> > -   bind "hostap_cs"
> > -
> > -card "Linksys WPC11 Ver 3 11Mbps WLAN Card"
> > -   manfid 0x0274, 0x1613
> > -   bind "hostap_cs"
> > -
> > -card "Linksys WCF12 Wireless CompactFlash Card"
> > -   version "Linksys", "Wireless CompactFlash Card"
> > -   bind "hostap_cs"
> > -
> > -card "D-Link DWL-650 11Mbps WLAN Card"
> > -   version "D", "Link DWL-650 11Mbps WLAN Card", "Version 01.02"
> > -   bind "hostap_cs"
> > -
> > -card "D-Link DRC-650 11Mbps WLAN Card"
> > -#  version "D", "Link DRC-650 11Mbps WLAN Card", "Version 01.02"
> > -   manfid 0x028a, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "ZoomAir 4100 11Mb/s WLAN Card"
> > -   version "ZoomAir 11Mbps High", "Rate wireless Networking"
> > -   bind "hostap_cs"
> > -
> > -card "Addtron AWP-100 11Mbps WLAN Card"
> > -   version "Addtron", "AWP-100 Wireless PCMCIA", "Version 01.02"
> > -   bind "hostap_cs"
> > -
> > -card "Samsung SWL2000-N 11Mb/s WLAN Card"
> > -   manfid 0x0250, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "SMC 2632W 11Mbps WLAN Card"
> > -   version "SMC", "SMC2632W", "Version 01.02"
> > -   bind "hostap_cs"
> > -
> > -card "BroMax Freeport 11Mbps WLAN Card"
> > -   version "Intersil", "PRISM 2_5 PCMCIA ADAPTER", "ISL37300P",
> "Eval-RevA"
> > -   bind "hostap_cs"
> > -
> > -card "Z-Com XI300 11Mb/s WLAN Card"
> > -   manfid 0xd601, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Zcomax XI-325H 200mW"
> > -#   version " ", "IEEE 802.11 Wireless LAN/PC Card"
> > -   manfid 0xd601, 0x0005
> > -   bind "hostap_cs"
> > -
> > -card "3Com AirConnect PCI 777A"
> > -   manfid 0x0101, 0x0777
> > -   bind "hostap_cs"
> > -
> > -card "U.S. Robotics IEEE 802.11b PC-CARD"
> > -   version "U.S. Robotics", "IEEE 802.11b PC-CARD", "Version 01.02"
> > -#   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Longshine LCR-8531 11Mbps WLAN PCMCIA CARD"
> > -   version "OEM", "PRISM2 IEEE 802.11 PC-Card", "Version 01.02"
> > -#   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Philips 802.11b WLAN PCMCIA"
> > -   manfid 0x000b, 0x7300
> > -   bind "hostap_cs"
> > -
> > -card "Proxim RangeLAN"
> > -#   version "PROXIM", "RangeLAN-DS/LAN PC CARD"
> > -   manfid 0x0126, 0x8000
> > -   bind "hostap_cs"
> > -
> > -card "Buffalo WLI-CF-S11G"
> > -   version "BUFFALO", "WLI-CF-S11G"
> > -#  manfid 0x026f, 0x030b
> > -   bind "hostap_cs"
> > -
> > -card "Level-One WPC-0100"
> > -   version "Digital Data Communications", "WPC-0100", "Version 00.00"
> > -   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Belkin 802.11b WLAN PCMCIA"
> > -   version "Belkin", "11Mbps Wireless Notebook Network Adapter",
> "Version 01.02"
> > -   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Senao SL-2011CD/SL-2011CDPLUS"
> > -   version "INTERSIL", "HFA384x/IEEE", "Version 01.02"
> > -   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Fulbond Airbond XI-300B"
> > -   version " ", "IEEE 802.11 Wireless LAN/PC Card"
> > -   manfid 0xd601, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "Netgear MA401"
> > -   version "NETGEAR MA401 Wireless PC", "Card", "Version 01.00"
> > -#   manfid 0x0156, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "D-Link DWL-650 Rev. P1"
> > -   version "D-Link", "DWL-650 Wireless PC Card RevP", "ISL37101P-10",
> "A3"
> > -#   manfid 0x000b, 0x7110
> > -   bind "hostap_cs"
> > -
> > -card "SonicWALL Long Range Wireless Card"
> > -   version "SonicWALL", "Long Range Wireless Card", "ISL37100P", "1.0"
> > -   manfid 0x000b, 0x7100
> > -   bind "hostap_cs"
> > -
> > -card "Senao NL-2011CD PLUS Ext2 Mercury"
> > -   version "WLAN", "11Mbps_PC-Card_3.0", "ISL37100P", "Eval-RevA"
> > -   manfid 0x000b, 0x7100
> > -   bind "hostap_cs"
> > -
> > -card "Airvast WL100"
> > -   version "AIRVAST", "IEEE 802.11b Wireless PCMCIA Card", "HFA3863"
> > -   manfid 0x50c2, 0x0001
> > -   bind "hostap_cs"
> > -
> > -card "Microsoft Wireless Notebook Adapter MN-520 1.0.3"
> > -   version "Microsoft", "Wireless Notebook Adapter MN-520", "", "1.0.3"
> > -   manfid 0x02d2, 0x0001
> > -   bind "hostap_cs"
> > -
> > -card "NETGEAR MA401RA"
> > -   version "NETGEAR MA401RA Wireless PC", "Card", "ISL37300P",
> "Eval-RevA"
> > -   manfid 0x000b, 0x7300
> > -   bind "hostap_cs"
> > -
> > -card "Allied Telesyn AT-WCL452"
> > -   version "Allied Telesyn", "AT-WCL452 Wireless PCMCIA Radio", "Ver.
> 1.00"
> > -   manfid 0xc00f, 0x0000
> > -   bind "hostap_cs"
> > -
> > -card "corega WL PCCL-11"
> > -   version "corega", "WL PCCL-11", "ISL37300P", "RevA"
> > -   manfid 0xc00f, 0x0000
> > -   bind "hostap_cs"
> > -
> > -card "SanDisk ConnectPlus"
> > -   version "SanDisk", "ConnectPlus"
> > -   manfid 0xd601, 0x0101
> > -   bind "hostap_cs" to 0
> > -   bind "ide-cs" to 1
> > -
> > -card "ASUS WL-100 8011b WLAN PC Card"
> > -   version "ASUS", "802_11b_PC_CARD_25", "Version 01.00"
> > -   manfid 0x02aa, 0x0002
> > -   bind "hostap_cs"
> > -
> > -card "ZyXel Zyair B-101 802.11b WLAN card"
> > -   version " ", "IEEE 802.11 Wireless LAN/PC Card"
> > -   manfid 0xd601, 0x0010
> > -   bind "hostap_cs"
> > -
> > -card "WLAN PRISM PCMCIA CARD 37300P RevB6"
> > -   version "WLAN", "PRISM PCMCIA CARD", "37300P", "Revision B6"
> > -   manfid 0x50c2, 0x7300
> > -   bind "hostap_cs"
> > -
> > -
> > -# Optional configuration parameters for hostap_cs.o
> > -# module "hostap_cs" opts "channel=3 iw_mode=3 essid=test
> ignore_cis_vcc=0"
> > diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.modalias
> b/meta/recipes-bsp/hostap/files/hostap_cs.modalias
> > deleted file mode 100644
> > index 28483515103..00000000000
> > --- a/meta/recipes-bsp/hostap/files/hostap_cs.modalias
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -# product info: "Pretec", "CompactWLAN Card 802.11b", "2.5"
> > -alias pcmcia:m0156c0002f06fn00pfn00pa1CADD3
> E5pbE697636Cpc7A5BFCF1pd00000000 hostap_cs
> > -
> > -# manufacturer ID which exist in orinoco_cs AND in hostap_cs
> > -alias pcmcia:m000Bc7100f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m000Bc7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m0126c8000f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m0138c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m0250c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m0274c1612f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m0274c1613f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m028Ac0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m02AAc0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:m50C2c7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:mD601c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -alias pcmcia:mD601c0005f06fn00pfn00pa*pb*pc*pd* hostap_cs
> > -
> > -# product info: "Linksys", "Wireless CompactFlash Card", "", ""
> > -alias pcmcia:m028Ac0673f06fn00pfn00pa0733CC
> 81pb0C52F395pc00000000pd00000000 hostap_cs
> > -
> > -# product info:"PLANEX COMMUNICATION INC","PLANEX GW-CF11X Wireless CF
> Card", "", ""
> > -alias pcmcia:mD601c0010f06fn00pfn00pa4703CF
> 68pbFAD7318Dpc00000000pd00000000 hostap_cs
> > -
> > -# 0x0156, 0x0002 and "Version 01.02" only appear for Prism based cards.
> > -alias pcmcia:m0156c0002f06fn00pfn00pa*pb*pc4B74BAA0pd00000000 hostap_cs
> > -
> > -# "BUFFALO", "WLI-CF-S11G", "", ""
> > -alias pcmcia:m026Fc030Bf06fn00pfn00pa2DECEC
> E3pb82067C18pc00000000pd00000000 hostap_cs
> > diff --git a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
> b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
> > deleted file mode 100644
> > index e1d4c5477cb..00000000000
> > --- a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -SUMMARY = "Configuration files for HostAP (wifi) driver"
> > -DESCRIPTION = "PCMCIA-cs configuration files for wireless LAN cards
> based on Intersil's Prism2/2.5/3 chipset."
> > -SECTION = "kernel/modules"
> > -LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f8
> 33"
> > -PR = "r15"
> > -
> > -SRC_URI = "file://hostap_cs.modalias \
> > -           file://COPYING.patch"
> > -
> > -inherit allarch
> > -
> > -S = "${WORKDIR}"
> > -
> > -do_compile() {
> > -}
> > -
> > -do_install() {
> > -     install -d ${D}${sysconfdir}/modprobe.d
> > -
> > -     install -m 0644 ${WORKDIR}/hostap_cs.modalias
> ${D}${sysconfdir}/modprobe.d/hostap_cs.conf
> > -}
> > -
> > diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-
> Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
> b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-
> Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
> > deleted file mode 100644
> > index b44dca3ec8b..00000000000
> > --- a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-
> Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 742fb110d9841a04b3ced256b0bf80ff304dcaff Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Mon, 31 Aug 2015 05:45:08 +0000
> > -Subject: [PATCH] Define _u32/__s32/__u16/__s16/__u8 in terms of c99
> types
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > -Upstream-Status: Pending
> > -
> > - wireless_copy.h | 10 +++++-----
> > - 1 file changed, 5 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/wireless_copy.h b/wireless_copy.h
> > -index 8208258..1171a35 100644
> > ---- a/wireless_copy.h
> > -+++ b/wireless_copy.h
> > -@@ -86,11 +86,11 @@
> > - #else
> > - #include <sys/types.h>
> > - #include <net/if.h>
> > --typedef __uint32_t __u32;
> > --typedef __int32_t __s32;
> > --typedef __uint16_t __u16;
> > --typedef __int16_t __s16;
> > --typedef __uint8_t __u8;
> > -+typedef u_int32_t __u32;
> > -+typedef int32_t __s32;
> > -+typedef u_int16_t __u16;
> > -+typedef int16_t __s16;
> > -+typedef u_int8_t __u8;
> > - #ifndef __user
> > - #define __user
> > - #endif /* __user */
> > ---
> > -2.5.1
> > -
> > diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
> b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
> > deleted file mode 100644
> > index 3e99d0d92e3..00000000000
> > --- a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -Obey LDFLAGS
> > -
> > -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > -Upstream-Status: Pending
> > -
> > ---- hostap-utils-0.4.7.orig/Makefile
> > -+++ hostap-utils-0.4.7/Makefile
> > -@@ -14,17 +14,17 @@ prism2_srec.o: prism2_srec.c util.h
> > - hostap_crypt_conf: hostap_crypt_conf.c
> > -
> > - hostap_diag: hostap_diag.o util.o
> > --    $(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o
> > -+    $(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.o util.o
> > -
> > - hostap_diag.o: hostap_diag.c util.h
> > -
> > - util.o: util.c util.h
> > -
> > - hostap_io_debug: hostap_io_debug.c
> > --    $(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c
> > -+    $(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_io_debug.c
> > -
> > - hostap_rid: hostap_rid.o util.o
> > --    $(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o
> > -+    $(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o util.o
> > -
> > - hostap_rid.o: hostap_rid.c util.h
> > diff --git a/meta/recipes-bsp/hostap/hostap-utils.inc
> b/meta/recipes-bsp/hostap/hostap-utils.inc
> > deleted file mode 100644
> > index 6d98e3a888b..00000000000
> > --- a/meta/recipes-bsp/hostap/hostap-utils.inc
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -SUMMARY = "User mode helpers for the hostap driver"
> > -DESCRIPTION = "The hostap driver supports Host AP mode, it allows for
> IEEE 802.11 \
> > -management functions on the host computer and allows the system to act
> as an access point."
> > -HOMEPAGE = "https://w1.fi"
> > -LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3
> \
> > -                     file://util.c;beginline=1;endline=9;md5=
> d3b9280851302e5ba34e5fb717489b6d"
> > -SECTION = "kernel/userland"
> > -PR = "r4"
> > -
> > -SRC_URI = "https://w1.fi/releases/hostap-utils-${PV}.tar.gz \
> > -           file://hostap-fw-load.patch \
> > -           file://0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
> \
> > -"
> > -S = "${WORKDIR}/hostap-utils-${PV}"
> > -
> > -BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load
> hostap_io_debug \
> > -         hostap_rid prism2_param prism2_srec split_combined_hex"
> > -
> > -do_install() {
> > -     install -d ${D}${sbindir}/
> > -     for f in ${BINARIES}
> > -     do
> > -             install -m 0755 $f ${D}${sbindir}/
> > -     done
> > -}
> > -
> > diff --git a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
> b/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
> > deleted file mode 100644
> > index be5481f6f7b..00000000000
> > --- a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -require hostap-utils.inc
> > -
> > -SRC_URI += "file://ldflags.patch"
> > -SRC_URI[md5sum] = "afe041581b8f01666e353bec20917c85"
> > -SRC_URI[sha256sum] = "c6f598d8e356c1620fa009eca0a700
> bf1105e16817eefd77d891994261009355"
>
>

--001a113fd83a4e0dde055da661e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, hostap-utils is just the userspace bit of the prism dr=
iver, and depends on wireless-tools.=C2=A0 I&#39;ll also reiterate that his=
 hardware is a decade old.=C2=A0 It predates 802.11g...<div><br></div><div>=
Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n 10 November 2017 at 19:01, akuster808 <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 11/10/2017 07:55 AM, Ross Burton wrote:<br>
&gt; HostAP is the user-space part of the Intersil Prism 2/2.5/3 wifi chips=
et.=C2=A0 It&#39;s<br>
&gt; also a decade old and obsolete, so remove it from oe-core.<br>
</span>Would it be beneficial to reference what replaced it ? I think its<b=
r>
wireless-tools if I am not mistaken<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/<wbr>distro_alias.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 meta/conf/distro/include/<wbr>maintainers.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/files/<wbr>COPYING.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 346 ---------------------<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/files/<wbr>hostap-fw-load.patch |=C2=A0 =
22 --<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/files/<wbr>hostap_cs.conf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 193 ------------<br>
&gt;=C2=A0 .../hostap/files/hostap_cs.<wbr>conf-upstream=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 191 ------------<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/files/<wbr>hostap_cs.modalias=C2=A0 =C2=
=A0|=C2=A0 28 --<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/<a href=3D"http://hostap-conf_1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">hostap<wbr>-conf_1.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
&gt;=C2=A0 ...-__s32-__u16-__s16-__u8-in-<wbr>terms-of-c99-t.patch |=C2=A0 =
36 ---<br>
&gt;=C2=A0 .../hostap/hostap-utils-0.4.7/<wbr>ldflags.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 27 --<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/<wbr>hostap-utils.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27 --<br>
&gt;=C2=A0 meta/recipes-bsp/hostap/<a href=3D"http://hostap-utils_0.4.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">hostap<wbr>-utils_0.4.7.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 12 files changed, 901 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/files/<wbr>COPYING.pa=
tch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/files/<wbr>hostap-fw-=
load.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/files/<wbr>hostap_cs.=
conf<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/files/<wbr>hostap_cs.=
conf-upstream<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/files/<wbr>hostap_cs.=
modalias<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/<a href=3D"http://hos=
tap-conf_1.0.bb" rel=3D"noreferrer" target=3D"_blank">hostap<wbr>-conf_1.0.=
bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4=
.7/0001-<wbr>Define-_u32-__s32-__u16-__s16-<wbr>__u8-in-terms-of-c99-t.patc=
h<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4=
.7/ldflags.<wbr>patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/<wbr>hostap-utils.inc=
<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-bsp/hostap/<a href=3D"http://hos=
tap-utils_0.4.7.bb" rel=3D"noreferrer" target=3D"_blank">hostap<wbr>-utils_=
0.4.7.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/<wbr>distro_alias.inc b/meta/con=
f/distro/include/<wbr>distro_alias.inc<br>
&gt; index 3b0411c3547..1a217daa390 100644<br>
&gt; --- a/meta/conf/distro/include/<wbr>distro_alias.inc<br>
&gt; +++ b/meta/conf/distro/include/<wbr>distro_alias.inc<br>
&gt; @@ -138,7 +138,6 @@ DISTRO_PN_ALIAS_pn-gtk-sato-<wbr>engine =3D &quot;=
OpenedHand&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-gtk-icon-<wbr>utils-native =3D &quot;OSPDT&qu=
ot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-systemd-<wbr>boot =3D &quot;Ubuntu=3Dsystemd-=
boot Fedora=3Dsystemd-boot&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-hello-mod =3D &quot;OE-Core&quot;<br>
&gt; -DISTRO_PN_ALIAS_pn-hostap-<wbr>conf =3D &quot;OE-Core&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-hwlatdetect =3D &quot;OSPDT&quot;<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-icecc-<wbr>create-env =3D &quot;OE-Core&quot;=
<br>
&gt;=C2=A0 DISTRO_PN_ALIAS_pn-init-<wbr>ifupdown =3D &quot;Debian=3Difupdow=
n Ubuntu=3Difupdown&quot;<br>
&gt; diff --git a/meta/conf/distro/include/<wbr>maintainers.inc b/meta/conf=
/distro/include/<wbr>maintainers.inc<br>
&gt; index 38789b217cd..856a6b763bf 100644<br>
&gt; --- a/meta/conf/distro/include/<wbr>maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/<wbr>maintainers.inc<br>
&gt; @@ -262,8 +262,6 @@ RECIPE_MAINTAINER_pn-harfbuzz =3D &quot;Maxin B. J=
ohn &lt;<a href=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&gt=
;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-hdparm =3D &quot;Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denys@ti.com">denys@ti.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-help2man-<wbr>native =3D &quot;Hongxu Jia &=
lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>=
&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-hicolor-<wbr>icon-theme =3D &quot;Jussi Kuk=
konen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.=
com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-hostap-<wbr>conf =3D &quot;Maxin B. John &lt;<a =
href=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-hostap-<wbr>utils =3D &quot;Maxin B. John &lt;<a=
 href=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&gt;&quot;<br=
>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-<wbr>hwlatdetect =3D &quot;Alexander Kanavi=
n &lt;<a href=3D"mailto:alexander.kanavin@intel.com">alexander.kanavin@inte=
l.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-i2c-tools =3D &quot;Maxin B. John &lt;<a hr=
ef=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-icecc-<wbr>create-env-native =3D &quot;Alex=
ander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@intel.com">alexander.=
kanavin@intel.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>files/COPYING.patch b/meta/r=
ecipes-bsp/hostap/<wbr>files/COPYING.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 05c70c92e5d..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>files/COPYING.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,346 +0,0 @@<br>
&gt; -Upstream-Status: Inappropriate [other]<br>
&gt; -<br>
&gt; -diff -ruN hostap-conf-1.0-orig/COPYING hostap-conf-1.0/COPYING<br>
&gt; ---- hostap-conf-1.0-orig/COPYING=C2=A0 =C2=A0 =C2=A01970-01-01 08:00:=
00.000000000 +0800<br>
&gt; -+++ hostap-conf-1.0/COPYING=C2=A0 2010-12-09 16:36:48.000000000 +0800=
<br>
&gt; -@@ -0,0 +1,340 @@<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNU GENERAL =
PUBLIC LICENSE<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Version 2, June 1991<br>
&gt; -+<br>
&gt; -+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A059 Temple Place, Suite 330, Boston, MA=C2=A0 02111-1307=C2=
=A0 USA<br>
&gt; -+ Everyone is permitted to copy and distribute verbatim copies<br>
&gt; -+ of this license document, but changing it is not allowed.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Preamble<br>
&gt; -+<br>
&gt; -+=C2=A0 The licenses for most software are designed to take away your=
<br>
&gt; -+freedom to share and change it.=C2=A0 By contrast, the GNU General P=
ublic<br>
&gt; -+License is intended to guarantee your freedom to share and change fr=
ee<br>
&gt; -+software--to make sure the software is free for all its users.=C2=A0=
 This<br>
&gt; -+General Public License applies to most of the Free Software<br>
&gt; -+Foundation&#39;s software and to any other program whose authors com=
mit to<br>
&gt; -+using it.=C2=A0 (Some other Free Software Foundation software is cov=
ered by<br>
&gt; -+the GNU Library General Public License instead.)=C2=A0 You can apply=
 it to<br>
&gt; -+your programs, too.<br>
&gt; -+<br>
&gt; -+=C2=A0 When we speak of free software, we are referring to freedom, =
not<br>
&gt; -+price.=C2=A0 Our General Public Licenses are designed to make sure t=
hat you<br>
&gt; -+have the freedom to distribute copies of free software (and charge f=
or<br>
&gt; -+this service if you wish), that you receive source code or can get i=
t<br>
&gt; -+if you want it, that you can change the software or use pieces of it=
<br>
&gt; -+in new free programs; and that you know you can do these things.<br>
&gt; -+<br>
&gt; -+=C2=A0 To protect your rights, we need to make restrictions that for=
bid<br>
&gt; -+anyone to deny you these rights or to ask you to surrender the right=
s.<br>
&gt; -+These restrictions translate to certain responsibilities for you if =
you<br>
&gt; -+distribute copies of the software, or if you modify it.<br>
&gt; -+<br>
&gt; -+=C2=A0 For example, if you distribute copies of such a program, whet=
her<br>
&gt; -+gratis or for a fee, you must give the recipients all the rights tha=
t<br>
&gt; -+you have.=C2=A0 You must make sure that they, too, receive or can ge=
t the<br>
&gt; -+source code.=C2=A0 And you must show them these terms so they know t=
heir<br>
&gt; -+rights.<br>
&gt; -+<br>
&gt; -+=C2=A0 We protect your rights with two steps: (1) copyright the soft=
ware, and<br>
&gt; -+(2) offer you this license which gives you legal permission to copy,=
<br>
&gt; -+distribute and/or modify the software.<br>
&gt; -+<br>
&gt; -+=C2=A0 Also, for each author&#39;s protection and ours, we want to m=
ake certain<br>
&gt; -+that everyone understands that there is no warranty for this free<br=
>
&gt; -+software.=C2=A0 If the software is modified by someone else and pass=
ed on, we<br>
&gt; -+want its recipients to know that what they have is not the original,=
 so<br>
&gt; -+that any problems introduced by others will not reflect on the origi=
nal<br>
&gt; -+authors&#39; reputations.<br>
&gt; -+<br>
&gt; -+=C2=A0 Finally, any free program is threatened constantly by softwar=
e<br>
&gt; -+patents.=C2=A0 We wish to avoid the danger that redistributors of a =
free<br>
&gt; -+program will individually obtain patent licenses, in effect making t=
he<br>
&gt; -+program proprietary.=C2=A0 To prevent this, we have made it clear th=
at any<br>
&gt; -+patent must be licensed for everyone&#39;s free use or not licensed =
at all.<br>
&gt; -+<br>
&gt; -+=C2=A0 The precise terms and conditions for copying, distribution an=
d<br>
&gt; -+modification follow.<br>
&gt; -+=0C<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNU GENERAL =
PUBLIC LICENSE<br>
&gt; -+=C2=A0 =C2=A0TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODI=
FICATION<br>
&gt; -+<br>
&gt; -+=C2=A0 0. This License applies to any program or other work which co=
ntains<br>
&gt; -+a notice placed by the copyright holder saying it may be distributed=
<br>
&gt; -+under the terms of this General Public License.=C2=A0 The &quot;Prog=
ram&quot;, below,<br>
&gt; -+refers to any such program or work, and a &quot;work based on the Pr=
ogram&quot;<br>
&gt; -+means either the Program or any derivative work under copyright law:=
<br>
&gt; -+that is to say, a work containing the Program or a portion of it,<br=
>
&gt; -+either verbatim or with modifications and/or translated into another=
<br>
&gt; -+language.=C2=A0 (Hereinafter, translation is included without limita=
tion in<br>
&gt; -+the term &quot;modification&quot;.)=C2=A0 Each licensee is addressed=
 as &quot;you&quot;.<br>
&gt; -+<br>
&gt; -+Activities other than copying, distribution and modification are not=
<br>
&gt; -+covered by this License; they are outside its scope.=C2=A0 The act o=
f<br>
&gt; -+running the Program is not restricted, and the output from the Progr=
am<br>
&gt; -+is covered only if its contents constitute a work based on the<br>
&gt; -+Program (independent of having been made by running the Program).<br=
>
&gt; -+Whether that is true depends on what the Program does.<br>
&gt; -+<br>
&gt; -+=C2=A0 1. You may copy and distribute verbatim copies of the Program=
&#39;s<br>
&gt; -+source code as you receive it, in any medium, provided that you<br>
&gt; -+conspicuously and appropriately publish on each copy an appropriate<=
br>
&gt; -+copyright notice and disclaimer of warranty; keep intact all the<br>
&gt; -+notices that refer to this License and to the absence of any warrant=
y;<br>
&gt; -+and give any other recipients of the Program a copy of this License<=
br>
&gt; -+along with the Program.<br>
&gt; -+<br>
&gt; -+You may charge a fee for the physical act of transferring a copy, an=
d<br>
&gt; -+you may at your option offer warranty protection in exchange for a f=
ee.<br>
&gt; -+<br>
&gt; -+=C2=A0 2. You may modify your copy or copies of the Program or any p=
ortion<br>
&gt; -+of it, thus forming a work based on the Program, and copy and<br>
&gt; -+distribute such modifications or work under the terms of Section 1<b=
r>
&gt; -+above, provided that you also meet all of these conditions:<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 a) You must cause the modified files to carry prominen=
t notices<br>
&gt; -+=C2=A0 =C2=A0 stating that you changed the files and the date of any=
 change.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 b) You must cause any work that you distribute or publ=
ish, that in<br>
&gt; -+=C2=A0 =C2=A0 whole or in part contains or is derived from the Progr=
am or any<br>
&gt; -+=C2=A0 =C2=A0 part thereof, to be licensed as a whole at no charge t=
o all third<br>
&gt; -+=C2=A0 =C2=A0 parties under the terms of this License.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 c) If the modified program normally reads commands int=
eractively<br>
&gt; -+=C2=A0 =C2=A0 when run, you must cause it, when started running for =
such<br>
&gt; -+=C2=A0 =C2=A0 interactive use in the most ordinary way, to print or =
display an<br>
&gt; -+=C2=A0 =C2=A0 announcement including an appropriate copyright notice=
 and a<br>
&gt; -+=C2=A0 =C2=A0 notice that there is no warranty (or else, saying that=
 you provide<br>
&gt; -+=C2=A0 =C2=A0 a warranty) and that users may redistribute the progra=
m under<br>
&gt; -+=C2=A0 =C2=A0 these conditions, and telling the user how to view a c=
opy of this<br>
&gt; -+=C2=A0 =C2=A0 License.=C2=A0 (Exception: if the Program itself is in=
teractive but<br>
&gt; -+=C2=A0 =C2=A0 does not normally print such an announcement, your wor=
k based on<br>
&gt; -+=C2=A0 =C2=A0 the Program is not required to print an announcement.)=
<br>
&gt; -+=0C<br>
&gt; -+These requirements apply to the modified work as a whole.=C2=A0 If<b=
r>
&gt; -+identifiable sections of that work are not derived from the Program,=
<br>
&gt; -+and can be reasonably considered independent and separate works in<b=
r>
&gt; -+themselves, then this License, and its terms, do not apply to those<=
br>
&gt; -+sections when you distribute them as separate works.=C2=A0 But when =
you<br>
&gt; -+distribute the same sections as part of a whole which is a work base=
d<br>
&gt; -+on the Program, the distribution of the whole must be on the terms o=
f<br>
&gt; -+this License, whose permissions for other licensees extend to the<br=
>
&gt; -+entire whole, and thus to each and every part regardless of who wrot=
e it.<br>
&gt; -+<br>
&gt; -+Thus, it is not the intent of this section to claim rights or contes=
t<br>
&gt; -+your rights to work written entirely by you; rather, the intent is t=
o<br>
&gt; -+exercise the right to control the distribution of derivative or<br>
&gt; -+collective works based on the Program.<br>
&gt; -+<br>
&gt; -+In addition, mere aggregation of another work not based on the Progr=
am<br>
&gt; -+with the Program (or with a work based on the Program) on a volume o=
f<br>
&gt; -+a storage or distribution medium does not bring the other work under=
<br>
&gt; -+the scope of this License.<br>
&gt; -+<br>
&gt; -+=C2=A0 3. You may copy and distribute the Program (or a work based o=
n it,<br>
&gt; -+under Section 2) in object code or executable form under the terms o=
f<br>
&gt; -+Sections 1 and 2 above provided that you also do one of the followin=
g:<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 a) Accompany it with the complete corresponding machin=
e-readable<br>
&gt; -+=C2=A0 =C2=A0 source code, which must be distributed under the terms=
 of Sections<br>
&gt; -+=C2=A0 =C2=A0 1 and 2 above on a medium customarily used for softwar=
e interchange; or,<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 b) Accompany it with a written offer, valid for at lea=
st three<br>
&gt; -+=C2=A0 =C2=A0 years, to give any third party, for a charge no more t=
han your<br>
&gt; -+=C2=A0 =C2=A0 cost of physically performing source distribution, a c=
omplete<br>
&gt; -+=C2=A0 =C2=A0 machine-readable copy of the corresponding source code=
, to be<br>
&gt; -+=C2=A0 =C2=A0 distributed under the terms of Sections 1 and 2 above =
on a medium<br>
&gt; -+=C2=A0 =C2=A0 customarily used for software interchange; or,<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 c) Accompany it with the information you received as t=
o the offer<br>
&gt; -+=C2=A0 =C2=A0 to distribute corresponding source code.=C2=A0 (This a=
lternative is<br>
&gt; -+=C2=A0 =C2=A0 allowed only for noncommercial distribution and only i=
f you<br>
&gt; -+=C2=A0 =C2=A0 received the program in object code or executable form=
 with such<br>
&gt; -+=C2=A0 =C2=A0 an offer, in accord with Subsection b above.)<br>
&gt; -+<br>
&gt; -+The source code for a work means the preferred form of the work for<=
br>
&gt; -+making modifications to it.=C2=A0 For an executable work, complete s=
ource<br>
&gt; -+code means all the source code for all modules it contains, plus any=
<br>
&gt; -+associated interface definition files, plus the scripts used to<br>
&gt; -+control compilation and installation of the executable.=C2=A0 Howeve=
r, as a<br>
&gt; -+special exception, the source code distributed need not include<br>
&gt; -+anything that is normally distributed (in either source or binary<br=
>
&gt; -+form) with the major components (compiler, kernel, and so on) of the=
<br>
&gt; -+operating system on which the executable runs, unless that component=
<br>
&gt; -+itself accompanies the executable.<br>
&gt; -+<br>
&gt; -+If distribution of executable or object code is made by offering<br>
&gt; -+access to copy from a designated place, then offering equivalent<br>
&gt; -+access to copy the source code from the same place counts as<br>
&gt; -+distribution of the source code, even though third parties are not<b=
r>
&gt; -+compelled to copy the source along with the object code.<br>
&gt; -+=0C<br>
&gt; -+=C2=A0 4. You may not copy, modify, sublicense, or distribute the Pr=
ogram<br>
&gt; -+except as expressly provided under this License.=C2=A0 Any attempt<b=
r>
&gt; -+otherwise to copy, modify, sublicense or distribute the Program is<b=
r>
&gt; -+void, and will automatically terminate your rights under this Licens=
e.<br>
&gt; -+However, parties who have received copies, or rights, from you under=
<br>
&gt; -+this License will not have their licenses terminated so long as such=
<br>
&gt; -+parties remain in full compliance.<br>
&gt; -+<br>
&gt; -+=C2=A0 5. You are not required to accept this License, since you hav=
e not<br>
&gt; -+signed it.=C2=A0 However, nothing else grants you permission to modi=
fy or<br>
&gt; -+distribute the Program or its derivative works.=C2=A0 These actions =
are<br>
&gt; -+prohibited by law if you do not accept this License.=C2=A0 Therefore=
, by<br>
&gt; -+modifying or distributing the Program (or any work based on the<br>
&gt; -+Program), you indicate your acceptance of this License to do so, and=
<br>
&gt; -+all its terms and conditions for copying, distributing or modifying<=
br>
&gt; -+the Program or works based on it.<br>
&gt; -+<br>
&gt; -+=C2=A0 6. Each time you redistribute the Program (or any work based =
on the<br>
&gt; -+Program), the recipient automatically receives a license from the<br=
>
&gt; -+original licensor to copy, distribute or modify the Program subject =
to<br>
&gt; -+these terms and conditions.=C2=A0 You may not impose any further<br>
&gt; -+restrictions on the recipients&#39; exercise of the rights granted h=
erein.<br>
&gt; -+You are not responsible for enforcing compliance by third parties to=
<br>
&gt; -+this License.<br>
&gt; -+<br>
&gt; -+=C2=A0 7. If, as a consequence of a court judgment or allegation of =
patent<br>
&gt; -+infringement or for any other reason (not limited to patent issues),=
<br>
&gt; -+conditions are imposed on you (whether by court order, agreement or<=
br>
&gt; -+otherwise) that contradict the conditions of this License, they do n=
ot<br>
&gt; -+excuse you from the conditions of this License.=C2=A0 If you cannot<=
br>
&gt; -+distribute so as to satisfy simultaneously your obligations under th=
is<br>
&gt; -+License and any other pertinent obligations, then as a consequence y=
ou<br>
&gt; -+may not distribute the Program at all.=C2=A0 For example, if a paten=
t<br>
&gt; -+license would not permit royalty-free redistribution of the Program =
by<br>
&gt; -+all those who receive copies directly or indirectly through you, the=
n<br>
&gt; -+the only way you could satisfy both it and this License would be to<=
br>
&gt; -+refrain entirely from distribution of the Program.<br>
&gt; -+<br>
&gt; -+If any portion of this section is held invalid or unenforceable unde=
r<br>
&gt; -+any particular circumstance, the balance of the section is intended =
to<br>
&gt; -+apply and the section as a whole is intended to apply in other<br>
&gt; -+circumstances.<br>
&gt; -+<br>
&gt; -+It is not the purpose of this section to induce you to infringe any<=
br>
&gt; -+patents or other property right claims or to contest validity of any=
<br>
&gt; -+such claims; this section has the sole purpose of protecting the<br>
&gt; -+integrity of the free software distribution system, which is<br>
&gt; -+implemented by public license practices.=C2=A0 Many people have made=
<br>
&gt; -+generous contributions to the wide range of software distributed<br>
&gt; -+through that system in reliance on consistent application of that<br=
>
&gt; -+system; it is up to the author/donor to decide if he or she is willi=
ng<br>
&gt; -+to distribute software through any other system and a licensee canno=
t<br>
&gt; -+impose that choice.<br>
&gt; -+<br>
&gt; -+This section is intended to make thoroughly clear what is believed t=
o<br>
&gt; -+be a consequence of the rest of this License.<br>
&gt; -+=0C<br>
&gt; -+=C2=A0 8. If the distribution and/or use of the Program is restricte=
d in<br>
&gt; -+certain countries either by patents or by copyrighted interfaces, th=
e<br>
&gt; -+original copyright holder who places the Program under this License<=
br>
&gt; -+may add an explicit geographical distribution limitation excluding<b=
r>
&gt; -+those countries, so that distribution is permitted only in or among<=
br>
&gt; -+countries not thus excluded.=C2=A0 In such case, this License incorp=
orates<br>
&gt; -+the limitation as if written in the body of this License.<br>
&gt; -+<br>
&gt; -+=C2=A0 9. The Free Software Foundation may publish revised and/or ne=
w versions<br>
&gt; -+of the General Public License from time to time.=C2=A0 Such new vers=
ions will<br>
&gt; -+be similar in spirit to the present version, but may differ in detai=
l to<br>
&gt; -+address new problems or concerns.<br>
&gt; -+<br>
&gt; -+Each version is given a distinguishing version number.=C2=A0 If the =
Program<br>
&gt; -+specifies a version number of this License which applies to it and &=
quot;any<br>
&gt; -+later version&quot;, you have the option of following the terms and =
conditions<br>
&gt; -+either of that version or of any later version published by the Free=
<br>
&gt; -+Software Foundation.=C2=A0 If the Program does not specify a version=
 number of<br>
&gt; -+this License, you may choose any version ever published by the Free =
Software<br>
&gt; -+Foundation.<br>
&gt; -+<br>
&gt; -+=C2=A0 10. If you wish to incorporate parts of the Program into othe=
r free<br>
&gt; -+programs whose distribution conditions are different, write to the a=
uthor<br>
&gt; -+to ask for permission.=C2=A0 For software which is copyrighted by th=
e Free<br>
&gt; -+Software Foundation, write to the Free Software Foundation; we somet=
imes<br>
&gt; -+make exceptions for this.=C2=A0 Our decision will be guided by the t=
wo goals<br>
&gt; -+of preserving the free status of all derivatives of our free softwar=
e and<br>
&gt; -+of promoting the sharing and reuse of software generally.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NO WARRANTY<br>
&gt; -+<br>
&gt; -+=C2=A0 11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS =
NO WARRANTY<br>
&gt; -+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.=C2=A0 EX=
CEPT WHEN<br>
&gt; -+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTI=
ES<br>
&gt; -+PROVIDE THE PROGRAM &quot;AS IS&quot; WITHOUT WARRANTY OF ANY KIND, =
EITHER EXPRESSED<br>
&gt; -+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF=
<br>
&gt; -+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 THE ENTI=
RE RISK AS<br>
&gt; -+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.=C2=A0 SHO=
ULD THE<br>
&gt; -+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVIC=
ING,<br>
&gt; -+REPAIR OR CORRECTION.<br>
&gt; -+<br>
&gt; -+=C2=A0 12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED T=
O IN WRITING<br>
&gt; -+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR<=
br>
&gt; -+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DA=
MAGES,<br>
&gt; -+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES =
ARISING<br>
&gt; -+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LI=
MITED<br>
&gt; -+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINE=
D BY<br>
&gt; -+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY=
 OTHER<br>
&gt; -+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF TH=
E<br>
&gt; -+POSSIBILITY OF SUCH DAMAGES.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0END OF=
 TERMS AND CONDITIONS<br>
&gt; -+=0C<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 How to Apply These Terms to Your New Pro=
grams<br>
&gt; -+<br>
&gt; -+=C2=A0 If you develop a new program, and you want it to be of the gr=
eatest<br>
&gt; -+possible use to the public, the best way to achieve this is to make =
it<br>
&gt; -+free software which everyone can redistribute and change under these=
 terms.<br>
&gt; -+<br>
&gt; -+=C2=A0 To do so, attach the following notices to the program.=C2=A0 =
It is safest<br>
&gt; -+to attach them to the start of each source file to most effectively<=
br>
&gt; -+convey the exclusion of warranty; and each file should have at least=
<br>
&gt; -+the &quot;copyright&quot; line and a pointer to where the full notic=
e is found.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 &lt;one line to give the program&#39;s name and a brie=
f idea of what it does.&gt;<br>
&gt; -+=C2=A0 =C2=A0 Copyright (C) &lt;year&gt;=C2=A0 &lt;name of author&gt=
;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 This program is free software; you can redistribute it=
 and/or modify<br>
&gt; -+=C2=A0 =C2=A0 it under the terms of the GNU General Public License a=
s published by<br>
&gt; -+=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of the =
License, or<br>
&gt; -+=C2=A0 =C2=A0 (at your option) any later version.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 This program is distributed in the hope that it will b=
e useful,<br>
&gt; -+=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied war=
ranty of<br>
&gt; -+=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=
=C2=A0 See the<br>
&gt; -+=C2=A0 =C2=A0 GNU General Public License for more details.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 You should have received a copy of the GNU General Pub=
lic License<br>
&gt; -+=C2=A0 =C2=A0 along with this program; if not, write to the Free Sof=
tware<br>
&gt; -+=C2=A0 =C2=A0 Foundation, Inc., 59 Temple Place, Suite 330, Boston, =
MA=C2=A0 02111-1307=C2=A0 USA<br>
&gt; -+<br>
&gt; -+<br>
&gt; -+Also add information on how to contact you by electronic and paper m=
ail.<br>
&gt; -+<br>
&gt; -+If the program is interactive, make it output a short notice like th=
is<br>
&gt; -+when it starts in an interactive mode:<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 Gnomovision version 69, Copyright (C) year name of aut=
hor<br>
&gt; -+=C2=A0 =C2=A0 Gnomovision comes with ABSOLUTELY NO WARRANTY; for det=
ails type `show w&#39;.<br>
&gt; -+=C2=A0 =C2=A0 This is free software, and you are welcome to redistri=
bute it<br>
&gt; -+=C2=A0 =C2=A0 under certain conditions; type `show c&#39; for detail=
s.<br>
&gt; -+<br>
&gt; -+The hypothetical commands `show w&#39; and `show c&#39; should show =
the appropriate<br>
&gt; -+parts of the General Public License.=C2=A0 Of course, the commands y=
ou use may<br>
&gt; -+be called something other than `show w&#39; and `show c&#39;; they c=
ould even be<br>
&gt; -+mouse-clicks or menu items--whatever suits your program.<br>
&gt; -+<br>
&gt; -+You should also get your employer (if you work as a programmer) or y=
our<br>
&gt; -+school, if any, to sign a &quot;copyright disclaimer&quot; for the p=
rogram, if<br>
&gt; -+necessary.=C2=A0 Here is a sample; alter the names:<br>
&gt; -+<br>
&gt; -+=C2=A0 Yoyodyne, Inc., hereby disclaims all copyright interest in th=
e program<br>
&gt; -+=C2=A0 `Gnomovision&#39; (which makes passes at compilers) written b=
y James Hacker.<br>
&gt; -+<br>
&gt; -+=C2=A0 &lt;signature of Ty Coon&gt;, 1 April 1989<br>
&gt; -+=C2=A0 Ty Coon, President of Vice<br>
&gt; -+<br>
&gt; -+This General Public License does not permit incorporating your progr=
am into<br>
&gt; -+proprietary programs.=C2=A0 If your program is a subroutine library,=
 you may<br>
&gt; -+consider it more useful to permit linking proprietary applications w=
ith the<br>
&gt; -+library.=C2=A0 If this is what you want to do, use the GNU Library G=
eneral<br>
&gt; -+Public License instead of this License.<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>files/hostap-fw-load.patch b=
/meta/recipes-bsp/hostap/<wbr>files/hostap-fw-load.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 050bdc113c4..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>files/hostap-fw-load.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,22 +0,0 @@<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Patch managed by <a href=3D"http://www.holgerschurig.de/patcher.htm=
l" rel=3D"noreferrer" target=3D"_blank">http://www.holgerschurig.de/<wbr>pa=
tcher.html</a><br>
&gt; -#<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [configuration]<br>
&gt; -<br>
&gt; ---- hostap-utils-0.2.4/hostap_fw_<wbr>load~hostap-fw-load<br>
&gt; -+++ hostap-utils-0.2.4/hostap_fw_<wbr>load<br>
&gt; -@@ -6,9 +6,9 @@<br>
&gt; - # Firmware images for the card<br>
&gt; - # TODO: could try to select correct firmware type automatically<br>
&gt; -<br>
&gt; --PRI=3D/etc/pcmcia/PM010102.HEX<br>
&gt; --STA=3D/etc/pcmcia/RF010802.HEX<br>
&gt; --PRISM2_SREC=3D/usr/local/bin/<wbr>prism2_srec<br>
&gt; -+PRI=3D/etc/pcmcia/pm010102.hex<br>
&gt; -+STA=3D/etc/pcmcia/rf010804.hex<br>
&gt; -+PRISM2_SREC=3D/usr/sbin/<wbr>prism2_srec<br>
&gt; -<br>
&gt; - set -e<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.conf b/meta/=
recipes-bsp/hostap/<wbr>files/hostap_cs.conf<br>
&gt; deleted file mode 100644<br>
&gt; index 8dda82aad35..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.conf<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,193 +0,0 @@<br>
&gt; -module &quot;hostap_cs&quot; opts &quot;channel=3D3 iw_mode=3D2 essid=
=3Dany ignore_cis_vcc=3D1&quot;<br>
&gt; -<br>
&gt; -card &quot;Actiontec 802CI2&quot;<br>
&gt; -=C2=A0 manfid 0x1668, 0x0101<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;AirWay 802.11 Adapter (PCMCIA)&quot;<br>
&gt; -=C2=A0 #version &quot;AirWay&quot;, &quot;802.11 Adapter (PCMCIA)&quo=
t;<br>
&gt; -=C2=A0 manfid 0x0261, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Asus SpaceLink WL110&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x02aa,0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -## <a href=3D"http://handhelds.org" rel=3D"noreferrer" target=3D"_bla=
nk">handhelds.org</a> bug 964<br>
&gt; -card &quot;Belkin F5D6060 Ethernet&quot;<br>
&gt; -=C2=A0 =C2=A0#version &quot;PCMCIA&quot;, &quot;11M WLAN Card v2.5&qu=
ot;, &quot;ISL37300P&quot;, &quot;RevA&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0274, 0x1612<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Compaq 11Mbps Wireless PC Card&quot;<br>
&gt; -=C2=A0 manfid 0x028a, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Compaq WL100 11 Mbps Wireless Adapter&quot;<br>
&gt; -=C2=A0 manfid 0x0138, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Compaq HNW-100 11 Mbps Wireless Adapter&quot;<br>
&gt; -=C2=A0 manfid 0x028a, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;D-Link DWL-650&quot;<br>
&gt; -=C2=A0 version &quot;D&quot;, &quot;Link DWL-650 11Mbps WLAN Card&quo=
t;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;D-Link DRC-650&quot;<br>
&gt; -=C2=A0 version &quot;D&quot;, &quot;Link DRC-650 11Mbps WLAN Card&quo=
t;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;D-Link DCF660&quot;<br>
&gt; -=C2=A0 manfid 0xd601, 0x0005<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Farallon SkyLINE&quot;<br>
&gt; -=C2=A0 version &quot;INTERSIL&quot;, &quot;HFA384x/IEEE&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;HyperLink Wireless PC Card 11Mbps&quot;<br>
&gt; -=C2=A0 version &quot;HyperLink&quot;, &quot;Wireless PC Card 11Mbps&q=
uot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -# card &quot;Intersil PRISM2 11 Mbps Wireless Adapter&quot;<br>
&gt; -#=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -#=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;LA4111 Spectrum24 Wireless LAN PC Card&quot;<br>
&gt; -=C2=A0 version &quot;Symbol Technologies&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WPC11 11Mbps 802.11b WLAN Card&quot;<br>
&gt; -=C2=A0 version &quot;Instant Wireless &quot;, &quot; Network PC CARD&=
quot;, &quot;Version 01.02&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WCF11 11Mbps 802.11b WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0274, 0x3301<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -## <a href=3D"http://handhelds.org" rel=3D"noreferrer" target=3D"_bla=
nk">handhelds.org</a> bug #790<br>
&gt; -card &quot;Linksys Wireless CompactFlash Card WCF12&quot;<br>
&gt; -=C2=A0 manfid 0x028a, 0x0673<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WLAN CF Card&quot;<br>
&gt; -=C2=A0 manfid 0x0274, 0x3301<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;NETGEAR MA701 Wireless CF Card&quot;<br>
&gt; -=C2=A0 manfid 0xd601, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Nortel Networks eMobility 802.11 Wireless Adapter&quot;<br=
>
&gt; -=C2=A0 manfid 0x01eb, 0x080a<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;PLANEX GeoWave GW-CF110&quot;<br>
&gt; -=C2=A0 version &quot;PLANEX&quot;, &quot;GeoWave/GW-CF110&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;PROXIM LAN PC CARD HARMONY 80211B&quot;<br>
&gt; -=C2=A0 version &quot;PROXIM&quot;, &quot;LAN PC CARD HARMONY 80211B&q=
uot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Proxim RangeLAN/DS&quot;<br>
&gt; -=C2=A0 version &quot;PROXIM&quot;,&quot;RangeLAN-DS/LAN PC CARD&quot;=
<br>
&gt; -=C2=A0 manfid 0x0126, 0x8000<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Safeway 802.11b Wireless Adapter&quot;<br>
&gt; -=C2=A0 manfid 0xd601, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;SAMSUNG 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 version &quot;SAMSUNG&quot;, &quot;11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -# needs firmware upload via hostap_fw_load<br>
&gt; -card &quot;SanDisk ConnectPlus OEM (0MB)&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0010<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -# needs special activation (&gt;=3Dhostap 0.3.2 only) plus firmware u=
pload<br>
&gt; -card &quot;SanDisk ConnectPlus w/ Memory&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;SanDisk&quot;, &quot;ConnectPlus&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0101<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot; to 0<br>
&gt; -#=C2=A0 =C2=A0bind &quot;ide-cs&quot; to 1<br>
&gt; -<br>
&gt; -card &quot;Senao/Origo 80211b WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x000b,0x7100<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Sitecom WL-007 WLAN CF Card&quot;<br>
&gt; -=C2=A0 manfid 0xd601, 0x0004<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;SMC2632 802.11 (prism2) Card&quot;<br>
&gt; -=C2=A0 version &quot;SMC&quot;, &quot;SMC2632W&quot;, &quot;Version 0=
1.02&quot;, &quot;&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;SpeedStream SS1021 Wireless Adapter&quot;<br>
&gt; -=C2=A0 #version &quot;Siemens&quot;, &quot;SpeedStream Wireless PCMCI=
A&quot;<br>
&gt; -=C2=A0 manfid 0x02ac, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;ZCOMAX AirRunner/XI-300&quot;<br>
&gt; -=C2=A0 #version &quot;ZCOMAX&quot;, &quot;AirRunner/XI-300&quot;<br>
&gt; -=C2=A0 manfid 0xd601, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Zonet ZCF1100&quot;<br>
&gt; -=C2=A0 manfid 0x000b, 0x7100<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Wireless LAN Adapter Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Wireless&quot;, &quot;LAN Adapter&quot;, &=
quot;Version 01.02&quot;<br>
&gt; -#=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Ambicom WL1100C 11Mbs Card 802.11b&quot;<br>
&gt; -=C2=A0 version &quot;AmbiCom&quot;, &quot;WL1100C 802.11b CF-Card&quo=
t;, &quot;2.2&quot;<br>
&gt; -=C2=A0 manfid 0xd601,0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Ambicom WL1100C 11Mbs Card 802.11b&quot;<br>
&gt; -=C2=A0 manfid 0xd601,0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Sandisk Connect SDWCFB-000&quot;<br>
&gt; -=C2=A0 manfid 0xd601,0x0005<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -# Cards with Intersil firmware (Prism chipset)<br>
&gt; -<br>
&gt; -card &quot;Linksys WPC11 11Mbps 802.11b WLAN Card&quot;<br>
&gt; -=C2=A0 version &quot;The Linksys Group, Inc.&quot;, &quot;Instant Wir=
eless Network PC Card&quot;, &quot;ISL37300P&quot;, &quot;RevA&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys CompactFlash Wireless Card&quot;<br>
&gt; -=C2=A0 version &quot;Linksys&quot;, &quot;Wireless CompactFlash Card&=
quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;ACTIONTEC PRISM Wireless LAN PC Card&quot;<br>
&gt; -=C2=A0 version &quot;ACTIONTEC&quot;, &quot;PRISM Wireless LAN PC Car=
d&quot;<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WPC11 Version 3&quot;<br>
&gt; -=C2=A0 manfid 0x0274,0x1613<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;BENQ AWL100&quot;<br>
&gt; -=C2=A0 version &quot;BENQ&quot;, &quot;AWL100 PCMCIA ADAPTER&quot;<br=
>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Pretec WLAN&quot;<br>
&gt; -=C2=A0 version &quot;Pretec&quot;, &quot;CompactWLAN Card 802.11b&quo=
t;, &quot;2.5&quot;<br>
&gt; -=C2=A0 manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;TrendNet TEW PC16&quot;<br>
&gt; -=C2=A0 manfid 0x0274, 0x1601<br>
&gt; -=C2=A0 bind &quot;hostap_cs&quot;<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.conf-upstrea=
m b/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.conf-upstream<br>
&gt; deleted file mode 100644<br>
&gt; index 5b7385a7cbb..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.conf-upstream<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,191 +0,0 @@<br>
&gt; -device &quot;hostap_cs&quot;<br>
&gt; -=C2=A0 =C2=A0class &quot;network&quot; module &quot;hostap&quot;, &qu=
ot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Intersil PRISM2 Reference Design 11Mb/s WLAN Card&quot;<br=
>
&gt; -=C2=A0 =C2=A0version &quot;INTERSIL&quot;, &quot;HFA384x/IEEE&quot;<b=
r>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Compaq WL100 11Mb/s WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0138, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Compaq WL200&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Compaq&quot;, &quot;WL200_11Mbps_Wireless_=
PCI_<wbr>Card&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;EMTAC A2424i 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xc250, 0x0002<br>
&gt; -#=C2=A0 =C2=A0cis &quot;cis/Emtac.dat&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WPC11 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Instant Wireless &quot;, &quot; Network PC=
 CARD&quot;, &quot;Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WPC11 Ver 2.5 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0274, 0x1612<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WPC11 Ver 3 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0274, 0x1613<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Linksys WCF12 Wireless CompactFlash Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Linksys&quot;, &quot;Wireless CompactFlash=
 Card&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;D-Link DWL-650 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;D&quot;, &quot;Link DWL-650 11Mbps WLAN Ca=
rd&quot;, &quot;Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;D-Link DRC-650 11Mbps WLAN Card&quot;<br>
&gt; -#=C2=A0 version &quot;D&quot;, &quot;Link DRC-650 11Mbps WLAN Card&qu=
ot;, &quot;Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x028a, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;ZoomAir 4100 11Mb/s WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;ZoomAir 11Mbps High&quot;, &quot;Rate wire=
less Networking&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Addtron AWP-100 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Addtron&quot;, &quot;AWP-100 Wireless PCMC=
IA&quot;, &quot;Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Samsung SWL2000-N 11Mb/s WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0250, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;SMC 2632W 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;SMC&quot;, &quot;SMC2632W&quot;, &quot;Ver=
sion 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;BroMax Freeport 11Mbps WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Intersil&quot;, &quot;PRISM 2_5 PCMCIA ADA=
PTER&quot;, &quot;ISL37300P&quot;, &quot;Eval-RevA&quot;<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Z-Com XI300 11Mb/s WLAN Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Zcomax XI-325H 200mW&quot;<br>
&gt; -#=C2=A0 =C2=A0version &quot; &quot;, &quot;IEEE 802.11 Wireless LAN/P=
C Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0005<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;3Com AirConnect PCI 777A&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0101, 0x0777<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;U.S. Robotics IEEE 802.11b PC-CARD&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;U.S. Robotics&quot;, &quot;IEEE 802.11b PC=
-CARD&quot;, &quot;Version 01.02&quot;<br>
&gt; -#=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Longshine LCR-8531 11Mbps WLAN PCMCIA CARD&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;OEM&quot;, &quot;PRISM2 IEEE 802.11 PC-Car=
d&quot;, &quot;Version 01.02&quot;<br>
&gt; -#=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Philips 802.11b WLAN PCMCIA&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x000b, 0x7300<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Proxim RangeLAN&quot;<br>
&gt; -#=C2=A0 =C2=A0version &quot;PROXIM&quot;, &quot;RangeLAN-DS/LAN PC CA=
RD&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0126, 0x8000<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Buffalo WLI-CF-S11G&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;BUFFALO&quot;, &quot;WLI-CF-S11G&quot;<br>
&gt; -#=C2=A0 manfid 0x026f, 0x030b<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Level-One WPC-0100&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Digital Data Communications&quot;, &quot;W=
PC-0100&quot;, &quot;Version 00.00&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Belkin 802.11b WLAN PCMCIA&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Belkin&quot;, &quot;11Mbps Wireless Notebo=
ok Network Adapter&quot;, &quot;Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Senao SL-2011CD/SL-2011CDPLUS&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;INTERSIL&quot;, &quot;HFA384x/IEEE&quot;, =
&quot;Version 01.02&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Fulbond Airbond XI-300B&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot; &quot;, &quot;IEEE 802.11 Wireless LAN/PC=
 Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Netgear MA401&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;NETGEAR MA401 Wireless PC&quot;, &quot;Car=
d&quot;, &quot;Version 01.00&quot;<br>
&gt; -#=C2=A0 =C2=A0manfid 0x0156, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;D-Link DWL-650 Rev. P1&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;D-Link&quot;, &quot;DWL-650 Wireless PC Ca=
rd RevP&quot;, &quot;ISL37101P-10&quot;, &quot;A3&quot;<br>
&gt; -#=C2=A0 =C2=A0manfid 0x000b, 0x7110<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;SonicWALL Long Range Wireless Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;SonicWALL&quot;, &quot;Long Range Wireless=
 Card&quot;, &quot;ISL37100P&quot;, &quot;1.0&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x000b, 0x7100<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Senao NL-2011CD PLUS Ext2 Mercury&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;WLAN&quot;, &quot;11Mbps_PC-Card_3.0&quot;=
, &quot;ISL37100P&quot;, &quot;Eval-RevA&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x000b, 0x7100<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Airvast WL100&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;AIRVAST&quot;, &quot;IEEE 802.11b Wireless=
 PCMCIA Card&quot;, &quot;HFA3863&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x50c2, 0x0001<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Microsoft Wireless Notebook Adapter MN-520 1.0.3&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Microsoft&quot;, &quot;Wireless Notebook A=
dapter MN-520&quot;, &quot;&quot;, &quot;1.0.3&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x02d2, 0x0001<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;NETGEAR MA401RA&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;NETGEAR MA401RA Wireless PC&quot;, &quot;C=
ard&quot;, &quot;ISL37300P&quot;, &quot;Eval-RevA&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x000b, 0x7300<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;Allied Telesyn AT-WCL452&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;Allied Telesyn&quot;, &quot;AT-WCL452 Wire=
less PCMCIA Radio&quot;, &quot;Ver. 1.00&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xc00f, 0x0000<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;corega WL PCCL-11&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;corega&quot;, &quot;WL PCCL-11&quot;, &quo=
t;ISL37300P&quot;, &quot;RevA&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xc00f, 0x0000<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;SanDisk ConnectPlus&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;SanDisk&quot;, &quot;ConnectPlus&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0101<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot; to 0<br>
&gt; -=C2=A0 =C2=A0bind &quot;ide-cs&quot; to 1<br>
&gt; -<br>
&gt; -card &quot;ASUS WL-100 8011b WLAN PC Card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;ASUS&quot;, &quot;802_11b_PC_CARD_25&quot;=
, &quot;Version 01.00&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x02aa, 0x0002<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;ZyXel Zyair B-101 802.11b WLAN card&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot; &quot;, &quot;IEEE 802.11 Wireless LAN/PC=
 Card&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0xd601, 0x0010<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -card &quot;WLAN PRISM PCMCIA CARD 37300P RevB6&quot;<br>
&gt; -=C2=A0 =C2=A0version &quot;WLAN&quot;, &quot;PRISM PCMCIA CARD&quot;,=
 &quot;37300P&quot;, &quot;Revision B6&quot;<br>
&gt; -=C2=A0 =C2=A0manfid 0x50c2, 0x7300<br>
&gt; -=C2=A0 =C2=A0bind &quot;hostap_cs&quot;<br>
&gt; -<br>
&gt; -<br>
&gt; -# Optional configuration parameters for hostap_cs.o<br>
&gt; -# module &quot;hostap_cs&quot; opts &quot;channel=3D3 iw_mode=3D3 ess=
id=3Dtest ignore_cis_vcc=3D0&quot;<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.modalias b/m=
eta/recipes-bsp/hostap/<wbr>files/hostap_cs.modalias<br>
&gt; deleted file mode 100644<br>
&gt; index 28483515103..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>files/hostap_cs.modalias<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -# product info: &quot;Pretec&quot;, &quot;CompactWLAN Card 802.11b&qu=
ot;, &quot;2.5&quot;<br>
&gt; -alias pcmcia:<wbr>m0156c0002f06fn00pfn00pa1CADD3<wbr>E5pbE697636Cpc7A=
5BFCF1pd000000<wbr>00 hostap_cs<br>
&gt; -<br>
&gt; -# manufacturer ID which exist in orinoco_cs AND in hostap_cs<br>
&gt; -alias pcmcia:<wbr>m000Bc7100f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m000Bc7300f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m0126c8000f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m0138c0002f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m0250c0002f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m0274c1612f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m0274c1613f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m028Ac0002f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m02AAc0002f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>m50C2c7300f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>mD601c0002f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -alias pcmcia:<wbr>mD601c0005f06fn00pfn00pa*pb*<wbr>pc*pd* hostap_cs<b=
r>
&gt; -<br>
&gt; -# product info: &quot;Linksys&quot;, &quot;Wireless CompactFlash Card=
&quot;, &quot;&quot;, &quot;&quot;<br>
&gt; -alias pcmcia:<wbr>m028Ac0673f06fn00pfn00pa0733CC<wbr>81pb0C52F395pc00=
000000pd000000<wbr>00 hostap_cs<br>
&gt; -<br>
&gt; -# product info:&quot;PLANEX COMMUNICATION INC&quot;,&quot;PLANEX GW-C=
F11X Wireless CF Card&quot;, &quot;&quot;, &quot;&quot;<br>
&gt; -alias pcmcia:<wbr>mD601c0010f06fn00pfn00pa4703CF<wbr>68pbFAD7318Dpc00=
000000pd000000<wbr>00 hostap_cs<br>
&gt; -<br>
&gt; -# 0x0156, 0x0002 and &quot;Version 01.02&quot; only appear for Prism =
based cards.<br>
&gt; -alias pcmcia:<wbr>m0156c0002f06fn00pfn00pa*pb*<wbr>pc4B74BAA0pd000000=
00 hostap_cs<br>
&gt; -<br>
&gt; -# &quot;BUFFALO&quot;, &quot;WLI-CF-S11G&quot;, &quot;&quot;, &quot;&=
quot;<br>
&gt; -alias pcmcia:<wbr>m026Fc030Bf06fn00pfn00pa2DECEC<wbr>E3pb82067C18pc00=
000000pd000000<wbr>00 hostap_cs<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<a href=3D"http://hostap-conf_1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">host<wbr>ap-conf_1.0.bb</a> b/met=
a/recipes-bsp/hostap/<a href=3D"http://hostap-conf_1.0.bb" rel=3D"noreferre=
r" target=3D"_blank">host<wbr>ap-conf_1.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index e1d4c5477cb..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<a href=3D"http://hostap-conf_1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">host<wbr>ap-conf_1.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,23 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Configuration files for HostAP (wifi) driver&quot;<=
br>
&gt; -DESCRIPTION =3D &quot;PCMCIA-cs configuration files for wireless LAN =
cards based on Intersil&#39;s Prism2/2.5/3 chipset.&quot;<br>
&gt; -SECTION =3D &quot;kernel/modules&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>393a5ca445f69658=
73eca0259a17f8<wbr>33&quot;<br>
&gt; -PR =3D &quot;r15&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;file://hostap_cs.modalias \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.patch&quot;<b=
r>
&gt; -<br>
&gt; -inherit allarch<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}&quot;<br>
&gt; -<br>
&gt; -do_compile() {<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/modprobe.d<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/hostap_cs.modalias ${D=
}${sysconfdir}/modprobe.d/<wbr>hostap_cs.conf<br>
&gt; -}<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4.7/0001-<wbr=
>Define-_u32-__s32-__u16-__s16-<wbr>__u8-in-terms-of-c99-t.patch b/meta/rec=
ipes-bsp/hostap/<wbr>hostap-utils-0.4.7/0001-<wbr>Define-_u32-__s32-__u16-_=
_s16-<wbr>__u8-in-terms-of-c99-t.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b44dca3ec8b..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4.7/0001-<wbr>Define=
-_u32-__s32-__u16-__s16-<wbr>__u8-in-terms-of-c99-t.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,36 +0,0 @@<br>
&gt; -From 742fb110d9841a04b3ced256b0bf80<wbr>ff304dcaff Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
&gt; -Date: Mon, 31 Aug 2015 05:45:08 +0000<br>
&gt; -Subject: [PATCH] Define _u32/__s32/__u16/__s16/__u8 in terms of c99 t=
ypes<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; - wireless_copy.h | 10 +++++-----<br>
&gt; - 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/wireless_copy.h b/wireless_copy.h<br>
&gt; -index 8208258..1171a35 100644<br>
&gt; ---- a/wireless_copy.h<br>
&gt; -+++ b/wireless_copy.h<br>
&gt; -@@ -86,11 +86,11 @@<br>
&gt; - #else<br>
&gt; - #include &lt;sys/types.h&gt;<br>
&gt; - #include &lt;net/if.h&gt;<br>
&gt; --typedef __uint32_t __u32;<br>
&gt; --typedef __int32_t __s32;<br>
&gt; --typedef __uint16_t __u16;<br>
&gt; --typedef __int16_t __s16;<br>
&gt; --typedef __uint8_t __u8;<br>
&gt; -+typedef u_int32_t __u32;<br>
&gt; -+typedef int32_t __s32;<br>
&gt; -+typedef u_int16_t __u16;<br>
&gt; -+typedef int16_t __s16;<br>
&gt; -+typedef u_int8_t __u8;<br>
&gt; - #ifndef __user<br>
&gt; - #define __user<br>
&gt; - #endif /* __user */<br>
&gt; ---<br>
&gt; -2.5.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4.7/ldflags.<=
wbr>patch b/meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4.7/ldflags.<wbr>pa=
tch<br>
&gt; deleted file mode 100644<br>
&gt; index 3e99d0d92e3..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>hostap-utils-0.4.7/ldflags.<wbr>pat=
ch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -Obey LDFLAGS<br>
&gt; -<br>
&gt; -Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@=
mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; ---- hostap-utils-0.4.7.orig/<wbr>Makefile<br>
&gt; -+++ hostap-utils-0.4.7/Makefile<br>
&gt; -@@ -14,17 +14,17 @@ prism2_srec.o: prism2_srec.c util.h<br>
&gt; - hostap_crypt_conf: hostap_crypt_conf.c<br>
&gt; -<br>
&gt; - hostap_diag: hostap_diag.o util.o<br>
&gt; --=C2=A0 =C2=A0 $(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o<br=
>
&gt; -+=C2=A0 =C2=A0 $(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.=
o util.o<br>
&gt; -<br>
&gt; - hostap_diag.o: hostap_diag.c util.h<br>
&gt; -<br>
&gt; - util.o: util.c util.h<br>
&gt; -<br>
&gt; - hostap_io_debug: hostap_io_debug.c<br>
&gt; --=C2=A0 =C2=A0 $(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c<b=
r>
&gt; -+=C2=A0 =C2=A0 $(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_i=
o_debug.c<br>
&gt; -<br>
&gt; - hostap_rid: hostap_rid.o util.o<br>
&gt; --=C2=A0 =C2=A0 $(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o<br>
&gt; -+=C2=A0 =C2=A0 $(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o =
util.o<br>
&gt; -<br>
&gt; - hostap_rid.o: hostap_rid.c util.h<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<wbr>hostap-utils.inc b/meta/reci=
pes-bsp/hostap/<wbr>hostap-utils.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 6d98e3a888b..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<wbr>hostap-utils.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;User mode helpers for the hostap driver&quot;<br>
&gt; -DESCRIPTION =3D &quot;The hostap driver supports Host AP mode, it all=
ows for IEEE 802.11 \<br>
&gt; -management functions on the host computer and allows the system to ac=
t as an access point.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://w1.fi" rel=3D"noreferrer" targe=
t=3D"_blank">https://w1.fi</a>&quot;<br>
&gt; -LICENSE =3D &quot;GPLv2&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>0636e73ff0215e8d=
672dc4c32c317b<wbr>b3 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0file://util.c;beginline=3D1;<wbr>endline=3D9;md5=3D<wbr>d3b928085130=
2e5ba34e5fb717489b<wbr>6d&quot;<br>
&gt; -SECTION =3D &quot;kernel/userland&quot;<br>
&gt; -PR =3D &quot;r4&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://w1.fi/releases/hostap-utils-${PV=
}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://w1.fi/releases/<wbr>=
hostap-utils-${PV}.tar.gz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hostap-fw-load.patch =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Define-_u32-__s3=
2-<wbr>__u16-__s16-__u8-in-terms-of-<wbr>c99-t.patch \<br>
&gt; -&quot;<br>
&gt; -S =3D &quot;${WORKDIR}/hostap-utils-${PV}<wbr>&quot;<br>
&gt; -<br>
&gt; -BINARIES =3D &quot;hostap_crypt_conf hostap_diag hostap_fw_load hosta=
p_io_debug \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hostap_rid prism2_param prism2_srec=
 split_combined_hex&quot;<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d ${D}${sbindir}/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for f in ${BINARIES}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 $f ${=
D}${sbindir}/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -}<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-bsp/hostap/<a href=3D"http://hostap-utils_0.=
4.7.bb" rel=3D"noreferrer" target=3D"_blank">host<wbr>ap-utils_0.4.7.bb</a>=
 b/meta/recipes-bsp/hostap/<a href=3D"http://hostap-utils_0.4.7.bb" rel=3D"=
noreferrer" target=3D"_blank">host<wbr>ap-utils_0.4.7.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index be5481f6f7b..00000000000<br>
&gt; --- a/meta/recipes-bsp/hostap/<a href=3D"http://hostap-utils_0.4.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">host<wbr>ap-utils_0.4.7.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,5 +0,0 @@<br>
&gt; -require hostap-utils.inc<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot;file://ldflags.patch&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>afe041581b8f01666e353bec20917c<wbr>85&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>c6f598d8e356c1620fa009eca0a700<wbr>=
bf1105e16817eefd77d89199426100<wbr>9355&quot;<br>
<br>
</div></div></blockquote></div><br></div>

--001a113fd83a4e0dde055da661e0--
