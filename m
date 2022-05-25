Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC844C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:30:57 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.10533.1653503455969624194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ixeeKky5;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id x65so13837687qke.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lSTPAJUUzg1fYPfSEoJ97tUCxP7bHY1dTU+Ec1Tc/iE=;
        b=ixeeKky5h8E6MFkGJSfHDmxzYVMln7Jfbu2r6+dbNM2cFyhNpEsQB3Gsp7aZzSHH31
         ojHYkQY/kVHCnvQdHzZWbJojj98IS4wR7hPEUtMYpghDitXElkqq7Ex9nep9EPOBqFsV
         gyfNcMUDqbpELCKq/uD1BSG8GGPCbx304tpXUb1Li3lGMpZ0t/nnnGKWi+AUOlVqvirh
         yZrKY4m+bNwfR/7hyjyKF8Z9ZTV6nmPqfA6U+Pg/4iHku1G4p5CYYTIpCnhUG2UfsX6M
         B6iJ/SCaffldAYqrhs6X0urBGx1H4cTKcv4L2YWRsh0P7juBA4yd6Un3bKDKGYdEUTvl
         qbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lSTPAJUUzg1fYPfSEoJ97tUCxP7bHY1dTU+Ec1Tc/iE=;
        b=pitgAMK3jIxRozubRRM8Q2nOsSnkTwDoddNZwcMK1I+OThYS7G8B9ZNAYxIhrLJOc7
         wxpJhDglIKDdjmTJ7hZrUf5x1PUbqsIDE44nyBZ2A9h2fgUfZiouAbIshrGySXa3+VoY
         M6+ztJreYrYWxGT5C8pLYATVJV5+JPSyCVDS/Pwg/Q5myRg6Zxuv7lsUA7p5b2gASFbx
         /rDnP5WLy4L8mB5f4IAP5aacasLidHupzPe9JFDfQESjNAEnXU0LoPWZI8DoO9dGLqFM
         T8MA5txNPJjzCM6fIdeJ5NZmF9lTOWcss3H7ItZ/yueKEd5tK24uiJPQJenCCkmgWsnr
         w+xg==
X-Gm-Message-State: AOAM532fc0joYloZYeF3Sy8ydM9wmofiaYN0m3ZqzJ3JEquEpE8wfmEy
	o08ADXxTph6YOXLTRtxrHu6fZbijVZ8fpQ5irmI=
X-Google-Smtp-Source: 
 ABdhPJyV5eLtFHUrBBO9865WqHqcxcG919Yv115y1RTUAeXjqLHeUGz7B2q2i6SGYwrKfGzwaPSZXprhdand/P3zvBw=
X-Received: by 2002:a05:620a:17a4:b0:6a3:aa21:50d7 with SMTP id
 ay36-20020a05620a17a400b006a3aa2150d7mr9074116qkb.227.1653503454557; Wed, 25
 May 2022 11:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <16F26ACEC3C7C32B.14582@lists.openembedded.org>
 <CA+chaQd5GBkAx=pBky5FFjQkXCXXEjvoz2DC+QEYEvYR2e5PQg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQd5GBkAx=pBky5FFjQkXCXXEjvoz2DC+QEYEvYR2e5PQg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2022 11:30:28 -0700
Message-ID: 
 <CAMKF1sp-TA8PgE=QVtMH4oBUbyPB5V47MEf1v1bgEq-d6uzM+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedevs: Don't use COPYING.patch just to add
 GPL-2.0-or-later into
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 18:30:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166163

On Wed, May 25, 2022 at 11:21 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> FWIW: the code was introduced long time ago in bk:// without any license indication:
>
> https://git.openembedded.org/openembedded/log/packages/makedevs?h=master
> https://git.openembedded.org/openembedded/log/recipes/makedevs?h=master
> https://git.openembedded.org/openembedded-core/log/meta/recipes-devtools/makedevs
>
> and the GPL-2.0-or-later license was added much longer in:
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/makedevs?id=409ac23702058a058c187f22d796eff251a8f18e
>
> So I wouldn't say, it's completely clear, but this patch just keeps the same LICENSE value as was set in LICENSE in:
> https://git.openembedded.org/openembedded/commit/recipes/makedevs?h=master&id=122efc0b6621f22709fa7f8071392b37ae0d3b02
> but using "or-later" version in LIC_FILES_CHKSUM as added in COPYING.patch.

Buildroot added it in 2005 with license info in the file itself
https://github.com/buildroot/buildroot/commit/611ec0e3b16219c1987f2aca065ddec22bd84cc9

>
>
> On Wed, May 25, 2022 at 7:57 PM Martin Jansa via lists.openembedded.org <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
>>
>> * as it uses S = "${WORKDIR}" it's another possible reproducer for
>>   do_patch issue mentioned here:
>>   https://lists.yoctoproject.org/g/yocto/message/56602
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  .../makedevs/makedevs/COPYING.patch           | 346 ------------------
>>  .../makedevs/makedevs_1.0.1.bb                |   5 +-
>>  2 files changed, 2 insertions(+), 349 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/makedevs/makedevs/COPYING.patch
>>
>> diff --git a/meta/recipes-devtools/makedevs/makedevs/COPYING.patch b/meta/recipes-devtools/makedevs/makedevs/COPYING.patch
>> deleted file mode 100644
>> index 3a8902b97a..0000000000
>> --- a/meta/recipes-devtools/makedevs/makedevs/COPYING.patch
>> +++ /dev/null
>> @@ -1,346 +0,0 @@
>> -Upstream-Status: Inappropriate [licensing]
>> -
>> -diff -ruN makedevs-1.0.0-orig/COPYING makedevs-1.0.0/COPYING
>> ---- makedevs-1.0.0-orig/COPYING        1970-01-01 08:00:00.000000000 +0800
>> -+++ makedevs-1.0.0/COPYING     2010-12-09 16:42:20.274984665 +0800
>> -@@ -0,0 +1,340 @@
>> -+                  GNU GENERAL PUBLIC LICENSE
>> -+                     Version 2, June 1991
>> -+
>> -+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
>> -+                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>> -+ Everyone is permitted to copy and distribute verbatim copies
>> -+ of this license document, but changing it is not allowed.
>> -+
>> -+                          Preamble
>> -+
>> -+  The licenses for most software are designed to take away your
>> -+freedom to share and change it.  By contrast, the GNU General Public
>> -+License is intended to guarantee your freedom to share and change free
>> -+software--to make sure the software is free for all its users.  This
>> -+General Public License applies to most of the Free Software
>> -+Foundation's software and to any other program whose authors commit to
>> -+using it.  (Some other Free Software Foundation software is covered by
>> -+the GNU Library General Public License instead.)  You can apply it to
>> -+your programs, too.
>> -+
>> -+  When we speak of free software, we are referring to freedom, not
>> -+price.  Our General Public Licenses are designed to make sure that you
>> -+have the freedom to distribute copies of free software (and charge for
>> -+this service if you wish), that you receive source code or can get it
>> -+if you want it, that you can change the software or use pieces of it
>> -+in new free programs; and that you know you can do these things.
>> -+
>> -+  To protect your rights, we need to make restrictions that forbid
>> -+anyone to deny you these rights or to ask you to surrender the rights.
>> -+These restrictions translate to certain responsibilities for you if you
>> -+distribute copies of the software, or if you modify it.
>> -+
>> -+  For example, if you distribute copies of such a program, whether
>> -+gratis or for a fee, you must give the recipients all the rights that
>> -+you have.  You must make sure that they, too, receive or can get the
>> -+source code.  And you must show them these terms so they know their
>> -+rights.
>> -+
>> -+  We protect your rights with two steps: (1) copyright the software, and
>> -+(2) offer you this license which gives you legal permission to copy,
>> -+distribute and/or modify the software.
>> -+
>> -+  Also, for each author's protection and ours, we want to make certain
>> -+that everyone understands that there is no warranty for this free
>> -+software.  If the software is modified by someone else and passed on, we
>> -+want its recipients to know that what they have is not the original, so
>> -+that any problems introduced by others will not reflect on the original
>> -+authors' reputations.
>> -+
>> -+  Finally, any free program is threatened constantly by software
>> -+patents.  We wish to avoid the danger that redistributors of a free
>> -+program will individually obtain patent licenses, in effect making the
>> -+program proprietary.  To prevent this, we have made it clear that any
>> -+patent must be licensed for everyone's free use or not licensed at all.
>> -+
>> -+  The precise terms and conditions for copying, distribution and
>> -+modification follow.
>> -+
>> -+                  GNU GENERAL PUBLIC LICENSE
>> -+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
>> -+
>> -+  0. This License applies to any program or other work which contains
>> -+a notice placed by the copyright holder saying it may be distributed
>> -+under the terms of this General Public License.  The "Program", below,
>> -+refers to any such program or work, and a "work based on the Program"
>> -+means either the Program or any derivative work under copyright law:
>> -+that is to say, a work containing the Program or a portion of it,
>> -+either verbatim or with modifications and/or translated into another
>> -+language.  (Hereinafter, translation is included without limitation in
>> -+the term "modification".)  Each licensee is addressed as "you".
>> -+
>> -+Activities other than copying, distribution and modification are not
>> -+covered by this License; they are outside its scope.  The act of
>> -+running the Program is not restricted, and the output from the Program
>> -+is covered only if its contents constitute a work based on the
>> -+Program (independent of having been made by running the Program).
>> -+Whether that is true depends on what the Program does.
>> -+
>> -+  1. You may copy and distribute verbatim copies of the Program's
>> -+source code as you receive it, in any medium, provided that you
>> -+conspicuously and appropriately publish on each copy an appropriate
>> -+copyright notice and disclaimer of warranty; keep intact all the
>> -+notices that refer to this License and to the absence of any warranty;
>> -+and give any other recipients of the Program a copy of this License
>> -+along with the Program.
>> -+
>> -+You may charge a fee for the physical act of transferring a copy, and
>> -+you may at your option offer warranty protection in exchange for a fee.
>> -+
>> -+  2. You may modify your copy or copies of the Program or any portion
>> -+of it, thus forming a work based on the Program, and copy and
>> -+distribute such modifications or work under the terms of Section 1
>> -+above, provided that you also meet all of these conditions:
>> -+
>> -+    a) You must cause the modified files to carry prominent notices
>> -+    stating that you changed the files and the date of any change.
>> -+
>> -+    b) You must cause any work that you distribute or publish, that in
>> -+    whole or in part contains or is derived from the Program or any
>> -+    part thereof, to be licensed as a whole at no charge to all third
>> -+    parties under the terms of this License.
>> -+
>> -+    c) If the modified program normally reads commands interactively
>> -+    when run, you must cause it, when started running for such
>> -+    interactive use in the most ordinary way, to print or display an
>> -+    announcement including an appropriate copyright notice and a
>> -+    notice that there is no warranty (or else, saying that you provide
>> -+    a warranty) and that users may redistribute the program under
>> -+    these conditions, and telling the user how to view a copy of this
>> -+    License.  (Exception: if the Program itself is interactive but
>> -+    does not normally print such an announcement, your work based on
>> -+    the Program is not required to print an announcement.)
>> -+
>> -+These requirements apply to the modified work as a whole.  If
>> -+identifiable sections of that work are not derived from the Program,
>> -+and can be reasonably considered independent and separate works in
>> -+themselves, then this License, and its terms, do not apply to those
>> -+sections when you distribute them as separate works.  But when you
>> -+distribute the same sections as part of a whole which is a work based
>> -+on the Program, the distribution of the whole must be on the terms of
>> -+this License, whose permissions for other licensees extend to the
>> -+entire whole, and thus to each and every part regardless of who wrote it.
>> -+
>> -+Thus, it is not the intent of this section to claim rights or contest
>> -+your rights to work written entirely by you; rather, the intent is to
>> -+exercise the right to control the distribution of derivative or
>> -+collective works based on the Program.
>> -+
>> -+In addition, mere aggregation of another work not based on the Program
>> -+with the Program (or with a work based on the Program) on a volume of
>> -+a storage or distribution medium does not bring the other work under
>> -+the scope of this License.
>> -+
>> -+  3. You may copy and distribute the Program (or a work based on it,
>> -+under Section 2) in object code or executable form under the terms of
>> -+Sections 1 and 2 above provided that you also do one of the following:
>> -+
>> -+    a) Accompany it with the complete corresponding machine-readable
>> -+    source code, which must be distributed under the terms of Sections
>> -+    1 and 2 above on a medium customarily used for software interchange; or,
>> -+
>> -+    b) Accompany it with a written offer, valid for at least three
>> -+    years, to give any third party, for a charge no more than your
>> -+    cost of physically performing source distribution, a complete
>> -+    machine-readable copy of the corresponding source code, to be
>> -+    distributed under the terms of Sections 1 and 2 above on a medium
>> -+    customarily used for software interchange; or,
>> -+
>> -+    c) Accompany it with the information you received as to the offer
>> -+    to distribute corresponding source code.  (This alternative is
>> -+    allowed only for noncommercial distribution and only if you
>> -+    received the program in object code or executable form with such
>> -+    an offer, in accord with Subsection b above.)
>> -+
>> -+The source code for a work means the preferred form of the work for
>> -+making modifications to it.  For an executable work, complete source
>> -+code means all the source code for all modules it contains, plus any
>> -+associated interface definition files, plus the scripts used to
>> -+control compilation and installation of the executable.  However, as a
>> -+special exception, the source code distributed need not include
>> -+anything that is normally distributed (in either source or binary
>> -+form) with the major components (compiler, kernel, and so on) of the
>> -+operating system on which the executable runs, unless that component
>> -+itself accompanies the executable.
>> -+
>> -+If distribution of executable or object code is made by offering
>> -+access to copy from a designated place, then offering equivalent
>> -+access to copy the source code from the same place counts as
>> -+distribution of the source code, even though third parties are not
>> -+compelled to copy the source along with the object code.
>> -+
>> -+  4. You may not copy, modify, sublicense, or distribute the Program
>> -+except as expressly provided under this License.  Any attempt
>> -+otherwise to copy, modify, sublicense or distribute the Program is
>> -+void, and will automatically terminate your rights under this License.
>> -+However, parties who have received copies, or rights, from you under
>> -+this License will not have their licenses terminated so long as such
>> -+parties remain in full compliance.
>> -+
>> -+  5. You are not required to accept this License, since you have not
>> -+signed it.  However, nothing else grants you permission to modify or
>> -+distribute the Program or its derivative works.  These actions are
>> -+prohibited by law if you do not accept this License.  Therefore, by
>> -+modifying or distributing the Program (or any work based on the
>> -+Program), you indicate your acceptance of this License to do so, and
>> -+all its terms and conditions for copying, distributing or modifying
>> -+the Program or works based on it.
>> -+
>> -+  6. Each time you redistribute the Program (or any work based on the
>> -+Program), the recipient automatically receives a license from the
>> -+original licensor to copy, distribute or modify the Program subject to
>> -+these terms and conditions.  You may not impose any further
>> -+restrictions on the recipients' exercise of the rights granted herein.
>> -+You are not responsible for enforcing compliance by third parties to
>> -+this License.
>> -+
>> -+  7. If, as a consequence of a court judgment or allegation of patent
>> -+infringement or for any other reason (not limited to patent issues),
>> -+conditions are imposed on you (whether by court order, agreement or
>> -+otherwise) that contradict the conditions of this License, they do not
>> -+excuse you from the conditions of this License.  If you cannot
>> -+distribute so as to satisfy simultaneously your obligations under this
>> -+License and any other pertinent obligations, then as a consequence you
>> -+may not distribute the Program at all.  For example, if a patent
>> -+license would not permit royalty-free redistribution of the Program by
>> -+all those who receive copies directly or indirectly through you, then
>> -+the only way you could satisfy both it and this License would be to
>> -+refrain entirely from distribution of the Program.
>> -+
>> -+If any portion of this section is held invalid or unenforceable under
>> -+any particular circumstance, the balance of the section is intended to
>> -+apply and the section as a whole is intended to apply in other
>> -+circumstances.
>> -+
>> -+It is not the purpose of this section to induce you to infringe any
>> -+patents or other property right claims or to contest validity of any
>> -+such claims; this section has the sole purpose of protecting the
>> -+integrity of the free software distribution system, which is
>> -+implemented by public license practices.  Many people have made
>> -+generous contributions to the wide range of software distributed
>> -+through that system in reliance on consistent application of that
>> -+system; it is up to the author/donor to decide if he or she is willing
>> -+to distribute software through any other system and a licensee cannot
>> -+impose that choice.
>> -+
>> -+This section is intended to make thoroughly clear what is believed to
>> -+be a consequence of the rest of this License.
>> -+
>> -+  8. If the distribution and/or use of the Program is restricted in
>> -+certain countries either by patents or by copyrighted interfaces, the
>> -+original copyright holder who places the Program under this License
>> -+may add an explicit geographical distribution limitation excluding
>> -+those countries, so that distribution is permitted only in or among
>> -+countries not thus excluded.  In such case, this License incorporates
>> -+the limitation as if written in the body of this License.
>> -+
>> -+  9. The Free Software Foundation may publish revised and/or new versions
>> -+of the General Public License from time to time.  Such new versions will
>> -+be similar in spirit to the present version, but may differ in detail to
>> -+address new problems or concerns.
>> -+
>> -+Each version is given a distinguishing version number.  If the Program
>> -+specifies a version number of this License which applies to it and "any
>> -+later version", you have the option of following the terms and conditions
>> -+either of that version or of any later version published by the Free
>> -+Software Foundation.  If the Program does not specify a version number of
>> -+this License, you may choose any version ever published by the Free Software
>> -+Foundation.
>> -+
>> -+  10. If you wish to incorporate parts of the Program into other free
>> -+programs whose distribution conditions are different, write to the author
>> -+to ask for permission.  For software which is copyrighted by the Free
>> -+Software Foundation, write to the Free Software Foundation; we sometimes
>> -+make exceptions for this.  Our decision will be guided by the two goals
>> -+of preserving the free status of all derivatives of our free software and
>> -+of promoting the sharing and reuse of software generally.
>> -+
>> -+                          NO WARRANTY
>> -+
>> -+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
>> -+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
>> -+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
>> -+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
>> -+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
>> -+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
>> -+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
>> -+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
>> -+REPAIR OR CORRECTION.
>> -+
>> -+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
>> -+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
>> -+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
>> -+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
>> -+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
>> -+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
>> -+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
>> -+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
>> -+POSSIBILITY OF SUCH DAMAGES.
>> -+
>> -+                   END OF TERMS AND CONDITIONS
>> -+
>> -+          How to Apply These Terms to Your New Programs
>> -+
>> -+  If you develop a new program, and you want it to be of the greatest
>> -+possible use to the public, the best way to achieve this is to make it
>> -+free software which everyone can redistribute and change under these terms.
>> -+
>> -+  To do so, attach the following notices to the program.  It is safest
>> -+to attach them to the start of each source file to most effectively
>> -+convey the exclusion of warranty; and each file should have at least
>> -+the "copyright" line and a pointer to where the full notice is found.
>> -+
>> -+    <one line to give the program's name and a brief idea of what it does.>
>> -+    Copyright (C) <year>  <name of author>
>> -+
>> -+    This program is free software; you can redistribute it and/or modify
>> -+    it under the terms of the GNU General Public License as published by
>> -+    the Free Software Foundation; either version 2 of the License, or
>> -+    (at your option) any later version.
>> -+
>> -+    This program is distributed in the hope that it will be useful,
>> -+    but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> -+    GNU General Public License for more details.
>> -+
>> -+    You should have received a copy of the GNU General Public License
>> -+    along with this program; if not, write to the Free Software
>> -+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>> -+
>> -+
>> -+Also add information on how to contact you by electronic and paper mail.
>> -+
>> -+If the program is interactive, make it output a short notice like this
>> -+when it starts in an interactive mode:
>> -+
>> -+    Gnomovision version 69, Copyright (C) year name of author
>> -+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
>> -+    This is free software, and you are welcome to redistribute it
>> -+    under certain conditions; type `show c' for details.
>> -+
>> -+The hypothetical commands `show w' and `show c' should show the appropriate
>> -+parts of the General Public License.  Of course, the commands you use may
>> -+be called something other than `show w' and `show c'; they could even be
>> -+mouse-clicks or menu items--whatever suits your program.
>> -+
>> -+You should also get your employer (if you work as a programmer) or your
>> -+school, if any, to sign a "copyright disclaimer" for the program, if
>> -+necessary.  Here is a sample; alter the names:
>> -+
>> -+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
>> -+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
>> -+
>> -+  <signature of Ty Coon>, 1 April 1989
>> -+  Ty Coon, President of Vice
>> -+
>> -+This General Public License does not permit incorporating your program into
>> -+proprietary programs.  If your program is a subroutine library, you may
>> -+consider it more useful to permit linking proprietary applications with the
>> -+library.  If this is what you want to do, use the GNU Library General
>> -+Public License instead of this License.
>> diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
>> index 007ebbca89..127ab489f9 100644
>> --- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
>> +++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
>> @@ -1,10 +1,9 @@
>>  SUMMARY = "Tool for creating device nodes"
>>  DESCRIPTION = "${SUMMARY}"
>>  LICENSE = "GPL-2.0-only"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=fed54355545ffd980b814dab4a3b312c"
>>  SECTION = "base"
>> -SRC_URI = "file://makedevs.c \
>> -           file://COPYING.patch"
>> +SRC_URI = "file://makedevs.c"
>>
>>  S = "${WORKDIR}"
>>
>> --
>> 2.35.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166162): https://lists.openembedded.org/g/openembedded-core/message/166162
> Mute This Topic: https://lists.openembedded.org/mt/91338664/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

