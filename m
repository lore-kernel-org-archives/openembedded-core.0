Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FFAC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:39:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.10584.1653503961420266728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WbTaoGym;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id t13so12112991wrg.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jFA1lkGqcOXFQ8RHQybYZDvf8ne4M4UCAWSuK7nxQFg=;
        b=WbTaoGymYm/ZS1k9Fu2KabVXnGBDDA0/8ieFhTaJsBHDW612eKtRRJkbWktmgUFCRV
         7+vVH/gToTx7sGfWutu1OkcyFB7VVN53DPXFahxL07ZvwJMFb1/p2ypW8mXWv2DUbaCG
         vmYuDTJg2uqrHrAfj1RvqrEmOkS8j9Ro7yYE6DU8gEFSb0LpiscYIhaSqUeyPoPuU/zT
         3JDWX0Hxtii6sGlt1d5unVpM7BKC5Of0U617gXc1L8pFdlWgx+zvrOa6fScwl9C/JLC0
         RLcdXpxnfkLBknMnupsxpXKuPZwbRjLvTqgUJilfbtJBjPzsDztLZ9jO9fC8UYIQ2q7t
         ORKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jFA1lkGqcOXFQ8RHQybYZDvf8ne4M4UCAWSuK7nxQFg=;
        b=wPz+WAB55xyFHnQ4pejOPOO/ybUNTCIBxCu3JTxFuaMQZAj3adddBVSG94mvfAH9PE
         VVTnF8nXFtdENyHohKIqASV6qjZfasS9hiHKyBLWFqnQ0CSrvrcZiWSSRjsXuI1sBvtr
         kqNDmxM2G0qFKcGzc2esDyO6sjiWXA501kQSAf0ToJWeClaJGG3IJh6YSHGfJTzsKEXG
         cDeXYSMVDTL8x7t5jZXLev3OGLDUolXOQY77Rnw57Xj+kDqmNEWp62LjlguFfjfqQhDv
         pTv2MqY6QCA+Pq/aAfZ+hVLHnHl4VVvfVid1rBI8X0A5hYk6zt8RmOOj/pxjBLYpEs0f
         1rkw==
X-Gm-Message-State: AOAM531RB+HmGvNafrofKSdpVIV+XhXa6QHJ7qG+U4CMm70kMmkclzqS
	R9CAElYp3z9m/r44wMruLSseGGknHaekqr44bJc=
X-Google-Smtp-Source: 
 ABdhPJxvXZZukESaAEfBkmZCSCCJx/3jIDDHq6RJ8JppxNFqA1DK/xM2EmvEYl1msLrmqo89sTe/DeXiE1B19gSv/2U=
X-Received: by 2002:adf:ee43:0:b0:20e:607c:6943 with SMTP id
 w3-20020adfee43000000b0020e607c6943mr29514530wro.407.1653503959644; Wed, 25
 May 2022 11:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <16F26ACEC3C7C32B.14582@lists.openembedded.org>
 <CA+chaQd5GBkAx=pBky5FFjQkXCXXEjvoz2DC+QEYEvYR2e5PQg@mail.gmail.com>
 <CAMKF1sp-TA8PgE=QVtMH4oBUbyPB5V47MEf1v1bgEq-d6uzM+A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp-TA8PgE=QVtMH4oBUbyPB5V47MEf1v1bgEq-d6uzM+A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 May 2022 20:38:58 +0200
Message-ID: 
 <CA+chaQejt3fCBSjYzBcXAijECJaBG-r3uDiTxUEMLpS3_K-pKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedevs: Don't use COPYING.patch just to add
 GPL-2.0-or-later into
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000263f5e05dfda640e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 18:39:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166164

--000000000000263f5e05dfda640e
Content-Type: text/plain; charset="UTF-8"

Should I resend this with just GPL-2.0-only (as buildroot header) and only
SPDX header in source like RP did for keymaps in:
https://git.openembedded.org/openembedded-core/commit/?h=master&id=17d981005a0c0c97702ad88602b7181b69bcc9eb
?


On Wed, May 25, 2022 at 8:30 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 25, 2022 at 11:21 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > FWIW: the code was introduced long time ago in bk:// without any license
> indication:
> >
> > https://git.openembedded.org/openembedded/log/packages/makedevs?h=master
> > https://git.openembedded.org/openembedded/log/recipes/makedevs?h=master
> >
> https://git.openembedded.org/openembedded-core/log/meta/recipes-devtools/makedevs
> >
> > and the GPL-2.0-or-later license was added much longer in:
> >
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/makedevs?id=409ac23702058a058c187f22d796eff251a8f18e
> >
> > So I wouldn't say, it's completely clear, but this patch just keeps the
> same LICENSE value as was set in LICENSE in:
> >
> https://git.openembedded.org/openembedded/commit/recipes/makedevs?h=master&id=122efc0b6621f22709fa7f8071392b37ae0d3b02
> > but using "or-later" version in LIC_FILES_CHKSUM as added in
> COPYING.patch.
>
> Buildroot added it in 2005 with license info in the file itself
>
> https://github.com/buildroot/buildroot/commit/611ec0e3b16219c1987f2aca065ddec22bd84cc9
>
> >
> >
> > On Wed, May 25, 2022 at 7:57 PM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
> >>
> >> * as it uses S = "${WORKDIR}" it's another possible reproducer for
> >>   do_patch issue mentioned here:
> >>   https://lists.yoctoproject.org/g/yocto/message/56602
> >>
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>  .../makedevs/makedevs/COPYING.patch           | 346 ------------------
> >>  .../makedevs/makedevs_1.0.1.bb                |   5 +-
> >>  2 files changed, 2 insertions(+), 349 deletions(-)
> >>  delete mode 100644
> meta/recipes-devtools/makedevs/makedevs/COPYING.patch
> >>
> >> diff --git a/meta/recipes-devtools/makedevs/makedevs/COPYING.patch
> b/meta/recipes-devtools/makedevs/makedevs/COPYING.patch
> >> deleted file mode 100644
> >> index 3a8902b97a..0000000000
> >> --- a/meta/recipes-devtools/makedevs/makedevs/COPYING.patch
> >> +++ /dev/null
> >> @@ -1,346 +0,0 @@
> >> -Upstream-Status: Inappropriate [licensing]
> >> -
> >> -diff -ruN makedevs-1.0.0-orig/COPYING makedevs-1.0.0/COPYING
> >> ---- makedevs-1.0.0-orig/COPYING        1970-01-01 08:00:00.000000000
> +0800
> >> -+++ makedevs-1.0.0/COPYING     2010-12-09 16:42:20.274984665 +0800
> >> -@@ -0,0 +1,340 @@
> >> -+                  GNU GENERAL PUBLIC LICENSE
> >> -+                     Version 2, June 1991
> >> -+
> >> -+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
> >> -+                       59 Temple Place, Suite 330, Boston, MA
> 02111-1307  USA
> >> -+ Everyone is permitted to copy and distribute verbatim copies
> >> -+ of this license document, but changing it is not allowed.
> >> -+
> >> -+                          Preamble
> >> -+
> >> -+  The licenses for most software are designed to take away your
> >> -+freedom to share and change it.  By contrast, the GNU General Public
> >> -+License is intended to guarantee your freedom to share and change free
> >> -+software--to make sure the software is free for all its users.  This
> >> -+General Public License applies to most of the Free Software
> >> -+Foundation's software and to any other program whose authors commit to
> >> -+using it.  (Some other Free Software Foundation software is covered by
> >> -+the GNU Library General Public License instead.)  You can apply it to
> >> -+your programs, too.
> >> -+
> >> -+  When we speak of free software, we are referring to freedom, not
> >> -+price.  Our General Public Licenses are designed to make sure that you
> >> -+have the freedom to distribute copies of free software (and charge for
> >> -+this service if you wish), that you receive source code or can get it
> >> -+if you want it, that you can change the software or use pieces of it
> >> -+in new free programs; and that you know you can do these things.
> >> -+
> >> -+  To protect your rights, we need to make restrictions that forbid
> >> -+anyone to deny you these rights or to ask you to surrender the rights.
> >> -+These restrictions translate to certain responsibilities for you if
> you
> >> -+distribute copies of the software, or if you modify it.
> >> -+
> >> -+  For example, if you distribute copies of such a program, whether
> >> -+gratis or for a fee, you must give the recipients all the rights that
> >> -+you have.  You must make sure that they, too, receive or can get the
> >> -+source code.  And you must show them these terms so they know their
> >> -+rights.
> >> -+
> >> -+  We protect your rights with two steps: (1) copyright the software,
> and
> >> -+(2) offer you this license which gives you legal permission to copy,
> >> -+distribute and/or modify the software.
> >> -+
> >> -+  Also, for each author's protection and ours, we want to make certain
> >> -+that everyone understands that there is no warranty for this free
> >> -+software.  If the software is modified by someone else and passed on,
> we
> >> -+want its recipients to know that what they have is not the original,
> so
> >> -+that any problems introduced by others will not reflect on the
> original
> >> -+authors' reputations.
> >> -+
> >> -+  Finally, any free program is threatened constantly by software
> >> -+patents.  We wish to avoid the danger that redistributors of a free
> >> -+program will individually obtain patent licenses, in effect making the
> >> -+program proprietary.  To prevent this, we have made it clear that any
> >> -+patent must be licensed for everyone's free use or not licensed at
> all.
> >> -+
> >> -+  The precise terms and conditions for copying, distribution and
> >> -+modification follow.
> >> -+
> >> -+                  GNU GENERAL PUBLIC LICENSE
> >> -+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> >> -+
> >> -+  0. This License applies to any program or other work which contains
> >> -+a notice placed by the copyright holder saying it may be distributed
> >> -+under the terms of this General Public License.  The "Program", below,
> >> -+refers to any such program or work, and a "work based on the Program"
> >> -+means either the Program or any derivative work under copyright law:
> >> -+that is to say, a work containing the Program or a portion of it,
> >> -+either verbatim or with modifications and/or translated into another
> >> -+language.  (Hereinafter, translation is included without limitation in
> >> -+the term "modification".)  Each licensee is addressed as "you".
> >> -+
> >> -+Activities other than copying, distribution and modification are not
> >> -+covered by this License; they are outside its scope.  The act of
> >> -+running the Program is not restricted, and the output from the Program
> >> -+is covered only if its contents constitute a work based on the
> >> -+Program (independent of having been made by running the Program).
> >> -+Whether that is true depends on what the Program does.
> >> -+
> >> -+  1. You may copy and distribute verbatim copies of the Program's
> >> -+source code as you receive it, in any medium, provided that you
> >> -+conspicuously and appropriately publish on each copy an appropriate
> >> -+copyright notice and disclaimer of warranty; keep intact all the
> >> -+notices that refer to this License and to the absence of any warranty;
> >> -+and give any other recipients of the Program a copy of this License
> >> -+along with the Program.
> >> -+
> >> -+You may charge a fee for the physical act of transferring a copy, and
> >> -+you may at your option offer warranty protection in exchange for a
> fee.
> >> -+
> >> -+  2. You may modify your copy or copies of the Program or any portion
> >> -+of it, thus forming a work based on the Program, and copy and
> >> -+distribute such modifications or work under the terms of Section 1
> >> -+above, provided that you also meet all of these conditions:
> >> -+
> >> -+    a) You must cause the modified files to carry prominent notices
> >> -+    stating that you changed the files and the date of any change.
> >> -+
> >> -+    b) You must cause any work that you distribute or publish, that in
> >> -+    whole or in part contains or is derived from the Program or any
> >> -+    part thereof, to be licensed as a whole at no charge to all third
> >> -+    parties under the terms of this License.
> >> -+
> >> -+    c) If the modified program normally reads commands interactively
> >> -+    when run, you must cause it, when started running for such
> >> -+    interactive use in the most ordinary way, to print or display an
> >> -+    announcement including an appropriate copyright notice and a
> >> -+    notice that there is no warranty (or else, saying that you provide
> >> -+    a warranty) and that users may redistribute the program under
> >> -+    these conditions, and telling the user how to view a copy of this
> >> -+    License.  (Exception: if the Program itself is interactive but
> >> -+    does not normally print such an announcement, your work based on
> >> -+    the Program is not required to print an announcement.)
> >> -+
> >> -+These requirements apply to the modified work as a whole.  If
> >> -+identifiable sections of that work are not derived from the Program,
> >> -+and can be reasonably considered independent and separate works in
> >> -+themselves, then this License, and its terms, do not apply to those
> >> -+sections when you distribute them as separate works.  But when you
> >> -+distribute the same sections as part of a whole which is a work based
> >> -+on the Program, the distribution of the whole must be on the terms of
> >> -+this License, whose permissions for other licensees extend to the
> >> -+entire whole, and thus to each and every part regardless of who wrote
> it.
> >> -+
> >> -+Thus, it is not the intent of this section to claim rights or contest
> >> -+your rights to work written entirely by you; rather, the intent is to
> >> -+exercise the right to control the distribution of derivative or
> >> -+collective works based on the Program.
> >> -+
> >> -+In addition, mere aggregation of another work not based on the Program
> >> -+with the Program (or with a work based on the Program) on a volume of
> >> -+a storage or distribution medium does not bring the other work under
> >> -+the scope of this License.
> >> -+
> >> -+  3. You may copy and distribute the Program (or a work based on it,
> >> -+under Section 2) in object code or executable form under the terms of
> >> -+Sections 1 and 2 above provided that you also do one of the following:
> >> -+
> >> -+    a) Accompany it with the complete corresponding machine-readable
> >> -+    source code, which must be distributed under the terms of Sections
> >> -+    1 and 2 above on a medium customarily used for software
> interchange; or,
> >> -+
> >> -+    b) Accompany it with a written offer, valid for at least three
> >> -+    years, to give any third party, for a charge no more than your
> >> -+    cost of physically performing source distribution, a complete
> >> -+    machine-readable copy of the corresponding source code, to be
> >> -+    distributed under the terms of Sections 1 and 2 above on a medium
> >> -+    customarily used for software interchange; or,
> >> -+
> >> -+    c) Accompany it with the information you received as to the offer
> >> -+    to distribute corresponding source code.  (This alternative is
> >> -+    allowed only for noncommercial distribution and only if you
> >> -+    received the program in object code or executable form with such
> >> -+    an offer, in accord with Subsection b above.)
> >> -+
> >> -+The source code for a work means the preferred form of the work for
> >> -+making modifications to it.  For an executable work, complete source
> >> -+code means all the source code for all modules it contains, plus any
> >> -+associated interface definition files, plus the scripts used to
> >> -+control compilation and installation of the executable.  However, as a
> >> -+special exception, the source code distributed need not include
> >> -+anything that is normally distributed (in either source or binary
> >> -+form) with the major components (compiler, kernel, and so on) of the
> >> -+operating system on which the executable runs, unless that component
> >> -+itself accompanies the executable.
> >> -+
> >> -+If distribution of executable or object code is made by offering
> >> -+access to copy from a designated place, then offering equivalent
> >> -+access to copy the source code from the same place counts as
> >> -+distribution of the source code, even though third parties are not
> >> -+compelled to copy the source along with the object code.
> >> -+
> >> -+  4. You may not copy, modify, sublicense, or distribute the Program
> >> -+except as expressly provided under this License.  Any attempt
> >> -+otherwise to copy, modify, sublicense or distribute the Program is
> >> -+void, and will automatically terminate your rights under this License.
> >> -+However, parties who have received copies, or rights, from you under
> >> -+this License will not have their licenses terminated so long as such
> >> -+parties remain in full compliance.
> >> -+
> >> -+  5. You are not required to accept this License, since you have not
> >> -+signed it.  However, nothing else grants you permission to modify or
> >> -+distribute the Program or its derivative works.  These actions are
> >> -+prohibited by law if you do not accept this License.  Therefore, by
> >> -+modifying or distributing the Program (or any work based on the
> >> -+Program), you indicate your acceptance of this License to do so, and
> >> -+all its terms and conditions for copying, distributing or modifying
> >> -+the Program or works based on it.
> >> -+
> >> -+  6. Each time you redistribute the Program (or any work based on the
> >> -+Program), the recipient automatically receives a license from the
> >> -+original licensor to copy, distribute or modify the Program subject to
> >> -+these terms and conditions.  You may not impose any further
> >> -+restrictions on the recipients' exercise of the rights granted herein.
> >> -+You are not responsible for enforcing compliance by third parties to
> >> -+this License.
> >> -+
> >> -+  7. If, as a consequence of a court judgment or allegation of patent
> >> -+infringement or for any other reason (not limited to patent issues),
> >> -+conditions are imposed on you (whether by court order, agreement or
> >> -+otherwise) that contradict the conditions of this License, they do not
> >> -+excuse you from the conditions of this License.  If you cannot
> >> -+distribute so as to satisfy simultaneously your obligations under this
> >> -+License and any other pertinent obligations, then as a consequence you
> >> -+may not distribute the Program at all.  For example, if a patent
> >> -+license would not permit royalty-free redistribution of the Program by
> >> -+all those who receive copies directly or indirectly through you, then
> >> -+the only way you could satisfy both it and this License would be to
> >> -+refrain entirely from distribution of the Program.
> >> -+
> >> -+If any portion of this section is held invalid or unenforceable under
> >> -+any particular circumstance, the balance of the section is intended to
> >> -+apply and the section as a whole is intended to apply in other
> >> -+circumstances.
> >> -+
> >> -+It is not the purpose of this section to induce you to infringe any
> >> -+patents or other property right claims or to contest validity of any
> >> -+such claims; this section has the sole purpose of protecting the
> >> -+integrity of the free software distribution system, which is
> >> -+implemented by public license practices.  Many people have made
> >> -+generous contributions to the wide range of software distributed
> >> -+through that system in reliance on consistent application of that
> >> -+system; it is up to the author/donor to decide if he or she is willing
> >> -+to distribute software through any other system and a licensee cannot
> >> -+impose that choice.
> >> -+
> >> -+This section is intended to make thoroughly clear what is believed to
> >> -+be a consequence of the rest of this License.
> >> -+
> >> -+  8. If the distribution and/or use of the Program is restricted in
> >> -+certain countries either by patents or by copyrighted interfaces, the
> >> -+original copyright holder who places the Program under this License
> >> -+may add an explicit geographical distribution limitation excluding
> >> -+those countries, so that distribution is permitted only in or among
> >> -+countries not thus excluded.  In such case, this License incorporates
> >> -+the limitation as if written in the body of this License.
> >> -+
> >> -+  9. The Free Software Foundation may publish revised and/or new
> versions
> >> -+of the General Public License from time to time.  Such new versions
> will
> >> -+be similar in spirit to the present version, but may differ in detail
> to
> >> -+address new problems or concerns.
> >> -+
> >> -+Each version is given a distinguishing version number.  If the Program
> >> -+specifies a version number of this License which applies to it and
> "any
> >> -+later version", you have the option of following the terms and
> conditions
> >> -+either of that version or of any later version published by the Free
> >> -+Software Foundation.  If the Program does not specify a version
> number of
> >> -+this License, you may choose any version ever published by the Free
> Software
> >> -+Foundation.
> >> -+
> >> -+  10. If you wish to incorporate parts of the Program into other free
> >> -+programs whose distribution conditions are different, write to the
> author
> >> -+to ask for permission.  For software which is copyrighted by the Free
> >> -+Software Foundation, write to the Free Software Foundation; we
> sometimes
> >> -+make exceptions for this.  Our decision will be guided by the two
> goals
> >> -+of preserving the free status of all derivatives of our free software
> and
> >> -+of promoting the sharing and reuse of software generally.
> >> -+
> >> -+                          NO WARRANTY
> >> -+
> >> -+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO
> WARRANTY
> >> -+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT
> WHEN
> >> -+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> >> -+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
> EXPRESSED
> >> -+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> >> -+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE
> RISK AS
> >> -+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
> >> -+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY
> SERVICING,
> >> -+REPAIR OR CORRECTION.
> >> -+
> >> -+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
> WRITING
> >> -+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> >> -+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR
> DAMAGES,
> >> -+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> ARISING
> >> -+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT
> LIMITED
> >> -+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED
> BY
> >> -+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY
> OTHER
> >> -+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> >> -+POSSIBILITY OF SUCH DAMAGES.
> >> -+
> >> -+                   END OF TERMS AND CONDITIONS
> >> -+
> >> -+          How to Apply These Terms to Your New Programs
> >> -+
> >> -+  If you develop a new program, and you want it to be of the greatest
> >> -+possible use to the public, the best way to achieve this is to make it
> >> -+free software which everyone can redistribute and change under these
> terms.
> >> -+
> >> -+  To do so, attach the following notices to the program.  It is safest
> >> -+to attach them to the start of each source file to most effectively
> >> -+convey the exclusion of warranty; and each file should have at least
> >> -+the "copyright" line and a pointer to where the full notice is found.
> >> -+
> >> -+    <one line to give the program's name and a brief idea of what it
> does.>
> >> -+    Copyright (C) <year>  <name of author>
> >> -+
> >> -+    This program is free software; you can redistribute it and/or
> modify
> >> -+    it under the terms of the GNU General Public License as published
> by
> >> -+    the Free Software Foundation; either version 2 of the License, or
> >> -+    (at your option) any later version.
> >> -+
> >> -+    This program is distributed in the hope that it will be useful,
> >> -+    but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> -+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> -+    GNU General Public License for more details.
> >> -+
> >> -+    You should have received a copy of the GNU General Public License
> >> -+    along with this program; if not, write to the Free Software
> >> -+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> 02111-1307  USA
> >> -+
> >> -+
> >> -+Also add information on how to contact you by electronic and paper
> mail.
> >> -+
> >> -+If the program is interactive, make it output a short notice like this
> >> -+when it starts in an interactive mode:
> >> -+
> >> -+    Gnomovision version 69, Copyright (C) year name of author
> >> -+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type
> `show w'.
> >> -+    This is free software, and you are welcome to redistribute it
> >> -+    under certain conditions; type `show c' for details.
> >> -+
> >> -+The hypothetical commands `show w' and `show c' should show the
> appropriate
> >> -+parts of the General Public License.  Of course, the commands you use
> may
> >> -+be called something other than `show w' and `show c'; they could even
> be
> >> -+mouse-clicks or menu items--whatever suits your program.
> >> -+
> >> -+You should also get your employer (if you work as a programmer) or
> your
> >> -+school, if any, to sign a "copyright disclaimer" for the program, if
> >> -+necessary.  Here is a sample; alter the names:
> >> -+
> >> -+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
> program
> >> -+  `Gnomovision' (which makes passes at compilers) written by James
> Hacker.
> >> -+
> >> -+  <signature of Ty Coon>, 1 April 1989
> >> -+  Ty Coon, President of Vice
> >> -+
> >> -+This General Public License does not permit incorporating your
> program into
> >> -+proprietary programs.  If your program is a subroutine library, you
> may
> >> -+consider it more useful to permit linking proprietary applications
> with the
> >> -+library.  If this is what you want to do, use the GNU Library General
> >> -+Public License instead of this License.
> >> diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
> b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
> >> index 007ebbca89..127ab489f9 100644
> >> --- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
> >> +++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
> >> @@ -1,10 +1,9 @@
> >>  SUMMARY = "Tool for creating device nodes"
> >>  DESCRIPTION = "${SUMMARY}"
> >>  LICENSE = "GPL-2.0-only"
> >> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> >> +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=fed54355545ffd980b814dab4a3b312c"
> >>  SECTION = "base"
> >> -SRC_URI = "file://makedevs.c \
> >> -           file://COPYING.patch"
> >> +SRC_URI = "file://makedevs.c"
> >>
> >>  S = "${WORKDIR}"
> >>
> >> --
> >> 2.35.1
> >>
> >>
> >>
> >>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#166162):
> https://lists.openembedded.org/g/openembedded-core/message/166162
> > Mute This Topic: https://lists.openembedded.org/mt/91338664/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000263f5e05dfda640e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Should I resend this with just GPL-2.0-only (as buildroot =
header) and only SPDX header in source like RP did for keymaps in: <a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster&amp;i=
d=3D17d981005a0c0c97702ad88602b7181b69bcc9eb">https://git.openembedded.org/=
openembedded-core/commit/?h=3Dmaster&amp;id=3D17d981005a0c0c97702ad88602b71=
81b69bcc9eb</a> ?<div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, May 25, 2022 at 8:30 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, May 25, 2=
022 at 11:21 AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; FWIW: the code was introduced long time ago in bk:// without any licen=
se indication:<br>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded/log/packages/make=
devs?h=3Dmaster" rel=3D"noreferrer" target=3D"_blank">https://git.openembed=
ded.org/openembedded/log/packages/makedevs?h=3Dmaster</a><br>
&gt; <a href=3D"https://git.openembedded.org/openembedded/log/recipes/maked=
evs?h=3Dmaster" rel=3D"noreferrer" target=3D"_blank">https://git.openembedd=
ed.org/openembedded/log/recipes/makedevs?h=3Dmaster</a><br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/log/meta/rec=
ipes-devtools/makedevs" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/openembedded-core/log/meta/recipes-devtools/makedevs</a><br>
&gt;<br>
&gt; and the GPL-2.0-or-later license was added much longer in:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/=
recipes-devtools/makedevs?id=3D409ac23702058a058c187f22d796eff251a8f18e" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core/commit/meta/recipes-devtools/makedevs?id=3D409ac23702058a058c187f22d=
796eff251a8f18e</a><br>
&gt;<br>
&gt; So I wouldn&#39;t say, it&#39;s completely clear, but this patch just =
keeps the same LICENSE value as was set in LICENSE in:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded/commit/recipes/ma=
kedevs?h=3Dmaster&amp;id=3D122efc0b6621f22709fa7f8071392b37ae0d3b02" rel=3D=
"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded/co=
mmit/recipes/makedevs?h=3Dmaster&amp;id=3D122efc0b6621f22709fa7f8071392b37a=
e0d3b02</a><br>
&gt; but using &quot;or-later&quot; version in LIC_FILES_CHKSUM as added in=
 COPYING.patch.<br>
<br>
Buildroot added it in 2005 with license info in the file itself<br>
<a href=3D"https://github.com/buildroot/buildroot/commit/611ec0e3b16219c198=
7f2aca065ddec22bd84cc9" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/buildroot/buildroot/commit/611ec0e3b16219c1987f2aca065ddec22bd84cc9</a=
><br>
<br>
&gt;<br>
&gt;<br>
&gt; On Wed, May 25, 2022 at 7:57 PM Martin Jansa via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; * as it uses S =3D &quot;${WORKDIR}&quot; it&#39;s another possibl=
e reproducer for<br>
&gt;&gt;=C2=A0 =C2=A0do_patch issue mentioned here:<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://lists.yoctoproject.org/g/yocto/mess=
age/56602" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/g/yocto/message/56602</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gma=
il.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../makedevs/makedevs/COPYING.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 346 ------------------<br>
&gt;&gt;=C2=A0 .../makedevs/<a href=3D"http://makedevs_1.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">makedevs_1.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt;&gt;=C2=A0 2 files changed, 2 insertions(+), 349 deletions(-)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/makedevs/makedevs/C=
OPYING.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/makedevs/makedevs/COPYING.patch=
 b/meta/recipes-devtools/makedevs/makedevs/COPYING.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 3a8902b97a..0000000000<br>
&gt;&gt; --- a/meta/recipes-devtools/makedevs/makedevs/COPYING.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,346 +0,0 @@<br>
&gt;&gt; -Upstream-Status: Inappropriate [licensing]<br>
&gt;&gt; -<br>
&gt;&gt; -diff -ruN makedevs-1.0.0-orig/COPYING makedevs-1.0.0/COPYING<br>
&gt;&gt; ---- makedevs-1.0.0-orig/COPYING=C2=A0 =C2=A0 =C2=A0 =C2=A0 1970-0=
1-01 08:00:00.000000000 +0800<br>
&gt;&gt; -+++ makedevs-1.0.0/COPYING=C2=A0 =C2=A0 =C2=A02010-12-09 16:42:20=
.274984665 +0800<br>
&gt;&gt; -@@ -0,0 +1,340 @@<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
NU GENERAL PUBLIC LICENSE<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Version 2, June 1991<br>
&gt;&gt; -+<br>
&gt;&gt; -+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A059 Temple Place, Suite 330, Boston, MA=C2=A0 02111-1307=
=C2=A0 USA<br>
&gt;&gt; -+ Everyone is permitted to copy and distribute verbatim copies<br=
>
&gt;&gt; -+ of this license document, but changing it is not allowed.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Preamble<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 The licenses for most software are designed to take away =
your<br>
&gt;&gt; -+freedom to share and change it.=C2=A0 By contrast, the GNU Gener=
al Public<br>
&gt;&gt; -+License is intended to guarantee your freedom to share and chang=
e free<br>
&gt;&gt; -+software--to make sure the software is free for all its users.=
=C2=A0 This<br>
&gt;&gt; -+General Public License applies to most of the Free Software<br>
&gt;&gt; -+Foundation&#39;s software and to any other program whose authors=
 commit to<br>
&gt;&gt; -+using it.=C2=A0 (Some other Free Software Foundation software is=
 covered by<br>
&gt;&gt; -+the GNU Library General Public License instead.)=C2=A0 You can a=
pply it to<br>
&gt;&gt; -+your programs, too.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 When we speak of free software, we are referring to freed=
om, not<br>
&gt;&gt; -+price.=C2=A0 Our General Public Licenses are designed to make su=
re that you<br>
&gt;&gt; -+have the freedom to distribute copies of free software (and char=
ge for<br>
&gt;&gt; -+this service if you wish), that you receive source code or can g=
et it<br>
&gt;&gt; -+if you want it, that you can change the software or use pieces o=
f it<br>
&gt;&gt; -+in new free programs; and that you know you can do these things.=
<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 To protect your rights, we need to make restrictions that=
 forbid<br>
&gt;&gt; -+anyone to deny you these rights or to ask you to surrender the r=
ights.<br>
&gt;&gt; -+These restrictions translate to certain responsibilities for you=
 if you<br>
&gt;&gt; -+distribute copies of the software, or if you modify it.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 For example, if you distribute copies of such a program, =
whether<br>
&gt;&gt; -+gratis or for a fee, you must give the recipients all the rights=
 that<br>
&gt;&gt; -+you have.=C2=A0 You must make sure that they, too, receive or ca=
n get the<br>
&gt;&gt; -+source code.=C2=A0 And you must show them these terms so they kn=
ow their<br>
&gt;&gt; -+rights.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 We protect your rights with two steps: (1) copyright the =
software, and<br>
&gt;&gt; -+(2) offer you this license which gives you legal permission to c=
opy,<br>
&gt;&gt; -+distribute and/or modify the software.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 Also, for each author&#39;s protection and ours, we want =
to make certain<br>
&gt;&gt; -+that everyone understands that there is no warranty for this fre=
e<br>
&gt;&gt; -+software.=C2=A0 If the software is modified by someone else and =
passed on, we<br>
&gt;&gt; -+want its recipients to know that what they have is not the origi=
nal, so<br>
&gt;&gt; -+that any problems introduced by others will not reflect on the o=
riginal<br>
&gt;&gt; -+authors&#39; reputations.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 Finally, any free program is threatened constantly by sof=
tware<br>
&gt;&gt; -+patents.=C2=A0 We wish to avoid the danger that redistributors o=
f a free<br>
&gt;&gt; -+program will individually obtain patent licenses, in effect maki=
ng the<br>
&gt;&gt; -+program proprietary.=C2=A0 To prevent this, we have made it clea=
r that any<br>
&gt;&gt; -+patent must be licensed for everyone&#39;s free use or not licen=
sed at all.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 The precise terms and conditions for copying, distributio=
n and<br>
&gt;&gt; -+modification follow.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
NU GENERAL PUBLIC LICENSE<br>
&gt;&gt; -+=C2=A0 =C2=A0TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND =
MODIFICATION<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 0. This License applies to any program or other work whic=
h contains<br>
&gt;&gt; -+a notice placed by the copyright holder saying it may be distrib=
uted<br>
&gt;&gt; -+under the terms of this General Public License.=C2=A0 The &quot;=
Program&quot;, below,<br>
&gt;&gt; -+refers to any such program or work, and a &quot;work based on th=
e Program&quot;<br>
&gt;&gt; -+means either the Program or any derivative work under copyright =
law:<br>
&gt;&gt; -+that is to say, a work containing the Program or a portion of it=
,<br>
&gt;&gt; -+either verbatim or with modifications and/or translated into ano=
ther<br>
&gt;&gt; -+language.=C2=A0 (Hereinafter, translation is included without li=
mitation in<br>
&gt;&gt; -+the term &quot;modification&quot;.)=C2=A0 Each licensee is addre=
ssed as &quot;you&quot;.<br>
&gt;&gt; -+<br>
&gt;&gt; -+Activities other than copying, distribution and modification are=
 not<br>
&gt;&gt; -+covered by this License; they are outside its scope.=C2=A0 The a=
ct of<br>
&gt;&gt; -+running the Program is not restricted, and the output from the P=
rogram<br>
&gt;&gt; -+is covered only if its contents constitute a work based on the<b=
r>
&gt;&gt; -+Program (independent of having been made by running the Program)=
.<br>
&gt;&gt; -+Whether that is true depends on what the Program does.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 1. You may copy and distribute verbatim copies of the Pro=
gram&#39;s<br>
&gt;&gt; -+source code as you receive it, in any medium, provided that you<=
br>
&gt;&gt; -+conspicuously and appropriately publish on each copy an appropri=
ate<br>
&gt;&gt; -+copyright notice and disclaimer of warranty; keep intact all the=
<br>
&gt;&gt; -+notices that refer to this License and to the absence of any war=
ranty;<br>
&gt;&gt; -+and give any other recipients of the Program a copy of this Lice=
nse<br>
&gt;&gt; -+along with the Program.<br>
&gt;&gt; -+<br>
&gt;&gt; -+You may charge a fee for the physical act of transferring a copy=
, and<br>
&gt;&gt; -+you may at your option offer warranty protection in exchange for=
 a fee.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 2. You may modify your copy or copies of the Program or a=
ny portion<br>
&gt;&gt; -+of it, thus forming a work based on the Program, and copy and<br=
>
&gt;&gt; -+distribute such modifications or work under the terms of Section=
 1<br>
&gt;&gt; -+above, provided that you also meet all of these conditions:<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 a) You must cause the modified files to carry prom=
inent notices<br>
&gt;&gt; -+=C2=A0 =C2=A0 stating that you changed the files and the date of=
 any change.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 b) You must cause any work that you distribute or =
publish, that in<br>
&gt;&gt; -+=C2=A0 =C2=A0 whole or in part contains or is derived from the P=
rogram or any<br>
&gt;&gt; -+=C2=A0 =C2=A0 part thereof, to be licensed as a whole at no char=
ge to all third<br>
&gt;&gt; -+=C2=A0 =C2=A0 parties under the terms of this License.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 c) If the modified program normally reads commands=
 interactively<br>
&gt;&gt; -+=C2=A0 =C2=A0 when run, you must cause it, when started running =
for such<br>
&gt;&gt; -+=C2=A0 =C2=A0 interactive use in the most ordinary way, to print=
 or display an<br>
&gt;&gt; -+=C2=A0 =C2=A0 announcement including an appropriate copyright no=
tice and a<br>
&gt;&gt; -+=C2=A0 =C2=A0 notice that there is no warranty (or else, saying =
that you provide<br>
&gt;&gt; -+=C2=A0 =C2=A0 a warranty) and that users may redistribute the pr=
ogram under<br>
&gt;&gt; -+=C2=A0 =C2=A0 these conditions, and telling the user how to view=
 a copy of this<br>
&gt;&gt; -+=C2=A0 =C2=A0 License.=C2=A0 (Exception: if the Program itself i=
s interactive but<br>
&gt;&gt; -+=C2=A0 =C2=A0 does not normally print such an announcement, your=
 work based on<br>
&gt;&gt; -+=C2=A0 =C2=A0 the Program is not required to print an announceme=
nt.)<br>
&gt;&gt; -+<br>
&gt;&gt; -+These requirements apply to the modified work as a whole.=C2=A0 =
If<br>
&gt;&gt; -+identifiable sections of that work are not derived from the Prog=
ram,<br>
&gt;&gt; -+and can be reasonably considered independent and separate works =
in<br>
&gt;&gt; -+themselves, then this License, and its terms, do not apply to th=
ose<br>
&gt;&gt; -+sections when you distribute them as separate works.=C2=A0 But w=
hen you<br>
&gt;&gt; -+distribute the same sections as part of a whole which is a work =
based<br>
&gt;&gt; -+on the Program, the distribution of the whole must be on the ter=
ms of<br>
&gt;&gt; -+this License, whose permissions for other licensees extend to th=
e<br>
&gt;&gt; -+entire whole, and thus to each and every part regardless of who =
wrote it.<br>
&gt;&gt; -+<br>
&gt;&gt; -+Thus, it is not the intent of this section to claim rights or co=
ntest<br>
&gt;&gt; -+your rights to work written entirely by you; rather, the intent =
is to<br>
&gt;&gt; -+exercise the right to control the distribution of derivative or<=
br>
&gt;&gt; -+collective works based on the Program.<br>
&gt;&gt; -+<br>
&gt;&gt; -+In addition, mere aggregation of another work not based on the P=
rogram<br>
&gt;&gt; -+with the Program (or with a work based on the Program) on a volu=
me of<br>
&gt;&gt; -+a storage or distribution medium does not bring the other work u=
nder<br>
&gt;&gt; -+the scope of this License.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 3. You may copy and distribute the Program (or a work bas=
ed on it,<br>
&gt;&gt; -+under Section 2) in object code or executable form under the ter=
ms of<br>
&gt;&gt; -+Sections 1 and 2 above provided that you also do one of the foll=
owing:<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 a) Accompany it with the complete corresponding ma=
chine-readable<br>
&gt;&gt; -+=C2=A0 =C2=A0 source code, which must be distributed under the t=
erms of Sections<br>
&gt;&gt; -+=C2=A0 =C2=A0 1 and 2 above on a medium customarily used for sof=
tware interchange; or,<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 b) Accompany it with a written offer, valid for at=
 least three<br>
&gt;&gt; -+=C2=A0 =C2=A0 years, to give any third party, for a charge no mo=
re than your<br>
&gt;&gt; -+=C2=A0 =C2=A0 cost of physically performing source distribution,=
 a complete<br>
&gt;&gt; -+=C2=A0 =C2=A0 machine-readable copy of the corresponding source =
code, to be<br>
&gt;&gt; -+=C2=A0 =C2=A0 distributed under the terms of Sections 1 and 2 ab=
ove on a medium<br>
&gt;&gt; -+=C2=A0 =C2=A0 customarily used for software interchange; or,<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 c) Accompany it with the information you received =
as to the offer<br>
&gt;&gt; -+=C2=A0 =C2=A0 to distribute corresponding source code.=C2=A0 (Th=
is alternative is<br>
&gt;&gt; -+=C2=A0 =C2=A0 allowed only for noncommercial distribution and on=
ly if you<br>
&gt;&gt; -+=C2=A0 =C2=A0 received the program in object code or executable =
form with such<br>
&gt;&gt; -+=C2=A0 =C2=A0 an offer, in accord with Subsection b above.)<br>
&gt;&gt; -+<br>
&gt;&gt; -+The source code for a work means the preferred form of the work =
for<br>
&gt;&gt; -+making modifications to it.=C2=A0 For an executable work, comple=
te source<br>
&gt;&gt; -+code means all the source code for all modules it contains, plus=
 any<br>
&gt;&gt; -+associated interface definition files, plus the scripts used to<=
br>
&gt;&gt; -+control compilation and installation of the executable.=C2=A0 Ho=
wever, as a<br>
&gt;&gt; -+special exception, the source code distributed need not include<=
br>
&gt;&gt; -+anything that is normally distributed (in either source or binar=
y<br>
&gt;&gt; -+form) with the major components (compiler, kernel, and so on) of=
 the<br>
&gt;&gt; -+operating system on which the executable runs, unless that compo=
nent<br>
&gt;&gt; -+itself accompanies the executable.<br>
&gt;&gt; -+<br>
&gt;&gt; -+If distribution of executable or object code is made by offering=
<br>
&gt;&gt; -+access to copy from a designated place, then offering equivalent=
<br>
&gt;&gt; -+access to copy the source code from the same place counts as<br>
&gt;&gt; -+distribution of the source code, even though third parties are n=
ot<br>
&gt;&gt; -+compelled to copy the source along with the object code.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 4. You may not copy, modify, sublicense, or distribute th=
e Program<br>
&gt;&gt; -+except as expressly provided under this License.=C2=A0 Any attem=
pt<br>
&gt;&gt; -+otherwise to copy, modify, sublicense or distribute the Program =
is<br>
&gt;&gt; -+void, and will automatically terminate your rights under this Li=
cense.<br>
&gt;&gt; -+However, parties who have received copies, or rights, from you u=
nder<br>
&gt;&gt; -+this License will not have their licenses terminated so long as =
such<br>
&gt;&gt; -+parties remain in full compliance.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 5. You are not required to accept this License, since you=
 have not<br>
&gt;&gt; -+signed it.=C2=A0 However, nothing else grants you permission to =
modify or<br>
&gt;&gt; -+distribute the Program or its derivative works.=C2=A0 These acti=
ons are<br>
&gt;&gt; -+prohibited by law if you do not accept this License.=C2=A0 There=
fore, by<br>
&gt;&gt; -+modifying or distributing the Program (or any work based on the<=
br>
&gt;&gt; -+Program), you indicate your acceptance of this License to do so,=
 and<br>
&gt;&gt; -+all its terms and conditions for copying, distributing or modify=
ing<br>
&gt;&gt; -+the Program or works based on it.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 6. Each time you redistribute the Program (or any work ba=
sed on the<br>
&gt;&gt; -+Program), the recipient automatically receives a license from th=
e<br>
&gt;&gt; -+original licensor to copy, distribute or modify the Program subj=
ect to<br>
&gt;&gt; -+these terms and conditions.=C2=A0 You may not impose any further=
<br>
&gt;&gt; -+restrictions on the recipients&#39; exercise of the rights grant=
ed herein.<br>
&gt;&gt; -+You are not responsible for enforcing compliance by third partie=
s to<br>
&gt;&gt; -+this License.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 7. If, as a consequence of a court judgment or allegation=
 of patent<br>
&gt;&gt; -+infringement or for any other reason (not limited to patent issu=
es),<br>
&gt;&gt; -+conditions are imposed on you (whether by court order, agreement=
 or<br>
&gt;&gt; -+otherwise) that contradict the conditions of this License, they =
do not<br>
&gt;&gt; -+excuse you from the conditions of this License.=C2=A0 If you can=
not<br>
&gt;&gt; -+distribute so as to satisfy simultaneously your obligations unde=
r this<br>
&gt;&gt; -+License and any other pertinent obligations, then as a consequen=
ce you<br>
&gt;&gt; -+may not distribute the Program at all.=C2=A0 For example, if a p=
atent<br>
&gt;&gt; -+license would not permit royalty-free redistribution of the Prog=
ram by<br>
&gt;&gt; -+all those who receive copies directly or indirectly through you,=
 then<br>
&gt;&gt; -+the only way you could satisfy both it and this License would be=
 to<br>
&gt;&gt; -+refrain entirely from distribution of the Program.<br>
&gt;&gt; -+<br>
&gt;&gt; -+If any portion of this section is held invalid or unenforceable =
under<br>
&gt;&gt; -+any particular circumstance, the balance of the section is inten=
ded to<br>
&gt;&gt; -+apply and the section as a whole is intended to apply in other<b=
r>
&gt;&gt; -+circumstances.<br>
&gt;&gt; -+<br>
&gt;&gt; -+It is not the purpose of this section to induce you to infringe =
any<br>
&gt;&gt; -+patents or other property right claims or to contest validity of=
 any<br>
&gt;&gt; -+such claims; this section has the sole purpose of protecting the=
<br>
&gt;&gt; -+integrity of the free software distribution system, which is<br>
&gt;&gt; -+implemented by public license practices.=C2=A0 Many people have =
made<br>
&gt;&gt; -+generous contributions to the wide range of software distributed=
<br>
&gt;&gt; -+through that system in reliance on consistent application of tha=
t<br>
&gt;&gt; -+system; it is up to the author/donor to decide if he or she is w=
illing<br>
&gt;&gt; -+to distribute software through any other system and a licensee c=
annot<br>
&gt;&gt; -+impose that choice.<br>
&gt;&gt; -+<br>
&gt;&gt; -+This section is intended to make thoroughly clear what is believ=
ed to<br>
&gt;&gt; -+be a consequence of the rest of this License.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 8. If the distribution and/or use of the Program is restr=
icted in<br>
&gt;&gt; -+certain countries either by patents or by copyrighted interfaces=
, the<br>
&gt;&gt; -+original copyright holder who places the Program under this Lice=
nse<br>
&gt;&gt; -+may add an explicit geographical distribution limitation excludi=
ng<br>
&gt;&gt; -+those countries, so that distribution is permitted only in or am=
ong<br>
&gt;&gt; -+countries not thus excluded.=C2=A0 In such case, this License in=
corporates<br>
&gt;&gt; -+the limitation as if written in the body of this License.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 9. The Free Software Foundation may publish revised and/o=
r new versions<br>
&gt;&gt; -+of the General Public License from time to time.=C2=A0 Such new =
versions will<br>
&gt;&gt; -+be similar in spirit to the present version, but may differ in d=
etail to<br>
&gt;&gt; -+address new problems or concerns.<br>
&gt;&gt; -+<br>
&gt;&gt; -+Each version is given a distinguishing version number.=C2=A0 If =
the Program<br>
&gt;&gt; -+specifies a version number of this License which applies to it a=
nd &quot;any<br>
&gt;&gt; -+later version&quot;, you have the option of following the terms =
and conditions<br>
&gt;&gt; -+either of that version or of any later version published by the =
Free<br>
&gt;&gt; -+Software Foundation.=C2=A0 If the Program does not specify a ver=
sion number of<br>
&gt;&gt; -+this License, you may choose any version ever published by the F=
ree Software<br>
&gt;&gt; -+Foundation.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 10. If you wish to incorporate parts of the Program into =
other free<br>
&gt;&gt; -+programs whose distribution conditions are different, write to t=
he author<br>
&gt;&gt; -+to ask for permission.=C2=A0 For software which is copyrighted b=
y the Free<br>
&gt;&gt; -+Software Foundation, write to the Free Software Foundation; we s=
ometimes<br>
&gt;&gt; -+make exceptions for this.=C2=A0 Our decision will be guided by t=
he two goals<br>
&gt;&gt; -+of preserving the free status of all derivatives of our free sof=
tware and<br>
&gt;&gt; -+of promoting the sharing and reuse of software generally.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NO WARRANTY<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE=
 IS NO WARRANTY<br>
&gt;&gt; -+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.=C2=
=A0 EXCEPT WHEN<br>
&gt;&gt; -+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER P=
ARTIES<br>
&gt;&gt; -+PROVIDE THE PROGRAM &quot;AS IS&quot; WITHOUT WARRANTY OF ANY KI=
ND, EITHER EXPRESSED<br>
&gt;&gt; -+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIE=
S OF<br>
&gt;&gt; -+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 THE =
ENTIRE RISK AS<br>
&gt;&gt; -+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.=C2=A0=
 SHOULD THE<br>
&gt;&gt; -+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SE=
RVICING,<br>
&gt;&gt; -+REPAIR OR CORRECTION.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGRE=
ED TO IN WRITING<br>
&gt;&gt; -+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND=
/OR<br>
&gt;&gt; -+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FO=
R DAMAGES,<br>
&gt;&gt; -+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMA=
GES ARISING<br>
&gt;&gt; -+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NO=
T LIMITED<br>
&gt;&gt; -+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUST=
AINED BY<br>
&gt;&gt; -+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH=
 ANY OTHER<br>
&gt;&gt; -+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED O=
F THE<br>
&gt;&gt; -+POSSIBILITY OF SUCH DAMAGES.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0END OF TERMS AND CONDITIONS<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 How to Apply These Terms to Y=
our New Programs<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 If you develop a new program, and you want it to be of th=
e greatest<br>
&gt;&gt; -+possible use to the public, the best way to achieve this is to m=
ake it<br>
&gt;&gt; -+free software which everyone can redistribute and change under t=
hese terms.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 To do so, attach the following notices to the program.=C2=
=A0 It is safest<br>
&gt;&gt; -+to attach them to the start of each source file to most effectiv=
ely<br>
&gt;&gt; -+convey the exclusion of warranty; and each file should have at l=
east<br>
&gt;&gt; -+the &quot;copyright&quot; line and a pointer to where the full n=
otice is found.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 &lt;one line to give the program&#39;s name and a =
brief idea of what it does.&gt;<br>
&gt;&gt; -+=C2=A0 =C2=A0 Copyright (C) &lt;year&gt;=C2=A0 &lt;name of autho=
r&gt;<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 This program is free software; you can redistribut=
e it and/or modify<br>
&gt;&gt; -+=C2=A0 =C2=A0 it under the terms of the GNU General Public Licen=
se as published by<br>
&gt;&gt; -+=C2=A0 =C2=A0 the Free Software Foundation; either version 2 of =
the License, or<br>
&gt;&gt; -+=C2=A0 =C2=A0 (at your option) any later version.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 This program is distributed in the hope that it wi=
ll be useful,<br>
&gt;&gt; -+=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied=
 warranty of<br>
&gt;&gt; -+=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.=C2=A0 See the<br>
&gt;&gt; -+=C2=A0 =C2=A0 GNU General Public License for more details.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 You should have received a copy of the GNU General=
 Public License<br>
&gt;&gt; -+=C2=A0 =C2=A0 along with this program; if not, write to the Free=
 Software<br>
&gt;&gt; -+=C2=A0 =C2=A0 Foundation, Inc., 59 Temple Place, Suite 330, Bost=
on, MA=C2=A0 02111-1307=C2=A0 USA<br>
&gt;&gt; -+<br>
&gt;&gt; -+<br>
&gt;&gt; -+Also add information on how to contact you by electronic and pap=
er mail.<br>
&gt;&gt; -+<br>
&gt;&gt; -+If the program is interactive, make it output a short notice lik=
e this<br>
&gt;&gt; -+when it starts in an interactive mode:<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 Gnomovision version 69, Copyright (C) year name of=
 author<br>
&gt;&gt; -+=C2=A0 =C2=A0 Gnomovision comes with ABSOLUTELY NO WARRANTY; for=
 details type `show w&#39;.<br>
&gt;&gt; -+=C2=A0 =C2=A0 This is free software, and you are welcome to redi=
stribute it<br>
&gt;&gt; -+=C2=A0 =C2=A0 under certain conditions; type `show c&#39; for de=
tails.<br>
&gt;&gt; -+<br>
&gt;&gt; -+The hypothetical commands `show w&#39; and `show c&#39; should s=
how the appropriate<br>
&gt;&gt; -+parts of the General Public License.=C2=A0 Of course, the comman=
ds you use may<br>
&gt;&gt; -+be called something other than `show w&#39; and `show c&#39;; th=
ey could even be<br>
&gt;&gt; -+mouse-clicks or menu items--whatever suits your program.<br>
&gt;&gt; -+<br>
&gt;&gt; -+You should also get your employer (if you work as a programmer) =
or your<br>
&gt;&gt; -+school, if any, to sign a &quot;copyright disclaimer&quot; for t=
he program, if<br>
&gt;&gt; -+necessary.=C2=A0 Here is a sample; alter the names:<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 Yoyodyne, Inc., hereby disclaims all copyright interest i=
n the program<br>
&gt;&gt; -+=C2=A0 `Gnomovision&#39; (which makes passes at compilers) writt=
en by James Hacker.<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 &lt;signature of Ty Coon&gt;, 1 April 1989<br>
&gt;&gt; -+=C2=A0 Ty Coon, President of Vice<br>
&gt;&gt; -+<br>
&gt;&gt; -+This General Public License does not permit incorporating your p=
rogram into<br>
&gt;&gt; -+proprietary programs.=C2=A0 If your program is a subroutine libr=
ary, you may<br>
&gt;&gt; -+consider it more useful to permit linking proprietary applicatio=
ns with the<br>
&gt;&gt; -+library.=C2=A0 If this is what you want to do, use the GNU Libra=
ry General<br>
&gt;&gt; -+Public License instead of this License.<br>
&gt;&gt; diff --git a/meta/recipes-devtools/makedevs/<a href=3D"http://make=
devs_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">makedevs_1.0.1.bb</a> b=
/meta/recipes-devtools/makedevs/<a href=3D"http://makedevs_1.0.1.bb" rel=3D=
"noreferrer" target=3D"_blank">makedevs_1.0.1.bb</a><br>
&gt;&gt; index 007ebbca89..127ab489f9 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/makedevs/<a href=3D"http://makedevs_1.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">makedevs_1.0.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/makedevs/<a href=3D"http://makedevs_1.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">makedevs_1.0.1.bb</a><br>
&gt;&gt; @@ -1,10 +1,9 @@<br>
&gt;&gt;=C2=A0 SUMMARY =3D &quot;Tool for creating device nodes&quot;<br>
&gt;&gt;=C2=A0 DESCRIPTION =3D &quot;${SUMMARY}&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D393a5ca445f696587=
3eca0259a17f833&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/GPL-2.0-o=
r-later;md5=3Dfed54355545ffd980b814dab4a3b312c&quot;<br>
&gt;&gt;=C2=A0 SECTION =3D &quot;base&quot;<br>
&gt;&gt; -SRC_URI =3D &quot;file://makedevs.c \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.patch&quo=
t;<br>
&gt;&gt; +SRC_URI =3D &quot;file://makedevs.c&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#166162): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/166162" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/166162</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91338664=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91338664/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000263f5e05dfda640e--

