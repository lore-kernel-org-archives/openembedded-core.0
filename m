Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDC2757F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:18:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t539IHaQ012489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 02:18:18 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Jun 2015 02:18:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jun 2015 02:18:17 -0700
Message-ID: <8cedb0be9be8172d8cfd98e4a08fd2a71b8ad218.1433323040.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433323040.git.liezhi.yang@windriver.com>
References: <cover.1433323040.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sgmlspl-native: 1.03ii -> 1.1
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
X-List-Received-Date: Wed, 03 Jun 2015 09:18:17 -0000
Content-Type: text/plain

* The old HOMEPAGE and SRC_URI are not available any more, use github to
  instead of.

* Remove combined.patch since part of them is already in the
  source (sgmlspl.pl), and part of them are not needed any more (the doc
  sgmlspl.1, there is a sgmlspl.sgml).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/sgmlspl/files/combined.patch |  460 --------------------
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |   16 -
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |   20 +
 3 files changed, 20 insertions(+), 476 deletions(-)
 delete mode 100644 meta/recipes-devtools/sgmlspl/files/combined.patch
 delete mode 100644 meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
 create mode 100644 meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb

diff --git a/meta/recipes-devtools/sgmlspl/files/combined.patch b/meta/recipes-devtools/sgmlspl/files/combined.patch
deleted file mode 100644
index bea3dab..0000000
--- a/meta/recipes-devtools/sgmlspl/files/combined.patch
+++ /dev/null
@@ -1,460 +0,0 @@
-Patch obtained from OpenEmbedded.
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- libsgmls-perl-1.03ii.orig/Makefile
-+++ libsgmls-perl-1.03ii/Makefile
-@@ -94,5 +94,5 @@
- 	mv /tmp/${DIST} SGMLSpm
- 
- clean:
--	cd DOC; make clean
-+	#cd DOC; make clean
- 	rm -f *~ core *.tar *.tar.gz
---- libsgmls-perl-1.03ii.orig/Makefile.PL
-+++ libsgmls-perl-1.03ii/Makefile.PL
-@@ -0,0 +1,17 @@
-+use ExtUtils::MakeMaker;
-+# See lib/ExtUtils/MakeMaker.pm for details of how to influence
-+# the contents of the Makefile that is written.
-+WriteMakefile(
-+      'NAME'	=> 'SGMLS',
-+      'VERSION'	=> '1.03ii',
-+      'PM'	=> { 'SGMLS.pm' => '$(INST_LIBDIR)/SGMLS.pm',
-+		     'Output.pm' => '$(INST_LIBDIR)/SGMLS/Output.pm',
-+		     'Refs.pm' => '$(INST_LIBDIR)/SGMLS/Refs.pm',
-+		     'skel.pl' => '$(INST_LIBDIR)/sgmlspl-specs/skel.pl',
-+		 },
-+      'MAN3PODS'=> { 'SGMLS.pm' => '$(INST_MAN3DIR)/SGMLS.3pm',
-+		     'Output.pm' => '$(INST_MAN3DIR)/SGMLS::Output.3pm',
-+		     'Refs.pm' => '$(INST_MAN3DIR)/SGMLS::Refs.3pm',
-+		 },
-+      'EXE_FILES' => [ 'sgmlspl', ],
-+);
---- libsgmls-perl-1.03ii.orig/Output.pm
-+++ libsgmls-perl-1.03ii/Output.pm
-@@ -5,7 +5,7 @@
- @ISA = Exporter;
- @EXPORT = qw(output push_output pop_output);
- 
--$version = '$Id: Output.pm,v 1.6 1995/12/05 12:21:51 david Exp $';
-+$version = '$Id: Output.pm,v 1.1 1999/10/26 19:30:45 ardo Exp $';
- 
- =head1 NAME
- 
---- libsgmls-perl-1.03ii.orig/Refs.pm
-+++ libsgmls-perl-1.03ii/Refs.pm
-@@ -2,11 +2,11 @@
- 
- use Carp;
- 
--$version = '$Id: Refs.pm,v 1.5 1995/12/03 21:28:36 david Exp $';
-+$version = '$Id: Refs.pm,v 1.1 1999/10/26 19:30:45 ardo Exp $';
- 
- =head1 NAME
- 
--SGMLS::Refs
-+SGMLS::Refs - Forward refeence handling
- 
- =head1 SYNOPSIS
- 
---- libsgmls-perl-1.03ii.orig/sgmlspl.1
-+++ libsgmls-perl-1.03ii/sgmlspl.1
-@@ -0,0 +1,47 @@
-+.\" -*- nroff -*-
-+.\" ----------------------------------------------------------------------
-+.TH SGMLSPL 1 "October 26, 1999" "SGMLSPL" "SGMLSPL"
-+.\"
-+.\" ----------------------------------------------------------------------
-+.SH "NAME"
-+sgmlspl \- a simple post-processor for nsgmls
-+.\"
-+.\" ----------------------------------------------------------------------
-+.SH "SYNOPSIS"
-+.B sgmlspl
-+.I "spec file"
-+.\"
-+.\" ----------------------------------------------------------------------
-+.SH "DESCRIPTION"
-+sgmlspl is a sample application to convert SGML documents to other
-+formats by providing a specification file detailing exactly how to
-+handle each element, external data entity, subdocument entity, CDATA
-+string, record end, SDATA string, and processing instruction.
-+
-+To use sgmlspl, prepare a specification file containing regular perl5
-+code. If the SGML document were named doc.sgml, the sgmlspl
-+specification file were named, spec.pl, and the name of the new file
-+were doc.latex, then use the following command in a Unix shell to
-+convert the SGML document:
-+
-+nsgmls doc.sgml | sgmlspl spec.pl > doc.latex
-+
-+sgmlspl will pass any additional arguments on to the specification
-+file, which can then process them in the regular perl5 fashion.
-+.\"
-+.\" ----------------------------------------------------------------------
-+.SH "SEE ALSO"
-+.TP
-+.BR /usr/share/doc/sgmls-doc/sgmlspl/sgmlspl.html
-+sgmlspl documentation in HTML format
-+.TP
-+.BR /usr/share/doc/sgmls-doc/SGMLSpm/sgmls.html
-+SGMLS documentation in HTML format
-+.TP
-+.BR nsgmls (1)
-+.\"
-+.\" ----------------------------------------------------------------------
-+.SH "AUTHOR"
-+Ardo van Rangelrooij <ardo@debian.org>
-+.\"
-+.\" ----------------------------------------------------------------------
---- libsgmls-perl-1.03ii.orig/sgmlspl
-+++ libsgmls-perl-1.03ii/sgmlspl
-@@ -0,0 +1,323 @@
-+#!/usr/bin/perl
-+########################################################################
-+# sgmlspl: a simple SGML postprocesser for the SGMLS and NSGMLS
-+#          parsers (requires SGMLS.pm library).
-+#
-+# Copyright (c) 1995 by David Megginson <dmeggins@aix1.uottawa.ca>
-+#
-+# This program is free software; you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation; either version 2 of the License, or
-+# (at your option) any later version.
-+#
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+#
-+# You should have received a copy of the GNU General Public License
-+# along with this program; if not, write to the Free Software
-+# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+#
-+# $Log: sgmlspl,v $
-+# Revision 1.1  2004/02/23 01:23:07  ardo
-+# Added debian changes for version 1.03ii-27.
-+#
-+# Revision 1.1  2001/04/15 14:42:01  ardo
-+# *** empty log message ***
-+#
-+# Revision 1.8  1995/12/03  21:46:31  david
-+# Eliminated all use of the SGMLS_Event::key method.
-+#
-+# Revision 1.7  1995/11/15  20:22:24  david
-+# Changed "use Output" to "use SGMLS::Output".  Qualified the STDIN
-+# filehandle for the SGMLS object with the main:: package name.
-+#
-+# Revision 1.6  1995/08/12  16:15:14  david
-+# Revised version for 1.01 distribution.
-+#
-+# Revision 1.5  1995/04/27  11:52:25  david
-+# Changed 'print' to 'main::output' for re handler; empty string
-+# translates into an empty sub {} rather than a sub printing an empty
-+# string; instead of evaluating every argument as a perl script, take
-+# only the first as a perl script and the rest as its arguments; allow
-+# empty scripts or scripts which do not end with '1;'; pass the event
-+# itself as the second argument to each handler, after the event data.
-+#
-+# Revision 1.4  1995/04/23  14:44:58  david
-+# Use the Output package.  Fixed the $version variable.
-+#
-+# Revision 1.3  1995/04/22  21:02:49  david
-+# Added some missing 'last SWITCH;' statements in the sgmls function.
-+#
-+# Revision 1.2  1995/04/22  20:58:48  david
-+# Added $SGMLS_PL::version variable and changed SDATA notation from
-+# [SDATA] to |SDATA|.
-+#
-+# Revision 1.1  1995/04/22  14:40:50  david
-+# Initial revision
-+#
-+########################################################################
-+
-+use SGMLS::Output;
-+
-+package SGMLS_PL;
-+use SGMLS;
-+
-+$version = '$Id: sgmlspl,v 1.1 2004/02/23 01:23:07 ardo Exp $';
-+
-+#
-+# Set up handler defaults.
-+#
-+$start_document_handler = sub {};
-+$end_document_handler = sub {};
-+$start_element_handlers = { '' => sub {} };
-+$end_element_handlers = { '' => sub {} };
-+$cdata_handler = sub { main::output($_[0]); };
-+$sdata_handlers = { '' => sub { main::output($_[0]);} };
-+$re_handler = sub { main::output("\n"); };
-+$pi_handler = sub { '' => sub {} };
-+$entity_handlers = { '' => sub {} };
-+$start_subdoc_handlers = { '' => sub {} };
-+$end_subdoc_handlers = { '' => sub {} };
-+$conforming_handler = sub {};
-+
-+#
-+# Main access point: declare handlers for different SGML events.
-+#
-+# Usage: sgml(event, handler);
-+#
-+# The event may be one of the following strings, or a special pattern.
-+# The generic events are as follow:
-+#
-+#   'start'                 The beginning of the document.
-+#   'end'                   The end of the document.
-+#   'start_element'         The beginning of an element.
-+#   'end_element'           The end of an element.
-+#   'cdata'                 Regular character data.
-+#   'sdata'                 Special system-specific data.
-+#   're'                    A record-end.
-+#   'pi'                    A processing instruction.
-+#   'entity'                An external-entity reference.
-+#   'start_subdoc'          The beginning of a subdocument entity.
-+#   'end_subdoc'            The end of a subdocument entity.
-+#   'conforming'            The document is conforming.
-+#
-+# In addition to these generic events, it is possible to handlers
-+# for certain specific, named events, as follow:
-+#
-+#   '<GI>'                  The beginning of element GI.
-+#   '</GI>'                 The end of element GI.
-+#   '[SDATA]'               The system-specific data SDATA.
-+#   '&ENAME;'               A reference to the external entity ENAME.
-+#   '{ENAME}'               The beginning of the subdocument-entity ENAME.
-+#   '{/ENAME}'              The end of the subdocument-entity ENAME.
-+#
-+#
-+# The handler may be a string, which will simply be printed when the
-+# event occurs (this is usually useful only for the specific, named
-+# events), or a reference to an anonymous subroutine, which will
-+# receive two arguments: the event data and the event itself.  For 
-+# example,
-+#
-+#   sgml('<FOO>', "\n\\begin{foo}\n");
-+#
-+# and
-+#
-+#   sgml('<FOO>', sub { output("\n\\begin{foo}\n"); });
-+#
-+# will have identical results.
-+#
-+sub main::sgml {
-+    my ($spec,$handler) = (@_);
-+    if (ref($handler) ne 'CODE') {
-+	$handler =~ s/\\/\\\\/g;
-+	$handler =~ s/'/\\'/g;
-+	if ($handler eq '') {
-+	    $handler = sub {};
-+	} else {
-+	    $handler = eval "sub { main::output('$handler'); };";
-+	}
-+    }
-+  SWITCH: {
-+				# start-document handler
-+      $spec eq 'start' && do {
-+	  $start_document_handler = $handler;
-+	  last SWITCH;
-+      };
-+				# end-document handler
-+      $spec eq 'end' && do {
-+	  $end_document_handler = $handler;
-+	  last SWITCH;
-+      };
-+				# start-element handler
-+      $spec =~ /^<([^\/].*|)>$/ && do {
-+	  $start_element_handlers->{$1} = $handler;
-+	  last SWITCH;
-+      };
-+				# generic start-element handler
-+      $spec eq 'start_element' && do {
-+	  $start_element_handlers->{''} = $handler;
-+	  last SWITCH;
-+      };
-+				# end-element handler
-+      $spec =~ /^<\/(.*)>$/ && do {
-+	  $end_element_handlers->{$1} = $handler;
-+	  last SWITCH;
-+      };
-+				# generic end-element handler
-+      $spec =~ 'end_element' && do {
-+	  $end_element_handlers->{''} = $handler;
-+	  last SWITCH;
-+      };
-+				# cdata handler
-+      $spec eq 'cdata' && do {
-+	  $cdata_handler = $handler;
-+	  last SWITCH;
-+      };
-+				# sdata handler
-+      $spec =~ /^\|(.*)\|$/ && do {
-+	  $sdata_handlers->{$1} = $handler;
-+	  last SWITCH;
-+      };
-+				# generic sdata handler
-+      $spec eq 'sdata' && do {
-+	  $sdata_handlers->{''} = $handler;
-+	  last SWITCH;
-+      };
-+				# record-end handler
-+      $spec eq 're' && do {
-+	  $re_handler = $handler;
-+	  last SWITCH;
-+      };
-+				# processing-instruction handler
-+      $spec eq 'pi' && do {
-+	  $pi_handler = $handler;
-+	  last SWITCH;
-+      };
-+				# entity-reference handler
-+      $spec =~ /^\&(.*);$/ && do {
-+	  $entity_handlers->{$1} = $handler;
-+	  last SWITCH;
-+      };
-+				# generic entity-reference handler
-+      $spec eq 'entity' && do {
-+	  $entity_handlers->{''} = $handler;
-+	  last SWITCH;
-+      };
-+				# start-subdoc handler
-+      $spec =~ /^\{([^\/].*|)\}$/ && do {
-+	  $start_subdoc_handlers->{$1} = $handler;
-+	  last SWITCH;
-+      };
-+				# generic start-subdoc handler
-+      $spec eq 'start_subdoc' && do {
-+	  $start_subdoc_handlers->{''} = $handler;
-+	  last SWITCH;
-+      };
-+				# end-subdoc handler
-+      $spec =~ /^\{\/(.*)\}$/ && do {
-+	  $end_subdoc_handlers->{$1} = $handler;
-+	  last SWITCH;
-+      };
-+				# generic end-subdoc handler
-+      $spec eq 'end_subdoc' && do {
-+	  $end_subdoc_handlers->{''} = $handler;
-+	  last SWITCH;
-+      };
-+				# conforming handler
-+      $spec eq 'conforming' && do {
-+	  $conforming_handler = $handler;
-+	  last SWITCH;
-+      };
-+
-+      die "Bad SGML handler pattern: $spec\n";
-+  }
-+}
-+
-+
-+#
-+# The first argument on the command line is a perl module which will be
-+# read here and evaluated in the 'main' package -- everything else will
-+# be an argument to it.
-+#
-+package main;
-+
-+$ARGV = shift;
-+unless ($ARGV eq '' || do 'sgmlspl-specs/' . $ARGV || do $ARGV) {
-+    if (!-e $ARGV) {
-+	die "FATAL: $ARGV does not exist.\n";
-+    } elsif (!-r $ARGV) {
-+	die "FATAL: $ARGV exists but is read-protected.\n";
-+    } elsif ($@) {
-+	die "FATAL: $@\n";
-+    }
-+}
-+
-+
-+#
-+# Do the actual work, using the SGMLS package.
-+#
-+package SGMLS_PL;
-+
-+$parse = new SGMLS(main::STDIN);	# a new parse object
-+
-+&{$start_document_handler}();	# run the start handler.
-+
-+				# run the appropriate handler for each
-+				# event
-+while ($event = $parse->next_event) {
-+    my $type = $event->type;
-+  SWITCH: {
-+      $type eq 'start_element' && do {
-+	  &{($start_element_handlers->{$event->data->name}||
-+		$start_element_handlers->{''} || sub {})}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'end_element' && do {
-+	  &{($end_element_handlers->{$event->data->name}||
-+		$end_element_handlers->{''} || sub {})}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'cdata' && do {
-+	  &{$cdata_handler}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'sdata' && do {
-+	  &{($sdata_handlers->{$event->data}||
-+	     $sdata_handlers->{''} || sub {})}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 're' && do {
-+	  &{$re_handler}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'pi' && do {
-+	  &{$pi_handler}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'entity' && do {
-+	  &{($entity_handlers->{$event->data->name}||
-+	     $entity_handlers->{''} || sub {})}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'start_subdoc' && do {
-+	  &{($start_subdoc_handlers->{$event->data->name}||
-+	     $start_subdoc_handlers->{''} || sub {})}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'end_subdoc' && do {
-+	  &{($end_subdoc_handlers->{$event->data->name}||
-+	     $end_subdoc_handlers->{''} || sub {})}($event->data,$event);
-+	  last SWITCH;
-+      };
-+      $type eq 'conforming' && do {
-+	  &{$conforming_handler}($event->data,$event);
-+	  last SWITCH;
-+      };
-+
-+      die "Unknown SGML event type: $type\n";
-+  }
-+}
-+				
-+&{$end_document_handler}();	# run the end handler
---- libsgmls-perl-1.03ii.orig/sgmlspl.pl
-+++ libsgmls-perl-1.03ii/sgmlspl.pl
-@@ -238,7 +238,7 @@
- package main;
- 
- $ARGV = shift;
--unless ($ARGV eq '' || do $ARGV) {
-+unless ($ARGV eq '' || do 'sgmlspl-specs/' . $ARGV || do $ARGV) {
-     if (!-e $ARGV) {
- 	die "FATAL: $ARGV does not exist.\n";
-     } elsif (!-r $ARGV) {
---- libsgmls-perl-1.03ii.orig/SGMLS.pm
-+++ libsgmls-perl-1.03ii/SGMLS.pm
-@@ -1,7 +1,7 @@
- package SGMLS;
- use Carp;
- 
--$version = '$Revision: 1.14 $';
-+$version = '$Revision: 1.1 $';
- 
- =head1 NAME
- 
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
deleted file mode 100644
index be03fc5..0000000
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A simple post-processor for SGMLS and NSGMLS"
-HOMEPAGE = "http://search.cpan.org/src/DMEGG/SGMLSpm-1.03ii/DOC/HTML/SGMLSpm/sgmlspm.html"
-SECTION = "libs"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-PR = "r3"
-
-SRC_URI = "http://www.cpan.org/authors/id/D/DM/DMEGG/SGMLSpm-${PV}.tar.gz \
-           file://combined.patch"
-
-SRC_URI[md5sum] = "5bcb197fd42e67d51c739b1414d514a7"
-SRC_URI[sha256sum] = "f06895c0206dada9f9e7f07ecaeb6a3651fd648f4820f49c1f76bfeaec2f2913"
-
-S = "${WORKDIR}/SGMLSpm"
-
-inherit native cpan
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
new file mode 100644
index 0000000..5e3460f
--- /dev/null
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A simple post-processor for SGMLS and NSGMLS"
+HOMEPAGE = "https://github.com/gitpan/SGMLSpm"
+SECTION = "libs"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
+
+SRC_URI = "git://github.com/gitpan/SGMLSpm \
+          "
+
+SRCREV = "71595b9b5e36bfc00046995e058926bd27793fef"
+
+PV = "1.1+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit native cpan
+
+do_install_append() {
+    ln -s sgmlspl.pl ${D}${bindir}/sgmlspl
+}
-- 
1.7.9.5


