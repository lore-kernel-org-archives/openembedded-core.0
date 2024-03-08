Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F88C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 11:20:46 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.19545.1709896844119194195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 03:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S/AmYjyu;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: zboszor@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a068e26d8so4356857b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 03:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709896842; x=1710501642; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCArcYRPVITOtKVEFINd3xOz3m5gaTl7HQ2gGSYJgzs=;
        b=S/AmYjyutsz5j40aR9pE6PhXxpKYydb2W+z+1vZg/CYdiktpAnBkcjoCJXD/h+PAtg
         CHEO4nxef/0Ew3mvlegsoDoOIkV4YnH9LHyX3sjScWp9REFVbDgm2upJyTlfbunT2u+b
         9Lmyxa3OCXZs+eumBfLWzcQO7DdoOPEh+8eESgZgXXLwaP3Bcrklg0QP0+D2mwpufBJ7
         5mYonGKy5iWY1QLSysozFN5PhMkt79mKZAky+5tY95SrOKAFHeZA/YLMYrncyaJWTrMg
         WE5CRDX7s1D10B4bUX6k5RhUZ8qL1RvX0Bg8FyyZUYA05CkZV+1GO2/LMnJKDQzWWrAq
         GiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709896842; x=1710501642;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCArcYRPVITOtKVEFINd3xOz3m5gaTl7HQ2gGSYJgzs=;
        b=KD8KfYo2GuG+3Xp+L4I81+9baiQadJDIKcAB1wKadBVC2G23eLA1NEhsUtmgVGSHhH
         Jb4a+sv+xbywiGRlukEzizkwNkmEfrj7Z/cPShOUBWxBLeZMBZDmn8LDIjReLgC6lyjx
         aav/+g7Dk7i+MjYxTEednIbwfOrCzZORV9J/7nK5x9uXYHMjU0CC4HsZ0Ri62nd+mnEX
         jCeRI9kGft399dIlVqE/wHBEd1xtvGtZzQi8G9qFHeL9W4Iu9OFyx11fkRjRRgxjdPoN
         vAShYt3qedp8ppQEUH5/2mByal7f6wkFStUwnNmPz1itjN/10tvk/0Jmcdw+fb5NE0Jk
         bSdQ==
X-Gm-Message-State: AOJu0YzVwLgZFiIenuLboCZ3F7homlwbJ7vbt6BkS37A9N8zyUsmLJ+k
	9AsKYq/ftail0DTR1hOIvJ3n4W9CL1dj2+EibqaFSblLM6ON2Z7wjdnlEsXJ
X-Google-Smtp-Source: AGHT+IHsNqoRFFmveaesLZQElrNppU+jfqNYl97wH/8wyMC1/eZDwmXVNxhtZSZJpJcHiCHa8/qDfQ==
X-Received: by 2002:a25:660e:0:b0:dc6:9b89:3f75 with SMTP id a14-20020a25660e000000b00dc69b893f75mr17401638ybc.40.1709896842459;
        Fri, 08 Mar 2024 03:20:42 -0800 (PST)
Received: from [192.168.2.53] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id m20-20020a05622a119400b0042ef530b49fsm4774827qtk.88.2024.03.08.03.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 03:20:42 -0800 (PST)
Message-ID: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
Date: Fri, 8 Mar 2024 12:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: Yocto rpm packages do not keep the modified CONFFILES (was: BB
 Equivalent for %config(noreplace))
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 11:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196848

Hi,

I just found out that if an updated package ships a modified
configuration file, then the Yocto package upgrade does this:

* rename the edited conffile to conffile.rpmsave
* install the new, modified one from the package

instead of:

* keep the edited conffile intact
* install the new, modified one from the package as conffile.rpmnew

I think this is what was asked in 2017 here:
https://docs.yoctoproject.org/pipermail/yocto/2017-May/036031.html

The answer was a little uninformed about saying that using
CONFFILES is the fix, because rpm can behave two ways, see above.

Yocto, to this day, uses "%config /path/to/conffile" instead of
"%config(noreplace) /path/to/conffile" in package_rpm.bbclass.
The latter would behave as "keep modified conffile + install conffile.rpmnew".

What's the official stance on this behaviour?
Is it a known issue?
Is this what the project would expect from a package upgrade?

FWIW, this one liner would change the behaviour:

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c79..6610115849 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -256,7 +256,7 @@ python write_specfile () {
                  attr = get_attr(file)
                  p = path + '/' + file
                  if conffiles.count(p):
-                    target.append(attr + '%config "' + escape_chars(p) + '"')
+                    target.append(attr + '%config(noreplace) "' + escape_chars(p) + '"')
                  else:
                      target.append(attr + '"' + escape_chars(p) + '"')


Maybe it's better to make it conditional on a different variable:

CONFFILES_MODE = "keepold"
vs
CONFFILES_MODE = "installnew"

and the patch would be something like this below (untested),
keeping the current behaviour as default:

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c79..f0651d69ba 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -191,7 +191,7 @@ python write_specfile () {
                  if not len(depends_dict[dep]):
                      array.append("%s: %s" % (tag, dep))

-    def walk_files(walkpath, target, conffiles, dirfiles):
+    def walk_files(d, walkpath, target, conffiles, dirfiles):
          # We can race against the ipk/deb backends which create CONTROL or DEBIAN 
directories
          # when packaging. We just ignore these files which are created in
          # packages-split/ and not package/
@@ -250,13 +250,19 @@ python write_specfile () {
                  if (not files and not dirs) or path in dirfiles:
                      target.append(attr + '%dir "' + escape_chars(path) + '"')

+            conffiles_mode = d.getVar("CONFFILES_MODE") or "installnew"
+            if conffiles_mode != "installnew" and conffiles_mode != "keepold":
+                conffiles_mode = "installnew"
              for file in files:
                  if file == "CONTROL" or file == "DEBIAN":
                      continue
                  attr = get_attr(file)
                  p = path + '/' + file
                  if conffiles.count(p):
-                    target.append(attr + '%config "' + escape_chars(p) + '"')
+                    if conffiles_mode == "keepold":
+                        target.append(attr + '%config(noreplace) "' + escape_chars(p) + '"')
+                    else:
+                        target.append(attr + '%config "' + escape_chars(p) + '"')
                  else:
                      target.append(attr + '"' + escape_chars(p) + '"')

@@ -430,7 +436,7 @@ python write_specfile () {
              srcrpostrm     = splitrpostrm

              file_list = []
-            walk_files(root, file_list, conffiles, dirfiles)
+            walk_files(localdata, root, file_list, conffiles, dirfiles)
              if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
                  bb.note("Not creating empty RPM package for %s" % splitname)
              else:
@@ -522,7 +528,7 @@ python write_specfile () {

          # Now process files
          file_list = []
-        walk_files(root, file_list, conffiles, dirfiles)
+        walk_files(localdata, root, file_list, conffiles, dirfiles)
          if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
              bb.note("Not creating empty RPM package for %s" % splitname)
          else:

Best regards,
Zoltán Böszörményi


