Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QxvPl-0008M6-31
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 08:33:45 +0200
Received: by ewy5 with SMTP id 5so2250365ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2011 23:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ahICGAzJhhC0VN/liHtfHXfb2VcGV3zNnMtilZ/TOcI=;
	b=ttKbB9thrnwx80YaF5npMKzb9OdwwZKOK8mcA05EMI53/WDbSJKDBlVyxZDySt4nHR
	+f5aScx54ASPyuXB3dvD4cSHwhHIWpi2EtundpIDEJEF7++MwPc3njSTxoM6eMvrxfFP
	GpjZu/Iv/9p2aUMrcxKKcfDDfvuFGMnKzX5VU=
MIME-Version: 1.0
Received: by 10.213.26.17 with SMTP id b17mr1253338ebc.2.1314599330222; Sun,
	28 Aug 2011 23:28:50 -0700 (PDT)
Received: by 10.213.26.13 with HTTP; Sun, 28 Aug 2011 23:28:50 -0700 (PDT)
In-Reply-To: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
Date: Mon, 29 Aug 2011 01:28:50 -0500
Message-ID: <CAD=GYpaG5t6rmv1cSgSBL+70nFK3i-vJPPbSh68d7hkb=T2y1w@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2011 06:33:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2011 at 1:12 AM, Joel A Fernandes <joelagnel@ti.com> wrote:
> Script written by Graeme Gregory
> http://www.angstrom-distribution.org/demo/beagleboard/mkcard.txt
>
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> Cc: Graeme Gregory <dp@xora.org.uk>
> Cc: Jason Kridner <jdk@ti.com>
> Cc: k-kooi@ti.com
> ---

This script is to be run as native and will be used for SD Card image creat=
ion

> =A0.../mkcard/mkcard-0.5/COPYING.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0344 ++++++++++++++++++++
> =A0meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt | =A0 79 +++++
> =A0meta/recipes-devtools/mkcard/mkcard_0.5.bb =A0 =A0 =A0 =A0 | =A0 19 +
> =A03 files changed, 442 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.pat=
ch
> =A0create mode 100755 meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt
> =A0create mode 100644 meta/recipes-devtools/mkcard/mkcard_0.5.bb
>
> diff --git a/meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch b/meta=
/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch
> new file mode 100644
> index 0000000..c70eaf6
> --- /dev/null
> +++ b/meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch
> @@ -0,0 +1,344 @@
> +diff -ruN mkcard-0.5-orig/COPYING mkdcard-0.5/COPYING
> +--- mkcard-0.5-orig/COPYING =A0 =A01970-01-01 08:00:00.000000000 +0800
> ++++ mkcard-0.5/COPYING 2010-12-09 16:42:20.274984665 +0800
> +@@ -0,0 +1,340 @@
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GNU GENERAL PUBLIC LICENSE
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Version 2, June 1991
> ++
> ++ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 59 Temple Place, Suite 330=
, Boston, MA =A002111-1307 =A0USA
> ++ Everyone is permitted to copy and distribute verbatim copies
> ++ of this license document, but changing it is not allowed.
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Preamble
> ++
> ++ =A0The licenses for most software are designed to take away your
> ++freedom to share and change it. =A0By contrast, the GNU General Public
> ++License is intended to guarantee your freedom to share and change free
> ++software--to make sure the software is free for all its users. =A0This
> ++General Public License applies to most of the Free Software
> ++Foundation's software and to any other program whose authors commit to
> ++using it. =A0(Some other Free Software Foundation software is covered b=
y
> ++the GNU Library General Public License instead.) =A0You can apply it to
> ++your programs, too.
> ++
> ++ =A0When we speak of free software, we are referring to freedom, not
> ++price. =A0Our General Public Licenses are designed to make sure that yo=
u
> ++have the freedom to distribute copies of free software (and charge for
> ++this service if you wish), that you receive source code or can get it
> ++if you want it, that you can change the software or use pieces of it
> ++in new free programs; and that you know you can do these things.
> ++
> ++ =A0To protect your rights, we need to make restrictions that forbid
> ++anyone to deny you these rights or to ask you to surrender the rights.
> ++These restrictions translate to certain responsibilities for you if you
> ++distribute copies of the software, or if you modify it.
> ++
> ++ =A0For example, if you distribute copies of such a program, whether
> ++gratis or for a fee, you must give the recipients all the rights that
> ++you have. =A0You must make sure that they, too, receive or can get the
> ++source code. =A0And you must show them these terms so they know their
> ++rights.
> ++
> ++ =A0We protect your rights with two steps: (1) copyright the software, =
and
> ++(2) offer you this license which gives you legal permission to copy,
> ++distribute and/or modify the software.
> ++
> ++ =A0Also, for each author's protection and ours, we want to make certai=
n
> ++that everyone understands that there is no warranty for this free
> ++software. =A0If the software is modified by someone else and passed on,=
 we
> ++want its recipients to know that what they have is not the original, so
> ++that any problems introduced by others will not reflect on the original
> ++authors' reputations.
> ++
> ++ =A0Finally, any free program is threatened constantly by software
> ++patents. =A0We wish to avoid the danger that redistributors of a free
> ++program will individually obtain patent licenses, in effect making the
> ++program proprietary. =A0To prevent this, we have made it clear that any
> ++patent must be licensed for everyone's free use or not licensed at all.
> ++
> ++ =A0The precise terms and conditions for copying, distribution and
> ++modification follow.
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GNU GENERAL PUBLIC LICENSE
> ++ =A0 TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> ++
> ++ =A00. This License applies to any program or other work which contains
> ++a notice placed by the copyright holder saying it may be distributed
> ++under the terms of this General Public License. =A0The "Program", below=
,
> ++refers to any such program or work, and a "work based on the Program"
> ++means either the Program or any derivative work under copyright law:
> ++that is to say, a work containing the Program or a portion of it,
> ++either verbatim or with modifications and/or translated into another
> ++language. =A0(Hereinafter, translation is included without limitation i=
n
> ++the term "modification".) =A0Each licensee is addressed as "you".
> ++
> ++Activities other than copying, distribution and modification are not
> ++covered by this License; they are outside its scope. =A0The act of
> ++running the Program is not restricted, and the output from the Program
> ++is covered only if its contents constitute a work based on the
> ++Program (independent of having been made by running the Program).
> ++Whether that is true depends on what the Program does.
> ++
> ++ =A01. You may copy and distribute verbatim copies of the Program's
> ++source code as you receive it, in any medium, provided that you
> ++conspicuously and appropriately publish on each copy an appropriate
> ++copyright notice and disclaimer of warranty; keep intact all the
> ++notices that refer to this License and to the absence of any warranty;
> ++and give any other recipients of the Program a copy of this License
> ++along with the Program.
> ++
> ++You may charge a fee for the physical act of transferring a copy, and
> ++you may at your option offer warranty protection in exchange for a fee.
> ++
> ++ =A02. You may modify your copy or copies of the Program or any portion
> ++of it, thus forming a work based on the Program, and copy and
> ++distribute such modifications or work under the terms of Section 1
> ++above, provided that you also meet all of these conditions:
> ++
> ++ =A0 =A0a) You must cause the modified files to carry prominent notices
> ++ =A0 =A0stating that you changed the files and the date of any change.
> ++
> ++ =A0 =A0b) You must cause any work that you distribute or publish, that=
 in
> ++ =A0 =A0whole or in part contains or is derived from the Program or any
> ++ =A0 =A0part thereof, to be licensed as a whole at no charge to all thi=
rd
> ++ =A0 =A0parties under the terms of this License.
> ++
> ++ =A0 =A0c) If the modified program normally reads commands interactivel=
y
> ++ =A0 =A0when run, you must cause it, when started running for such
> ++ =A0 =A0interactive use in the most ordinary way, to print or display a=
n
> ++ =A0 =A0announcement including an appropriate copyright notice and a
> ++ =A0 =A0notice that there is no warranty (or else, saying that you prov=
ide
> ++ =A0 =A0a warranty) and that users may redistribute the program under
> ++ =A0 =A0these conditions, and telling the user how to view a copy of th=
is
> ++ =A0 =A0License. =A0(Exception: if the Program itself is interactive bu=
t
> ++ =A0 =A0does not normally print such an announcement, your work based o=
n
> ++ =A0 =A0the Program is not required to print an announcement.)
> ++
> ++These requirements apply to the modified work as a whole. =A0If
> ++identifiable sections of that work are not derived from the Program,
> ++and can be reasonably considered independent and separate works in
> ++themselves, then this License, and its terms, do not apply to those
> ++sections when you distribute them as separate works. =A0But when you
> ++distribute the same sections as part of a whole which is a work based
> ++on the Program, the distribution of the whole must be on the terms of
> ++this License, whose permissions for other licensees extend to the
> ++entire whole, and thus to each and every part regardless of who wrote i=
t.
> ++
> ++Thus, it is not the intent of this section to claim rights or contest
> ++your rights to work written entirely by you; rather, the intent is to
> ++exercise the right to control the distribution of derivative or
> ++collective works based on the Program.
> ++
> ++In addition, mere aggregation of another work not based on the Program
> ++with the Program (or with a work based on the Program) on a volume of
> ++a storage or distribution medium does not bring the other work under
> ++the scope of this License.
> ++
> ++ =A03. You may copy and distribute the Program (or a work based on it,
> ++under Section 2) in object code or executable form under the terms of
> ++Sections 1 and 2 above provided that you also do one of the following:
> ++
> ++ =A0 =A0a) Accompany it with the complete corresponding machine-readabl=
e
> ++ =A0 =A0source code, which must be distributed under the terms of Secti=
ons
> ++ =A0 =A01 and 2 above on a medium customarily used for software interch=
ange; or,
> ++
> ++ =A0 =A0b) Accompany it with a written offer, valid for at least three
> ++ =A0 =A0years, to give any third party, for a charge no more than your
> ++ =A0 =A0cost of physically performing source distribution, a complete
> ++ =A0 =A0machine-readable copy of the corresponding source code, to be
> ++ =A0 =A0distributed under the terms of Sections 1 and 2 above on a medi=
um
> ++ =A0 =A0customarily used for software interchange; or,
> ++
> ++ =A0 =A0c) Accompany it with the information you received as to the off=
er
> ++ =A0 =A0to distribute corresponding source code. =A0(This alternative i=
s
> ++ =A0 =A0allowed only for noncommercial distribution and only if you
> ++ =A0 =A0received the program in object code or executable form with suc=
h
> ++ =A0 =A0an offer, in accord with Subsection b above.)
> ++
> ++The source code for a work means the preferred form of the work for
> ++making modifications to it. =A0For an executable work, complete source
> ++code means all the source code for all modules it contains, plus any
> ++associated interface definition files, plus the scripts used to
> ++control compilation and installation of the executable. =A0However, as =
a
> ++special exception, the source code distributed need not include
> ++anything that is normally distributed (in either source or binary
> ++form) with the major components (compiler, kernel, and so on) of the
> ++operating system on which the executable runs, unless that component
> ++itself accompanies the executable.
> ++
> ++If distribution of executable or object code is made by offering
> ++access to copy from a designated place, then offering equivalent
> ++access to copy the source code from the same place counts as
> ++distribution of the source code, even though third parties are not
> ++compelled to copy the source along with the object code.
> ++
> ++ =A04. You may not copy, modify, sublicense, or distribute the Program
> ++except as expressly provided under this License. =A0Any attempt
> ++otherwise to copy, modify, sublicense or distribute the Program is
> ++void, and will automatically terminate your rights under this License.
> ++However, parties who have received copies, or rights, from you under
> ++this License will not have their licenses terminated so long as such
> ++parties remain in full compliance.
> ++
> ++ =A05. You are not required to accept this License, since you have not
> ++signed it. =A0However, nothing else grants you permission to modify or
> ++distribute the Program or its derivative works. =A0These actions are
> ++prohibited by law if you do not accept this License. =A0Therefore, by
> ++modifying or distributing the Program (or any work based on the
> ++Program), you indicate your acceptance of this License to do so, and
> ++all its terms and conditions for copying, distributing or modifying
> ++the Program or works based on it.
> ++
> ++ =A06. Each time you redistribute the Program (or any work based on the
> ++Program), the recipient automatically receives a license from the
> ++original licensor to copy, distribute or modify the Program subject to
> ++these terms and conditions. =A0You may not impose any further
> ++restrictions on the recipients' exercise of the rights granted herein.
> ++You are not responsible for enforcing compliance by third parties to
> ++this License.
> ++
> ++ =A07. If, as a consequence of a court judgment or allegation of patent
> ++infringement or for any other reason (not limited to patent issues),
> ++conditions are imposed on you (whether by court order, agreement or
> ++otherwise) that contradict the conditions of this License, they do not
> ++excuse you from the conditions of this License. =A0If you cannot
> ++distribute so as to satisfy simultaneously your obligations under this
> ++License and any other pertinent obligations, then as a consequence you
> ++may not distribute the Program at all. =A0For example, if a patent
> ++license would not permit royalty-free redistribution of the Program by
> ++all those who receive copies directly or indirectly through you, then
> ++the only way you could satisfy both it and this License would be to
> ++refrain entirely from distribution of the Program.
> ++
> ++If any portion of this section is held invalid or unenforceable under
> ++any particular circumstance, the balance of the section is intended to
> ++apply and the section as a whole is intended to apply in other
> ++circumstances.
> ++
> ++It is not the purpose of this section to induce you to infringe any
> ++patents or other property right claims or to contest validity of any
> ++such claims; this section has the sole purpose of protecting the
> ++integrity of the free software distribution system, which is
> ++implemented by public license practices. =A0Many people have made
> ++generous contributions to the wide range of software distributed
> ++through that system in reliance on consistent application of that
> ++system; it is up to the author/donor to decide if he or she is willing
> ++to distribute software through any other system and a licensee cannot
> ++impose that choice.
> ++
> ++This section is intended to make thoroughly clear what is believed to
> ++be a consequence of the rest of this License.
> ++
> ++ =A08. If the distribution and/or use of the Program is restricted in
> ++certain countries either by patents or by copyrighted interfaces, the
> ++original copyright holder who places the Program under this License
> ++may add an explicit geographical distribution limitation excluding
> ++those countries, so that distribution is permitted only in or among
> ++countries not thus excluded. =A0In such case, this License incorporates
> ++the limitation as if written in the body of this License.
> ++
> ++ =A09. The Free Software Foundation may publish revised and/or new vers=
ions
> ++of the General Public License from time to time. =A0Such new versions w=
ill
> ++be similar in spirit to the present version, but may differ in detail t=
o
> ++address new problems or concerns.
> ++
> ++Each version is given a distinguishing version number. =A0If the Progra=
m
> ++specifies a version number of this License which applies to it and "any
> ++later version", you have the option of following the terms and conditio=
ns
> ++either of that version or of any later version published by the Free
> ++Software Foundation. =A0If the Program does not specify a version numbe=
r of
> ++this License, you may choose any version ever published by the Free Sof=
tware
> ++Foundation.
> ++
> ++ =A010. If you wish to incorporate parts of the Program into other free
> ++programs whose distribution conditions are different, write to the auth=
or
> ++to ask for permission. =A0For software which is copyrighted by the Free
> ++Software Foundation, write to the Free Software Foundation; we sometime=
s
> ++make exceptions for this. =A0Our decision will be guided by the two goa=
ls
> ++of preserving the free status of all derivatives of our free software a=
nd
> ++of promoting the sharing and reuse of software generally.
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NO WARRANTY
> ++
> ++ =A011. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WAR=
RANTY
> ++FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. =A0EXCEPT W=
HEN
> ++OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> ++PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRES=
SED
> ++OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> ++MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. =A0THE ENTIRE RIS=
K AS
> ++TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. =A0SHOULD TH=
E
> ++PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING=
,
> ++REPAIR OR CORRECTION.
> ++
> ++ =A012. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN W=
RITING
> ++WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> ++REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAG=
ES,
> ++INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARI=
SING
> ++OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMIT=
ED
> ++TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED B=
Y
> ++YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OT=
HER
> ++PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> ++POSSIBILITY OF SUCH DAMAGES.
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 END OF TERMS AND CONDITIONS
> ++
> ++ =A0 =A0 =A0 =A0 =A0How to Apply These Terms to Your New Programs
> ++
> ++ =A0If you develop a new program, and you want it to be of the greatest
> ++possible use to the public, the best way to achieve this is to make it
> ++free software which everyone can redistribute and change under these te=
rms.
> ++
> ++ =A0To do so, attach the following notices to the program. =A0It is saf=
est
> ++to attach them to the start of each source file to most effectively
> ++convey the exclusion of warranty; and each file should have at least
> ++the "copyright" line and a pointer to where the full notice is found.
> ++
> ++ =A0 =A0<one line to give the program's name and a brief idea of what i=
t does.>
> ++ =A0 =A0Copyright (C) <year> =A0<name of author>
> ++
> ++ =A0 =A0This program is free software; you can redistribute it and/or m=
odify
> ++ =A0 =A0it under the terms of the GNU General Public License as publish=
ed by
> ++ =A0 =A0the Free Software Foundation; either version 2 of the License, =
or
> ++ =A0 =A0(at your option) any later version.
> ++
> ++ =A0 =A0This program is distributed in the hope that it will be useful,
> ++ =A0 =A0but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ =A0 =A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> ++ =A0 =A0GNU General Public License for more details.
> ++
> ++ =A0 =A0You should have received a copy of the GNU General Public Licen=
se
> ++ =A0 =A0along with this program; if not, write to the Free Software
> ++ =A0 =A0Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =A0021=
11-1307 =A0USA
> ++
> ++
> ++Also add information on how to contact you by electronic and paper mail=
.
> ++
> ++If the program is interactive, make it output a short notice like this
> ++when it starts in an interactive mode:
> ++
> ++ =A0 =A0Gnomovision version 69, Copyright (C) year name of author
> ++ =A0 =A0Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type=
 `show w'.
> ++ =A0 =A0This is free software, and you are welcome to redistribute it
> ++ =A0 =A0under certain conditions; type `show c' for details.
> ++
> ++The hypothetical commands `show w' and `show c' should show the appropr=
iate
> ++parts of the General Public License. =A0Of course, the commands you use=
 may
> ++be called something other than `show w' and `show c'; they could even b=
e
> ++mouse-clicks or menu items--whatever suits your program.
> ++
> ++You should also get your employer (if you work as a programmer) or your
> ++school, if any, to sign a "copyright disclaimer" for the program, if
> ++necessary. =A0Here is a sample; alter the names:
> ++
> ++ =A0Yoyodyne, Inc., hereby disclaims all copyright interest in the prog=
ram
> ++ =A0`Gnomovision' (which makes passes at compilers) written by James Ha=
cker.
> ++
> ++ =A0<signature of Ty Coon>, 1 April 1989
> ++ =A0Ty Coon, President of Vice
> ++
> ++This General Public License does not permit incorporating your program =
into
> ++proprietary programs. =A0If your program is a subroutine library, you m=
ay
> ++consider it more useful to permit linking proprietary applications with=
 the
> ++library. =A0If this is what you want to do, use the GNU Library General
> ++Public License instead of this License.
> diff --git a/meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt b/meta/re=
cipes-devtools/mkcard/mkcard-0.5/mkcard.txt
> new file mode 100755
> index 0000000..743b36d
> --- /dev/null
> +++ b/meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt
> @@ -0,0 +1,79 @@
> +#! /bin/sh
> +# mkcard.sh v0.5
> +# (c) Copyright 2009 Graeme Gregory <dp@xora.org.uk>
> +# Licensed under terms of GPLv2
> +#
> +# Parts of the procudure base on the work of Denys Dmytriyenko
> +# http://wiki.omap.com/index.php/MMC_Boot_Format
> +
> +export LC_ALL=3DC
> +
> +if [ $# -ne 1 ]; then
> + =A0 =A0 =A0 echo "Usage: $0 <drive>"
> + =A0 =A0 =A0 exit 1;
> +fi
> +
> +DRIVE=3D$1
> +
> +dd if=3D/dev/zero of=3D$DRIVE bs=3D1024 count=3D1024
> +
> +SIZE=3D`fdisk -l $DRIVE | grep Disk | grep bytes | awk '{print $5}'`
> +
> +echo DISK SIZE - $SIZE bytes
> +
> +CYLINDERS=3D`echo $SIZE/255/63/512 | bc`
> +
> +echo CYLINDERS - $CYLINDERS
> +
> +{
> +echo ,9,0x0C,*
> +echo ,,,-
> +} | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
> +
> +sleep 1
> +
> +
> +if [ -x `which kpartx` ]; then
> + =A0 =A0 =A0 kpartx -a ${DRIVE}
> +fi
> +
> +# handle various device names.
> +# note something like fdisk -l /dev/loop0 | egrep -E '^/dev' | cut -d' '=
 -f1
> +# won't work due to https://bugzilla.redhat.com/show_bug.cgi?id=3D649572
> +
> +PARTITION1=3D${DRIVE}1
> +if [ ! -b ${PARTITION1} ]; then
> + =A0 =A0 =A0 PARTITION1=3D${DRIVE}p1
> +fi
> +
> +DRIVE_NAME=3D`basename $DRIVE`
> +DEV_DIR=3D`dirname $DRIVE`
> +
> +if [ ! -b ${PARTITION1} ]; then
> + =A0 =A0 =A0 PARTITION1=3D$DEV_DIR/mapper/${DRIVE_NAME}p1
> +fi
> +
> +PARTITION2=3D${DRIVE}2
> +if [ ! -b ${PARTITION2} ]; then
> + =A0 =A0 =A0 PARTITION2=3D${DRIVE}p2
> +fi
> +if [ ! -b ${PARTITION2} ]; then
> + =A0 =A0 =A0 PARTITION2=3D$DEV_DIR/mapper/${DRIVE_NAME}p2
> +fi
> +
> +
> +# now make partitions.
> +if [ -b ${PARTITION1} ]; then
> + =A0 =A0 =A0 umount ${PARTITION1}
> + =A0 =A0 =A0 mkfs.vfat -F 32 -n "boot" ${PARTITION1}
> +else
> + =A0 =A0 =A0 echo "Cant find boot partition in /dev"
> +fi
> +
> +if [ -b ${PARITION2} ]; then
> + =A0 =A0 =A0 umount ${PARTITION2}
> + =A0 =A0 =A0 mke2fs -j -L "Angstrom" ${PARTITION2}
> +else
> + =A0 =A0 =A0 echo "Cant find rootfs partition in /dev"
> +fi
> +
> diff --git a/meta/recipes-devtools/mkcard/mkcard_0.5.bb b/meta/recipes-de=
vtools/mkcard/mkcard_0.5.bb
> new file mode 100644
> index 0000000..4d4a642
> --- /dev/null
> +++ b/meta/recipes-devtools/mkcard/mkcard_0.5.bb
> @@ -0,0 +1,19 @@
> +inherit native
> +
> +DESCRIPTION =3D "A tool to format SD Cards correctly"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
> +SECTION =3D "base"
> +SRC_URI =3D "file://mkcard.txt \
> + =A0 =A0 =A0 =A0 =A0 file://COPYING.patch"
> +PR =3D "r0"
> +
> +do_configure() {
> + =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/mkcard.txt ${S}/
> +}
> +
> +do_install() {
> + =A0 =A0 =A0 install -d ${D}${base_sbindir}
> + =A0 =A0 =A0 install -m 0755 ${S}/mkcard.txt ${D}${base_sbindir}/mkcard
> +}
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


