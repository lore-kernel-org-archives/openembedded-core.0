Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id B17E971A8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 11:10:47 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so60484452itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 03:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Fmh8zRBgmDAxdDwRN565mzfWfLn5D3c/TILA7cBcGy4=;
	b=QBtWWeUcYiN/JXJqGtfXQwVqbT0JkcJvYTJhnuK7nf1TwlG4iMTqcipXC3qOeuBRYW
	gDsurxYQkLcgfI7KajDKXzfnshIaCW/Sqv+7egxbR6gFUJ6+ovIyq8kRpTwV2xB235Wl
	fBffOYgCTfYZtrxfppTV65wo4TI/bwEuMWlqvv8lntdux1orvfg+N/jAPJkYLqXjyKAr
	wuD0fqOJ0neqsNQso4cn0gwS2jFKygwl7I6QQXdwRR2rJytwli+oo/uZGuzBnXC3BNnx
	hFu5tjzvnimJnaEgkzptg7YuGM73hZJZNKHO7Z6o+vVJcNjhbSp7GU5b/y/hyx2+T79x
	Lh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Fmh8zRBgmDAxdDwRN565mzfWfLn5D3c/TILA7cBcGy4=;
	b=IKQiCyBACErQ+ahopykMONuVxJkyIZUeOnOF9sxk+wHUJFIbXjhSEViMIIK2jw9PI1
	G+x3Y4Lgbb0y0I0zRaNt3FoqxS4VKtXEAVeONw1IYUaflEy8yBoj8lTgrAmfqQFDSj8I
	ruFRD4DmF57RHyEwAev07VH2edX1ERVay7db2rcfMyjhEdRUVM2XDh5iEhL2fNX7MbtY
	4D0flqmZENlsfmFse6Yl+JHLrSQCAOWwxGVI/jIUSDAg5Y0oCZH2DLP11bLR99bz5xJz
	uiegN971q7e5oy2lL5X0tINDhdneE6Cm5WtmeNrpQkHzo/XnE7CvyuvqbPdUGBuJNK1T
	eVDw==
X-Gm-Message-State: AIkVDXI2DvfeedaRZHObEJkMwcXDV9/WN0jZJqlB+b8RNVhTB7+6kPOEF1c/ixpJW37LW/i4
X-Received: by 10.36.37.199 with SMTP id g190mr4391193itg.12.1484133047817;
	Wed, 11 Jan 2017 03:10:47 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8EC30.dip0.t-ipconnect.de.
	[93.232.236.48]) by smtp.gmail.com with ESMTPSA id
	n134sm2881019itg.19.2017.01.11.03.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jan 2017 03:10:46 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 12:10:33 +0100
Message-Id: <7d1790c10e9bd3e1be46d50d3a9008e1b517e946.1484132929.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.eecd085acd37cef2ce0793e6bb962bf87f107b05.1484132929.git-series.patrick.ohly@intel.com>
References: <cover.eecd085acd37cef2ce0793e6bb962bf87f107b05.1484132929.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.eecd085acd37cef2ce0793e6bb962bf87f107b05.1484132929.git-series.patrick.ohly@intel.com>
References: <cover.eecd085acd37cef2ce0793e6bb962bf87f107b05.1484132929.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/1] insane.bbclass: print license text as part of QA message
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
X-List-Received-Date: Wed, 11 Jan 2017 11:10:47 -0000

It it is hard to select exactly the right lines from a file, in
particular because the documentation did not specify the exact
semantic (YOCTO #10898).

When the QA license check fails, it now includes the license text for
which the md5sum was calculated. When adding a new entry to
LIC_FILES_CHKSUM, developers can then verify that they picked the
desired lines. When the checksum of an older entry changes, the developer
does not have to manually look up the changed text.

Here's an example which probably has an endline which is too large
(message triggered by changing the md5sum in the recipe):

ERROR: cmake-native-3.7.1-r0 do_populate_lic: QA Issue: cmake-native: The LIC_FILES_CHKSUM does not match for file://Source/cmake.h;beginline=1;endline=3;md5=deadbeef
cmake-native: The new md5 checksum is 4494dee184212fc89c469c3acd555a14
cmake-native: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=1 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=3 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
cmake-native: Check if the license information has changed in .../cmake.h (lines 1 through to 3) to verify that the LICENSE value "BSD" remains valid [license-checksum]

The beginline/endline values are only repeated in the borders if set.

License snippets larger larger than 20 lines (configurable with
QA_MAX_LICENSE_LINES) are truncated in the middle.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/insane.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f8f6e00..c172e72 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -740,17 +740,21 @@ python populate_lic_qa_checksum() {
 
         if (not beginline) and (not endline):
             md5chksum = bb.utils.md5_file(srclicfile)
+            with open(srclicfile, 'rb') as f:
+                license = f.read()
         else:
             fi = open(srclicfile, 'rb')
             fo = tempfile.NamedTemporaryFile(mode='wb', prefix='poky.', suffix='.tmp', delete=False)
             tmplicfile = fo.name;
             lineno = 0
             linesout = 0
+            license = []
             for line in fi:
                 lineno += 1
                 if (lineno >= beginline):
                     if ((lineno <= endline) or not endline):
                         fo.write(line)
+                        license.append(line)
                         linesout += 1
                     else:
                         break
@@ -758,6 +762,7 @@ python populate_lic_qa_checksum() {
             fo.close()
             fi.close()
             md5chksum = bb.utils.md5_file(tmplicfile)
+            license = b''.join(license)
             os.unlink(tmplicfile)
 
         if recipemd5 == md5chksum:
@@ -766,6 +771,30 @@ python populate_lic_qa_checksum() {
             if recipemd5:
                 msg = pn + ": The LIC_FILES_CHKSUM does not match for " + url
                 msg = msg + "\n" + pn + ": The new md5 checksum is " + md5chksum
+                try:
+                    license_lines = license.decode('utf-8').split('\n')
+                except:
+                    # License text might not be valid UTF-8, in which
+                    # case we don't know how to include it in our output
+                    # and have to skip it.
+                    pass
+                else:
+                    max_lines = int(d.getVar('QA_MAX_LICENSE_LINES') or 20)
+                    if not license_lines or license_lines[-1] != '':
+                        # Ensure that our license text ends with a line break
+                        # (will be added with join() below).
+                        license_lines.append('')
+                    remove = len(license_lines) - max_lines
+                    if remove > 0:
+                        start = max_lines // 2
+                        end = start + remove - 1
+                        del license_lines[start:end]
+                        license_lines.insert(start, '...')
+                    msg = msg + "\n" + pn + ": Here is the selected license text:" + \
+                          "\n" + \
+                          "{:v^70}".format(" beginline=%d " % beginline if beginline else "") + \
+                          "\n" + "\n".join(license_lines) + \
+                          "{:^^70}".format(" endline=%d " % endline if endline else "")
                 if beginline:
                     if endline:
                         srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
-- 
git-series 0.9.1

