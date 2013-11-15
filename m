Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15D006DA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id AEBCA25B1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id auikNwePc3qc
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id B4F3125B07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 98F89BF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 82CBDBE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 80BD33E06F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH98m8014820
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98sX014819
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:50 +0100
Message-Id: <f8651db83fdd916be7edb7315a3bc7086531855a.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 01/14] pybootchartgui: Import pybootchartgui 0.14.5
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:36 -0000

This update the pybootchartgui code to the latest release from its new
location at "https://github.com/mmeeks/bootchart". This only imports
the relevant parts, and not all of bootchart2.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/AUTHORS                     |  10 +-
 scripts/pybootchartgui/COPYING                     | 912 +++++++--------------
 scripts/pybootchartgui/MAINTAINERS                 |   3 +
 scripts/pybootchartgui/NEWS                        | 204 +++++
 .../pybootchartgui/{README => README.pybootchart}  |  19 +-
 scripts/pybootchartgui/pybootchartgui.py           |  16 +
 scripts/pybootchartgui/pybootchartgui/batch.py     |  53 +-
 scripts/pybootchartgui/pybootchartgui/draw.py      | 710 +++++++++++++---
 scripts/pybootchartgui/pybootchartgui/gui.py       | 594 ++++++++------
 scripts/pybootchartgui/pybootchartgui/main.py      |  79 +-
 scripts/pybootchartgui/pybootchartgui/main.py.in   | 171 ++++
 scripts/pybootchartgui/pybootchartgui/parsing.py   | 791 ++++++++++++++----
 .../pybootchartgui/pybootchartgui/process_tree.py  | 126 +--
 scripts/pybootchartgui/pybootchartgui/samples.py   | 226 +++--
 .../pybootchartgui/tests/parser_test.py            |  82 +-
 .../pybootchartgui/tests/process_tree_test.py      |  30 +-
 16 files changed, 2563 insertions(+), 1463 deletions(-)
 create mode 100644 scripts/pybootchartgui/MAINTAINERS
 create mode 100644 scripts/pybootchartgui/NEWS
 rename scripts/pybootchartgui/{README => README.pybootchart} (61%)
 mode change 100644 => 120000 scripts/pybootchartgui/pybootchartgui/main.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/main.py.in

diff --git a/scripts/pybootchartgui/AUTHORS b/scripts/pybootchartgui/AUTHORS
index 45bd1ac..672b7e9 100644
--- a/scripts/pybootchartgui/AUTHORS
+++ b/scripts/pybootchartgui/AUTHORS
@@ -1,11 +1,11 @@
+Michael Meeks <michael.meeks@novell.com>
 Anders Norgaard <anders.norgaard@gmail.com>
+Scott James Remnant <scott@ubuntu.com>
 Henning Niss <henningniss@gmail.com>
-
-
+Riccardo Magliocchetti <riccardo.magliocchetti@gmail.com>
 
 Contributors:
-Brian Ewins
-
+	Brian Ewins
 
 Based on work by:
-Ziga Mahkovec
+	Ziga Mahkovec
diff --git a/scripts/pybootchartgui/COPYING b/scripts/pybootchartgui/COPYING
index 94a9ed0..ed87acf 100644
--- a/scripts/pybootchartgui/COPYING
+++ b/scripts/pybootchartgui/COPYING
@@ -1,626 +1,285 @@
-                    GNU GENERAL PUBLIC LICENSE
-                       Version 3, 29 June 2007
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
 
- Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+    51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
-                            Preamble
+			    Preamble
 
-  The GNU General Public License is a free, copyleft license for
-software and other kinds of works.
-
-  The licenses for most software and other practical works are designed
-to take away your freedom to share and change the works.  By contrast,
-the GNU General Public License is intended to guarantee your freedom to
-share and change all versions of a program--to make sure it remains free
-software for all its users.  We, the Free Software Foundation, use the
-GNU General Public License for most of our software; it applies also to
-any other work released this way by its authors.  You can apply it to
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
 your programs, too.
 
   When we speak of free software, we are referring to freedom, not
 price.  Our General Public Licenses are designed to make sure that you
 have the freedom to distribute copies of free software (and charge for
-them if you wish), that you receive source code or can get it if you
-want it, that you can change the software or use pieces of it in new
-free programs, and that you know you can do these things.
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
 
-  To protect your rights, we need to prevent others from denying you
-these rights or asking you to surrender the rights.  Therefore, you have
-certain responsibilities if you distribute copies of the software, or if
-you modify it: responsibilities to respect the freedom of others.
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
 
   For example, if you distribute copies of such a program, whether
-gratis or for a fee, you must pass on to the recipients the same
-freedoms that you received.  You must make sure that they, too, receive
-or can get the source code.  And you must show them these terms so they
-know their rights.
-
-  Developers that use the GNU GPL protect your rights with two steps:
-(1) assert copyright on the software, and (2) offer you this License
-giving you legal permission to copy, distribute and/or modify it.
-
-  For the developers' and authors' protection, the GPL clearly explains
-that there is no warranty for this free software.  For both users' and
-authors' sake, the GPL requires that modified versions be marked as
-changed, so that their problems will not be attributed erroneously to
-authors of previous versions.
-
-  Some devices are designed to deny users access to install or run
-modified versions of the software inside them, although the manufacturer
-can do so.  This is fundamentally incompatible with the aim of
-protecting users' freedom to change the software.  The systematic
-pattern of such abuse occurs in the area of products for individuals to
-use, which is precisely where it is most unacceptable.  Therefore, we
-have designed this version of the GPL to prohibit the practice for those
-products.  If such problems arise substantially in other domains, we
-stand ready to extend this provision to those domains in future versions
-of the GPL, as needed to protect the freedom of users.
-
-  Finally, every program is threatened constantly by software patents.
-States should not allow patents to restrict development and use of
-software on general-purpose computers, but in those that do, we wish to
-avoid the special danger that patents applied to a free program could
-make it effectively proprietary.  To prevent this, the GPL assures that
-patents cannot be used to render the program non-free.
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
 
   The precise terms and conditions for copying, distribution and
 modification follow.
-
-                       TERMS AND CONDITIONS
-
-  0. Definitions.
-
-  "This License" refers to version 3 of the GNU General Public License.
-
-  "Copyright" also means copyright-like laws that apply to other kinds of
-works, such as semiconductor masks.
-
-  "The Program" refers to any copyrightable work licensed under this
-License.  Each licensee is addressed as "you".  "Licensees" and
-"recipients" may be individuals or organizations.
-
-  To "modify" a work means to copy from or adapt all or part of the work
-in a fashion requiring copyright permission, other than the making of an
-exact copy.  The resulting work is called a "modified version" of the
-earlier work or a work "based on" the earlier work.
-
-  A "covered work" means either the unmodified Program or a work based
-on the Program.
-
-  To "propagate" a work means to do anything with it that, without
-permission, would make you directly or secondarily liable for
-infringement under applicable copyright law, except executing it on a
-computer or modifying a private copy.  Propagation includes copying,
-distribution (with or without modification), making available to the
-public, and in some countries other activities as well.
-
-  To "convey" a work means any kind of propagation that enables other
-parties to make or receive copies.  Mere interaction with a user through
-a computer network, with no transfer of a copy, is not conveying.
-
-  An interactive user interface displays "Appropriate Legal Notices"
-to the extent that it includes a convenient and prominently visible
-feature that (1) displays an appropriate copyright notice, and (2)
-tells the user that there is no warranty for the work (except to the
-extent that warranties are provided), that licensees may convey the
-work under this License, and how to view a copy of this License.  If
-the interface presents a list of user commands or options, such as a
-menu, a prominent item in the list meets this criterion.
-
-  1. Source Code.
-
-  The "source code" for a work means the preferred form of the work
-for making modifications to it.  "Object code" means any non-source
-form of a work.
-
-  A "Standard Interface" means an interface that either is an official
-standard defined by a recognized standards body, or, in the case of
-interfaces specified for a particular programming language, one that
-is widely used among developers working in that language.
-
-  The "System Libraries" of an executable work include anything, other
-than the work as a whole, that (a) is included in the normal form of
-packaging a Major Component, but which is not part of that Major
-Component, and (b) serves only to enable use of the work with that
-Major Component, or to implement a Standard Interface for which an
-implementation is available to the public in source code form.  A
-"Major Component", in this context, means a major essential component
-(kernel, window system, and so on) of the specific operating system
-(if any) on which the executable work runs, or a compiler used to
-produce the work, or an object code interpreter used to run it.
-
-  The "Corresponding Source" for a work in object code form means all
-the source code needed to generate, install, and (for an executable
-work) run the object code and to modify the work, including scripts to
-control those activities.  However, it does not include the work's
-System Libraries, or general-purpose tools or generally available free
-programs which are used unmodified in performing those activities but
-which are not part of the work.  For example, Corresponding Source
-includes interface definition files associated with source files for
-the work, and the source code for shared libraries and dynamically
-linked subprograms that the work is specifically designed to require,
-such as by intimate data communication or control flow between those
-subprograms and other parts of the work.
-
-  The Corresponding Source need not include anything that users
-can regenerate automatically from other parts of the Corresponding
-Source.
-
-  The Corresponding Source for a work in source code form is that
-same work.
-
-  2. Basic Permissions.
-
-  All rights granted under this License are granted for the term of
-copyright on the Program, and are irrevocable provided the stated
-conditions are met.  This License explicitly affirms your unlimited
-permission to run the unmodified Program.  The output from running a
-covered work is covered by this License only if the output, given its
-content, constitutes a covered work.  This License acknowledges your
-rights of fair use or other equivalent, as provided by copyright law.
-
-  You may make, run and propagate covered works that you do not
-convey, without conditions so long as your license otherwise remains
-in force.  You may convey covered works to others for the sole purpose
-of having them make modifications exclusively for you, or provide you
-with facilities for running those works, provided that you comply with
-the terms of this License in conveying all material for which you do
-not control copyright.  Those thus making or running the covered works
-for you must do so exclusively on your behalf, under your direction
-and control, on terms that prohibit them from making any copies of
-your copyrighted material outside their relationship with you.
-
-  Conveying under any other circumstances is permitted solely under
-the conditions stated below.  Sublicensing is not allowed; section 10
-makes it unnecessary.
-
-  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
-
-  No covered work shall be deemed part of an effective technological
-measure under any applicable law fulfilling obligations under article
-11 of the WIPO copyright treaty adopted on 20 December 1996, or
-similar laws prohibiting or restricting circumvention of such
-measures.
-
-  When you convey a covered work, you waive any legal power to forbid
-circumvention of technological measures to the extent such circumvention
-is effected by exercising rights under this License with respect to
-the covered work, and you disclaim any intention to limit operation or
-modification of the work as a means of enforcing, against the work's
-users, your or third parties' legal rights to forbid circumvention of
-technological measures.
-
-  4. Conveying Verbatim Copies.
-
-  You may convey verbatim copies of the Program's source code as you
-receive it, in any medium, provided that you conspicuously and
-appropriately publish on each copy an appropriate copyright notice;
-keep intact all notices stating that this License and any
-non-permissive terms added in accord with section 7 apply to the code;
-keep intact all notices of the absence of any warranty; and give all
-recipients a copy of this License along with the Program.
-
-  You may charge any price or no price for each copy that you convey,
-and you may offer support or warranty protection for a fee.
-
-  5. Conveying Modified Source Versions.
-
-  You may convey a work based on the Program, or the modifications to
-produce it from the Program, in the form of source code under the
-terms of section 4, provided that you also meet all of these conditions:
-
-    a) The work must carry prominent notices stating that you modified
-    it, and giving a relevant date.
-
-    b) The work must carry prominent notices stating that it is
-    released under this License and any conditions added under section
-    7.  This requirement modifies the requirement in section 4 to
-    "keep intact all notices".
-
-    c) You must license the entire work, as a whole, under this
-    License to anyone who comes into possession of a copy.  This
-    License will therefore apply, along with any applicable section 7
-    additional terms, to the whole of the work, and all its parts,
-    regardless of how they are packaged.  This License gives no
-    permission to license the work in any other way, but it does not
-    invalidate such permission if you have separately received it.
-
-    d) If the work has interactive user interfaces, each must display
-    Appropriate Legal Notices; however, if the Program has interactive
-    interfaces that do not display Appropriate Legal Notices, your
-    work need not make them do so.
-
-  A compilation of a covered work with other separate and independent
-works, which are not by their nature extensions of the covered work,
-and which are not combined with it such as to form a larger program,
-in or on a volume of a storage or distribution medium, is called an
-"aggregate" if the compilation and its resulting copyright are not
-used to limit the access or legal rights of the compilation's users
-beyond what the individual works permit.  Inclusion of a covered work
-in an aggregate does not cause this License to apply to the other
-parts of the aggregate.
-
-  6. Conveying Non-Source Forms.
-
-  You may convey a covered work in object code form under the terms
-of sections 4 and 5, provided that you also convey the
-machine-readable Corresponding Source under the terms of this License,
-in one of these ways:
-
-    a) Convey the object code in, or embodied in, a physical product
-    (including a physical distribution medium), accompanied by the
-    Corresponding Source fixed on a durable physical medium
-    customarily used for software interchange.
-
-    b) Convey the object code in, or embodied in, a physical product
-    (including a physical distribution medium), accompanied by a
-    written offer, valid for at least three years and valid for as
-    long as you offer spare parts or customer support for that product
-    model, to give anyone who possesses the object code either (1) a
-    copy of the Corresponding Source for all the software in the
-    product that is covered by this License, on a durable physical
-    medium customarily used for software interchange, for a price no
-    more than your reasonable cost of physically performing this
-    conveying of source, or (2) access to copy the
-    Corresponding Source from a network server at no charge.
-
-    c) Convey individual copies of the object code with a copy of the
-    written offer to provide the Corresponding Source.  This
-    alternative is allowed only occasionally and noncommercially, and
-    only if you received the object code with such an offer, in accord
-    with subsection 6b.
-
-    d) Convey the object code by offering access from a designated
-    place (gratis or for a charge), and offer equivalent access to the
-    Corresponding Source in the same way through the same place at no
-    further charge.  You need not require recipients to copy the
-    Corresponding Source along with the object code.  If the place to
-    copy the object code is a network server, the Corresponding Source
-    may be on a different server (operated by you or a third party)
-    that supports equivalent copying facilities, provided you maintain
-    clear directions next to the object code saying where to find the
-    Corresponding Source.  Regardless of what server hosts the
-    Corresponding Source, you remain obligated to ensure that it is
-    available for as long as needed to satisfy these requirements.
-
-    e) Convey the object code using peer-to-peer transmission, provided
-    you inform other peers where the object code and Corresponding
-    Source of the work are being offered to the general public at no
-    charge under subsection 6d.
-
-  A separable portion of the object code, whose source code is excluded
-from the Corresponding Source as a System Library, need not be
-included in conveying the object code work.
-
-  A "User Product" is either (1) a "consumer product", which means any
-tangible personal property which is normally used for personal, family,
-or household purposes, or (2) anything designed or sold for incorporation
-into a dwelling.  In determining whether a product is a consumer product,
-doubtful cases shall be resolved in favor of coverage.  For a particular
-product received by a particular user, "normally used" refers to a
-typical or common use of that class of product, regardless of the status
-of the particular user or of the way in which the particular user
-actually uses, or expects or is expected to use, the product.  A product
-is a consumer product regardless of whether the product has substantial
-commercial, industrial or non-consumer uses, unless such uses represent
-the only significant mode of use of the product.
-
-  "Installation Information" for a User Product means any methods,
-procedures, authorization keys, or other information required to install
-and execute modified versions of a covered work in that User Product from
-a modified version of its Corresponding Source.  The information must
-suffice to ensure that the continued functioning of the modified object
-code is in no case prevented or interfered with solely because
-modification has been made.
-
-  If you convey an object code work under this section in, or with, or
-specifically for use in, a User Product, and the conveying occurs as
-part of a transaction in which the right of possession and use of the
-User Product is transferred to the recipient in perpetuity or for a
-fixed term (regardless of how the transaction is characterized), the
-Corresponding Source conveyed under this section must be accompanied
-by the Installation Information.  But this requirement does not apply
-if neither you nor any third party retains the ability to install
-modified object code on the User Product (for example, the work has
-been installed in ROM).
-
-  The requirement to provide Installation Information does not include a
-requirement to continue to provide support service, warranty, or updates
-for a work that has been modified or installed by the recipient, or for
-the User Product in which it has been modified or installed.  Access to a
-network may be denied when the modification itself materially and
-adversely affects the operation of the network or violates the rules and
-protocols for communication across the network.
-
-  Corresponding Source conveyed, and Installation Information provided,
-in accord with this section must be in a format that is publicly
-documented (and with an implementation available to the public in
-source code form), and must require no special password or key for
-unpacking, reading or copying.
-
-  7. Additional Terms.
-
-  "Additional permissions" are terms that supplement the terms of this
-License by making exceptions from one or more of its conditions.
-Additional permissions that are applicable to the entire Program shall
-be treated as though they were included in this License, to the extent
-that they are valid under applicable law.  If additional permissions
-apply only to part of the Program, that part may be used separately
-under those permissions, but the entire Program remains governed by
-this License without regard to the additional permissions.
-
-  When you convey a copy of a covered work, you may at your option
-remove any additional permissions from that copy, or from any part of
-it.  (Additional permissions may be written to require their own
-removal in certain cases when you modify the work.)  You may place
-additional permissions on material, added by you to a covered work,
-for which you have or can give appropriate copyright permission.
-
-  Notwithstanding any other provision of this License, for material you
-add to a covered work, you may (if authorized by the copyright holders of
-that material) supplement the terms of this License with terms:
-
-    a) Disclaiming warranty or limiting liability differently from the
-    terms of sections 15 and 16 of this License; or
-
-    b) Requiring preservation of specified reasonable legal notices or
-    author attributions in that material or in the Appropriate Legal
-    Notices displayed by works containing it; or
-
-    c) Prohibiting misrepresentation of the origin of that material, or
-    requiring that modified versions of such material be marked in
-    reasonable ways as different from the original version; or
-
-    d) Limiting the use for publicity purposes of names of licensors or
-    authors of the material; or
-
-    e) Declining to grant rights under trademark law for use of some
-    trade names, trademarks, or service marks; or
-
-    f) Requiring indemnification of licensors and authors of that
-    material by anyone who conveys the material (or modified versions of
-    it) with contractual assumptions of liability to the recipient, for
-    any liability that these contractual assumptions directly impose on
-    those licensors and authors.
-
-  All other non-permissive additional terms are considered "further
-restrictions" within the meaning of section 10.  If the Program as you
-received it, or any part of it, contains a notice stating that it is
-governed by this License along with a term that is a further
-restriction, you may remove that term.  If a license document contains
-a further restriction but permits relicensing or conveying under this
-License, you may add to a covered work material governed by the terms
-of that license document, provided that the further restriction does
-not survive such relicensing or conveying.
-
-  If you add terms to a covered work in accord with this section, you
-must place, in the relevant source files, a statement of the
-additional terms that apply to those files, or a notice indicating
-where to find the applicable terms.
-
-  Additional terms, permissive or non-permissive, may be stated in the
-form of a separately written license, or stated as exceptions;
-the above requirements apply either way.
-
-  8. Termination.
-
-  You may not propagate or modify a covered work except as expressly
-provided under this License.  Any attempt otherwise to propagate or
-modify it is void, and will automatically terminate your rights under
-this License (including any patent licenses granted under the third
-paragraph of section 11).
-
-  However, if you cease all violation of this License, then your
-license from a particular copyright holder is reinstated (a)
-provisionally, unless and until the copyright holder explicitly and
-finally terminates your license, and (b) permanently, if the copyright
-holder fails to notify you of the violation by some reasonable means
-prior to 60 days after the cessation.
-
-  Moreover, your license from a particular copyright holder is
-reinstated permanently if the copyright holder notifies you of the
-violation by some reasonable means, this is the first time you have
-received notice of violation of this License (for any work) from that
-copyright holder, and you cure the violation prior to 30 days after
-your receipt of the notice.
-
-  Termination of your rights under this section does not terminate the
-licenses of parties who have received copies or rights from you under
-this License.  If your rights have been terminated and not permanently
-reinstated, you do not qualify to receive new licenses for the same
-material under section 10.
-
-  9. Acceptance Not Required for Having Copies.
-
-  You are not required to accept this License in order to receive or
-run a copy of the Program.  Ancillary propagation of a covered work
-occurring solely as a consequence of using peer-to-peer transmission
-to receive a copy likewise does not require acceptance.  However,
-nothing other than this License grants you permission to propagate or
-modify any covered work.  These actions infringe copyright if you do
-not accept this License.  Therefore, by modifying or propagating a
-covered work, you indicate your acceptance of this License to do so.
-
-  10. Automatic Licensing of Downstream Recipients.
-
-  Each time you convey a covered work, the recipient automatically
-receives a license from the original licensors, to run, modify and
-propagate that work, subject to this License.  You are not responsible
-for enforcing compliance by third parties with this License.
-
-  An "entity transaction" is a transaction transferring control of an
-organization, or substantially all assets of one, or subdividing an
-organization, or merging organizations.  If propagation of a covered
-work results from an entity transaction, each party to that
-transaction who receives a copy of the work also receives whatever
-licenses to the work the party's predecessor in interest had or could
-give under the previous paragraph, plus a right to possession of the
-Corresponding Source of the work from the predecessor in interest, if
-the predecessor has it or can get it with reasonable efforts.
-
-  You may not impose any further restrictions on the exercise of the
-rights granted or affirmed under this License.  For example, you may
-not impose a license fee, royalty, or other charge for exercise of
-rights granted under this License, and you may not initiate litigation
-(including a cross-claim or counterclaim in a lawsuit) alleging that
-any patent claim is infringed by making, using, selling, offering for
-sale, or importing the Program or any portion of it.
-
-  11. Patents.
-
-  A "contributor" is a copyright holder who authorizes use under this
-License of the Program or a work on which the Program is based.  The
-work thus licensed is called the contributor's "contributor version".
-
-  A contributor's "essential patent claims" are all patent claims
-owned or controlled by the contributor, whether already acquired or
-hereafter acquired, that would be infringed by some manner, permitted
-by this License, of making, using, or selling its contributor version,
-but do not include claims that would be infringed only as a
-consequence of further modification of the contributor version.  For
-purposes of this definition, "control" includes the right to grant
-patent sublicenses in a manner consistent with the requirements of
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
 this License.
 
-  Each contributor grants you a non-exclusive, worldwide, royalty-free
-patent license under the contributor's essential patent claims, to
-make, use, sell, offer for sale, import and otherwise run, modify and
-propagate the contents of its contributor version.
-
-  In the following three paragraphs, a "patent license" is any express
-agreement or commitment, however denominated, not to enforce a patent
-(such as an express permission to practice a patent or covenant not to
-sue for patent infringement).  To "grant" such a patent license to a
-party means to make such an agreement or commitment not to enforce a
-patent against the party.
-
-  If you convey a covered work, knowingly relying on a patent license,
-and the Corresponding Source of the work is not available for anyone
-to copy, free of charge and under the terms of this License, through a
-publicly available network server or other readily accessible means,
-then you must either (1) cause the Corresponding Source to be so
-available, or (2) arrange to deprive yourself of the benefit of the
-patent license for this particular work, or (3) arrange, in a manner
-consistent with the requirements of this License, to extend the patent
-license to downstream recipients.  "Knowingly relying" means you have
-actual knowledge that, but for the patent license, your conveying the
-covered work in a country, or your recipient's use of the covered work
-in a country, would infringe one or more identifiable patents in that
-country that you have reason to believe are valid.
-
-  If, pursuant to or in connection with a single transaction or
-arrangement, you convey, or propagate by procuring conveyance of, a
-covered work, and grant a patent license to some of the parties
-receiving the covered work authorizing them to use, propagate, modify
-or convey a specific copy of the covered work, then the patent license
-you grant is automatically extended to all recipients of the covered
-work and works based on it.
-
-  A patent license is "discriminatory" if it does not include within
-the scope of its coverage, prohibits the exercise of, or is
-conditioned on the non-exercise of one or more of the rights that are
-specifically granted under this License.  You may not convey a covered
-work if you are a party to an arrangement with a third party that is
-in the business of distributing software, under which you make payment
-to the third party based on the extent of your activity of conveying
-the work, and under which the third party grants, to any of the
-parties who would receive the covered work from you, a discriminatory
-patent license (a) in connection with copies of the covered work
-conveyed by you (or copies made from those copies), or (b) primarily
-for and in connection with specific products or compilations that
-contain the covered work, unless you entered into that arrangement,
-or that patent license was granted, prior to 28 March 2007.
-
-  Nothing in this License shall be construed as excluding or limiting
-any implied license or other defenses to infringement that may
-otherwise be available to you under applicable patent law.
-
-  12. No Surrender of Others' Freedom.
-
-  If conditions are imposed on you (whether by court order, agreement or
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
 otherwise) that contradict the conditions of this License, they do not
-excuse you from the conditions of this License.  If you cannot convey a
-covered work so as to satisfy simultaneously your obligations under this
-License and any other pertinent obligations, then as a consequence you may
-not convey it at all.  For example, if you agree to terms that obligate you
-to collect a royalty for further conveying from those to whom you convey
-the Program, the only way you could satisfy both those terms and this
-License would be to refrain entirely from conveying the Program.
-
-  13. Use with the GNU Affero General Public License.
-
-  Notwithstanding any other provision of this License, you have
-permission to link or combine any covered work with a work licensed
-under version 3 of the GNU Affero General Public License into a single
-combined work, and to convey the resulting work.  The terms of this
-License will continue to apply to the part which is the covered work,
-but the special requirements of the GNU Affero General Public License,
-section 13, concerning interaction through a network will apply to the
-combination as such.
-
-  14. Revised Versions of this License.
-
-  The Free Software Foundation may publish revised and/or new versions of
-the GNU General Public License from time to time.  Such new versions will
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
 be similar in spirit to the present version, but may differ in detail to
 address new problems or concerns.
 
-  Each version is given a distinguishing version number.  If the
-Program specifies that a certain numbered version of the GNU General
-Public License "or any later version" applies to it, you have the
-option of following the terms and conditions either of that numbered
-version or of any later version published by the Free Software
-Foundation.  If the Program does not specify a version number of the
-GNU General Public License, you may choose any version ever published
-by the Free Software Foundation.
-
-  If the Program specifies that a proxy can decide which future
-versions of the GNU General Public License can be used, that proxy's
-public statement of acceptance of a version permanently authorizes you
-to choose that version for the Program.
-
-  Later license versions may give you additional or different
-permissions.  However, no additional obligations are imposed on any
-author or copyright holder as a result of your choosing to follow a
-later version.
-
-  15. Disclaimer of Warranty.
-
-  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
-APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
-HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
-OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
-THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
-IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
-ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-  16. Limitation of Liability.
-
-  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
-THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
-GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
-USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
-DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
-PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
-EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
-SUCH DAMAGES.
-
-  17. Interpretation of Sections 15 and 16.
-
-  If the disclaimer of warranty and limitation of liability provided
-above cannot be given local legal effect according to their terms,
-reviewing courts shall apply local law that most closely approximates
-an absolute waiver of all civil liability in connection with the
-Program, unless a warranty or assumption of liability accompanies a
-copy of the Program in return for a fee.
-
-                     END OF TERMS AND CONDITIONS
-
-            How to Apply These Terms to Your New Programs
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
 
   If you develop a new program, and you want it to be of the greatest
 possible use to the public, the best way to achieve this is to make it
@@ -628,15 +287,15 @@ free software which everyone can redistribute and change under these terms.
 
   To do so, attach the following notices to the program.  It is safest
 to attach them to the start of each source file to most effectively
-state the exclusion of warranty; and each file should have at least
+convey the exclusion of warranty; and each file should have at least
 the "copyright" line and a pointer to where the full notice is found.
 
     <one line to give the program's name and a brief idea of what it does.>
     Copyright (C) <year>  <name of author>
 
-    This program is free software: you can redistribute it and/or modify
+    This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
-    the Free Software Foundation, either version 3 of the License, or
+    the Free Software Foundation; either version 2 of the License, or
     (at your option) any later version.
 
     This program is distributed in the hope that it will be useful,
@@ -645,30 +304,37 @@ the "copyright" line and a pointer to where the full notice is found.
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
+
 
 Also add information on how to contact you by electronic and paper mail.
 
-  If the program does terminal interaction, make it output a short
-notice like this when it starts in an interactive mode:
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
 
-    <program>  Copyright (C) <year>  <name of author>
-    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    Gnomovision version 69, Copyright (C) year  name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
     This is free software, and you are welcome to redistribute it
     under certain conditions; type `show c' for details.
 
 The hypothetical commands `show w' and `show c' should show the appropriate
-parts of the General Public License.  Of course, your program's commands
-might be different; for a GUI interface, you would use an "about box".
-
-  You should also get your employer (if you work as a programmer) or school,
-if any, to sign a "copyright disclaimer" for the program, if necessary.
-For more information on this, and how to apply and follow the GNU GPL, see
-<http://www.gnu.org/licenses/>.
-
-  The GNU General Public License does not permit incorporating your program
-into proprietary programs.  If your program is a subroutine library, you
-may consider it more useful to permit linking proprietary applications with
-the library.  If this is what you want to do, use the GNU Lesser General
-Public License instead of this License.  But first, please read
-<http://www.gnu.org/philosophy/why-not-lgpl.html>.
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/scripts/pybootchartgui/MAINTAINERS b/scripts/pybootchartgui/MAINTAINERS
new file mode 100644
index 0000000..c65e131
--- /dev/null
+++ b/scripts/pybootchartgui/MAINTAINERS
@@ -0,0 +1,3 @@
+Riccardo Magliocchetti <riccardo.magliocchetti@gmail.com>
+Michael Meeks <michael.meeks@novell.com>
+Harald Hoyer <harald@redhat.com>
diff --git a/scripts/pybootchartgui/NEWS b/scripts/pybootchartgui/NEWS
new file mode 100644
index 0000000..7c5b2fc
--- /dev/null
+++ b/scripts/pybootchartgui/NEWS
@@ -0,0 +1,204 @@
+bootchart2 0.14.5:
+	+ pybootchartgui (Riccardo)
+		+ Fix tests with python3
+		+ Fix parsing of files with non-ascii bytes
+		+ Robustness fixes to taskstats and meminfo parsing
+		+ More python3 fixes
+
+bootchart2 0.14.4:
+	+ bootchartd
+		+ Add relevant EXIT_PROC for GNOME3, XFCE4, openbox
+		  (Justin Lecher, Ben Eills)
+	+ pybootchartgui (Riccardo)
+		+ Fix some issues in --crop-after and --annotate
+		+ Fix pybootchartgui process_tree tests
+		+ More python3 fixes
+
+bootchart2 0.14.2:
+	+ pybootchartgui
+		+ Fix some crashes in parsing.py (Jakub Czaplicki, Riccardo)
+		+ speedup a bit meminfo parsing (Riccardo)
+		+ Fix indentation for python3.2 (Riccardo)
+
+bootchart2 0.14.1:
+	+ bootchartd
+		+ Expect dmesg only if started as init (Henry Yei)
+		+ look for bootchart_init in the environment (Henry Gebhardt)
+	+ pybootchartgui
+		+ Fixup some tests (Riccardo)
+		+ Support hp smart arrays block devices (Anders Norgaard,
+		  Brian Murray)
+		+ Fixes for -t, -o and -f options (Mladen Kuntner, Harald, Riccardo)
+
+bootchart2 0.14.0:
+	+ bootchartd
+		+ Add ability to define custom commands
+		  (Lucian Muresan, Peter Hjalmarsson)
+	+ collector
+		+ fix tmpfs mount leakage (Peter Hjalmarsson)
+	+ pybootchartgui
+		+ render cumulative I/O time chart (Sankar P)
+		+ python3 compatibility fixes (Riccardo)
+	+ Misc (Michael)
+		+ remove confusing, obsolete setup.py
+		+ install docs to /usr/share/
+		+ lot of fixes for easier packaging (Peter Hjalmarsson)
+		+ add bootchart2, bootchartd and pybootchartgui manpages
+		  (Francesca Ciceri, David Paleino)
+
+bootchart2 0.12.6:
+	+ bootchartd
+		+ better check for initrd (Riccardo Magliocchetti)
+		+ code cleanup (Riccardo)
+		+ make the list of processes we are waiting for editable
+		  in config file by EXIT_PROC (Riccardo)
+		+ fix parsing of cmdline for alternative init system (Riccardo)
+		+ fixed calling init in initramfs (Harald)
+		+ exit 0 for start, if the collector is already running (Harald)
+	+ collector
+		+ try harder with taskstats (Michael)
+		+ plug some small leaks (Riccardo)
+		+ fix missing PROC_EVENTS detection (Harald)
+	+ pybootchartgui (Michael)
+		+ add kernel bootchart tab to interactive gui
+		+ report bootchart version in cli interface
+		+ improve rendering performance
+		+ GUI improvements
+		+ lot of cleanups
+	+ Makefile
+		+ do not python compile if NO_PYTHON_COMPILE is set (Harald)
+	+ systemd service files
+		+ added them and install (Harald, Wulf C. Krueger)
+
+bootchart2 0.12.5:
+	+ administrative snafu version; pull before pushing...
+
+bootchart2 0.12.4:
+	+ bootchartd
+		+ reduce overhead caused by pidof (Riccardo Magliocchetti)
+	+ collector
+		+ attempt to retry ptrace to avoid bogus ENOSYS (Michael)
+		+ add meminfo polling (Dave Martin)
+	+ pybootchartgui
+		+ handle dmesg timestamps with big delta (Riccardo)
+		+ avoid divide by zero when rendering I/O utilization (Riccardo)
+		+ add process grouping in the cumulative chart (Riccardo)
+		+ fix cpu time calculation in cumulative chart (Riccardo)
+		+ get i/o statistics for flash based devices (Riccardo)
+		+ prettier coloring for the cumulative graphs (Michael)
+		+ fix interactive CPU rendering (Michael)
+		+ render memory usage graph (Dave Martin)
+
+bootchart2 0.12.3
+	+ collector
+		+ pclose after popen (Riccardo Magliocchetti (xrmx))
+		+ fix buffer overflow (xrmx)
+		+ count 'processor:' in /proc/cpuinfo for ARM (Michael)
+		+ get model name from that line too for ARM (xrmx)
+		+ store /proc/cpuinfo in the boot-chart archive (xrmx)
+		+ try harder to detect missing TASKSTATS (Michael)
+		+ sanity-check invalid domain names (Michael)
+		+ detect missing PROC_EVENTS more reliably (Michael)
+		+ README fixes (xrmx, Michael)
+	+ pybootchartgui
+		+ make num_cpu parsing robust (Michael)
+
+bootchart2 0.12.2
+ 	+ fix pthread compile / linking bug
+
+bootchart2 0.12.1
+	+ pybootchartgui
+		+ pylint cleanup
+		+ handle empty traces more elegantly
+		+ add '-t' / '--boot-time' argument (Matthew Bauer)
+	+ collector
+		+ now GPLv2
+		+ add rdinit support for very early initrd tracing
+		+ cleanup / re-factor code into separate modules
+		+ re-factor arg parsing, and parse remote process args
+		+ handle missing bootchartd.conf cleanly
+		+ move much of bootchartd from shell -> C
+			+ drop dmesg and uname usage
+			+ avoid rpm/dpkg with native version reporting
+
+bootchart2 0.12.0 (Michael Meeks)
+	+ collector
+		+ use netlink PROC_EVENTS to generate parentage data
+			+ finally kills any need for 'acct' et. al.
+			+ also removes need to poll /proc => faster
+		+ cleanup code to K&R, 8 stop tabs.
+	+ pybootchartgui
+		+ consume thread parentage data
+
+bootchart2 0.11.4 (Michael Meeks)
+	+ collector
+		+ if run inside an initrd detect when /dev is writable
+		  and remount ourselves into that.
+		+ overflow buffers more elegantly in extremis
+		+ dump full process path and command-line args
+		+ calm down debugging output
+	+ pybootchartgui
+		+ can render logs in a directory again
+		+ has a 'show more' option to show command-lines
+
+bootchart2 0.11.3 (Michael Meeks)
+	+ add $$ display to the bootchart header
+	+ process command-line bits
+		+ fix collection code, and rename stream to match
+		+ enable parsing, add check button to UI, and --show-all
+		  command-line option
+	+ fix parsing of directories full of files.
+
+bootchart2 0.11.2 (Michael Meeks)
+	+ fix initrd sanity check to use the right proc path
+	+ don't return a bogus error value when dumping state
+	+ add -c to aid manual console debugging
+
+bootchart2 0.11.1 (Michael Meeks)
+	+ even simpler initrd setup
+		+ create a single directory: /lib/bootchart/tmpfs
+
+bootchart2 0.11 (Michael Meeks)
+	+ bootchartd
+		+ far, far simpler, less shell, more robustness etc.
+	+ bootchart-collector
+		+ remove the -p argument - we always mount proc
+		+ requires /lib/bootchart (make install-chroot) to
+		  be present (also in the initrd) [ with a kmsg
+		  node included ]
+		+ add a --probe-running mode
+	+ ptrace re-write
+		+ gives -much- better early-boot-time resolution
+		+ unconditional chroot /lib/bootchart/chroot
+			+ we mount proc there ourselves
+		+ log extraction requires no common file-system view
+
+
+bootchart2 0.10.1 (Kel Modderman)
+	+ collector arg -m should mount /proc
+	+ remove bogus vcsid code
+	+ split collector install in Makefile
+	+ remove bogus debug code
+	+ accept process names containing spaces
+
+bootchart2 0.10.0
+	+ rendering (Anders Norgaard)
+		+ fix for unknown exceptions
+	+ interactive UI (Michael)
+		+ much faster rendering by manual clipping
+		+ horizontal scaling
+		+ remove annoying page-up/down bindings
+	+ initrd portability & fixes (Federic Crozat)
+		+ port to Mandriva
+		+ improved process waiting
+		+ inittab commenting fix
+		+ improved initrd detection / jail tagging
+		+ fix for un-detectable accton behaviour change
+		+ implement a built-in usleep to help initrd deps (Michael)
+
+bootchart2 0.0.9
+	+ fix initrd bug
+
+bootchart2 0.0.8
+	+ add a filename string to the window title in interactive mode
+	+ add a NEWS file
diff --git a/scripts/pybootchartgui/README b/scripts/pybootchartgui/README.pybootchart
similarity index 61%
rename from scripts/pybootchartgui/README
rename to scripts/pybootchartgui/README.pybootchart
index 1b97c44..8642e64 100644
--- a/scripts/pybootchartgui/README
+++ b/scripts/pybootchartgui/README.pybootchart
@@ -1,13 +1,14 @@
 			    PYBOOTCHARTGUI
 			   ----------------
 
-pybootchartgui is a tool for visualization and analysis of the
-GNU/Linux boot process. It renders the output of the boot-logger tool
-bootchart (see http://www.bootchart.org/) to either the screen or
-files of various formats. Bootchart collects information about the
-processes, their dependencies, and resource consumption during boot of
-a GNU/Linux system. The pybootchartgui tools visualizes the process
-tree and overall resource utilization.
+pybootchartgui is a tool (now included as part of bootchart2) for
+visualization and analysis of the GNU/Linux boot process. It renders
+the output of the boot-logger tool bootchart (see
+http://www.bootchart.org/) to either the screen or files of various
+formats. Bootchart collects information about the processes, their
+dependencies, and resource consumption during boot of a GNU/Linux
+system. The pybootchartgui tools visualizes the process tree and
+overall resource utilization.
 
 pybootchartgui is a port of the visualization part of bootchart from
 Java to Python and Cairo.
@@ -32,5 +33,5 @@ To get help for pybootchartgui, run
 
 $ pybootchartgui --help
 
-
-http://code.google.com/p/pybootchartgui/
+This code was originally hosted at:
+	http://code.google.com/p/pybootchartgui/
diff --git a/scripts/pybootchartgui/pybootchartgui.py b/scripts/pybootchartgui/pybootchartgui.py
index f301027..947ce10 100755
--- a/scripts/pybootchartgui/pybootchartgui.py
+++ b/scripts/pybootchartgui/pybootchartgui.py
@@ -1,4 +1,20 @@
 #!/usr/bin/python
+#
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
 
 import sys
 from pybootchartgui.main import main
diff --git a/scripts/pybootchartgui/pybootchartgui/batch.py b/scripts/pybootchartgui/pybootchartgui/batch.py
index 3c1dbf8..05c714e 100644
--- a/scripts/pybootchartgui/pybootchartgui/batch.py
+++ b/scripts/pybootchartgui/pybootchartgui/batch.py
@@ -1,23 +1,46 @@
-import cairo
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
 
-import draw
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
 
-def render(res, format, filename):
+import cairo
+from . import draw
+from .draw import RenderOptions
+
+def render(writer, trace, app_options, filename):
     handlers = {
-        "png": (lambda w,h: cairo.ImageSurface(cairo.FORMAT_ARGB32,w,h), lambda sfc: sfc.write_to_png(filename)),
-        "pdf": (lambda w,h: cairo.PDFSurface(filename, w, h), lambda sfc: 0),
-        "svg": (lambda w,h: cairo.SVGSurface(filename, w, h), lambda sfc: 0)
+        "png": (lambda w, h: cairo.ImageSurface(cairo.FORMAT_ARGB32, w, h), \
+                lambda sfc: sfc.write_to_png(filename)),
+        "pdf": (lambda w, h: cairo.PDFSurface(filename, w, h), lambda sfc: 0),
+        "svg": (lambda w, h: cairo.SVGSurface(filename, w, h), lambda sfc: 0)
     }
 
-    if not(handlers.has_key(format)):
-        print "Unknown format '%s'." % format
+    if app_options.format is None:
+        fmt = filename.rsplit('.', 1)[1]
+    else:
+        fmt = app_options.format
+
+    if not (fmt in handlers):
+        writer.error ("Unknown format '%s'." % fmt)
         return 10
 
-    make_surface, write_surface = handlers[format]
-    w,h = draw.extents(res)
-    w = max(w, draw.MIN_IMG_W)
-    surface = make_surface(w,h)
-    ctx = cairo.Context(surface)
-    draw.render(ctx, res)
-    write_surface(surface)
+    make_surface, write_surface = handlers[fmt]
+    options = RenderOptions (app_options)
+    (w, h) = draw.extents (options, 1.0, trace)
+    w = max (w, draw.MIN_IMG_W)
+    surface = make_surface (w, h)
+    ctx = cairo.Context (surface)
+    draw.render (ctx, options, 1.0, trace)
+    write_surface (surface)
+    writer.status ("bootchart written to '%s'" % filename)
 
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 1b872de..c3492c7 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -1,6 +1,40 @@
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
+
 import cairo
 import math
 import re
+import random
+import colorsys
+from operator import itemgetter
+
+class RenderOptions:
+
+	def __init__(self, app_options):
+		# should we render a cumulative CPU time chart
+		self.cumulative = True
+		self.charts = True
+		self.kernel_only = False
+		self.app_options = app_options
+
+	def proc_tree (self, trace):
+		if self.kernel_only:
+			return trace.kernel_tree
+		else:
+			return trace.proc_tree
 
 # Process tree background color.
 BACK_COLOR = (1.0, 1.0, 1.0, 1.0)
@@ -12,11 +46,13 @@ BORDER_COLOR = (0.63, 0.63, 0.63, 1.0)
 TICK_COLOR = (0.92, 0.92, 0.92, 1.0)
 # 5-second tick line color.
 TICK_COLOR_BOLD = (0.86, 0.86, 0.86, 1.0)
+# Annotation colour
+ANNOTATION_COLOR = (0.63, 0.0, 0.0, 0.5)
 # Text color.
 TEXT_COLOR = (0.0, 0.0, 0.0, 1.0)
 
 # Font family
-FONT_NAME = "Bitstream Vera Sans"	
+FONT_NAME = "Bitstream Vera Sans"
 # Title text font.
 TITLE_FONT_SIZE = 18
 # Default text font.
@@ -25,7 +61,7 @@ TEXT_FONT_SIZE = 12
 AXIS_FONT_SIZE = 11
 # Legend font.
 LEGEND_FONT_SIZE = 12
-	
+
 # CPU load chart color.
 CPU_COLOR = (0.40, 0.55, 0.70, 1.0)
 # IO wait chart color.
@@ -34,11 +70,19 @@ IO_COLOR = (0.76, 0.48, 0.48, 0.5)
 DISK_TPUT_COLOR = (0.20, 0.71, 0.20, 1.0)
 # CPU load chart color.
 FILE_OPEN_COLOR = (0.20, 0.71, 0.71, 1.0)
-	
+# Mem cached color
+MEM_CACHED_COLOR = CPU_COLOR
+# Mem used color
+MEM_USED_COLOR = IO_COLOR
+# Buffers color
+MEM_BUFFERS_COLOR = (0.4, 0.4, 0.4, 0.3)
+# Swap color
+MEM_SWAP_COLOR = DISK_TPUT_COLOR
+
 # Process border color.
 PROC_BORDER_COLOR = (0.71, 0.71, 0.71, 1.0)
-
-PROC_COLOR_D = (0.76, 0.48, 0.48, 0.125)
+# Waiting process color.
+PROC_COLOR_D = (0.76, 0.48, 0.48, 0.5)
 # Running process color.
 PROC_COLOR_R = CPU_COLOR
 # Sleeping process color.
@@ -62,8 +106,8 @@ SIG_COLOR = (0.0, 0.0, 0.0, 0.3125)
 # Signature font.
 SIG_FONT_SIZE = 14
 # Signature text.
-SIGNATURE = "http://code.google.com/p/pybootchartgui"
-	
+SIGNATURE = "http://github.com/mmeeks/bootchart"
+
 # Process dependency line color.
 DEP_COLOR = (0.75, 0.75, 0.75, 1.0)
 # Process dependency line stroke.
@@ -72,6 +116,10 @@ DEP_STROKE = 1.0
 # Process description date format.
 DESC_TIME_FORMAT = "mm:ss.SSS"
 
+# Cumulative coloring bits
+HSV_MAX_MOD = 31
+HSV_STEP = 7
+
 # Configure task color
 TASK_COLOR_CONFIGURE = (1.0, 1.0, 0.00, 1.0)
 # Compile task color.
@@ -91,66 +139,67 @@ STATE_WAITING   = 3
 STATE_STOPPED   = 4
 STATE_ZOMBIE    = 5
 
-STATE_COLORS = [(0,0,0,0), PROC_COLOR_R, PROC_COLOR_S, PROC_COLOR_D, PROC_COLOR_T, PROC_COLOR_Z, PROC_COLOR_X, PROC_COLOR_W]
+STATE_COLORS = [(0, 0, 0, 0), PROC_COLOR_R, PROC_COLOR_S, PROC_COLOR_D, \
+		PROC_COLOR_T, PROC_COLOR_Z, PROC_COLOR_X, PROC_COLOR_W]
+
+# CumulativeStats Types
+STAT_TYPE_CPU = 0
+STAT_TYPE_IO = 1
 
 # Convert ps process state to an int
 def get_proc_state(flag):
-	return "RSDTZXW".index(flag) + 1
-	
+	return "RSDTZXW".find(flag) + 1
 
 def draw_text(ctx, text, color, x, y):
 	ctx.set_source_rgba(*color)
 	ctx.move_to(x, y)
 	ctx.show_text(text)
-	
-	
+
 def draw_fill_rect(ctx, color, rect):
 	ctx.set_source_rgba(*color)
 	ctx.rectangle(*rect)
 	ctx.fill()
-	
 
 def draw_rect(ctx, color, rect):
 	ctx.set_source_rgba(*color)
 	ctx.rectangle(*rect)
 	ctx.stroke()
-	
-	
+
 def draw_legend_box(ctx, label, fill_color, x, y, s):
 	draw_fill_rect(ctx, fill_color, (x, y - s, s, s))
 	draw_rect(ctx, PROC_BORDER_COLOR, (x, y - s, s, s))
 	draw_text(ctx, label, TEXT_COLOR, x + s + 5, y)
-	
-     
+
 def draw_legend_line(ctx, label, fill_color, x, y, s):
-	draw_fill_rect(ctx, fill_color, (x, y - s/2, s + 1, 3))    
+	draw_fill_rect(ctx, fill_color, (x, y - s/2, s + 1, 3))
 	ctx.arc(x + (s + 1)/2.0, y - (s - 3)/2.0, 2.5, 0, 2.0 * math.pi)
 	ctx.fill()
 	draw_text(ctx, label, TEXT_COLOR, x + s + 5, y)
-	
 
 def draw_label_in_box(ctx, color, label, x, y, w, maxx):
 	label_w = ctx.text_extents(label)[2]
 	label_x = x + w / 2 - label_w / 2
-        if label_w + 10 > w:
-            label_x = x + w + 5
-        if label_x + label_w > maxx:
-            label_x = x - label_w - 5
+	if label_w + 10 > w:
+		label_x = x + w + 5
+	if label_x + label_w > maxx:
+		label_x = x - label_w - 5
 	draw_text(ctx, label, color, label_x, y)
 
-
-def draw_5sec_labels(ctx, rect, sec_w):
-        ctx.set_font_size(AXIS_FONT_SIZE)
+def draw_sec_labels(ctx, rect, sec_w, nsecs):
+	ctx.set_font_size(AXIS_FONT_SIZE)
+	prev_x = 0
 	for i in range(0, rect[2] + 1, sec_w):
-		if ((i / sec_w) % 30 == 0) :
+		if ((i / sec_w) % nsecs == 0) :
 			label = "%ds" % (i / sec_w)
 			label_w = ctx.text_extents(label)[2]
-			draw_text(ctx, label, TEXT_COLOR, rect[0] + i - label_w/2, rect[1] - 2)
-
+			x = rect[0] + i - label_w/2
+			if x >= prev_x:
+				draw_text(ctx, label, TEXT_COLOR, x, rect[1] - 2)
+				prev_x = x + label_w
 
 def draw_box_ticks(ctx, rect, sec_w):
 	draw_rect(ctx, BORDER_COLOR, tuple(rect))
-	
+
 	ctx.set_line_cap(cairo.LINE_CAP_SQUARE)
 
 	for i in range(sec_w, rect[2] + 1, sec_w):
@@ -164,136 +213,211 @@ def draw_box_ticks(ctx, rect, sec_w):
 
 	ctx.set_line_cap(cairo.LINE_CAP_BUTT)
 
-def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree):
+def draw_annotations(ctx, proc_tree, times, rect):
+    ctx.set_line_cap(cairo.LINE_CAP_SQUARE)
+    ctx.set_source_rgba(*ANNOTATION_COLOR)
+    ctx.set_dash([4, 4])
+
+    for time in times:
+        if time is not None:
+            x = ((time - proc_tree.start_time) * rect[2] / proc_tree.duration)
+
+            ctx.move_to(rect[0] + x, rect[1] + 1)
+            ctx.line_to(rect[0] + x, rect[1] + rect[3] - 1)
+            ctx.stroke()
+
+    ctx.set_line_cap(cairo.LINE_CAP_BUTT)
+    ctx.set_dash([])
+
+def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
 	ctx.set_line_width(0.5)
 	x_shift = proc_tree.start_time
-	x_scale = proc_tree.duration
-    
-	def transform_point_coords(point, x_base, y_base, xscale, yscale, x_trans, y_trans):
+
+	def transform_point_coords(point, x_base, y_base, \
+				   xscale, yscale, x_trans, y_trans):
 		x = (point[0] - x_base) * xscale + x_trans
-		y = (point[1] - y_base) * -yscale + y_trans + bar_h
+		y = (point[1] - y_base) * -yscale + y_trans + chart_bounds[3]
 		return x, y
 
-	xscale = float(chart_bounds[2]) / max(x for (x,y) in data)
-	yscale = float(chart_bounds[3]) / max(y for (x,y) in data)
-    
-	first = transform_point_coords(data[0], x_shift, 0, xscale, yscale, chart_bounds[0], chart_bounds[1])
-	last = transform_point_coords(data[-1], x_shift, 0, xscale, yscale, chart_bounds[0], chart_bounds[1])
-    
+	max_x = max (x for (x, y) in data)
+	max_y = max (y for (x, y) in data)
+	# avoid divide by zero
+	if max_y == 0:
+		max_y = 1.0
+	xscale = float (chart_bounds[2]) / max_x
+	# If data_range is given, scale the chart so that the value range in
+	# data_range matches the chart bounds exactly.
+	# Otherwise, scale so that the actual data matches the chart bounds.
+	if data_range:
+		yscale = float(chart_bounds[3]) / (data_range[1] - data_range[0])
+		ybase = data_range[0]
+	else:
+		yscale = float(chart_bounds[3]) / max_y
+		ybase = 0
+
+	first = transform_point_coords (data[0], x_shift, ybase, xscale, yscale, \
+				        chart_bounds[0], chart_bounds[1])
+	last =  transform_point_coords (data[-1], x_shift, ybase, xscale, yscale, \
+				        chart_bounds[0], chart_bounds[1])
+
 	ctx.set_source_rgba(*color)
 	ctx.move_to(*first)
 	for point in data:
-		x, y = transform_point_coords(point, x_shift, 0, xscale, yscale, chart_bounds[0], chart_bounds[1])
+		x, y = transform_point_coords (point, x_shift, ybase, xscale, yscale, \
+					       chart_bounds[0], chart_bounds[1])
 		ctx.line_to(x, y)
 	if fill:
 		ctx.stroke_preserve()
-		ctx.line_to(last[0], chart_bounds[1]+bar_h)
-		ctx.line_to(first[0], chart_bounds[1]+bar_h)
+		ctx.line_to(last[0], chart_bounds[1]+chart_bounds[3])
+		ctx.line_to(first[0], chart_bounds[1]+chart_bounds[3])
 		ctx.line_to(first[0], first[1])
 		ctx.fill()
 	else:
 		ctx.stroke()
 	ctx.set_line_width(1.0)
 
-header_h = 280
 bar_h = 55
+meminfo_bar_h = 2 * bar_h
+header_h = 110 + 2 * (30 + bar_h) + 1 * (30 + meminfo_bar_h)
 # offsets
 off_x, off_y = 10, 10
-sec_w = 1 # the width of a second
+sec_w_base = 1 # the width of a second
 proc_h = 16 # the height of a process
 leg_s = 10
 MIN_IMG_W = 800
+CUML_HEIGHT = 2000 # Increased value to accomodate CPU and I/O Graphs
+OPTIONS = None
 
+def extents(options, xscale, trace):
+	start = min(trace.start.keys())
+	end = max(trace.end.keys())
 
-def extents(res):
-	start = min(res.start.keys())
-	end = max(res.end.keys())
+	w = int ((end - start) * sec_w_base * xscale) + 2*off_x
+	h = proc_h * len(trace.processes) + header_h + 2 * off_y
 
-	w = ((end - start) * sec_w) + 2*off_x
-	h = proc_h * len(res.processes) + header_h + 2*off_y
+	return (w, h)
 
-	return (w,h)
+def clip_visible(clip, rect):
+	xmax = max (clip[0], rect[0])
+	ymax = max (clip[1], rect[1])
+	xmin = min (clip[0] + clip[2], rect[0] + rect[2])
+	ymin = min (clip[1] + clip[3], rect[1] + rect[3])
+	return (xmin > xmax and ymin > ymax)
 
-#
-# Render the chart.
-# 
-def render(ctx, res):
-	(w, h) = extents(res)
+def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
+	proc_tree = options.proc_tree(trace)
 
-	ctx.set_line_width(1.0)
-	ctx.select_font_face(FONT_NAME)
-	draw_fill_rect(ctx, WHITE, (0, 0, max(w, MIN_IMG_W), h))
-	w -= 2*off_x    
-	# draw the title and headers
-	#curr_y = draw_header(ctx, headers, off_x, proc_tree.duration)
-        curr_y = 0
-    
 	# render bar legend
 	ctx.set_font_size(LEGEND_FONT_SIZE)
 
-        #print "w, h %s %s" % (w, h)
-
-	#draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
-	#draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+	draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
+	draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
 
 	# render I/O wait
-        #chart_rect = (off_x, curr_y+30, w, bar_h)
-	#draw_box_ticks(ctx, chart_rect, sec_w)
-	#draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.user + sample.sys + sample.io) for sample in cpu_stats], proc_tree) 
-	# render CPU load
-	#draw_chart(ctx, CPU_COLOR, True, chart_rect, [(sample.time, sample.user + sample.sys) for sample in cpu_stats], proc_tree)
-
-	#curr_y = curr_y + 30 + bar_h
+	chart_rect = (off_x, curr_y+30, w, bar_h)
+	if clip_visible (clip, chart_rect):
+		draw_box_ticks (ctx, chart_rect, sec_w)
+		draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+		draw_chart (ctx, IO_COLOR, True, chart_rect, \
+			    [(sample.time, sample.user + sample.sys + sample.io) for sample in trace.cpu_stats], \
+			    proc_tree, None)
+		# render CPU load
+		draw_chart (ctx, CPU_COLOR, True, chart_rect, \
+			    [(sample.time, sample.user + sample.sys) for sample in trace.cpu_stats], \
+			    proc_tree, None)
+
+	curr_y = curr_y + 30 + bar_h
 
 	# render second chart
-	#draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
-	#draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+	draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
+	draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
 
         # render I/O utilization
-	#chart_rect = (off_x, curr_y+30, w, bar_h)
-	#draw_box_ticks(ctx, chart_rect, sec_w)
-	#draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.util) for sample in disk_stats], proc_tree)
-				
+	chart_rect = (off_x, curr_y+30, w, bar_h)
+	if clip_visible (clip, chart_rect):
+		draw_box_ticks (ctx, chart_rect, sec_w)
+		draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+		draw_chart (ctx, IO_COLOR, True, chart_rect, \
+			    [(sample.time, sample.util) for sample in trace.disk_stats], \
+			    proc_tree, None)
+
 	# render disk throughput
-	#max_sample = max(disk_stats, key=lambda s: s.tput)
-	#draw_chart(ctx, DISK_TPUT_COLOR, False, chart_rect, [(sample.time, sample.tput) for sample in disk_stats], proc_tree)
-	
-	#pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
-        pos_x = off_x
+	max_sample = max (trace.disk_stats, key = lambda s: s.tput)
+	if clip_visible (clip, chart_rect):
+		draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect, \
+			    [(sample.time, sample.tput) for sample in trace.disk_stats], \
+			    proc_tree, None)
+
+	pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
 
 	shift_x, shift_y = -20, 20
 	if (pos_x < off_x + 245):
 		shift_x, shift_y = 5, 40
-       				
-	#label = "%dMB/s" % round((max_sample.tput) / 1024.0)
-	#draw_text(ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
-
-
 
+	label = "%dMB/s" % round ((max_sample.tput) / 1024.0)
+	draw_text (ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
+
+	curr_y = curr_y + 30 + bar_h
+
+	# render mem usage
+	chart_rect = (off_x, curr_y+30, w, meminfo_bar_h)
+	mem_stats = trace.mem_stats
+	if mem_stats and clip_visible (clip, chart_rect):
+		mem_scale = max(sample.records['MemTotal'] - sample.records['MemFree'] for sample in mem_stats)
+		draw_legend_box(ctx, "Mem cached (scale: %u MiB)" % (float(mem_scale) / 1024), MEM_CACHED_COLOR, off_x, curr_y+20, leg_s)
+		draw_legend_box(ctx, "Used", MEM_USED_COLOR, off_x + 240, curr_y+20, leg_s)
+		draw_legend_box(ctx, "Buffers", MEM_BUFFERS_COLOR, off_x + 360, curr_y+20, leg_s)
+		draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.records['SwapTotal'] - sample.records['SwapFree'])/1024 for sample in mem_stats]), \
+				 MEM_SWAP_COLOR, off_x + 480, curr_y+20, leg_s)
+		draw_box_ticks(ctx, chart_rect, sec_w)
+		draw_annotations(ctx, proc_tree, trace.times, chart_rect)
+		draw_chart(ctx, MEM_BUFFERS_COLOR, True, chart_rect, \
+			   [(sample.time, sample.records['MemTotal'] - sample.records['MemFree']) for sample in trace.mem_stats], \
+			   proc_tree, [0, mem_scale])
+		draw_chart(ctx, MEM_USED_COLOR, True, chart_rect, \
+			   [(sample.time, sample.records['MemTotal'] - sample.records['MemFree'] - sample.records['Buffers']) for sample in mem_stats], \
+			   proc_tree, [0, mem_scale])
+		draw_chart(ctx, MEM_CACHED_COLOR, True, chart_rect, \
+			   [(sample.time, sample.records['Cached']) for sample in mem_stats], \
+			   proc_tree, [0, mem_scale])
+		draw_chart(ctx, MEM_SWAP_COLOR, False, chart_rect, \
+			   [(sample.time, float(sample.records['SwapTotal'] - sample.records['SwapFree'])) for sample in mem_stats], \
+			   proc_tree, None)
+
+		curr_y = curr_y + meminfo_bar_h
+
+	return curr_y
+
+def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
         chart_rect = [off_x, curr_y+60, w, h - 2 * off_y - (curr_y+60) + proc_h]
 
-	draw_legend_box(ctx, "Configure", 	TASK_COLOR_CONFIGURE, off_x    , curr_y + 45, leg_s)
-	draw_legend_box(ctx, "Compile", 	TASK_COLOR_COMPILE, off_x+120, curr_y + 45, leg_s)
-	draw_legend_box(ctx, "Install", 	TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
-	draw_legend_box(ctx, "Package", 	TASK_COLOR_PACKAGE, off_x+360, curr_y + 45, leg_s)
-	draw_legend_box(ctx, "Populate Sysroot",	TASK_COLOR_SYSROOT, off_x+480, curr_y + 45, leg_s)
-	
+	draw_legend_box (ctx, "Configure", \
+			 TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
+	draw_legend_box (ctx, "Compile", \
+			 TASK_COLOR_COMPILE, off_x+120, curr_y + 45, leg_s)
+	draw_legend_box (ctx, "Install", \
+			 TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
+	draw_legend_box (ctx, "Package", \
+			 TASK_COLOR_PACKAGE, off_x+360, curr_y + 45, leg_s)
+	draw_legend_box (ctx, "Populate Sysroot", \
+			 TASK_COLOR_SYSROOT, off_x+480, curr_y + 45, leg_s)
+
 	ctx.set_font_size(PROC_TEXT_FONT_SIZE)
-	
+
 	draw_box_ticks(ctx, chart_rect, sec_w)
-	draw_5sec_labels(ctx, chart_rect, sec_w)
+	draw_sec_labels(ctx, chart_rect, sec_w, 30)
 
 	y = curr_y+60
 
-        offset = min(res.start.keys())
-        for s in sorted(res.start.keys()):
-            for val in sorted(res.start[s]):
+        offset = min(trace.start.keys())
+        for s in sorted(trace.start.keys()):
+            for val in sorted(trace.start[s]):
                 task = val.split(":")[1]
                 #print val
-                #print res.processes[val][1]
+                #print trace.processes[val][1]
                 #print s
                 x = (s - offset) * sec_w
-                w = ((res.processes[val][1] - s) * sec_w)
+                w = ((trace.processes[val][1] - s) * sec_w)
 
                 #print "proc at %s %s %s %s" % (x, y, w, proc_h)
                 col = None
@@ -315,95 +439,419 @@ def render(ctx, res):
                 draw_label_in_box(ctx, PROC_TEXT_COLOR, val, x, y + proc_h - 4, w, proc_h)
                 y = y + proc_h
 
+	return curr_y
+
+#
+# Render the chart.
+#
+def render(ctx, options, xscale, trace):
+	(w, h) = extents (options, xscale, trace)
+	global OPTIONS
+	OPTIONS = options.app_options
+
+	# x, y, w, h
+	clip = ctx.clip_extents()
+
+	sec_w = int (xscale * sec_w_base)
+	ctx.set_line_width(1.0)
+	ctx.select_font_face(FONT_NAME)
+	draw_fill_rect(ctx, WHITE, (0, 0, max(w, MIN_IMG_W), h))
+	w -= 2*off_x
+	curr_y = off_y;
+
+	curr_y = render_processes_chart (ctx, options, trace, curr_y, w, h, sec_w)
+
+	return
+
+	proc_tree = options.proc_tree (trace)
+
+	# draw the title and headers
+	if proc_tree.idle:
+		duration = proc_tree.idle
+	else:
+		duration = proc_tree.duration
+
+	if not options.kernel_only:
+		curr_y = draw_header (ctx, trace.headers, duration)
+	else:
+		curr_y = off_y;
+
+	if options.charts:
+		curr_y = render_charts (ctx, options, clip, trace, curr_y, w, h, sec_w)
+
 	# draw process boxes
-	#draw_process_bar_chart(ctx, proc_tree, curr_y + bar_h, w, h)
+	proc_height = h
+	if proc_tree.taskstats and options.cumulative:
+		proc_height -= CUML_HEIGHT
 
-	ctx.set_font_size(SIG_FONT_SIZE)
-	draw_text(ctx, SIGNATURE, SIG_COLOR, off_x + 5, h - off_y - 5)
+	draw_process_bar_chart(ctx, clip, options, proc_tree, trace.times,
+			       curr_y, w, proc_height, sec_w)
 
-def draw_process_bar_chart(ctx, proc_tree, curr_y, w, h):
+	curr_y = proc_height
+	ctx.set_font_size(SIG_FONT_SIZE)
+	draw_text(ctx, SIGNATURE, SIG_COLOR, off_x + 5, proc_height - 8)
+
+	# draw a cumulative CPU-time-per-process graph
+	if proc_tree.taskstats and options.cumulative:
+		cuml_rect = (off_x, curr_y + off_y, w, CUML_HEIGHT/2 - off_y * 2)
+		if clip_visible (clip, cuml_rect):
+			draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_CPU)
+
+	# draw a cumulative I/O-time-per-process graph
+	if proc_tree.taskstats and options.cumulative:
+		cuml_rect = (off_x, curr_y + off_y * 100, w, CUML_HEIGHT/2 - off_y * 2)
+		if clip_visible (clip, cuml_rect):
+			draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_IO)
+
+def draw_process_bar_chart(ctx, clip, options, proc_tree, times, curr_y, w, h, sec_w):
+	header_size = 0
+	if not options.kernel_only:
+		draw_legend_box (ctx, "Running (%cpu)",
+				 PROC_COLOR_R, off_x    , curr_y + 45, leg_s)
+		draw_legend_box (ctx, "Unint.sleep (I/O)",
+				 PROC_COLOR_D, off_x+120, curr_y + 45, leg_s)
+		draw_legend_box (ctx, "Sleeping",
+				 PROC_COLOR_S, off_x+240, curr_y + 45, leg_s)
+		draw_legend_box (ctx, "Zombie",
+				 PROC_COLOR_Z, off_x+360, curr_y + 45, leg_s)
+		header_size = 45
+
+	chart_rect = [off_x, curr_y + header_size + 15,
+		      w, h - 2 * off_y - (curr_y + header_size + 15) + proc_h]
+	ctx.set_font_size (PROC_TEXT_FONT_SIZE)
+
+	draw_box_ticks (ctx, chart_rect, sec_w)
+	if sec_w > 100:
+		nsec = 1
+	else:
+		nsec = 5
+	draw_sec_labels (ctx, chart_rect, sec_w, nsec)
+	draw_annotations (ctx, proc_tree, times, chart_rect)
 
-	for root in proc_tree.process_tree:        
-		draw_processes_recursively(ctx, root, proc_tree, y, proc_h, chart_rect)
-		y  = y + proc_h * proc_tree.num_nodes([root])
+	y = curr_y + 60
+	for root in proc_tree.process_tree:
+		draw_processes_recursively(ctx, root, proc_tree, y, proc_h, chart_rect, clip)
+		y = y + proc_h * proc_tree.num_nodes([root])
 
 
-def draw_header(ctx, headers, off_x, duration):
-    dur = duration / 100.0
+def draw_header (ctx, headers, duration):
     toshow = [
       ('system.uname', 'uname', lambda s: s),
       ('system.release', 'release', lambda s: s),
       ('system.cpu', 'CPU', lambda s: re.sub('model name\s*:\s*', '', s, 1)),
       ('system.kernel.options', 'kernel options', lambda s: s),
-      ('pseudo.header', 'time', lambda s: '%02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60)))
     ]
 
     header_y = ctx.font_extents()[2] + 10
     ctx.set_font_size(TITLE_FONT_SIZE)
     draw_text(ctx, headers['title'], TEXT_COLOR, off_x, header_y)
     ctx.set_font_size(TEXT_FONT_SIZE)
-	
+
     for (headerkey, headertitle, mangle) in toshow:
         header_y += ctx.font_extents()[2]
-        txt = headertitle + ': ' + mangle(headers.get(headerkey))
+        if headerkey in headers:
+            value = headers.get(headerkey)
+        else:
+            value = ""
+        txt = headertitle + ': ' + mangle(value)
         draw_text(ctx, txt, TEXT_COLOR, off_x, header_y)
 
+    dur = duration / 100.0
+    txt = 'time : %02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60))
+    if headers.get('system.maxpid') is not None:
+        txt = txt + '      max pid: %s' % (headers.get('system.maxpid'))
+
+    header_y += ctx.font_extents()[2]
+    draw_text (ctx, txt, TEXT_COLOR, off_x, header_y)
+
     return header_y
 
-def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect) :
+def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip) :
 	x = rect[0] +  ((proc.start_time - proc_tree.start_time) * rect[2] / proc_tree.duration)
 	w = ((proc.duration) * rect[2] / proc_tree.duration)
 
-	draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect)
+	draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect, clip)
 	draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
-	draw_label_in_box(ctx, PROC_TEXT_COLOR, proc.cmd, x, y + proc_h - 4, w, rect[0] + rect[2])
+	ipid = int(proc.pid)
+	if not OPTIONS.show_all:
+		cmdString = proc.cmd
+	else:
+		cmdString = ''
+	if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
+		cmdString = cmdString + " [" + str(ipid // 1000) + "]"
+	if OPTIONS.show_all:
+		if proc.args:
+			cmdString = cmdString + " '" + "' '".join(proc.args) + "'"
+		else:
+			cmdString = cmdString + " " + proc.exe
+
+	draw_label_in_box(ctx, PROC_TEXT_COLOR, cmdString, x, y + proc_h - 4, w, rect[0] + rect[2])
 
 	next_y = y + proc_h
 	for child in proc.child_list:
-		child_x, child_y = draw_processes_recursively(ctx, child, proc_tree, next_y, proc_h, rect)
+		if next_y > clip[1] + clip[3]:
+			break
+		child_x, child_y = draw_processes_recursively(ctx, child, proc_tree, next_y, proc_h, rect, clip)
 		draw_process_connecting_lines(ctx, x, y, child_x, child_y, proc_h)
 		next_y = next_y + proc_h * proc_tree.num_nodes([child])
-		
+
 	return x, y
 
 
-def draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect):
+def draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect, clip):
+
+	if y > clip[1] + clip[3] or y + proc_h + 2 < clip[1]:
+		return
+
 	draw_fill_rect(ctx, PROC_COLOR_S, (x, y, w, proc_h))
 
 	last_tx = -1
-	for sample in proc.samples :    
+	for sample in proc.samples :
 		tx = rect[0] + round(((sample.time - proc_tree.start_time) * rect[2] / proc_tree.duration))
+
+		# samples are sorted chronologically
+		if tx < clip[0]:
+			continue
+		if tx > clip[0] + clip[2]:
+			break
+
 		tw = round(proc_tree.sample_period * rect[2] / float(proc_tree.duration))
 		if last_tx != -1 and abs(last_tx - tx) <= tw:
 			tw -= last_tx - tx
 			tx = last_tx
-             
+		tw = max (tw, 1) # nice to see at least something
+
 		last_tx = tx + tw
 		state = get_proc_state( sample.state )
 
-		color = STATE_COLORS[state]        
+		color = STATE_COLORS[state]
 		if state == STATE_RUNNING:
-			alpha = sample.cpu_sample.user + sample.cpu_sample.sys
+			alpha = min (sample.cpu_sample.user + sample.cpu_sample.sys, 1.0)
 			color = tuple(list(PROC_COLOR_R[0:3]) + [alpha])
+#			print "render time %d [ tx %d tw %d ], sample state %s color %s alpha %g" % (sample.time, tx, tw, state, color, alpha)
 		elif state == STATE_SLEEPING:
 			continue
 
 		draw_fill_rect(ctx, color, (tx, y, tw, proc_h))
 
-    
 def draw_process_connecting_lines(ctx, px, py, x, y, proc_h):
 	ctx.set_source_rgba(*DEP_COLOR)
-	ctx.set_dash([2,2])
+	ctx.set_dash([2, 2])
 	if abs(px - x) < 3:
 		dep_off_x = 3
 		dep_off_y = proc_h / 4
 		ctx.move_to(x, y + proc_h / 2)
 		ctx.line_to(px - dep_off_x, y + proc_h / 2)
 		ctx.line_to(px - dep_off_x, py - dep_off_y)
-		ctx.line_to(px, py - dep_off_y)		
+		ctx.line_to(px, py - dep_off_y)
 	else:
 		ctx.move_to(x, y + proc_h / 2)
 		ctx.line_to(px, y + proc_h / 2)
 		ctx.line_to(px, py)
 	ctx.stroke()
-        ctx.set_dash([])
+	ctx.set_dash([])
+
+# elide the bootchart collector - it is quite distorting
+def elide_bootchart(proc):
+	return proc.cmd == 'bootchartd' or proc.cmd == 'bootchart-colle'
+
+class CumlSample:
+	def __init__(self, proc):
+		self.cmd = proc.cmd
+		self.samples = []
+		self.merge_samples (proc)
+		self.color = None
+
+	def merge_samples(self, proc):
+		self.samples.extend (proc.samples)
+		self.samples.sort (key = lambda p: p.time)
+
+	def next(self):
+		global palette_idx
+		palette_idx += HSV_STEP
+		return palette_idx
+
+	def get_color(self):
+		if self.color is None:
+			i = self.next() % HSV_MAX_MOD
+			h = 0.0
+			if i is not 0:
+				h = (1.0 * i) / HSV_MAX_MOD
+			s = 0.5
+			v = 1.0
+			c = colorsys.hsv_to_rgb (h, s, v)
+			self.color = (c[0], c[1], c[2], 1.0)
+		return self.color
+
+
+def draw_cuml_graph(ctx, proc_tree, chart_bounds, duration, sec_w, stat_type):
+	global palette_idx
+	palette_idx = 0
+
+	time_hash = {}
+	total_time = 0.0
+	m_proc_list = {}
+
+	if stat_type is STAT_TYPE_CPU:
+		sample_value = 'cpu'
+	else:
+		sample_value = 'io'
+	for proc in proc_tree.process_list:
+		if elide_bootchart(proc):
+			continue
+
+		for sample in proc.samples:
+			total_time += getattr(sample.cpu_sample, sample_value)
+			if not sample.time in time_hash:
+				time_hash[sample.time] = 1
+
+		# merge pids with the same cmd
+		if not proc.cmd in m_proc_list:
+			m_proc_list[proc.cmd] = CumlSample (proc)
+			continue
+		s = m_proc_list[proc.cmd]
+		s.merge_samples (proc)
+
+	# all the sample times
+	times = sorted(time_hash)
+	if len (times) < 2:
+		print("degenerate boot chart")
+		return
+
+	pix_per_ns = chart_bounds[3] / total_time
+#	print "total time: %g pix-per-ns %g" % (total_time, pix_per_ns)
+
+	# FIXME: we have duplicates in the process list too [!] - why !?
+
+	# Render bottom up, left to right
+	below = {}
+	for time in times:
+		below[time] = chart_bounds[1] + chart_bounds[3]
+
+	# same colors each time we render
+	random.seed (0)
+
+	ctx.set_line_width(1)
+
+	legends = []
+	labels = []
+
+	# render each pid in order
+	for cs in m_proc_list.values():
+		row = {}
+		cuml = 0.0
+
+		# print "pid : %s -> %g samples %d" % (proc.cmd, cuml, len (cs.samples))
+		for sample in cs.samples:
+			cuml += getattr(sample.cpu_sample, sample_value)
+			row[sample.time] = cuml
+
+		process_total_time = cuml
+
+		# hide really tiny processes
+		if cuml * pix_per_ns <= 2:
+			continue
+
+		last_time = times[0]
+		y = last_below = below[last_time]
+		last_cuml = cuml = 0.0
+
+		ctx.set_source_rgba(*cs.get_color())
+		for time in times:
+			render_seg = False
+
+			# did the underlying trend increase ?
+			if below[time] != last_below:
+				last_below = below[last_time]
+				last_cuml = cuml
+				render_seg = True
+
+			# did we move up a pixel increase ?
+			if time in row:
+				nc = round (row[time] * pix_per_ns)
+				if nc != cuml:
+					last_cuml = cuml
+					cuml = nc
+					render_seg = True
+
+#			if last_cuml > cuml:
+#				assert fail ... - un-sorted process samples
+
+			# draw the trailing rectangle from the last time to
+			# before now, at the height of the last segment.
+			if render_seg:
+				w = math.ceil ((time - last_time) * chart_bounds[2] / proc_tree.duration) + 1
+				x = chart_bounds[0] + round((last_time - proc_tree.start_time) * chart_bounds[2] / proc_tree.duration)
+				ctx.rectangle (x, below[last_time] - last_cuml, w, last_cuml)
+				ctx.fill()
+#				ctx.stroke()
+				last_time = time
+				y = below [time] - cuml
+
+			row[time] = y
+
+		# render the last segment
+		x = chart_bounds[0] + round((last_time - proc_tree.start_time) * chart_bounds[2] / proc_tree.duration)
+		y = below[last_time] - cuml
+		ctx.rectangle (x, y, chart_bounds[2] - x, cuml)
+		ctx.fill()
+#		ctx.stroke()
+
+		# render legend if it will fit
+		if cuml > 8:
+			label = cs.cmd
+			extnts = ctx.text_extents(label)
+			label_w = extnts[2]
+			label_h = extnts[3]
+#			print "Text extents %g by %g" % (label_w, label_h)
+			labels.append((label,
+				       chart_bounds[0] + chart_bounds[2] - label_w - off_x * 2,
+				       y + (cuml + label_h) / 2))
+			if cs in legends:
+				print("ARGH - duplicate process in list !")
+
+		legends.append ((cs, process_total_time))
+
+		below = row
+
+	# render grid-lines over the top
+	draw_box_ticks(ctx, chart_bounds, sec_w)
+
+	# render labels
+	for l in labels:
+		draw_text(ctx, l[0], TEXT_COLOR, l[1], l[2])
+
+	# Render legends
+	font_height = 20
+	label_width = 300
+	LEGENDS_PER_COL = 15
+	LEGENDS_TOTAL = 45
+	ctx.set_font_size (TITLE_FONT_SIZE)
+	dur_secs = duration / 100
+	cpu_secs = total_time / 1000000000
+
+	# misleading - with multiple CPUs ...
+#	idle = ((dur_secs - cpu_secs) / dur_secs) * 100.0
+	if stat_type is STAT_TYPE_CPU:
+		label = "Cumulative CPU usage, by process; total CPU: " \
+			" %.5g(s) time: %.3g(s)" % (cpu_secs, dur_secs)
+	else:
+		label = "Cumulative I/O usage, by process; total I/O: " \
+			" %.5g(s) time: %.3g(s)" % (cpu_secs, dur_secs)
+
+	draw_text(ctx, label, TEXT_COLOR, chart_bounds[0] + off_x,
+		  chart_bounds[1] + font_height)
+
+	i = 0
+	legends = sorted(legends, key=itemgetter(1), reverse=True)
+	ctx.set_font_size(TEXT_FONT_SIZE)
+	for t in legends:
+		cs = t[0]
+		time = t[1]
+		x = chart_bounds[0] + off_x + int (i/LEGENDS_PER_COL) * label_width
+		y = chart_bounds[1] + font_height * ((i % LEGENDS_PER_COL) + 2)
+		str = "%s - %.0f(ms) (%2.2f%%)" % (cs.cmd, time/1000000, (time/total_time) * 100.0)
+		draw_legend_box(ctx, str, cs.color, x, y, leg_s)
+		i = i + 1
+		if i >= LEGENDS_TOTAL:
+			break
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index 310c3d1..ddeb88c 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -1,273 +1,347 @@
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
 import gobject
 import gtk
 import gtk.gdk
 import gtk.keysyms
-
-import draw
+from . import draw
+from .draw import RenderOptions
 
 class PyBootchartWidget(gtk.DrawingArea):
-	__gsignals__ = {
-		'expose-event': 'override',
-		'clicked' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, gtk.gdk.Event)),
-		'position-changed' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT, gobject.TYPE_INT)),
-		'set-scroll-adjustments' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gtk.Adjustment, gtk.Adjustment))
-	}
-
-	def __init__(self, res):
-		gtk.DrawingArea.__init__(self)
-
-		self.res = res
-
-		self.set_flags(gtk.CAN_FOCUS)
-
-                self.add_events(gtk.gdk.BUTTON_PRESS_MASK | gtk.gdk.BUTTON_RELEASE_MASK)
-                self.connect("button-press-event", self.on_area_button_press)
-                self.connect("button-release-event", self.on_area_button_release)
-                self.add_events(gtk.gdk.POINTER_MOTION_MASK | gtk.gdk.POINTER_MOTION_HINT_MASK | gtk.gdk.BUTTON_RELEASE_MASK)
-                self.connect("motion-notify-event", self.on_area_motion_notify)
-                self.connect("scroll-event", self.on_area_scroll_event)
-                self.connect('key-press-event', self.on_key_press_event)
-
-		self.connect('set-scroll-adjustments', self.on_set_scroll_adjustments)
-		self.connect("size-allocate", self.on_allocation_size_changed)
-		self.connect("position-changed", self.on_position_changed)
-
-		self.zoom_ratio = 1.0
-                self.x, self.y = 0.0, 0.0
-
-		self.chart_width, self.chart_height = draw.extents(res)
-		self.hadj = None
-		self.vadj = None
-
-	def do_expose_event(self, event):
-		cr = self.window.cairo_create()
-
-		# set a clip region for the expose event
-		cr.rectangle(
-			event.area.x, event.area.y,
-			event.area.width, event.area.height
-		)
-		cr.clip()
-		self.draw(cr, self.get_allocation())
-		return False
-		
-	def draw(self, cr, rect):	
-		cr.set_source_rgba(1.0, 1.0, 1.0, 1.0)
-		cr.paint()
-                cr.scale(self.zoom_ratio, self.zoom_ratio)
-                cr.translate(-self.x, -self.y)
-		draw.render(cr, self.res)
-
-	def position_changed(self):
-		self.emit("position-changed", self.x, self.y)
-
-	ZOOM_INCREMENT = 1.25
-
-        def zoom_image(self, zoom_ratio):
-            self.zoom_ratio = zoom_ratio
-	    self._set_scroll_adjustments(self.hadj, self.vadj)
-            self.queue_draw()
-
-        def zoom_to_rect(self, rect):
-            zoom_ratio = float(rect.width)/float(self.chart_width)
-            self.zoom_image(zoom_ratio)
-	    self.x = 0
-	    self.position_changed()
-
-	def on_zoom_in(self, action):
-            self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
-
-	def on_zoom_out(self, action):
-            self.zoom_image(self.zoom_ratio / self.ZOOM_INCREMENT)
-
-	def on_zoom_fit(self, action):		
-            self.zoom_to_rect(self.get_allocation())
-
-	def on_zoom_100(self, action):
-            self.zoom_image(1.0)
-
-        POS_INCREMENT = 100
-
-        def on_key_press_event(self, widget, event):
-                if event.keyval == gtk.keysyms.Left:
-                        self.x -= self.POS_INCREMENT/self.zoom_ratio
-                elif event.keyval == gtk.keysyms.Right:
-                        self.x += self.POS_INCREMENT/self.zoom_ratio
-                elif event.keyval == gtk.keysyms.Up:
-                        self.y -= self.POS_INCREMENT/self.zoom_ratio
-                elif event.keyval == gtk.keysyms.Down:
-                        self.y += self.POS_INCREMENT/self.zoom_ratio
-                elif event.keyval == gtk.keysyms.Page_Up:
-                        self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
-                elif event.keyval == gtk.keysyms.Page_Down:
-                        self.zoom_image(self.zoom_ratio / self.ZOOM_INCREMENT)
-                else:
-                        return False                
-                self.queue_draw()
-		self.position_changed()
+    __gsignals__ = {
+            'expose-event': 'override',
+            'clicked' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, gtk.gdk.Event)),
+            'position-changed' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_INT, gobject.TYPE_INT)),
+            'set-scroll-adjustments' : (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gtk.Adjustment, gtk.Adjustment))
+    }
+
+    def __init__(self, trace, options, xscale):
+        gtk.DrawingArea.__init__(self)
+
+        self.trace = trace
+        self.options = options
+
+        self.set_flags(gtk.CAN_FOCUS)
+
+        self.add_events(gtk.gdk.BUTTON_PRESS_MASK | gtk.gdk.BUTTON_RELEASE_MASK)
+        self.connect("button-press-event", self.on_area_button_press)
+        self.connect("button-release-event", self.on_area_button_release)
+        self.add_events(gtk.gdk.POINTER_MOTION_MASK | gtk.gdk.POINTER_MOTION_HINT_MASK | gtk.gdk.BUTTON_RELEASE_MASK)
+        self.connect("motion-notify-event", self.on_area_motion_notify)
+        self.connect("scroll-event", self.on_area_scroll_event)
+        self.connect('key-press-event', self.on_key_press_event)
+
+        self.connect('set-scroll-adjustments', self.on_set_scroll_adjustments)
+        self.connect("size-allocate", self.on_allocation_size_changed)
+        self.connect("position-changed", self.on_position_changed)
+
+        self.zoom_ratio = 1.0
+        self.xscale = xscale
+        self.x, self.y = 0.0, 0.0
+
+        self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
+        self.hadj = None
+        self.vadj = None
+        self.hadj_changed_signal_id = None
+        self.vadj_changed_signal_id = None
+
+    def do_expose_event(self, event):
+        cr = self.window.cairo_create()
+
+        # set a clip region for the expose event
+        cr.rectangle(
+                event.area.x, event.area.y,
+                event.area.width, event.area.height
+        )
+        cr.clip()
+        self.draw(cr, self.get_allocation())
+        return False
+
+    def draw(self, cr, rect):
+        cr.set_source_rgba(1.0, 1.0, 1.0, 1.0)
+        cr.paint()
+        cr.scale(self.zoom_ratio, self.zoom_ratio)
+        cr.translate(-self.x, -self.y)
+        draw.render(cr, self.options, self.xscale, self.trace)
+
+    def position_changed(self):
+        self.emit("position-changed", self.x, self.y)
+
+    ZOOM_INCREMENT = 1.25
+
+    def zoom_image (self, zoom_ratio):
+        self.zoom_ratio = zoom_ratio
+        self._set_scroll_adjustments (self.hadj, self.vadj)
+        self.queue_draw()
+
+    def zoom_to_rect (self, rect):
+        zoom_ratio = float(rect.width)/float(self.chart_width)
+        self.zoom_image(zoom_ratio)
+        self.x = 0
+        self.position_changed()
+
+    def set_xscale(self, xscale):
+        old_mid_x = self.x + self.hadj.page_size / 2
+        self.xscale = xscale
+        self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
+        new_x = old_mid_x
+        self.zoom_image (self.zoom_ratio)
+
+    def on_expand(self, action):
+        self.set_xscale (self.xscale * 1.5)
+
+    def on_contract(self, action):
+        self.set_xscale (self.xscale / 1.5)
+
+    def on_zoom_in(self, action):
+        self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
+
+    def on_zoom_out(self, action):
+        self.zoom_image(self.zoom_ratio / self.ZOOM_INCREMENT)
+
+    def on_zoom_fit(self, action):
+        self.zoom_to_rect(self.get_allocation())
+
+    def on_zoom_100(self, action):
+        self.zoom_image(1.0)
+        self.set_xscale(1.0)
+
+    def show_toggled(self, button):
+        self.options.app_options.show_all = button.get_property ('active')
+        self.queue_draw()
+
+    POS_INCREMENT = 100
+
+    def on_key_press_event(self, widget, event):
+        if event.keyval == gtk.keysyms.Left:
+            self.x -= self.POS_INCREMENT/self.zoom_ratio
+        elif event.keyval == gtk.keysyms.Right:
+            self.x += self.POS_INCREMENT/self.zoom_ratio
+        elif event.keyval == gtk.keysyms.Up:
+            self.y -= self.POS_INCREMENT/self.zoom_ratio
+        elif event.keyval == gtk.keysyms.Down:
+            self.y += self.POS_INCREMENT/self.zoom_ratio
+        else:
+            return False
+        self.queue_draw()
+        self.position_changed()
+        return True
+
+    def on_area_button_press(self, area, event):
+        if event.button == 2 or event.button == 1:
+            area.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.FLEUR))
+            self.prevmousex = event.x
+            self.prevmousey = event.y
+        if event.type not in (gtk.gdk.BUTTON_PRESS, gtk.gdk.BUTTON_RELEASE):
+            return False
+        return False
+
+    def on_area_button_release(self, area, event):
+        if event.button == 2 or event.button == 1:
+            area.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.ARROW))
+            self.prevmousex = None
+            self.prevmousey = None
+            return True
+        return False
+
+    def on_area_scroll_event(self, area, event):
+        if event.state & gtk.gdk.CONTROL_MASK:
+            if event.direction == gtk.gdk.SCROLL_UP:
+                self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
                 return True
-
-        def on_area_button_press(self, area, event):
-                if event.button == 2 or event.button == 1:
-                        area.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.FLEUR))
-                        self.prevmousex = event.x
-                        self.prevmousey = event.y
-                if event.type not in (gtk.gdk.BUTTON_PRESS, gtk.gdk.BUTTON_RELEASE):
-                        return False
-                return False
-
-        def on_area_button_release(self, area, event):
-                if event.button == 2 or event.button == 1:
-                        area.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.ARROW))
-                        self.prevmousex = None
-                        self.prevmousey = None
-                        return True
-                return False
-
-        def on_area_scroll_event(self, area, event):
-                if event.direction == gtk.gdk.SCROLL_UP:
-                        self.zoom_image(self.zoom_ratio * self.ZOOM_INCREMENT)
-                        return True
-                if event.direction == gtk.gdk.SCROLL_DOWN:
-                        self.zoom_image(self.zoom_ratio / self.ZOOM_INCREMENT)
-                        return True
-                return False
-
-        def on_area_motion_notify(self, area, event):
-                state = event.state
-                if state & gtk.gdk.BUTTON2_MASK or state & gtk.gdk.BUTTON1_MASK:
-                        x, y = int(event.x), int(event.y)
-                        # pan the image
-                        self.x += (self.prevmousex - x)/self.zoom_ratio
-                        self.y += (self.prevmousey - y)/self.zoom_ratio
-                        self.queue_draw()
-                        self.prevmousex = x
-                        self.prevmousey = y
-			self.position_changed()
+            if event.direction == gtk.gdk.SCROLL_DOWN:
+                self.zoom_image(self.zoom_ratio / self.ZOOM_INCREMENT)
                 return True
-
-	def on_set_scroll_adjustments(self, area, hadj, vadj):
-		self._set_scroll_adjustments(hadj, vadj)
-
-	def on_allocation_size_changed(self, widget, allocation):
-		self.hadj.page_size = allocation.width
-		self.hadj.page_increment = allocation.width * 0.9
-		self.vadj.page_size = allocation.height
-		self.vadj.page_increment = allocation.height * 0.9
-
-	def _set_scroll_adjustments(self, hadj, vadj):
-		if hadj == None:
-			hadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
-		if vadj == None:
-			vadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
-			
-		if self.hadj != None and hadj != self.hadj:
-			self.hadj.disconnect(self.hadj_changed_signal_id)
-		if self.vadj != None and vadj != self.vadj:
-			self.vadj.disconnect(self.vadj_changed_signal_id)
-
-		if hadj != None:
-			self.hadj = hadj
-			self._set_adj_upper(self.hadj, self.zoom_ratio * self.chart_width)
-			self.hadj_changed_signal_id = self.hadj.connect('value-changed', self.on_adjustments_changed)
-
-		if vadj != None:
-			self.vadj = vadj
-			self._set_adj_upper(self.vadj, self.zoom_ratio * self.chart_height)
-			self.vadj_changed_signal_id = self.vadj.connect('value-changed', self.on_adjustments_changed)
-
-	def _set_adj_upper(self, adj, upper):
-		changed = False
-		value_changed = False
-
-		if adj.upper != upper:
-			adj.upper = upper
-			changed = True
-
-		max_value = max(0.0, upper - adj.page_size)
-		if adj.value > max_value:
-			adj.value = max_value
-			value_changed = True
-
-		if changed:
-			adj.changed()
-		if value_changed:
-			adj.value_changed()
-
-	def on_adjustments_changed(self, adj):
-		self.x = self.hadj.value / self.zoom_ratio
-		self.y = self.vadj.value / self.zoom_ratio
-		self.queue_draw()
-
-	def on_position_changed(self, widget, x, y):
-		self.hadj.value = x * self.zoom_ratio
-		self.vadj.value = y * self.zoom_ratio
+            return False
+
+    def on_area_motion_notify(self, area, event):
+        state = event.state
+        if state & gtk.gdk.BUTTON2_MASK or state & gtk.gdk.BUTTON1_MASK:
+            x, y = int(event.x), int(event.y)
+            # pan the image
+            self.x += (self.prevmousex - x)/self.zoom_ratio
+            self.y += (self.prevmousey - y)/self.zoom_ratio
+            self.queue_draw()
+            self.prevmousex = x
+            self.prevmousey = y
+            self.position_changed()
+        return True
+
+    def on_set_scroll_adjustments(self, area, hadj, vadj):
+        self._set_scroll_adjustments (hadj, vadj)
+
+    def on_allocation_size_changed(self, widget, allocation):
+        self.hadj.page_size = allocation.width
+        self.hadj.page_increment = allocation.width * 0.9
+        self.vadj.page_size = allocation.height
+        self.vadj.page_increment = allocation.height * 0.9
+
+    def _set_adj_upper(self, adj, upper):
+        changed = False
+        value_changed = False
+
+        if adj.upper != upper:
+            adj.upper = upper
+            changed = True
+
+        max_value = max(0.0, upper - adj.page_size)
+        if adj.value > max_value:
+            adj.value = max_value
+            value_changed = True
+
+        if changed:
+            adj.changed()
+        if value_changed:
+            adj.value_changed()
+
+    def _set_scroll_adjustments(self, hadj, vadj):
+        if hadj == None:
+            hadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
+        if vadj == None:
+            vadj = gtk.Adjustment(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
+
+        if self.hadj_changed_signal_id != None and \
+           self.hadj != None and hadj != self.hadj:
+            self.hadj.disconnect (self.hadj_changed_signal_id)
+        if self.vadj_changed_signal_id != None and \
+           self.vadj != None and vadj != self.vadj:
+            self.vadj.disconnect (self.vadj_changed_signal_id)
+
+        if hadj != None:
+            self.hadj = hadj
+            self._set_adj_upper (self.hadj, self.zoom_ratio * self.chart_width)
+            self.hadj_changed_signal_id = self.hadj.connect('value-changed', self.on_adjustments_changed)
+
+        if vadj != None:
+            self.vadj = vadj
+            self._set_adj_upper (self.vadj, self.zoom_ratio * self.chart_height)
+            self.vadj_changed_signal_id = self.vadj.connect('value-changed', self.on_adjustments_changed)
+
+    def on_adjustments_changed(self, adj):
+        self.x = self.hadj.value / self.zoom_ratio
+        self.y = self.vadj.value / self.zoom_ratio
+        self.queue_draw()
+
+    def on_position_changed(self, widget, x, y):
+        self.hadj.value = x * self.zoom_ratio
+        self.vadj.value = y * self.zoom_ratio
 
 PyBootchartWidget.set_set_scroll_adjustments_signal('set-scroll-adjustments')
 
+class PyBootchartShell(gtk.VBox):
+    ui = '''
+    <ui>
+            <toolbar name="ToolBar">
+                    <toolitem action="Expand"/>
+                    <toolitem action="Contract"/>
+                    <separator/>
+                    <toolitem action="ZoomIn"/>
+                    <toolitem action="ZoomOut"/>
+                    <toolitem action="ZoomFit"/>
+                    <toolitem action="Zoom100"/>
+            </toolbar>
+    </ui>
+    '''
+    def __init__(self, window, trace, options, xscale):
+        gtk.VBox.__init__(self)
+
+        self.widget = PyBootchartWidget(trace, options, xscale)
+
+        # Create a UIManager instance
+        uimanager = self.uimanager = gtk.UIManager()
+
+        # Add the accelerator group to the toplevel window
+        accelgroup = uimanager.get_accel_group()
+        window.add_accel_group(accelgroup)
+
+        # Create an ActionGroup
+        actiongroup = gtk.ActionGroup('Actions')
+        self.actiongroup = actiongroup
+
+        # Create actions
+        actiongroup.add_actions((
+                ('Expand', gtk.STOCK_ADD, None, None, None, self.widget.on_expand),
+                ('Contract', gtk.STOCK_REMOVE, None, None, None, self.widget.on_contract),
+                ('ZoomIn', gtk.STOCK_ZOOM_IN, None, None, None, self.widget.on_zoom_in),
+                ('ZoomOut', gtk.STOCK_ZOOM_OUT, None, None, None, self.widget.on_zoom_out),
+                ('ZoomFit', gtk.STOCK_ZOOM_FIT, 'Fit Width', None, None, self.widget.on_zoom_fit),
+                ('Zoom100', gtk.STOCK_ZOOM_100, None, None, None, self.widget.on_zoom_100),
+        ))
+
+        # Add the actiongroup to the uimanager
+        uimanager.insert_action_group(actiongroup, 0)
+
+        # Add a UI description
+        uimanager.add_ui_from_string(self.ui)
+
+        # Scrolled window
+        scrolled = gtk.ScrolledWindow()
+        scrolled.add(self.widget)
+
+        # toolbar / h-box
+        hbox = gtk.HBox(False, 8)
+
+        # Create a Toolbar
+        toolbar = uimanager.get_widget('/ToolBar')
+        hbox.pack_start(toolbar, True, True)
+
+        if not options.kernel_only:
+            # Misc. options
+            button = gtk.CheckButton("Show more")
+            button.connect ('toggled', self.widget.show_toggled)
+            hbox.pack_start (button, False, True)
+
+        self.pack_start(hbox, False)
+        self.pack_start(scrolled)
+        self.show_all()
+
+    def grab_focus(self, window):
+        window.set_focus(self.widget)
+
+
 class PyBootchartWindow(gtk.Window):
 
-	ui = '''
-	<ui>
-		<toolbar name="ToolBar">
-			<toolitem action="ZoomIn"/>
-			<toolitem action="ZoomOut"/>
-			<toolitem action="ZoomFit"/>
-			<toolitem action="Zoom100"/>
-		</toolbar>
-	</ui>
-	'''
-
-	def __init__(self, res):
-		gtk.Window.__init__(self)
-
-		window = self
-		window.set_title('Bootchart')
-		window.set_default_size(512, 512)
-		vbox = gtk.VBox()
-		window.add(vbox)
-
-		self.widget = PyBootchartWidget(res)
-
-		# Create a UIManager instance
-		uimanager = self.uimanager = gtk.UIManager()
-		
-		# Add the accelerator group to the toplevel window
-		accelgroup = uimanager.get_accel_group()
-		window.add_accel_group(accelgroup)
-
-		# Create an ActionGroup
-		actiongroup = gtk.ActionGroup('Actions')
-		self.actiongroup = actiongroup
-
-		# Create actions
-		actiongroup.add_actions((
-			('ZoomIn', gtk.STOCK_ZOOM_IN, None, None, None, self.widget.on_zoom_in),
-			('ZoomOut', gtk.STOCK_ZOOM_OUT, None, None, None, self.widget.on_zoom_out),
-			('ZoomFit', gtk.STOCK_ZOOM_FIT, 'Fit Width', None, None, self.widget.on_zoom_fit),
-			('Zoom100', gtk.STOCK_ZOOM_100, None, None, None, self.widget.on_zoom_100),
-		))
-
-		# Add the actiongroup to the uimanager
-		uimanager.insert_action_group(actiongroup, 0)
-
-		# Add a UI description
-		uimanager.add_ui_from_string(self.ui)
-
-		# Scrolled window
-                scrolled = gtk.ScrolledWindow()
-		scrolled.add(self.widget)
-
-		# Create a Toolbar
-		toolbar = uimanager.get_widget('/ToolBar')
-		vbox.pack_start(toolbar, False)
-		vbox.pack_start(scrolled)
-
-		self.set_focus(self.widget)
-
-		self.show_all()
-
-def show(res):
-	win = PyBootchartWindow(res)
-	win.connect('destroy', gtk.main_quit)
-	gtk.main()
+    def __init__(self, trace, app_options):
+        gtk.Window.__init__(self)
+
+        window = self
+        window.set_title("Bootchart %s" % trace.filename)
+        window.set_default_size(750, 550)
+
+        tab_page = gtk.Notebook()
+        tab_page.show()
+        window.add(tab_page)
+
+        full_opts = RenderOptions(app_options)
+        full_tree = PyBootchartShell(window, trace, full_opts, 1.0)
+        tab_page.append_page (full_tree, gtk.Label("Full tree"))
+
+        if trace.kernel is not None and len (trace.kernel) > 2:
+            kernel_opts = RenderOptions(app_options)
+            kernel_opts.cumulative = False
+            kernel_opts.charts = False
+            kernel_opts.kernel_only = True
+            kernel_tree = PyBootchartShell(window, trace, kernel_opts, 5.0)
+            tab_page.append_page (kernel_tree, gtk.Label("Kernel boot"))
+
+        full_tree.grab_focus(self)
+        self.show()
+
+
+def show(trace, options):
+    win = PyBootchartWindow(trace, options)
+    win.connect('destroy', gtk.main_quit)
+    gtk.main()
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
deleted file mode 100644
index e22636c..0000000
--- a/scripts/pybootchartgui/pybootchartgui/main.py
+++ /dev/null
@@ -1,78 +0,0 @@
-import sys
-import os
-import optparse
-
-import parsing
-import gui
-import batch
-
-def _mk_options_parser():
-	"""Make an options parser."""
-	usage = "%prog [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/"
-	version = "%prog v1.0.0"
-	parser = optparse.OptionParser(usage, version=version)
-	parser.add_option("-i", "--interactive", action="store_true", dest="interactive", default=False, 
-			  help="start in active mode")
-	parser.add_option("-f", "--format", dest="format", default="svg", choices=["svg", "pdf", "png"],
-			  help="image format: svg, pdf, png, [default: %default]")
-	parser.add_option("-o", "--output", dest="output", metavar="PATH", default=None,
-			  help="output path (file or directory) where charts are stored")
-	parser.add_option("-s", "--split", dest="num", type=int, default=1,
-			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
-	parser.add_option("-m", "--mintime", dest="mintime", type=int, default=8,
-			  help="only tasks longer than this time will be displayed")
-	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
-			  help="do not prune the process tree")
-	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
-			  help="suppress informational messages")
-	parser.add_option("--very-quiet", action="store_true", dest="veryquiet", default=False,
-			  help="suppress all messages except errors")
-	parser.add_option("--verbose", action="store_true", dest="verbose", default=False,
-			  help="print all messages")
-	return parser
-
-def _get_filename(path):
-	"""Construct a usable filename for outputs"""
-	dir = "."
-	file = "bootchart"
-	if os.path.isdir(path):
-		dir = path
-	elif path != None:
-		file = path
-	return os.path.join(dir, file)
-
-def main(argv=None):
-	try:
-		if argv is None:
-			argv = sys.argv[1:]
-	
-		parser = _mk_options_parser()
-		options, args = parser.parse_args(argv)
-	
-		if len(args) == 0:
-			parser.error("insufficient arguments, expected at least one path.")
-			return 2
-
-		res = parsing.parse(args, options.prune, options.mintime)
-		if options.interactive or options.output == None:
-			gui.show(res)
-		else:
-			filename = _get_filename(options.output)
-			res_list = parsing.split_res(res, options.num)
-			n = 1
-			for r in res_list:
-				if len(res_list) == 1:
-					f = filename + "." + options.format
-				else:
-					f = filename + "_" + str(n) + "." + options.format
-					n = n + 1
-				batch.render(r, options.format, f)
-				print "bootchart written to", f
-		return 0
-	except parsing.ParseError, ex:
-		print("Parse error: %s" % ex)
-		return 2
-
-
-if __name__ == '__main__':
-	sys.exit(main())
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
new file mode 120000
index 0000000..b45ae0a
--- /dev/null
+++ b/scripts/pybootchartgui/pybootchartgui/main.py
@@ -0,0 +1 @@
+main.py.in
\ No newline at end of file
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
new file mode 100644
index 0000000..265cb18
--- /dev/null
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -0,0 +1,171 @@
+#
+# ***********************************************************************
+#  Warning: This file is auto-generated from main.py.in - edit it there.
+# ***********************************************************************
+#
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
+from __future__ import print_function
+
+import sys
+import os
+import optparse
+
+from . import parsing
+from . import batch
+
+def _mk_options_parser():
+	"""Make an options parser."""
+	usage = "%prog [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/"
+	version = "%prog v1.0.0"
+	parser = optparse.OptionParser(usage, version=version)
+	parser.add_option("-i", "--interactive", action="store_true", dest="interactive", default=False, 
+			  help="start in active mode")
+	parser.add_option("-f", "--format", dest="format", default="png", choices=["png", "svg", "pdf"],
+			  help="image format (png, svg, pdf); default format png")
+	parser.add_option("-o", "--output", dest="output", metavar="PATH", default=None,
+			  help="output path (file or directory) where charts are stored")
+	parser.add_option("-s", "--split", dest="num", type=int, default=1,
+			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
+	parser.add_option("-m", "--mintime", dest="mintime", type=int, default=8,
+			  help="only tasks longer than this time will be displayed")
+	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
+			  help="do not prune the process tree")
+	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
+			  help="suppress informational messages")
+	parser.add_option("-t", "--boot-time", action="store_true", dest="boottime", default=False,
+			  help="only display the boot time of the boot in text format (stdout)")	
+	parser.add_option("--very-quiet", action="store_true", dest="veryquiet", default=False,
+			  help="suppress all messages except errors")
+	parser.add_option("--verbose", action="store_true", dest="verbose", default=False,
+			  help="print all messages")
+	parser.add_option("--profile", action="store_true", dest="profile", default=False,
+			  help="profile rendering of chart (only useful when in batch mode indicated by -f)")
+	parser.add_option("--show-pid", action="store_true", dest="show_pid", default=False,
+			  help="show process ids in the bootchart as 'processname [pid]'")
+	parser.add_option("--show-all", action="store_true", dest="show_all", default=False,
+			  help="show all process information in the bootchart as '/process/path/exe [pid] [args]'")
+	parser.add_option("--crop-after", dest="crop_after", metavar="PROCESS", default=None,
+			  help="crop chart when idle after PROCESS is started")
+	parser.add_option("--annotate", action="append", dest="annotate", metavar="PROCESS", default=None,
+			  help="annotate position where PROCESS is started; can be specified multiple times. " +
+			       "To create a single annotation when any one of a set of processes is started, use commas to separate the names")
+	parser.add_option("--annotate-file", dest="annotate_file", metavar="FILENAME", default=None,
+			  help="filename to write annotation points to")
+	return parser
+
+class Writer:
+	def __init__(self, write, options):
+		self.write = write
+		self.options = options
+		
+	def error(self, msg):
+		self.write(msg)
+
+	def warn(self, msg):
+		if not self.options.quiet:
+			self.write(msg)
+
+	def info(self, msg):
+		if self.options.verbose:
+			self.write(msg)
+
+	def status(self, msg):
+		if not self.options.quiet:
+			self.write(msg)
+
+def _mk_writer(options):
+	def write(s):
+		print(s)
+	return Writer(write, options)
+	
+def _get_filename(path):
+	"""Construct a usable filename for outputs"""
+	dname = "."
+	fname = "bootchart"
+	if path != None:
+		if os.path.isdir(path):
+			dname = path
+		else:
+			fname = path
+	return os.path.join(dname, fname)
+
+def main(argv=None):
+	try:
+		if argv is None:
+			argv = sys.argv[1:]
+	
+		parser = _mk_options_parser()
+		options, args = parser.parse_args(argv)
+		writer = _mk_writer(options)
+
+		if len(args) == 0:
+			print("No path given, trying /var/log/bootchart.tgz")
+			args = [ "/var/log/bootchart.tgz" ]
+
+		res = parsing.Trace(writer, args, options)
+
+		if options.interactive or options.output == None:
+			from . import gui
+			gui.show(res, options)
+		elif options.boottime:
+			import math
+			proc_tree = res.proc_tree
+			if proc_tree.idle:
+			    duration = proc_tree.idle
+			else:
+			    duration = proc_tree.duration
+			dur = duration / 100.0
+			print('%02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60)))
+		else:
+			if options.annotate_file:
+				f = open (options.annotate_file, "w")
+				try:
+					for time in res[4]:
+						if time is not None:
+							# output as ms
+							print(time * 10, file=f)
+						else:
+							print(file=f)
+				finally:
+					f.close()
+			filename = _get_filename(options.output)
+			res_list = parsing.split_res(res, options.num)
+			n = 1
+			for r in res_list:
+				if len(res_list) == 1:
+					f = filename + "." + options.format
+				else:
+					f = filename + "_" + str(n) + "." + options.format
+					n = n + 1
+				def render():
+					batch.render(writer, r, options, f)
+				if options.profile:
+					import cProfile
+					import pstats
+					profile = '%s.prof' % os.path.splitext(filename)[0]
+					cProfile.runctx('render()', globals(), locals(), profile)
+					p = pstats.Stats(profile)
+					p.strip_dirs().sort_stats('time').print_stats(20)
+				else:
+					render()
+
+		return 0
+	except parsing.ParseError as ex:
+		print(("Parse error: %s" % ex))
+		return 2
+
+
+if __name__ == '__main__':
+	sys.exit(main())
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 6343fd5..c8a6a57 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -1,178 +1,638 @@
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
+
 from __future__ import with_statement
 
 import os
 import string
 import re
+import sys
 import tarfile
+from time import clock
 from collections import defaultdict
+from functools import reduce
+
+from .samples import *
+from .process_tree import ProcessTree
+
+if sys.version_info >= (3, 0):
+    long = int
+
+# Parsing produces as its end result a 'Trace'
+
+class Trace:
+    def __init__(self, writer, paths, options):
+        self.processes = {}
+        self.start = {}
+        self.end = {}
+        self.headers = None
+        self.disk_stats = None
+        self.ps_stats = None
+        self.taskstats = None
+        self.cpu_stats = None
+        self.cmdline = None
+        self.kernel = None
+        self.kernel_tree = None
+        self.filename = None
+        self.parent_map = None
+        self.mem_stats = None
+
+        parse_paths (writer, self, paths, options.mintime)
+        if not self.valid():
+            raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
+
+        return
+
+        # Turn that parsed information into something more useful
+        # link processes into a tree of pointers, calculate statistics
+        self.compile(writer)
+
+        # Crop the chart to the end of the first idle period after the given
+        # process
+        if options.crop_after:
+            idle = self.crop (writer, options.crop_after)
+        else:
+            idle = None
+
+        # Annotate other times as the first start point of given process lists
+        self.times = [ idle ]
+        if options.annotate:
+            for procnames in options.annotate:
+                names = [x[:15] for x in procnames.split(",")]
+                for proc in self.ps_stats.process_map.values():
+                    if proc.cmd in names:
+                        self.times.append(proc.start_time)
+                        break
+                    else:
+                        self.times.append(None)
+
+        self.proc_tree = ProcessTree(writer, self.kernel, self.ps_stats,
+                                     self.ps_stats.sample_period,
+                                     self.headers.get("profile.process"),
+                                     options.prune, idle, self.taskstats,
+                                     self.parent_map is not None)
+
+        if self.kernel is not None:
+            self.kernel_tree = ProcessTree(writer, self.kernel, None, 0,
+                                           self.headers.get("profile.process"),
+                                           False, None, None, True)
+
+    def valid(self):
+        return len(self.processes) != 0
+        return self.headers != None and self.disk_stats != None and \
+               self.ps_stats != None and self.cpu_stats != None
+
+
+    def compile(self, writer):
+
+        def find_parent_id_for(pid):
+            if pid is 0:
+                return 0
+            ppid = self.parent_map.get(pid)
+            if ppid:
+                # many of these double forks are so short lived
+                # that we have no samples, or process info for them
+                # so climb the parent hierarcy to find one
+                if int (ppid * 1000) not in self.ps_stats.process_map:
+#                    print "Pid '%d' short lived with no process" % ppid
+                    ppid = find_parent_id_for (ppid)
+#                else:
+#                    print "Pid '%d' has an entry" % ppid
+            else:
+#                print "Pid '%d' missing from pid map" % pid
+                return 0
+            return ppid
+
+        # merge in the cmdline data
+        if self.cmdline is not None:
+            for proc in self.ps_stats.process_map.values():
+                rpid = int (proc.pid // 1000)
+                if rpid in self.cmdline:
+                    cmd = self.cmdline[rpid]
+                    proc.exe = cmd['exe']
+                    proc.args = cmd['args']
+#                else:
+#                    print "proc %d '%s' not in cmdline" % (rpid, proc.exe)
+
+        # re-parent any stray orphans if we can
+        if self.parent_map is not None:
+            for process in self.ps_stats.process_map.values():
+                ppid = find_parent_id_for (int(process.pid // 1000))
+                if ppid:
+                    process.ppid = ppid * 1000
+
+        # stitch the tree together with pointers
+        for process in self.ps_stats.process_map.values():
+            process.set_parent (self.ps_stats.process_map)
+
+        # count on fingers variously
+        for process in self.ps_stats.process_map.values():
+            process.calc_stats (self.ps_stats.sample_period)
+
+    def crop(self, writer, crop_after):
+
+        def is_idle_at(util, start, j):
+            k = j + 1
+            while k < len(util) and util[k][0] < start + 300:
+                k += 1
+            k = min(k, len(util)-1)
+
+            if util[j][1] >= 0.25:
+                return False
+
+            avgload = sum(u[1] for u in util[j:k+1]) / (k-j+1)
+            if avgload < 0.25:
+                return True
+            else:
+                return False
+        def is_idle(util, start):
+            for j in range(0, len(util)):
+                if util[j][0] < start:
+                    continue
+                return is_idle_at(util, start, j)
+            else:
+                return False
+
+        names = [x[:15] for x in crop_after.split(",")]
+        for proc in self.ps_stats.process_map.values():
+            if proc.cmd in names or proc.exe in names:
+                writer.info("selected proc '%s' from list (start %d)"
+                            % (proc.cmd, proc.start_time))
+                break
+        if proc is None:
+            writer.warn("no selected crop proc '%s' in list" % crop_after)
+
+
+        cpu_util = [(sample.time, sample.user + sample.sys + sample.io) for sample in self.cpu_stats]
+        disk_util = [(sample.time, sample.util) for sample in self.disk_stats]
+
+        idle = None
+        for i in range(0, len(cpu_util)):
+            if cpu_util[i][0] < proc.start_time:
+                continue
+            if is_idle_at(cpu_util, cpu_util[i][0], i) \
+               and is_idle(disk_util, cpu_util[i][0]):
+                idle = cpu_util[i][0]
+                break
+
+        if idle is None:
+            writer.warn ("not idle after proc '%s'" % crop_after)
+            return None
+
+        crop_at = idle + 300
+        writer.info ("cropping at time %d" % crop_at)
+        while len (self.cpu_stats) \
+                    and self.cpu_stats[-1].time > crop_at:
+            self.cpu_stats.pop()
+        while len (self.disk_stats) \
+                    and self.disk_stats[-1].time > crop_at:
+            self.disk_stats.pop()
+
+        self.ps_stats.end_time = crop_at
+
+        cropped_map = {}
+        for key, value in self.ps_stats.process_map.items():
+            if (value.start_time <= crop_at):
+                cropped_map[key] = value
+
+        for proc in cropped_map.values():
+            proc.duration = min (proc.duration, crop_at - proc.start_time)
+            while len (proc.samples) \
+                        and proc.samples[-1].time > crop_at:
+                proc.samples.pop()
+
+        self.ps_stats.process_map = cropped_map
+
+        return idle
+
 
-from samples import *
-from process_tree import ProcessTree
 
 class ParseError(Exception):
-	"""Represents errors during parse of the bootchart."""
-	def __init__(self, value):
-            self.value = value
+    """Represents errors during parse of the bootchart."""
+    def __init__(self, value):
+        self.value = value
 
-        def __str__(self):
-            return self.value
+    def __str__(self):
+        return self.value
 
 def _parse_headers(file):
-	"""Parses the headers of the bootchart."""
-        def parse((headers,last), line): 
-            if '=' in line: last,value = map(string.strip, line.split('=', 1))
-            else:           value = line.strip()
-            headers[last] += value
-            return headers,last
-        return reduce(parse, file.read().split('\n'), (defaultdict(str),''))[0]
+    """Parses the headers of the bootchart."""
+    def parse(acc, line):
+        (headers, last) = acc
+        if '=' in line:
+            last, value = map (lambda x: x.strip(), line.split('=', 1))
+        else:
+            value = line.strip()
+        headers[last] += value
+        return headers, last
+    return reduce(parse, file.read().decode('utf-8').split('\n'), (defaultdict(str),''))[0]
 
 def _parse_timed_blocks(file):
-	"""Parses (ie., splits) a file into so-called timed-blocks. A
-        timed-block consists of a timestamp on a line by itself followed
-        by zero or more lines of data for that point in time."""
-        def parse(block):
-            lines = block.split('\n')
-            if not lines:
-                raise ParseError('expected a timed-block consisting a timestamp followed by data lines')
-            try:
-                return (int(lines[0]), lines[1:])
-            except ValueError:
-                raise ParseError("expected a timed-block, but timestamp '%s' is not an integer" % lines[0])
-	blocks = file.read().split('\n\n')
-        return [parse(block) for block in blocks if block.strip()]
-	
-def _parse_proc_ps_log(file):
-	"""
-	 * See proc(5) for details.
-	 * 
-	 * {pid, comm, state, ppid, pgrp, session, tty_nr, tpgid, flags, minflt, cminflt, majflt, cmajflt, utime, stime,
-	 *  cutime, cstime, priority, nice, 0, itrealvalue, starttime, vsize, rss, rlim, startcode, endcode, startstack, 
-	 *  kstkesp, kstkeip}
-	"""
-	processMap = {}
-	ltime = 0
-        timed_blocks = _parse_timed_blocks(file)
-	for time, lines in timed_blocks:
-		for line in lines:
-			tokens = line.split(' ')
-
-			offset = [index for index, token in enumerate(tokens[1:]) if token.endswith(')')][0]		
-			pid, cmd, state, ppid = int(tokens[0]), ' '.join(tokens[1:2+offset]), tokens[2+offset], int(tokens[3+offset])
-			userCpu, sysCpu, stime= int(tokens[13+offset]), int(tokens[14+offset]), int(tokens[21+offset])
-
-			if processMap.has_key(pid):
-				process = processMap[pid]
-				process.cmd = cmd.replace('(', '').replace(')', '') # why rename after latest name??
-			else:
-				process = Process(pid, cmd, ppid, min(time, stime))
-				processMap[pid] = process
-			
-			if process.last_user_cpu_time is not None and process.last_sys_cpu_time is not None and ltime is not None:
-				userCpuLoad, sysCpuLoad = process.calc_load(userCpu, sysCpu, time - ltime)
-				cpuSample = CPUSample('null', userCpuLoad, sysCpuLoad, 0.0)
-				process.samples.append(ProcessSample(time, state, cpuSample))
-			
-			process.last_user_cpu_time = userCpu
-			process.last_sys_cpu_time = sysCpu
-		ltime = time
-
-	startTime = timed_blocks[0][0]
-	avgSampleLength = (ltime - startTime)/(len(timed_blocks)-1)	
-
-	for process in processMap.values():
-		process.set_parent(processMap)
-
-	for process in processMap.values():
-		process.calc_stats(avgSampleLength)
-		
-	return ProcessStats(processMap.values(), avgSampleLength, startTime, ltime)
-	
+    """Parses (ie., splits) a file into so-called timed-blocks. A
+    timed-block consists of a timestamp on a line by itself followed
+    by zero or more lines of data for that point in time."""
+    def parse(block):
+        lines = block.split('\n')
+        if not lines:
+            raise ParseError('expected a timed-block consisting a timestamp followed by data lines')
+        try:
+            return (int(lines[0]), lines[1:])
+        except ValueError:
+            raise ParseError("expected a timed-block, but timestamp '%s' is not an integer" % lines[0])
+    blocks = file.read().decode('utf-8').split('\n\n')
+    return [parse(block) for block in blocks if block.strip() and not block.endswith(' not running\n')]
+
+def _parse_proc_ps_log(writer, file):
+    """
+     * See proc(5) for details.
+     *
+     * {pid, comm, state, ppid, pgrp, session, tty_nr, tpgid, flags, minflt, cminflt, majflt, cmajflt, utime, stime,
+     *  cutime, cstime, priority, nice, 0, itrealvalue, starttime, vsize, rss, rlim, startcode, endcode, startstack,
+     *  kstkesp, kstkeip}
+    """
+    processMap = {}
+    ltime = 0
+    timed_blocks = _parse_timed_blocks(file)
+    for time, lines in timed_blocks:
+        for line in lines:
+            if not line: continue
+            tokens = line.split(' ')
+            if len(tokens) < 21:
+                continue
+
+            offset = [index for index, token in enumerate(tokens[1:]) if token[-1] == ')'][0]
+            pid, cmd, state, ppid = int(tokens[0]), ' '.join(tokens[1:2+offset]), tokens[2+offset], int(tokens[3+offset])
+            userCpu, sysCpu, stime = int(tokens[13+offset]), int(tokens[14+offset]), int(tokens[21+offset])
+
+            # magic fixed point-ness ...
+            pid *= 1000
+            ppid *= 1000
+            if pid in processMap:
+                process = processMap[pid]
+                process.cmd = cmd.strip('()') # why rename after latest name??
+            else:
+                process = Process(writer, pid, cmd.strip('()'), ppid, min(time, stime))
+                processMap[pid] = process
+
+            if process.last_user_cpu_time is not None and process.last_sys_cpu_time is not None and ltime is not None:
+                userCpuLoad, sysCpuLoad = process.calc_load(userCpu, sysCpu, max(1, time - ltime))
+                cpuSample = CPUSample('null', userCpuLoad, sysCpuLoad, 0.0)
+                process.samples.append(ProcessSample(time, state, cpuSample))
+
+            process.last_user_cpu_time = userCpu
+            process.last_sys_cpu_time = sysCpu
+        ltime = time
+
+    if len (timed_blocks) < 2:
+        return None
+
+    startTime = timed_blocks[0][0]
+    avgSampleLength = (ltime - startTime)/(len (timed_blocks) - 1)
+
+    return ProcessStats (writer, processMap, len (timed_blocks), avgSampleLength, startTime, ltime)
+
+def _parse_taskstats_log(writer, file):
+    """
+     * See bootchart-collector.c for details.
+     *
+     * { pid, ppid, comm, cpu_run_real_total, blkio_delay_total, swapin_delay_total }
+     *
+    """
+    processMap = {}
+    pidRewrites = {}
+    ltime = None
+    timed_blocks = _parse_timed_blocks(file)
+    for time, lines in timed_blocks:
+        # we have no 'stime' from taskstats, so prep 'init'
+        if ltime is None:
+            process = Process(writer, 1, '[init]', 0, 0)
+            processMap[1000] = process
+            ltime = time
+#                       continue
+        for line in lines:
+            if not line: continue
+            tokens = line.split(' ')
+            if len(tokens) != 6:
+                continue
+
+            opid, ppid, cmd = int(tokens[0]), int(tokens[1]), tokens[2]
+            cpu_ns, blkio_delay_ns, swapin_delay_ns = long(tokens[-3]), long(tokens[-2]), long(tokens[-1]),
+
+            # make space for trees of pids
+            opid *= 1000
+            ppid *= 1000
+
+            # when the process name changes, we re-write the pid.
+            if opid in pidRewrites:
+                pid = pidRewrites[opid]
+            else:
+                pid = opid
+
+            cmd = cmd.strip('(').strip(')')
+            if pid in processMap:
+                process = processMap[pid]
+                if process.cmd != cmd:
+                    pid += 1
+                    pidRewrites[opid] = pid
+#                                       print "process mutation ! '%s' vs '%s' pid %s -> pid %s\n" % (process.cmd, cmd, opid, pid)
+                    process = process.split (writer, pid, cmd, ppid, time)
+                    processMap[pid] = process
+                else:
+                    process.cmd = cmd;
+            else:
+                process = Process(writer, pid, cmd, ppid, time)
+                processMap[pid] = process
+
+            delta_cpu_ns = (float) (cpu_ns - process.last_cpu_ns)
+            delta_blkio_delay_ns = (float) (blkio_delay_ns - process.last_blkio_delay_ns)
+            delta_swapin_delay_ns = (float) (swapin_delay_ns - process.last_swapin_delay_ns)
+
+            # make up some state data ...
+            if delta_cpu_ns > 0:
+                state = "R"
+            elif delta_blkio_delay_ns + delta_swapin_delay_ns > 0:
+                state = "D"
+            else:
+                state = "S"
+
+            # retain the ns timing information into a CPUSample - that tries
+            # with the old-style to be a %age of CPU used in this time-slice.
+            if delta_cpu_ns + delta_blkio_delay_ns + delta_swapin_delay_ns > 0:
+#                               print "proc %s cpu_ns %g delta_cpu %g" % (cmd, cpu_ns, delta_cpu_ns)
+                cpuSample = CPUSample('null', delta_cpu_ns, 0.0,
+                                      delta_blkio_delay_ns,
+                                      delta_swapin_delay_ns)
+                process.samples.append(ProcessSample(time, state, cpuSample))
+
+            process.last_cpu_ns = cpu_ns
+            process.last_blkio_delay_ns = blkio_delay_ns
+            process.last_swapin_delay_ns = swapin_delay_ns
+        ltime = time
+
+    if len (timed_blocks) < 2:
+        return None
+
+    startTime = timed_blocks[0][0]
+    avgSampleLength = (ltime - startTime)/(len(timed_blocks)-1)
+
+    return ProcessStats (writer, processMap, len (timed_blocks), avgSampleLength, startTime, ltime)
+
 def _parse_proc_stat_log(file):
-	samples = []
-	ltimes = None
-	for time, lines in _parse_timed_blocks(file):
-		# CPU times {user, nice, system, idle, io_wait, irq, softirq}		
-		tokens = lines[0].split();
-		times = [ int(token) for token in tokens[1:] ]
-		if ltimes:
-			user = float((times[0] + times[1]) - (ltimes[0] + ltimes[1]))
-			system = float((times[2] + times[5] + times[6]) - (ltimes[2] + ltimes[5] + ltimes[6]))
-			idle = float(times[3] - ltimes[3])
-			iowait = float(times[4] - ltimes[4])
-			
-			aSum = max(user + system + idle + iowait, 1)
-			samples.append( CPUSample(time, user/aSum, system/aSum, iowait/aSum) )
-		
-		ltimes = times		
-		# skip the rest of statistics lines
-	return samples
-
-		
+    samples = []
+    ltimes = None
+    for time, lines in _parse_timed_blocks(file):
+        # skip emtpy lines
+        if not lines:
+            continue
+        # CPU times {user, nice, system, idle, io_wait, irq, softirq}
+        tokens = lines[0].split()
+        times = [ int(token) for token in tokens[1:] ]
+        if ltimes:
+            user = float((times[0] + times[1]) - (ltimes[0] + ltimes[1]))
+            system = float((times[2] + times[5] + times[6]) - (ltimes[2] + ltimes[5] + ltimes[6]))
+            idle = float(times[3] - ltimes[3])
+            iowait = float(times[4] - ltimes[4])
+
+            aSum = max(user + system + idle + iowait, 1)
+            samples.append( CPUSample(time, user/aSum, system/aSum, iowait/aSum) )
+
+        ltimes = times
+        # skip the rest of statistics lines
+    return samples
+
 def _parse_proc_disk_stat_log(file, numCpu):
-	"""
-	Parse file for disk stats, but only look at the whole disks, eg. sda,
-	not sda1, sda2 etc. The format of relevant lines should be:
-	{major minor name rio rmerge rsect ruse wio wmerge wsect wuse running use aveq}
-	"""
-	DISK_REGEX = 'hd.$|sd.$'
-	
-	def is_relevant_line(line):
-		return len(line.split()) == 14 and re.match(DISK_REGEX, line.split()[2])
-	
-	disk_stat_samples = []
-
-	for time, lines in _parse_timed_blocks(file):
-		sample = DiskStatSample(time)		
-		relevant_tokens = [line.split() for line in lines if is_relevant_line(line)]
-		
-		for tokens in relevant_tokens:			
-			disk, rsect, wsect, use = tokens[2], int(tokens[5]), int(tokens[9]), int(tokens[12])			
-			sample.add_diskdata([rsect, wsect, use])
-		
-		disk_stat_samples.append(sample)
-			
-	disk_stats = []
-	for sample1, sample2 in zip(disk_stat_samples[:-1], disk_stat_samples[1:]):
-		interval = sample1.time - sample2.time
-		sums = [ a - b for a, b in zip(sample1.diskdata, sample2.diskdata) ]
-		readTput = sums[0] / 2.0 * 100.0 / interval
-		writeTput = sums[1] / 2.0 * 100.0 / interval			
-		util = float( sums[2] ) / 10 / interval / numCpu
-		util = max(0.0, min(1.0, util))
-		disk_stats.append(DiskSample(sample2.time, readTput, writeTput, util))
-	
-	return disk_stats
-	
-	
+    """
+    Parse file for disk stats, but only look at the whole device, eg. sda,
+    not sda1, sda2 etc. The format of relevant lines should be:
+    {major minor name rio rmerge rsect ruse wio wmerge wsect wuse running use aveq}
+    """
+    disk_regex_re = re.compile ('^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
+
+    # this gets called an awful lot.
+    def is_relevant_line(linetokens):
+        if len(linetokens) != 14:
+            return False
+        disk = linetokens[2]
+        return disk_regex_re.match(disk)
+
+    disk_stat_samples = []
+
+    for time, lines in _parse_timed_blocks(file):
+        sample = DiskStatSample(time)
+        relevant_tokens = [linetokens for linetokens in map (lambda x: x.split(),lines) if is_relevant_line(linetokens)]
+
+        for tokens in relevant_tokens:
+            disk, rsect, wsect, use = tokens[2], int(tokens[5]), int(tokens[9]), int(tokens[12])
+            sample.add_diskdata([rsect, wsect, use])
+
+        disk_stat_samples.append(sample)
+
+    disk_stats = []
+    for sample1, sample2 in zip(disk_stat_samples[:-1], disk_stat_samples[1:]):
+        interval = sample1.time - sample2.time
+        if interval == 0:
+            interval = 1
+        sums = [ a - b for a, b in zip(sample1.diskdata, sample2.diskdata) ]
+        readTput = sums[0] / 2.0 * 100.0 / interval
+        writeTput = sums[1] / 2.0 * 100.0 / interval
+        util = float( sums[2] ) / 10 / interval / numCpu
+        util = max(0.0, min(1.0, util))
+        disk_stats.append(DiskSample(sample2.time, readTput, writeTput, util))
+
+    return disk_stats
+
+def _parse_proc_meminfo_log(file):
+    """
+    Parse file for global memory statistics.
+    The format of relevant lines should be: ^key: value( unit)?
+    """
+    used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
+
+    mem_stats = []
+    meminfo_re = re.compile(r'([^ \t:]+):\s*(\d+).*')
+
+    for time, lines in _parse_timed_blocks(file):
+        sample = MemSample(time)
+
+        for line in lines:
+            match = meminfo_re.match(line)
+            if not match:
+                raise ParseError("Invalid meminfo line \"%s\"" % match.groups(0))
+            sample.add_value(match.group(1), int(match.group(2)))
+
+        if sample.valid():
+            mem_stats.append(sample)
+
+    return mem_stats
+
+# if we boot the kernel with: initcall_debug printk.time=1 we can
+# get all manner of interesting data from the dmesg output
+# We turn this into a pseudo-process tree: each event is
+# characterised by a
+# we don't try to detect a "kernel finished" state - since the kernel
+# continues to do interesting things after init is called.
+#
+# sample input:
+# [    0.000000] ACPI: FACP 3f4fc000 000F4 (v04 INTEL  Napa     00000001 MSFT 01000013)
+# ...
+# [    0.039993] calling  migration_init+0x0/0x6b @ 1
+# [    0.039993] initcall migration_init+0x0/0x6b returned 1 after 0 usecs
+def _parse_dmesg(writer, file):
+    timestamp_re = re.compile ("^\[\s*(\d+\.\d+)\s*]\s+(.*)$")
+    split_re = re.compile ("^(\S+)\s+([\S\+_-]+) (.*)$")
+    processMap = {}
+    idx = 0
+    inc = 1.0 / 1000000
+    kernel = Process(writer, idx, "k-boot", 0, 0.1)
+    processMap['k-boot'] = kernel
+    base_ts = False
+    max_ts = 0
+    for line in file.read().decode('utf-8').split('\n'):
+        t = timestamp_re.match (line)
+        if t is None:
+#                       print "duff timestamp " + line
+            continue
+
+        time_ms = float (t.group(1)) * 1000
+        # looks like we may have a huge diff after the clock
+        # has been set up. This could lead to huge graph:
+        # so huge we will be killed by the OOM.
+        # So instead of using the plain timestamp we will
+        # use a delta to first one and skip the first one
+        # for convenience
+        if max_ts == 0 and not base_ts and time_ms > 1000:
+            base_ts = time_ms
+            continue
+        max_ts = max(time_ms, max_ts)
+        if base_ts:
+#                       print "fscked clock: used %f instead of %f" % (time_ms - base_ts, time_ms)
+            time_ms -= base_ts
+        m = split_re.match (t.group(2))
+
+        if m is None:
+            continue
+#               print "match: '%s'" % (m.group(1))
+        type = m.group(1)
+        func = m.group(2)
+        rest = m.group(3)
+
+        if t.group(2).startswith ('Write protecting the') or \
+           t.group(2).startswith ('Freeing unused kernel memory'):
+            kernel.duration = time_ms / 10
+            continue
+
+#               print "foo: '%s' '%s' '%s'" % (type, func, rest)
+        if type == "calling":
+            ppid = kernel.pid
+            p = re.match ("\@ (\d+)", rest)
+            if p is not None:
+                ppid = float (p.group(1)) // 1000
+#                               print "match: '%s' ('%g') at '%s'" % (func, ppid, time_ms)
+            name = func.split ('+', 1) [0]
+            idx += inc
+            processMap[func] = Process(writer, ppid + idx, name, ppid, time_ms / 10)
+        elif type == "initcall":
+#                       print "finished: '%s' at '%s'" % (func, time_ms)
+            if func in processMap:
+                process = processMap[func]
+                process.duration = (time_ms / 10) - process.start_time
+            else:
+                print("corrupted init call for %s" % (func))
+
+        elif type == "async_waiting" or type == "async_continuing":
+            continue # ignore
+
+    return processMap.values()
+
+#
+# Parse binary pacct accounting file output if we have one
+# cf. /usr/include/linux/acct.h
+#
+def _parse_pacct(writer, file):
+    # read LE int32
+    def _read_le_int32(file):
+        byts = file.read(4)
+        return (ord(byts[0]))       | (ord(byts[1]) << 8) | \
+               (ord(byts[2]) << 16) | (ord(byts[3]) << 24)
+
+    parent_map = {}
+    parent_map[0] = 0
+    while file.read(1) != "": # ignore flags
+        ver = file.read(1)
+        if ord(ver) < 3:
+            print("Invalid version 0x%x" % (ord(ver)))
+            return None
+
+        file.seek (14, 1)     # user, group etc.
+        pid = _read_le_int32 (file)
+        ppid = _read_le_int32 (file)
+#               print "Parent of %d is %d" % (pid, ppid)
+        parent_map[pid] = ppid
+        file.seek (4 + 4 + 16, 1) # timings
+        file.seek (16, 1)         # acct_comm
+    return parent_map
+
+def _parse_paternity_log(writer, file):
+    parent_map = {}
+    parent_map[0] = 0
+    for line in file.read().decode('utf-8').split('\n'):
+        if not line:
+            continue
+        elems = line.split(' ') # <Child> <Parent>
+        if len (elems) >= 2:
+#                       print "paternity of %d is %d" % (int(elems[0]), int(elems[1]))
+            parent_map[int(elems[0])] = int(elems[1])
+        else:
+            print("Odd paternity line '%s'" % (line))
+    return parent_map
+
+def _parse_cmdline_log(writer, file):
+    cmdLines = {}
+    for block in file.read().decode('utf-8').split('\n\n'):
+        lines = block.split('\n')
+        if len (lines) >= 3:
+#                       print "Lines '%s'" % (lines[0])
+            pid = int (lines[0])
+            values = {}
+            values['exe'] = lines[1].lstrip(':')
+            args = lines[2].lstrip(':').split('\0')
+            args.pop()
+            values['args'] = args
+            cmdLines[pid] = values
+    return cmdLines
+
 def get_num_cpus(headers):
     """Get the number of CPUs from the system.cpu header property. As the
     CPU utilization graphs are relative, the number of CPUs currently makes
     no difference."""
     if headers is None:
         return 1
+    if headers.get("system.cpu.num"):
+        return max (int (headers.get("system.cpu.num")), 1)
     cpu_model = headers.get("system.cpu")
     if cpu_model is None:
         return 1
     mat = re.match(".*\\((\\d+)\\)", cpu_model)
     if mat is None:
         return 1
-    return int(mat.group(1))
-
-class ParserState:
-    def __init__(self):
-        self.processes = {}
-        self.start = {}
-        self.end = {}
+    return max (int(mat.group(1)), 1)
 
-    def valid(self):
-        return len(self.processes) != 0
-
-
-_relevant_files = set(["header", "proc_diskstats.log", "proc_ps.log", "proc_stat.log"])
-
-def _do_parse(state, filename, file, mintime):
-    #print filename
-    #writer.status("parsing '%s'" % filename)
+def _do_parse(writer, state, filename, file, mintime):
+    writer.info("parsing '%s'" % filename)
+    t1 = clock()
     paths = filename.split("/")
     task = paths[-1]
     pn = paths[-2]
@@ -194,44 +654,49 @@ def _do_parse(state, filename, file, mintime):
             state.end[end] = []
         if k not in state.end[end]:
             state.end[end].append(pn + ":" + task)
+    t2 = clock()
+    writer.info("  %s seconds" % str(t2-t1))
     return state
 
-def parse_file(state, filename, mintime):
+def parse_file(writer, state, filename, mintime):
+    if state.filename is None:
+        state.filename = filename
     basename = os.path.basename(filename)
     with open(filename, "rb") as file:
-        return _do_parse(state, filename, file, mintime)
+        return _do_parse(writer, state, filename, file, mintime)
 
-def parse_paths(state, paths, mintime):
+def parse_paths(writer, state, paths, mintime):
     for path in paths:
-        root,extension = os.path.splitext(path)
+        if state.filename is None:
+            state.filename = path
+        root, extension = os.path.splitext(path)
         if not(os.path.exists(path)):
-            print "warning: path '%s' does not exist, ignoring." % path
+            writer.warn("warning: path '%s' does not exist, ignoring." % path)
             continue
+        #state.filename = path
         if os.path.isdir(path):
             files = [ f for f in [os.path.join(path, f) for f in os.listdir(path)] ]
             files.sort()
-            state = parse_paths(state, files, mintime)
-        elif extension in [".tar", ".tgz", ".tar.gz"]:
+            state = parse_paths(writer, state, files, mintime)
+        elif extension in [".tar", ".tgz", ".gz"]:
+            if extension == ".gz":
+                root, extension = os.path.splitext(root)
+                if extension != ".tar":
+                    writer.warn("warning: can only handle zipped tar files, not zipped '%s'-files; ignoring" % extension)
+                    continue
             tf = None
             try:
+                writer.status("parsing '%s'" % path)
                 tf = tarfile.open(path, 'r:*')
                 for name in tf.getnames():
-                    state = _do_parse(state, name, tf.extractfile(name))
-            except tarfile.ReadError, error:
+                    state = _do_parse(writer, state, name, tf.extractfile(name))
+            except tarfile.ReadError as error:
                 raise ParseError("error: could not read tarfile '%s': %s." % (path, error))
             finally:
                 if tf != None:
                     tf.close()
         else:
-            state = parse_file(state, path, mintime)
-    return state
-
-def parse(paths, prune, mintime):   
-    state = parse_paths(ParserState(), paths, mintime)
-    if not state.valid():
-        raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
-    #monitored_app = state.headers.get("profile.process")
-    #proc_tree = ProcessTree(state.ps_stats, monitored_app, prune)
+            state = parse_file(writer, state, path, mintime)
     return state
 
 def split_res(res, n):
diff --git a/scripts/pybootchartgui/pybootchartgui/process_tree.py b/scripts/pybootchartgui/pybootchartgui/process_tree.py
index bde29eb..cf88110 100644
--- a/scripts/pybootchartgui/pybootchartgui/process_tree.py
+++ b/scripts/pybootchartgui/pybootchartgui/process_tree.py
@@ -1,3 +1,18 @@
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
 class ProcessTree:
     """ProcessTree encapsulates a process tree.  The tree is built from log files
        retrieved during the boot process.  When building the process tree, it is
@@ -19,55 +34,61 @@ class ProcessTree:
           are merged together.
 
     """
-    LOGGER_PROC = 'bootchartd'
+    LOGGER_PROC = 'bootchart-colle'
     EXPLODER_PROCESSES = set(['hwup'])
 
-    def __init__(self, psstats, monitoredApp, prune, for_testing = False):
+    def __init__(self, writer, kernel, psstats, sample_period,
+                 monitoredApp, prune, idle, taskstats,
+                 accurate_parentage, for_testing = False):
+        self.writer = writer
         self.process_tree = []
-	self.psstats = psstats
-	self.process_list = sorted(psstats.process_list, key = lambda p: p.pid)
-	self.sample_period = psstats.sample_period
-
-	self.build()
-        self.update_ppids_for_daemons(self.process_list)
+        self.taskstats = taskstats
+        if psstats is None:
+            process_list = kernel
+        elif kernel is None:
+            process_list = psstats.process_map.values()
+        else:
+            process_list = list(kernel) + list(psstats.process_map.values())
+        self.process_list = sorted(process_list, key = lambda p: p.pid)
+        self.sample_period = sample_period
+
+        self.build()
+        if not accurate_parentage:
+            self.update_ppids_for_daemons(self.process_list)
 
         self.start_time = self.get_start_time(self.process_tree)
         self.end_time = self.get_end_time(self.process_tree)
         self.duration = self.end_time - self.start_time
+        self.idle = idle
 
         if for_testing:
             return
 
-	# print 'proc_tree before prune: num_proc=%i, duration=%i' % (self.num_nodes(self.process_list), self.duration)
-
-	removed = self.merge_logger(self.process_tree, self.LOGGER_PROC, monitoredApp, False)
-	print "Merged %i logger processes" % removed
+        removed = self.merge_logger(self.process_tree, self.LOGGER_PROC, monitoredApp, False)
+        writer.status("merged %i logger processes" % removed)
 
-	if prune:
-            removed = self.prune(self.process_tree, None)
-	    print "Pruned %i processes" % removed
-	    removed = self.merge_exploders(self.process_tree, self.EXPLODER_PROCESSES)
-	    print "Pruned %i exploders" % removed
-	    removed = self.merge_siblings(self.process_tree)
-	    print "Pruned %i threads" % removed
-	    removed = self.merge_runs(self.process_tree)
-	    print "Pruned %i runs" % removed
+        if prune:
+            p_processes = self.prune(self.process_tree, None)
+            p_exploders = self.merge_exploders(self.process_tree, self.EXPLODER_PROCESSES)
+            p_threads = self.merge_siblings(self.process_tree)
+            p_runs = self.merge_runs(self.process_tree)
+            writer.status("pruned %i process, %i exploders, %i threads, and %i runs" % (p_processes, p_exploders, p_threads, p_runs))
 
         self.sort(self.process_tree)
 
-	self.start_time = self.get_start_time(self.process_tree)
+        self.start_time = self.get_start_time(self.process_tree)
         self.end_time = self.get_end_time(self.process_tree)
-	self.duration = self.end_time - self.start_time
+        self.duration = self.end_time - self.start_time
 
-	self.num_proc = self.num_nodes(self.process_tree)
+        self.num_proc = self.num_nodes(self.process_tree)
 
     def build(self):
         """Build the process tree from the list of top samples."""
         self.process_tree = []
-	for proc in self.process_list:
+        for proc in self.process_list:
             if not proc.parent:
                 self.process_tree.append(proc)
-	    else:
+            else:
                 proc.parent.child_list.append(proc)
 
     def sort(self, process_subtree):
@@ -85,11 +106,11 @@ class ProcessTree:
 
     def get_start_time(self, process_subtree):
         """Returns the start time of the process subtree.  This is the start
-	   time of the earliest process.
+           time of the earliest process.
 
         """
         if not process_subtree:
-            return 100000000;
+            return 100000000
         return min( [min(proc.start_time, self.get_start_time(proc.child_list)) for proc in process_subtree] )
 
     def get_end_time(self, process_subtree):
@@ -98,13 +119,13 @@ class ProcessTree:
 
         """
         if not process_subtree:
-            return -100000000;
+            return -100000000
         return max( [max(proc.start_time + proc.duration, self.get_end_time(proc.child_list)) for proc in process_subtree] )
 
     def get_max_pid(self, process_subtree):
         """Returns the max PID found in the process tree."""
         if not process_subtree:
-            return -100000000;
+            return -100000000
         return max( [max(proc.pid, self.get_max_pid(proc.child_list)) for proc in process_subtree] )
 
     def update_ppids_for_daemons(self, process_list):
@@ -118,29 +139,29 @@ class ProcessTree:
         rcendpid = -1
         rcproc = None
         for p in process_list:
-            if p.cmd == "rc" and p.ppid == 1:
+            if p.cmd == "rc" and p.ppid // 1000 == 1:
                 rcproc = p
                 rcstartpid = p.pid
                 rcendpid = self.get_max_pid(p.child_list)
         if rcstartpid != -1 and rcendpid != -1:
             for p in process_list:
-                if p.pid > rcstartpid and p.pid < rcendpid and p.ppid == 1:
+                if p.pid > rcstartpid and p.pid < rcendpid and p.ppid // 1000 == 1:
                     p.ppid = rcstartpid
                     p.parent = rcproc
             for p in process_list:
                 p.child_list = []
             self.build()
-            
+
     def prune(self, process_subtree, parent):
         """Prunes the process tree by removing idle processes and processes
-	   that only live for the duration of a single top sample.  Sibling
-	   processes with the same command line (i.e. threads) are merged 
-	   together. This filters out sleepy background processes, short-lived
-	   processes and bootcharts' analysis tools.
+           that only live for the duration of a single top sample.  Sibling
+           processes with the same command line (i.e. threads) are merged
+           together. This filters out sleepy background processes, short-lived
+           processes and bootcharts' analysis tools.
         """
         def is_idle_background_process_without_children(p):
             process_end = p.start_time + p.duration
-	    return not p.active and \
+            return not p.active and \
                    process_end >= self.start_time + self.duration and \
                    p.start_time > self.start_time and \
                    p.duration > 0.9 * self.duration and \
@@ -175,8 +196,8 @@ class ProcessTree:
 
     def merge_logger(self, process_subtree, logger_proc, monitored_app, app_tree):
         """Merges the logger's process subtree.  The logger will typically
-	   spawn lots of sleep and cat processes, thus polluting the
-	   process tree.
+           spawn lots of sleep and cat processes, thus polluting the
+           process tree.
 
         """
         num_removed = 0
@@ -185,7 +206,7 @@ class ProcessTree:
             if logger_proc == p.cmd and not app_tree:
                 is_app_tree = True
                 num_removed += self.merge_logger(p.child_list, logger_proc, monitored_app, is_app_tree)
-		# don't remove the logger itself
+                # don't remove the logger itself
                 continue
 
             if app_tree and monitored_app != None and monitored_app == p.cmd:
@@ -193,7 +214,7 @@ class ProcessTree:
 
             if is_app_tree:
                 for child in p.child_list:
-                    self.__merge_processes(p, child)
+                    self.merge_processes(p, child)
                     num_removed += 1
                 p.child_list = []
             else:
@@ -202,7 +223,7 @@ class ProcessTree:
 
     def merge_exploders(self, process_subtree, processes):
         """Merges specific process subtrees (used for processes which usually
-	   spawn huge meaningless process trees).
+           spawn huge meaningless process trees).
 
         """
         num_removed = 0
@@ -210,7 +231,7 @@ class ProcessTree:
             if processes in processes and len(p.child_list) > 0:
                 subtreemap = self.getProcessMap(p.child_list)
                 for child in subtreemap.values():
-                    self.__merge_processes(p, child)
+                    self.merge_processes(p, child)
                     num_removed += len(subtreemap)
                     p.child_list = []
                     p.cmd += " (+)"
@@ -218,10 +239,10 @@ class ProcessTree:
                 num_removed += self.merge_exploders(p.child_list, processes)
         return num_removed
 
-    def merge_siblings(self,process_subtree):
+    def merge_siblings(self, process_subtree):
         """Merges thread processes.  Sibling processes with the same command
-	   line are merged together.
-	   
+           line are merged together.
+
         """
         num_removed = 0
         idx = 0
@@ -233,7 +254,7 @@ class ProcessTree:
                 idx -= 1
                 num_removed += 1
                 p.child_list.extend(nextp.child_list)
-                self.__merge_processes(p, nextp)
+                self.merge_processes(p, nextp)
             num_removed += self.merge_siblings(p.child_list)
             idx += 1
         if len(process_subtree) > 0:
@@ -243,7 +264,7 @@ class ProcessTree:
 
     def merge_runs(self, process_subtree):
         """Merges process runs.  Single child processes which share the same
-	   command line with the parent are merged.
+           command line with the parent are merged.
 
         """
         num_removed = 0
@@ -253,16 +274,17 @@ class ProcessTree:
             if len(p.child_list) == 1 and p.child_list[0].cmd == p.cmd:
                 child = p.child_list[0]
                 p.child_list = list(child.child_list)
-                self.__merge_processes(p, child)
+                self.merge_processes(p, child)
                 num_removed += 1
                 continue
             num_removed += self.merge_runs(p.child_list)
             idx += 1
         return num_removed
 
-    def __merge_processes(self, p1, p2):
-        """Merges two process samples."""
+    def merge_processes(self, p1, p2):
+        """Merges two process' samples."""
         p1.samples.extend(p2.samples)
+        p1.samples.sort( key = lambda p: p.time )
         p1time = p1.start_time
         p2time = p2.start_time
         p1.start_time = min(p1time, p2time)
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index c94b30d..015d743 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -1,93 +1,151 @@
+#  This file is part of pybootchartgui.
+
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
+
 class DiskStatSample:
-	def __init__(self, time):
-		self.time = time
-		self.diskdata = [0, 0, 0]
-	def add_diskdata(self, new_diskdata):
-		self.diskdata = [ a + b for a, b in zip(self.diskdata, new_diskdata) ]
+    def __init__(self, time):
+        self.time = time
+        self.diskdata = [0, 0, 0]
+    def add_diskdata(self, new_diskdata):
+        self.diskdata = [ a + b for a, b in zip(self.diskdata, new_diskdata) ]
 
 class CPUSample:
-	def __init__(self, time, user, sys, io):
-		self.time = time
-		self.user = user
-		self.sys = sys
-		self.io = io
-
-	def __str__(self):
-		return str(self.time) + "\t" + str(self.user) + "\t" + str(self.sys) + "\t" + str(self.io);
-		
+    def __init__(self, time, user, sys, io = 0.0, swap = 0.0):
+        self.time = time
+        self.user = user
+        self.sys = sys
+        self.io = io
+        self.swap = swap
+
+    @property
+    def cpu(self):
+        return self.user + self.sys
+
+    def __str__(self):
+        return str(self.time) + "\t" + str(self.user) + "\t" + \
+               str(self.sys) + "\t" + str(self.io) + "\t" + str (self.swap)
+
+class MemSample:
+    used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
+
+    def __init__(self, time):
+        self.time = time
+        self.records = {}
+
+    def add_value(self, name, value):
+        if name in MemSample.used_values:
+            self.records[name] = value
+
+    def valid(self):
+        keys = self.records.keys()
+        # discard incomplete samples
+        return [v for v in MemSample.used_values if v not in keys] == []
+
 class ProcessSample:
-	def __init__(self, time, state, cpu_sample):
-		self.time = time
-		self.state = state
-		self.cpu_sample = cpu_sample
-		
-	def __str__(self):
-		return str(self.time) + "\t" + str(self.state) + "\t" + str(self.cpu_sample);
+    def __init__(self, time, state, cpu_sample):
+        self.time = time
+        self.state = state
+        self.cpu_sample = cpu_sample
+
+    def __str__(self):
+        return str(self.time) + "\t" + str(self.state) + "\t" + str(self.cpu_sample)
 
 class ProcessStats:
-    def __init__(self, process_list, sample_period, start_time, end_time):
-		self.process_list = process_list
-		self.sample_period = sample_period
-		self.start_time = start_time
-		self.end_time = end_time
-
-class Process:	
-	def __init__(self, pid, cmd, ppid, start_time):
-		self.pid = pid
-		self.cmd = cmd.strip('(').strip(')')
-		self.ppid = ppid
-		self.start_time = start_time
-		self.samples = []
-		self.parent = None
-		self.child_list = []
-		
-		self.duration = 0
-		self.active = None
-		
-		self.last_user_cpu_time = None
-		self.last_sys_cpu_time = None
-	
-	def __str__(self):
-		return " ".join([str(self.pid), self.cmd, str(self.ppid), '[ ' + str(len(self.samples)) + ' samples ]' ])
-	
-	def calc_stats(self, samplePeriod):
-		if self.samples:
-			firstSample = self.samples[0]
-			lastSample = self.samples[-1]
-			self.start_time = min(firstSample.time, self.start_time)
-			self.duration = lastSample.time - self.start_time + samplePeriod
-			
-		activeCount = sum( [1 for sample in self.samples if sample.cpu_sample and sample.cpu_sample.sys + sample.cpu_sample.user + sample.cpu_sample.io > 0.0] )
-		activeCount = activeCount + sum( [1 for sample in self.samples if sample.state == 'D'] )
-		self.active = (activeCount>2)
-		
-	def calc_load(self, userCpu, sysCpu, interval):
-		
-		userCpuLoad = float(userCpu - self.last_user_cpu_time) / interval
-		sysCpuLoad = float(sysCpu - self.last_sys_cpu_time) / interval
-		cpuLoad = userCpuLoad + sysCpuLoad
-		# normalize
-		if cpuLoad > 1.0:
-			userCpuLoad = userCpuLoad / cpuLoad;
-			sysCpuLoad = sysCpuLoad / cpuLoad;
-		return (userCpuLoad, sysCpuLoad)
-	
-	def set_parent(self, processMap):
-		if self.ppid != None:
-			self.parent = processMap.get(self.ppid)
-			if self.parent == None and self.pid > 1:
-				print "warning: no parent for pid '%i' with ppid '%i'" % (self.pid,self.ppid)
-	def get_end_time(self):
-		return self.start_time + self.duration
+    def __init__(self, writer, process_map, sample_count, sample_period, start_time, end_time):
+        self.process_map = process_map
+        self.sample_count = sample_count
+        self.sample_period = sample_period
+        self.start_time = start_time
+        self.end_time = end_time
+        writer.info ("%d samples, avg. sample length %f" % (self.sample_count, self.sample_period))
+        writer.info ("process list size: %d" % len (self.process_map.values()))
 
-class DiskSample:
-	def __init__(self, time, read, write, util):
-		self.time = time
-		self.read = read
-		self.write = write
-		self.util = util
-	        self.tput = read + write
+class Process:
+    def __init__(self, writer, pid, cmd, ppid, start_time):
+        self.writer = writer
+        self.pid = pid
+        self.cmd = cmd
+        self.exe = cmd
+        self.args = []
+        self.ppid = ppid
+        self.start_time = start_time
+        self.duration = 0
+        self.samples = []
+        self.parent = None
+        self.child_list = []
+
+        self.active = None
+        self.last_user_cpu_time = None
+        self.last_sys_cpu_time = None
+
+        self.last_cpu_ns = 0
+        self.last_blkio_delay_ns = 0
+        self.last_swapin_delay_ns = 0
+
+    # split this process' run - triggered by a name change
+    def split(self, writer, pid, cmd, ppid, start_time):
+        split = Process (writer, pid, cmd, ppid, start_time)
+
+        split.last_cpu_ns = self.last_cpu_ns
+        split.last_blkio_delay_ns = self.last_blkio_delay_ns
+        split.last_swapin_delay_ns = self.last_swapin_delay_ns
+
+        return split
+
+    def __str__(self):
+        return " ".join([str(self.pid), self.cmd, str(self.ppid), '[ ' + str(len(self.samples)) + ' samples ]' ])
 
-	def __str__(self):
-		return "\t".join([str(self.time), str(self.read), str(self.write), str(self.util)])
+    def calc_stats(self, samplePeriod):
+        if self.samples:
+            firstSample = self.samples[0]
+            lastSample = self.samples[-1]
+            self.start_time = min(firstSample.time, self.start_time)
+            self.duration = lastSample.time - self.start_time + samplePeriod
+
+        activeCount = sum( [1 for sample in self.samples if sample.cpu_sample and sample.cpu_sample.sys + sample.cpu_sample.user + sample.cpu_sample.io > 0.0] )
+        activeCount = activeCount + sum( [1 for sample in self.samples if sample.state == 'D'] )
+        self.active = (activeCount>2)
+
+    def calc_load(self, userCpu, sysCpu, interval):
+        userCpuLoad = float(userCpu - self.last_user_cpu_time) / interval
+        sysCpuLoad = float(sysCpu - self.last_sys_cpu_time) / interval
+        cpuLoad = userCpuLoad + sysCpuLoad
+        # normalize
+        if cpuLoad > 1.0:
+            userCpuLoad = userCpuLoad / cpuLoad
+            sysCpuLoad = sysCpuLoad / cpuLoad
+        return (userCpuLoad, sysCpuLoad)
+
+    def set_parent(self, processMap):
+        if self.ppid != None:
+            self.parent = processMap.get (self.ppid)
+            if self.parent == None and self.pid // 1000 > 1 and \
+                not (self.ppid == 2000 or self.pid == 2000): # kernel threads: ppid=2
+                self.writer.warn("Missing CONFIG_PROC_EVENTS: no parent for pid '%i' ('%s') with ppid '%i'" \
+                                 % (self.pid,self.cmd,self.ppid))
+
+    def get_end_time(self):
+        return self.start_time + self.duration
+
+class DiskSample:
+    def __init__(self, time, read, write, util):
+        self.time = time
+        self.read = read
+        self.write = write
+        self.util = util
+        self.tput = read + write
 
+    def __str__(self):
+        return "\t".join([str(self.time), str(self.read), str(self.write), str(self.util)])
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index 574c2c7..00fb3bf 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -4,90 +4,102 @@ import unittest
 
 sys.path.insert(0, os.getcwd())
 
-import parsing
+import pybootchartgui.parsing as parsing
+import pybootchartgui.main as main
 
 debug = False
 
 def floatEq(f1, f2):
 	return math.fabs(f1-f2) < 0.00001
 
+bootchart_dir = os.path.join(os.path.dirname(sys.argv[0]), '../../examples/1/')
+parser = main._mk_options_parser()
+options, args = parser.parse_args(['--q', bootchart_dir])
+writer = main._mk_writer(options)
+
 class TestBCParser(unittest.TestCase):
     
 	def setUp(self):
 		self.name = "My first unittest"
-		self.rootdir = '../examples/1'
+		self.rootdir = bootchart_dir
 
 	def mk_fname(self,f):
 		return os.path.join(self.rootdir, f)
 
 	def testParseHeader(self):
-		state = parsing.parse_file(parsing.ParserState(), self.mk_fname('header'))
+		trace = parsing.Trace(writer, args, options)
+		state = parsing.parse_file(writer, trace, self.mk_fname('header'))
 		self.assertEqual(6, len(state.headers))
 		self.assertEqual(2, parsing.get_num_cpus(state.headers))
 
 	def test_parseTimedBlocks(self):
-		state = parsing.parse_file(parsing.ParserState(), self.mk_fname('proc_diskstats.log'))
+		trace = parsing.Trace(writer, args, options)
+		state = parsing.parse_file(writer, trace, self.mk_fname('proc_diskstats.log'))
 		self.assertEqual(141, len(state.disk_stats))		
 
 	def testParseProcPsLog(self):
-		state = parsing.parse_file(parsing.ParserState(), self.mk_fname('proc_ps.log'))
+		trace = parsing.Trace(writer, args, options)
+		state = parsing.parse_file(writer, trace, self.mk_fname('proc_ps.log'))
 		samples = state.ps_stats
-		processes = samples.process_list
-		sorted_processes = sorted(processes, key=lambda p: p.pid )
-		
-		for index, line in enumerate(open(self.mk_fname('extract2.proc_ps.log'))):
+		processes = samples.process_map
+		sorted_processes = [processes[k] for k in sorted(processes.keys())]
+
+		ps_data = open(self.mk_fname('extract2.proc_ps.log'))
+		for index, line in enumerate(ps_data):
 			tokens = line.split();
 			process = sorted_processes[index]
-			if debug:	
-				print tokens[0:4]
-				print process.pid, process.cmd, process.ppid, len(process.samples)
-				print '-------------------'
-			
-			self.assertEqual(tokens[0], str(process.pid))
+			if debug:
+				print(tokens[0:4])
+				print(process.pid / 1000, process.cmd, process.ppid, len(process.samples))
+				print('-------------------')
+
+			self.assertEqual(tokens[0], str(process.pid // 1000))
 			self.assertEqual(tokens[1], str(process.cmd))
-			self.assertEqual(tokens[2], str(process.ppid))
+			self.assertEqual(tokens[2], str(process.ppid // 1000))
 			self.assertEqual(tokens[3], str(len(process.samples)))
-        
+		ps_data.close()
 
 	def testparseProcDiskStatLog(self):
-		state_with_headers = parsing.parse_file(parsing.ParserState(), self.mk_fname('header'))
+		trace = parsing.Trace(writer, args, options)
+		state_with_headers = parsing.parse_file(writer, trace, self.mk_fname('header'))
 		state_with_headers.headers['system.cpu'] = 'xxx (2)'
-		samples = parsing.parse_file(state_with_headers, self.mk_fname('proc_diskstats.log')).disk_stats
+		samples = parsing.parse_file(writer, state_with_headers, self.mk_fname('proc_diskstats.log')).disk_stats
 		self.assertEqual(141, len(samples))
-	
-		for index, line in enumerate(open(self.mk_fname('extract.proc_diskstats.log'))):
+
+		diskstats_data = open(self.mk_fname('extract.proc_diskstats.log'))
+		for index, line in enumerate(diskstats_data):
 			tokens = line.split('\t')
 			sample = samples[index]
 			if debug:		
-				print line.rstrip(), 
-				print sample
-				print '-------------------'
+				print(line.rstrip())
+				print(sample)
+				print('-------------------')
 			
 			self.assertEqual(tokens[0], str(sample.time))
 			self.assert_(floatEq(float(tokens[1]), sample.read))
 			self.assert_(floatEq(float(tokens[2]), sample.write))
 			self.assert_(floatEq(float(tokens[3]), sample.util))
+		diskstats_data.close()
 	
 	def testparseProcStatLog(self):
-		samples = parsing.parse_file(parsing.ParserState(), self.mk_fname('proc_stat.log')).cpu_stats
+		trace = parsing.Trace(writer, args, options)
+		samples = parsing.parse_file(writer, trace, self.mk_fname('proc_stat.log')).cpu_stats
 		self.assertEqual(141, len(samples))
-			
-		for index, line in enumerate(open(self.mk_fname('extract.proc_stat.log'))):
+
+		stat_data = open(self.mk_fname('extract.proc_stat.log'))
+		for index, line in enumerate(stat_data):
 			tokens = line.split('\t')
 			sample = samples[index]
 			if debug:
-				print line.rstrip()
-				print sample
-				print '-------------------'
+				print(line.rstrip())
+				print(sample)
+				print('-------------------')
 			self.assert_(floatEq(float(tokens[0]), sample.time))
 			self.assert_(floatEq(float(tokens[1]), sample.user))
 			self.assert_(floatEq(float(tokens[2]), sample.sys))
 			self.assert_(floatEq(float(tokens[3]), sample.io))
-	
-	def testParseLogDir(self):		
-		res = parsing.parse([self.rootdir], False)		
-		self.assertEqual(4, len(res))
-	
+		stat_data.close()
+
 if __name__ == '__main__':
     unittest.main()
 
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
index 971e125..6f46a1c 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
@@ -4,16 +4,28 @@ import unittest
 
 sys.path.insert(0, os.getcwd())
 
-import parsing
-import process_tree
+import pybootchartgui.parsing as parsing
+import pybootchartgui.process_tree as process_tree
+import pybootchartgui.main as main
+
+if sys.version_info >= (3, 0):
+    long = int
 
 class TestProcessTree(unittest.TestCase):
 
     def setUp(self):
-	self.name = "Process tree unittest"
-        self.rootdir = '../examples/1'
-	self.ps_stats = parsing.parse_file(parsing.ParserState(), self.mk_fname('proc_ps.log')).ps_stats
-        self.processtree = process_tree.ProcessTree(self.ps_stats, None, False, for_testing = True)
+        self.name = "Process tree unittest"
+        self.rootdir = os.path.join(os.path.dirname(sys.argv[0]), '../../examples/1/')
+
+        parser = main._mk_options_parser()
+        options, args = parser.parse_args(['--q', self.rootdir])
+        writer = main._mk_writer(options)
+        trace = parsing.Trace(writer, args, options)
+
+        parsing.parse_file(writer, trace, self.mk_fname('proc_ps.log'))
+        trace.compile(writer)
+        self.processtree = process_tree.ProcessTree(writer, None, trace.ps_stats, \
+            trace.ps_stats.sample_period, None, options.prune, None, None, False, for_testing = True)
 
     def mk_fname(self,f):
         return os.path.join(self.rootdir, f)
@@ -26,14 +38,16 @@ class TestProcessTree(unittest.TestCase):
         return flattened
 
     def checkAgainstJavaExtract(self, filename, process_tree):
-        for expected, actual in zip(open(filename), self.flatten(process_tree)):
+        test_data = open(filename)
+        for expected, actual in zip(test_data, self.flatten(process_tree)):
             tokens = expected.split('\t')
-            self.assertEqual(int(tokens[0]), actual.pid)
+            self.assertEqual(int(tokens[0]), actual.pid // 1000)
             self.assertEqual(tokens[1], actual.cmd)
             self.assertEqual(long(tokens[2]), 10 * actual.start_time)
             self.assert_(long(tokens[3]) - 10 * actual.duration < 5, "duration")
             self.assertEqual(int(tokens[4]), len(actual.child_list))
             self.assertEqual(int(tokens[5]), len(actual.samples))
+        test_data.close()
 
     def testBuild(self):
         process_tree = self.processtree.process_tree
-- 
1.8.4


