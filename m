Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BE2E74AC6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 17:38:16 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.26332.1733247494756492136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 09:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEhH0Net;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71d51a9a42bso2700662a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733247494; x=1733852294; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qtp8y9JZG2m/I9hHZAJKspXZETFTx8umiKa8M6LgiQ=;
        b=CEhH0NetnMUHrG5ubSOC8JklFF6h+7m9XUBpOx7XhzBMkoIV9WlKiNu9lMTDO9AT89
         b1A/h/ACWw7ooOr8cmHS/2EjZxhW48t6RStuvaNTLQZx3PC1Yz2csP0zMCMiaAPyINwe
         z3IuzMFWQNr2U8l4BD952pJmz923uJltbnQzarEGXNAf6+EErvjlcKAE8kYXYwq9YL2s
         churPTQp+sDp84Wg4UeOvIedQS7tbVqG9vWhKPtJ2Aqdrhu88bkMrbxWLicIX2L4ShjL
         41NkUPvmDxuKmGpHPWIKJy7cvEhBMjd1vC5jFN3ayq9dRGLDJHmWRrXaPC7cie6W+8Fp
         PwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247494; x=1733852294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Qtp8y9JZG2m/I9hHZAJKspXZETFTx8umiKa8M6LgiQ=;
        b=mbHI6Urcj/3RuBw/6bITimEKfBeiSkzRVnGg6BECEYIUciVuESnu5Y/zwvPhoADuHE
         rIT73hNsEP014iIq2VVginQTFvg9e2EsDeGUe6zWKy8IJcnsXNF52d8bmmDPfjtYvii2
         HvuJJdEJJIU5WfqRADozaQn3ckMmEveiY7SrSdlHDNQbOKVhCLA1pMo9VqEvrBlyKzL0
         cN19WjvoaneH28LcR/fWLCyAb1yEMFaelGclul8+ektql4BEjwUtUB+sCbl5oG7ow83J
         xNfm084hicyjY70V2Hmc+zc/MQIvXmfNrjnj36M88ax2s9JXigwk/CgSgs9Gg02CTg7a
         1znw==
X-Gm-Message-State: AOJu0YxgrswC52nKIm5gY2icm6Fal7LV+2EHDUKCKKAkFWACXrz9laPb
	QbMTFikwHZ1lgKcFz9vAoR5njsFYIGxG1O36IYdG5dBFwXdS93zvErIckRRYhCE6pvHLvMYH+M4
	XoqUl01/895yQVIY3gjUJjnv5k5U=
X-Gm-Gg: ASbGncsraYaLUzW/RqzR8imYM/ftTvgwyJG49QQ/8PPN0vB8jLKtZtLxc/bzc1MAH66
	TOD5MHxfpUo0X7laV0owAlFGM5hXIg8I=
X-Google-Smtp-Source: AGHT+IFn6f4sVMTqPSqo2dodnRXN5GF5dwz3V3IQH/LmfRqUtTUm1CW/hIKQ1vd3xPLuBm86aKUcwXKifOl8B7ZZUaE=
X-Received: by 2002:a05:6830:6a8d:b0:718:db7:708d with SMTP id
 46e09a7af769-71dad701b54mr3521815a34.28.1733247493611; Tue, 03 Dec 2024
 09:38:13 -0800 (PST)
MIME-Version: 1.0
References: <7568332ffcb1456abdd1677fabb9fc8f@diehl.com>
In-Reply-To: <7568332ffcb1456abdd1677fabb9fc8f@diehl.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2024 09:37:47 -0800
Message-ID: <CAMKF1srCUPhs4UpKrnFQZ3t7raASJmHhz5cGpA3jOzef3qC4yQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-yocto: add and use GPL-2.0-with-syscall-note
 license
To: denis.osterland@diehl.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208219

On Tue, Dec 3, 2024 at 4:19=E2=80=AFAM Denis OSTERLAND-HEIM via
lists.openembedded.org
<denis.osterland=3Ddiehl.com@lists.openembedded.org> wrote:
>
> See Linux COPYING, LICENSES/preferred/GPL-2.0
> and LICENSES/exceptions/Linux-syscall-note.
>
> Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
> ---
> v1 -> v2:
>   * add full GPL-2.0 license text
>
>  .../GPL-2.0-with-Linux-syscall-note           | 357 ++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc     |   2 +-
>  2 files changed, 358 insertions(+), 1 deletion(-)
>  create mode 100644 meta/files/common-licenses/GPL-2.0-with-Linux-syscall=
-note
>
> diff --git a/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note b=
/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note
> new file mode 100644
> index 0000000000..90b059c286
> --- /dev/null
> +++ b/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note
> @@ -0,0 +1,357 @@
> +
> +                   GNU GENERAL PUBLIC LICENSE
> +                      Version 2, June 1991
> +
> + Copyright (C) 1989, 1991 Free Software Foundation, Inc.
> +                       51 Franklin St, Fifth Floor, Boston, MA  02110-13=
01  USA
> + Everyone is permitted to copy and distribute verbatim copies
> + of this license document, but changing it is not allowed.
> +
> +                           Preamble
> +
> +  The licenses for most software are designed to take away your
> +freedom to share and change it.  By contrast, the GNU General Public
> +License is intended to guarantee your freedom to share and change free
> +software--to make sure the software is free for all its users.  This
> +General Public License applies to most of the Free Software
> +Foundation's software and to any other program whose authors commit to
> +using it.  (Some other Free Software Foundation software is covered by
> +the GNU Library General Public License instead.)  You can apply it to
> +your programs, too.
> +
> +  When we speak of free software, we are referring to freedom, not
> +price.  Our General Public Licenses are designed to make sure that you
> +have the freedom to distribute copies of free software (and charge for
> +this service if you wish), that you receive source code or can get it
> +if you want it, that you can change the software or use pieces of it
> +in new free programs; and that you know you can do these things.
> +
> +  To protect your rights, we need to make restrictions that forbid
> +anyone to deny you these rights or to ask you to surrender the rights.
> +These restrictions translate to certain responsibilities for you if you
> +distribute copies of the software, or if you modify it.
> +
> +  For example, if you distribute copies of such a program, whether
> +gratis or for a fee, you must give the recipients all the rights that
> +you have.  You must make sure that they, too, receive or can get the
> +source code.  And you must show them these terms so they know their
> +rights.
> +
> +  We protect your rights with two steps: (1) copyright the software, and
> +(2) offer you this license which gives you legal permission to copy,
> +distribute and/or modify the software.
> +
> +  Also, for each author's protection and ours, we want to make certain
> +that everyone understands that there is no warranty for this free
> +software.  If the software is modified by someone else and passed on, we
> +want its recipients to know that what they have is not the original, so
> +that any problems introduced by others will not reflect on the original
> +authors' reputations.
> +
> +  Finally, any free program is threatened constantly by software
> +patents.  We wish to avoid the danger that redistributors of a free
> +program will individually obtain patent licenses, in effect making the
> +program proprietary.  To prevent this, we have made it clear that any
> +patent must be licensed for everyone's free use or not licensed at all.
> +
> +  The precise terms and conditions for copying, distribution and
> +modification follow.
> +
> +                   GNU GENERAL PUBLIC LICENSE
> +   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> +
> +  0. This License applies to any program or other work which contains
> +a notice placed by the copyright holder saying it may be distributed
> +under the terms of this General Public License.  The "Program", below,
> +refers to any such program or work, and a "work based on the Program"
> +means either the Program or any derivative work under copyright law:
> +that is to say, a work containing the Program or a portion of it,
> +either verbatim or with modifications and/or translated into another
> +language.  (Hereinafter, translation is included without limitation in
> +the term "modification".)  Each licensee is addressed as "you".
> +
> +Activities other than copying, distribution and modification are not
> +covered by this License; they are outside its scope.  The act of
> +running the Program is not restricted, and the output from the Program
> +is covered only if its contents constitute a work based on the
> +Program (independent of having been made by running the Program).
> +Whether that is true depends on what the Program does.
> +
> +  1. You may copy and distribute verbatim copies of the Program's
> +source code as you receive it, in any medium, provided that you
> +conspicuously and appropriately publish on each copy an appropriate
> +copyright notice and disclaimer of warranty; keep intact all the
> +notices that refer to this License and to the absence of any warranty;
> +and give any other recipients of the Program a copy of this License
> +along with the Program.
> +
> +You may charge a fee for the physical act of transferring a copy, and
> +you may at your option offer warranty protection in exchange for a fee.
> +
> +  2. You may modify your copy or copies of the Program or any portion
> +of it, thus forming a work based on the Program, and copy and
> +distribute such modifications or work under the terms of Section 1
> +above, provided that you also meet all of these conditions:
> +
> +    a) You must cause the modified files to carry prominent notices
> +    stating that you changed the files and the date of any change.
> +
> +    b) You must cause any work that you distribute or publish, that in
> +    whole or in part contains or is derived from the Program or any
> +    part thereof, to be licensed as a whole at no charge to all third
> +    parties under the terms of this License.
> +
> +    c) If the modified program normally reads commands interactively
> +    when run, you must cause it, when started running for such
> +    interactive use in the most ordinary way, to print or display an
> +    announcement including an appropriate copyright notice and a
> +    notice that there is no warranty (or else, saying that you provide
> +    a warranty) and that users may redistribute the program under
> +    these conditions, and telling the user how to view a copy of this
> +    License.  (Exception: if the Program itself is interactive but
> +    does not normally print such an announcement, your work based on
> +    the Program is not required to print an announcement.)
> +
> +These requirements apply to the modified work as a whole.  If
> +identifiable sections of that work are not derived from the Program,
> +and can be reasonably considered independent and separate works in
> +themselves, then this License, and its terms, do not apply to those
> +sections when you distribute them as separate works.  But when you
> +distribute the same sections as part of a whole which is a work based
> +on the Program, the distribution of the whole must be on the terms of
> +this License, whose permissions for other licensees extend to the
> +entire whole, and thus to each and every part regardless of who wrote it=
.
> +
> +Thus, it is not the intent of this section to claim rights or contest
> +your rights to work written entirely by you; rather, the intent is to
> +exercise the right to control the distribution of derivative or
> +collective works based on the Program.
> +
> +In addition, mere aggregation of another work not based on the Program
> +with the Program (or with a work based on the Program) on a volume of
> +a storage or distribution medium does not bring the other work under
> +the scope of this License.
> +
> +  3. You may copy and distribute the Program (or a work based on it,
> +under Section 2) in object code or executable form under the terms of
> +Sections 1 and 2 above provided that you also do one of the following:
> +
> +    a) Accompany it with the complete corresponding machine-readable
> +    source code, which must be distributed under the terms of Sections
> +    1 and 2 above on a medium customarily used for software interchange;=
 or,
> +
> +    b) Accompany it with a written offer, valid for at least three
> +    years, to give any third party, for a charge no more than your
> +    cost of physically performing source distribution, a complete
> +    machine-readable copy of the corresponding source code, to be
> +    distributed under the terms of Sections 1 and 2 above on a medium
> +    customarily used for software interchange; or,
> +
> +    c) Accompany it with the information you received as to the offer
> +    to distribute corresponding source code.  (This alternative is
> +    allowed only for noncommercial distribution and only if you
> +    received the program in object code or executable form with such
> +    an offer, in accord with Subsection b above.)
> +
> +The source code for a work means the preferred form of the work for
> +making modifications to it.  For an executable work, complete source
> +code means all the source code for all modules it contains, plus any
> +associated interface definition files, plus the scripts used to
> +control compilation and installation of the executable.  However, as a
> +special exception, the source code distributed need not include
> +anything that is normally distributed (in either source or binary
> +form) with the major components (compiler, kernel, and so on) of the
> +operating system on which the executable runs, unless that component
> +itself accompanies the executable.
> +
> +If distribution of executable or object code is made by offering
> +access to copy from a designated place, then offering equivalent
> +access to copy the source code from the same place counts as
> +distribution of the source code, even though third parties are not
> +compelled to copy the source along with the object code.
> +
> +  4. You may not copy, modify, sublicense, or distribute the Program
> +except as expressly provided under this License.  Any attempt
> +otherwise to copy, modify, sublicense or distribute the Program is
> +void, and will automatically terminate your rights under this License.
> +However, parties who have received copies, or rights, from you under
> +this License will not have their licenses terminated so long as such
> +parties remain in full compliance.
> +
> +  5. You are not required to accept this License, since you have not
> +signed it.  However, nothing else grants you permission to modify or
> +distribute the Program or its derivative works.  These actions are
> +prohibited by law if you do not accept this License.  Therefore, by
> +modifying or distributing the Program (or any work based on the
> +Program), you indicate your acceptance of this License to do so, and
> +all its terms and conditions for copying, distributing or modifying
> +the Program or works based on it.
> +
> +  6. Each time you redistribute the Program (or any work based on the
> +Program), the recipient automatically receives a license from the
> +original licensor to copy, distribute or modify the Program subject to
> +these terms and conditions.  You may not impose any further
> +restrictions on the recipients' exercise of the rights granted herein.
> +You are not responsible for enforcing compliance by third parties to
> +this License.
> +
> +  7. If, as a consequence of a court judgment or allegation of patent
> +infringement or for any other reason (not limited to patent issues),
> +conditions are imposed on you (whether by court order, agreement or
> +otherwise) that contradict the conditions of this License, they do not
> +excuse you from the conditions of this License.  If you cannot
> +distribute so as to satisfy simultaneously your obligations under this
> +License and any other pertinent obligations, then as a consequence you
> +may not distribute the Program at all.  For example, if a patent
> +license would not permit royalty-free redistribution of the Program by
> +all those who receive copies directly or indirectly through you, then
> +the only way you could satisfy both it and this License would be to
> +refrain entirely from distribution of the Program.
> +
> +If any portion of this section is held invalid or unenforceable under
> +any particular circumstance, the balance of the section is intended to
> +apply and the section as a whole is intended to apply in other
> +circumstances.
> +
> +It is not the purpose of this section to induce you to infringe any
> +patents or other property right claims or to contest validity of any
> +such claims; this section has the sole purpose of protecting the
> +integrity of the free software distribution system, which is
> +implemented by public license practices.  Many people have made
> +generous contributions to the wide range of software distributed
> +through that system in reliance on consistent application of that
> +system; it is up to the author/donor to decide if he or she is willing
> +to distribute software through any other system and a licensee cannot
> +impose that choice.
> +
> +This section is intended to make thoroughly clear what is believed to
> +be a consequence of the rest of this License.
> +
> +  8. If the distribution and/or use of the Program is restricted in
> +certain countries either by patents or by copyrighted interfaces, the
> +original copyright holder who places the Program under this License
> +may add an explicit geographical distribution limitation excluding
> +those countries, so that distribution is permitted only in or among
> +countries not thus excluded.  In such case, this License incorporates
> +the limitation as if written in the body of this License.
> +
> +  9. The Free Software Foundation may publish revised and/or new version=
s
> +of the General Public License from time to time.  Such new versions will
> +be similar in spirit to the present version, but may differ in detail to
> +address new problems or concerns.
> +
> +Each version is given a distinguishing version number.  If the Program
> +specifies a version number of this License which applies to it and "any
> +later version", you have the option of following the terms and condition=
s
> +either of that version or of any later version published by the Free
> +Software Foundation.  If the Program does not specify a version number o=
f
> +this License, you may choose any version ever published by the Free Soft=
ware
> +Foundation.
> +
> +  10. If you wish to incorporate parts of the Program into other free
> +programs whose distribution conditions are different, write to the autho=
r
> +to ask for permission.  For software which is copyrighted by the Free
> +Software Foundation, write to the Free Software Foundation; we sometimes
> +make exceptions for this.  Our decision will be guided by the two goals
> +of preserving the free status of all derivatives of our free software an=
d
> +of promoting the sharing and reuse of software generally.
> +
> +                           NO WARRANTY
> +
> +  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRAN=
TY
> +FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
> +OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> +PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS=
ED
> +OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> +MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK A=
S
> +TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
> +PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
> +REPAIR OR CORRECTION.
> +
> +  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRIT=
ING
> +WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> +REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGE=
S,
> +INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARIS=
ING
> +OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITE=
D
> +TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
> +YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTH=
ER
> +PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> +POSSIBILITY OF SUCH DAMAGES.
> +
> +                    END OF TERMS AND CONDITIONS
> +
> +           How to Apply These Terms to Your New Programs
> +
> +  If you develop a new program, and you want it to be of the greatest
> +possible use to the public, the best way to achieve this is to make it
> +free software which everyone can redistribute and change under these ter=
ms.
> +
> +  To do so, attach the following notices to the program.  It is safest
> +to attach them to the start of each source file to most effectively
> +convey the exclusion of warranty; and each file should have at least
> +the "copyright" line and a pointer to where the full notice is found.
> +
> +    <one line to give the program's name and a brief idea of what it doe=
s.>
> +    Copyright (C) <year>  <name of author>
> +
> +    This program is free software; you can redistribute it and/or modify
> +    it under the terms of the GNU General Public License as published by
> +    the Free Software Foundation; either version 2 of the License, or
> +    (at your option) any later version.
> +
> +    This program is distributed in the hope that it will be useful,
> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +    GNU General Public License for more details.
> +
> +    You should have received a copy of the GNU General Public License
> +    along with this program; if not, write to the Free Software
> +    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-130=
1  USA
> +
> +
> +Also add information on how to contact you by electronic and paper mail.
> +
> +If the program is interactive, make it output a short notice like this
> +when it starts in an interactive mode:
> +
> +    Gnomovision version 69, Copyright (C) year name of author
> +    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `sho=
w w'.
> +    This is free software, and you are welcome to redistribute it
> +    under certain conditions; type `show c' for details.
> +
> +The hypothetical commands `show w' and `show c' should show the appropri=
ate
> +parts of the General Public License.  Of course, the commands you use ma=
y
> +be called something other than `show w' and `show c'; they could even be
> +mouse-clicks or menu items--whatever suits your program.
> +
> +You should also get your employer (if you work as a programmer) or your
> +school, if any, to sign a "copyright disclaimer" for the program, if
> +necessary.  Here is a sample; alter the names:
> +
> +  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
> +  `Gnomovision' (which makes passes at compilers) written by James Hacke=
r.
> +
> +  <signature of Ty Coon>, 1 April 1989
> +  Ty Coon, President of Vice
> +
> +This General Public License does not permit incorporating your program i=
nto
> +proprietary programs.  If your program is a subroutine library, you may
> +consider it more useful to permit linking proprietary applications with =
the
> +library.  If this is what you want to do, use the GNU Library General
> +Public License instead of this License.
> +
> +
> +
> +   NOTE! This copyright does *not* cover user programs that use kernel
> + services by normal system calls - this is merely considered normal use
> + of the kernel, and does *not* fall under the heading of "derived work".
> + Also note that the GPL below is copyrighted by the Free Software
> + Foundation, but the instance of code that it refers to (the Linux
> + kernel) is copyrighted by me and others who actually wrote it.
> +
> + Also note that the only valid version of the GPL as far as the kernel
> + is concerned is _this_ particular version of the license (ie v2, not
> + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> +
> +                       Linus Torvalds
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 0132fcffb3..1765974666 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Linux kernel"
>  SECTION =3D "kernel"
> -LICENSE =3D "GPL-2.0-only"
> +LICENSE =3D "GPL-2.0-with-Linux-syscall-note"

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LIC=
ENSES/exceptions/Linux-syscall-note
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LIC=
ENSES/preferred/GPL-2.0

I know we have combined the exceptions and create individual files but
I wonder if there is a better way to
express it with combinations of files. eg. see
meta/files/common-licenses/GPL-3.0-with-GCC-exception
at the top it says "insert GPL v3 text here" seems a bit iffy. Instead
it could be expressed with two files having
full license texts.


>  HOMEPAGE =3D "https://www.yoctoproject.org/"
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be=
7cd7"
> --
> 2.45.2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208186): https://lists.openembedded.org/g/openembedde=
d-core/message/208186
> Mute This Topic: https://lists.openembedded.org/mt/109898806/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

