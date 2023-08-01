Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0802C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 14:47:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.14726.1690901221575867149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 07:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=raONqd19;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bb893e6365so36078835ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690901221; x=1691506021;
        h=message-id:date:mime-version:to:subject:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL+Yb+41vH3G285se5rCgVUKlBA7TU+5w656OWhJ8yY=;
        b=raONqd19qQwEc+YXV4sowaTE/MfZNfN5GvKfdocfaxYOIljGl3/qBElcNPNLoSU31I
         8LKkcswvbJDti0PEVOOM2Iwfa8HZe+F4SdP5EJRv6X2/ONfXhuSsU+ebW6v3QhIGX+vE
         BZlxUNhmqzn5lVxZk2inF2mgDB1lskEDZxgOm+fITWS+DdyGyH+q+JO79mfGRvgx4GTA
         Q/rPigmsx+q2JU6m+r+9Jd168WOv+vnHdfpGzdq5icxXNJ5pCuyIB1JOq4LeFgtlc2pW
         4xqRc3XfnIsEX4XYaH+CBTOhfWLQFziNGVEo//yGfdz5NOMaMXPJ+CDBmXYJ6d3inE0u
         2Isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690901221; x=1691506021;
        h=message-id:date:mime-version:to:subject:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL+Yb+41vH3G285se5rCgVUKlBA7TU+5w656OWhJ8yY=;
        b=j8wEPXLtpP86cnJ0NtT+G0ZtcSZe2bY7RSkKUw1V8tGt8B4KkOTDhplCqwAegP/Nlq
         4VWGwSopS9hgYWyVaqxno3fboIzekLLwwe6SDM2B5JCf4AzSsZN9QAuVjNIr39410tPl
         EOC3yckBSJw6e5wxpwylpl+U4PshNEIttyhqtDU7WbdtUOYmJ+9Pv52mv9f258sHn1mL
         kpwtRdfsZBO0qodAGphgUt11SaZ7lmgcye/z8Sq0lJyktFwjpFsx7THhvors4rr2MhFw
         igVmi1IsvH705IkO+PzPqWCwEYzkzyJ7v8ZaGCHbtKFauZIBjzYrcsE4i3PT8nr6kcNK
         LzEw==
X-Gm-Message-State: ABy/qLb/lKVqCdrQ+b3Dp3RyhouEQ9NGGfatkohdwlzSGWnm8EwgI/OL
	HxuEVhIvnEvBx7zOPyVuWS0=
X-Google-Smtp-Source: APBJJlEbGjk2XuIBD9FVWU3qZYqYPcRsIxJIMoM/kHJPKK/PsdnW7djmG4miL0pyBb0cV+Cs1J+rDw==
X-Received: by 2002:a17:903:244d:b0:1b9:e8a5:3699 with SMTP id l13-20020a170903244d00b001b9e8a53699mr13854012pls.21.1690901220630;
        Tue, 01 Aug 2023 07:47:00 -0700 (PDT)
Received: from [192.168.0.107] (137.sub-75-204-44.myvzw.com. [75.204.44.137])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b001bba7aab838sm10571657plg.162.2023.08.01.07.46.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Aug 2023 07:47:00 -0700 (PDT)
From: "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>
Subject: Yocto Project Status 1 August 2023 (WW31)
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; charset=UTF-8; boundary="oiForXRlL4xkBhXQA1RGnThtnZmi9=_cgb"
MIME-Version: 1.0
Date: Tue, 1 Aug 2023 07:46:57 -0700
Message-Id: <544760020212596879@gmail.com>
X-Mailer: EssentialPIM Pro  v. 11.6.5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 14:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185248

This is a multi-part message in MIME format

--oiForXRlL4xkBhXQA1RGnThtnZmi9=_cgb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Current Dev Position: YP 4.3 M3

Next Deadline: 28th August 2023 YP 4.3 M3 build date




Next Team Meetings:

Bug Triage meeting Thursday August 3rd 7:30 am PDT
(https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)


Weekly Project Engineering Sync Tuesday August 1st at 8 am PDT
(https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)


Twitch -  See https://www.twitch.tv/theyoctojester




Key Status/Updates:
YP 4.3 M2 rc2 is in QA, rc1 was rebuilt due to concerns about the test results
and a desire to set things up well for M3


YP 3.1.27 has come out of QA but has open questions about toolchain test
regressions blocking release


There were fixes for glibc tests which reduced the number of failures on x86
(32 and 64 bit), thanks Anuj.


There were further fixes for LTP result reliability after discovering error
code and timeout handling issues which answer long standing questions about
changes in test results.


Support for a  new recipe sanity testing task (do_recipe_qa) was merged and
there is a hope/plan to move more “processing” operations over to this task to
improve general parsing time.


The pre-release version of autoconf and a gcc stable update were merged.




Ways to contribute:
As people are likely aware, the project has a number of components which are
either unmaintained, or have people with little to no time trying to keep them
alive. These components include: patchtest, layerindex, devtool, toaster, wic,
oeqa, autobuilder, CROPs containers, pseudo and more. Many have open bugs.
Help is welcome in trying to better look after these components!


There are bugs identified as possible for newcomers to the project:
https://wiki.yoctoproject.org/wiki/Newcomers


There are bugs that are currently unassigned for YP 4.3. See:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned_Enhancements.2FBugs


We’d welcome new maintainers for recipes in OE-Core. Please see the list at:
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc
and discuss with the existing maintainer, or ask on the OE-Core mailing list.
We will likely move a chunk of these to “Unassigned” soon to help facilitate
this.


Help is very much welcome in trying to resolve our autobuilder intermittent
issues. You can see the list of failures we’re continuing to see by searching
for the “AB-INT” tag in bugzilla:
https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT.


Help us resolve CVE issues: CVE metrics


We have a growing number of bugs in bugzilla, any help with them is
appreciated.




YP 4.3 Milestone Dates:
YP 4.3 M2 is in QA


YP 4.3 M3 build date  2023/08/28


YP 4.3 M3 Release date 2023/09/08


YP 4.3 M4 build date  2023/10/02


YP 4.3 M4 Release date 2023/10/27




Upcoming dot releases:
YP 3.1.27 is back from QA


YP 4.0.12 build date 2023/08/07


YP 4.0.12 Release date 2023/08/18


YP 4.2.3 build date 2023/08/28


YP 4.2.3 Release date 2023/09/08


YP 3.1.28 build date 2023/09/18


YP 3.1.28 Release date 2023/09/29


YP 4.0.13 build date 2023/09/25


YP 4.0.13 Release date 2023/10/06


YP 3.1.29 build date 2023/10/30


YP 3.1.29 Release date 2023/11/10


YP 4.0.14 build date 2023/11/06


YP 4.0.14 Release date 2023/11/17


YP 4.2.4 build date 2023/11/13


YP 4.2.4 Release date 2023/11/24


YP 3.1.30 build date 2023/12/11


YP 3.1.30 Release date 2023/12/22


YP 4.0.15 build date 2023/12/18


YP 4.0.15 Release date 2023/12/29




Tracking Metrics:
WDD 2470 (last week 2487) (https://wiki.yoctoproject.org/charts/combo.html)


OE-Core/Poky Patch Metrics


Total patches found: 1181 (last week 1145)


Patches in the Pending State: 256 (22%) [last week 260 (23%)]


https://autobuilder.yocto.io/pub/non-release/patchmetrics/




The Yocto Project’s technical governance is through its Technical Steering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC


The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status


[If anyone has suggestions for other information you’d like to see on this
weekly status update, let us know!]


Thanks,

Stephen K. Jolley

Yocto Project Program Manager

(    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com


--oiForXRlL4xkBhXQA1RGnThtnZmi9=_cgb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

<html><head><meta http-equiv="Content-Type" content="text/html;
 charset=utf-8"></head><body bgcolor="#ffffff"><b
 id="docs-internal-guid-a507b648-7fff-ab26-3cad-f3df84b1e832"
 style="font-weight: normal;"><p style='line-height: 1.38; font-family:
 "Arial"; font-size: 10pt; margin-top: 0pt; margin-bottom: 0pt;'
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Current Dev Position: YP 4.3 M3</span></p><p
 style='line-height: 1.38; font-family: "Arial"; font-size: 10pt; margin-top:
 0pt; margin-bottom: 0pt;' dir="ltr"><span style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">Next Deadline: 28th August 2023 YP 4.3 M3 build date</span></p>
<div style='font-family: "Arial"; font-size: 10pt;'><br></div><p
 style='line-height: 1.38; font-family: "Arial"; font-size: 10pt; margin-top:
 0pt; margin-bottom: 0pt;' dir="ltr"><span style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">Next Team Meetings:</span></p>
<div style='font-family: "Arial"; font-size: 10pt;'><ul style="margin-top:
 0px; margin-bottom: 0px; padding-inline-start: 48px;"><li aria-level="1"
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Bug Triage meeting Thursday August 3rd 7:30
 am PDT (</span><a style="text-decoration: none;"
 href="https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink:
 none;">https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">)</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Weekly Project Engineering Sync Tuesday
 August 1st at 8 am PDT (</span><a style="text-decoration: none;"
 href="https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink:
 none;">https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a
 style="text-decoration: none;" href="https://zoom.us/j/990892712"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink: none;">)</span></a></p></li><li aria-level="1"
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Twitch -&nbsp; See </span><a
 style="text-decoration: none;"
 href="https://www.twitch.tv/theyoctojester"><span style="color: rgb(17, 85,
 204); font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: underline;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent; -webkit-text-decoration-skip: none; text-decoration-skip-ink:
 none;">https://www.twitch.tv/theyoctojester</span></a></p></li></ul></div><br><p
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Key Status/Updates:</span></p><ul
 style="margin-top: 0px; margin-bottom: 0px; padding-inline-start: 48px;"><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">YP 4.3 M2 rc2 is in
 QA, rc1 was rebuilt due to concerns about the test results and a desire to
 set things up well for M3</span></p></li><li aria-level="1" style="color:
 rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt; font-style:
 normal; font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.27 has come out of QA but has open
 questions about toolchain test regressions blocking
 release</span></p></li><li aria-level="1" style="color: rgb(46, 52, 54);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">There were fixes for glibc tests which
 reduced the number of failures on x86 (32 and 64 bit), thanks
 Anuj.</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">There were further fixes for LTP result
 reliability after discovering error code and timeout handling issues which
 answer long standing questions about changes in test
 results.</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Support for a&nbsp; new recipe sanity testing
 task (do_recipe_qa) was merged and there is a hope/plan to move more
 “processing” operations over to this task to improve general parsing
 time.</span></p></li><li aria-level="1" style="color: rgb(46, 52, 54);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(46, 52, 54); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: rgb(255, 255, 255);">The pre-release version of autoconf
 and a gcc stable update were merged.</span></p></li></ul><br><p
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Ways to contribute:</span></p><ul
 style="margin-top: 0px; margin-bottom: 0px; padding-inline-start: 48px;"><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">As people are likely
 aware, the project has a number of components which are either unmaintained,
 or have people with little to no time trying to keep them alive. These
 components include: patchtest, layerindex, devtool, toaster, wic, oeqa,
 autobuilder, CROPs containers, pseudo and more. Many have open bugs. Help is
 welcome in trying to better look after these components!</span></p></li><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">There are bugs
 identified as possible for newcomers to the project: </span><a
 style="text-decoration: none;"
 href="https://wiki.yoctoproject.org/wiki/Newcomers"><span style="color:
 rgb(17, 85, 204); font-family: Arial,sans-serif; font-size: 11pt; font-style:
 normal; font-variant: normal; font-weight: 400; text-decoration: underline;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent; -webkit-text-decoration-skip: none; text-decoration-skip-ink:
 none;">https://wiki.yoctoproject.org/wiki/Newcomers</span></a></p></li><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">There are bugs that
 are currently unassigned for YP 4.3. See: </span><a style="text-decoration:
 none;"
 href="https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned_Enhancements.2FBugs"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink:
 none;">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned_Enhancements.2FBugs</span></a></p></li><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">We’d welcome new
 maintainers for recipes in OE-Core. Please see the list at: </span><a
 style="text-decoration: none;"
 href="http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink:
 none;">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc</span></a><span
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;"> and discuss with the existing maintainer, or ask on the
 OE-Core mailing list. We will likely move a chunk of these to “Unassigned”
 soon to help facilitate this.</span></p></li><li aria-level="1" style="color:
 rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt; font-style:
 normal; font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Help is very much welcome in trying to
 resolve our autobuilder intermittent issues. You can see the list of failures
 we’re continuing to see by searching for the “AB-INT” tag in bugzilla:
 </span><a style="text-decoration: none;"
 href="https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink:
 none;">https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT</span></a><span
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">.</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Help us resolve CVE issues: </span><a
 style="text-decoration: none;"
 href="https://autobuilder.yocto.io/pub/non-release/patchmetrics/"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink: none;">CVE metrics</span></a><span style="color:
 rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt; font-style:
 normal; font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">&nbsp;</span></p></li><li aria-level="1" style="color: rgb(0,
 0, 0); font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">We have a growing number of bugs in bugzilla,
 any help with them is appreciated.</span></p></li></ul><br><p
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.3 Milestone Dates:</span></p><ul
 style="margin-top: 0px; margin-bottom: 0px; padding-inline-start: 48px;"><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">YP 4.3 M2 is in
 QA</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 list-style-type: disc; white-space: pre; background-color: transparent;"
 dir="ltr"><p role="presentation" style="line-height: 1.38; margin-top: 0pt;
 margin-bottom: 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">YP 4.3 M3 build
 date&nbsp; 2023/08/28</span></p></li><li aria-level="1" style="color: rgb(0,
 0, 0); font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.3 M3 Release date
 2023/09/08</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.3 M4 build date&nbsp;
 2023/10/02</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.3 M4 Release date
 2023/10/27</span></p></li></ul><br><p style="line-height: 1.38; margin-top:
 0pt; margin-bottom: 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">Upcoming dot releases:</span></p><ul style="margin-top: 0px;
 margin-bottom: 0px; padding-inline-start: 48px;"><li aria-level="1"
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.27 is back from QA</span></p></li><li
 aria-level="1" style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">YP 4.0.12 build date
 2023/08/07</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.12 Release date
 2023/08/18</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.2.3 build date
 2023/08/28</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.2.3 Release date
 2023/09/08</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.28 build date
 2023/09/18</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.28 Release date
 2023/09/29</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.13 build date
 2023/09/25</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.13 Release date
 2023/10/06</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.29 build date
 2023/10/30</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.29 Release date
 2023/11/10</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.14 build date
 2023/11/06</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.14 Release date
 2023/11/17</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.2.4 build date
 2023/11/13</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.2.4 Release date
 2023/11/24</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.30 build date
 2023/12/11</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 3.1.30 Release date
 2023/12/22</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.15 build date
 2023/12/18</span></p></li><li aria-level="1" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">YP 4.0.15 Release date
 2023/12/29</span></p></li></ul><br><p style="line-height: 1.38; margin-top:
 0pt; margin-bottom: 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent;">Tracking Metrics:</span></p><ul style="margin-top: 0px;
 margin-bottom: 0px; padding-inline-start: 48px;"><li aria-level="1"
 style="color: rgb(0, 0, 0); font-family: Arial,sans-serif; font-size: 11pt;
 font-style: normal; font-variant: normal; font-weight: 400; text-decoration:
 none; vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">WDD 2470 (last week 2487)</span><span
 style="color: rgb(0, 0, 0); font-family: Consolas,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;"> (</span><a style="text-decoration: none;"
 href="https://wiki.yoctoproject.org/charts/combo.html"><span style="color:
 rgb(17, 85, 204); font-family: Arial,sans-serif; font-size: 11pt; font-style:
 normal; font-variant: normal; font-weight: 400; text-decoration: underline;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent; -webkit-text-decoration-skip: none; text-decoration-skip-ink:
 none;">https://wiki.yoctoproject.org/charts/combo.html</span></a><span
 style="color: rgb(0, 0, 0); font-family: Consolas,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">)</span></p></li><li aria-level="1"
 style="color: rgb(0, 0, 0); font-family: Consolas,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; list-style-type: disc;
 white-space: pre; background-color: transparent;" dir="ltr"><p
 role="presentation" style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><span style="color: rgb(0, 0, 0); font-family:
 Arial,sans-serif; font-size: 11pt; font-style: normal; font-variant: normal;
 font-weight: 400; text-decoration: none; vertical-align: baseline;
 white-space: pre-wrap; background-color: transparent;">OE-Core/Poky Patch
 Metrics</span></p></li><ul style="margin-top: 0px; margin-bottom: 0px;
 padding-inline-start: 48px;"><li aria-level="2" style="color: rgb(0, 0, 0);
 font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: circle; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Total patches found: 1181 (last week
 1145)</span></p></li><li aria-level="2" style="color: rgb(0, 0, 0);
 font-family: Consolas,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: circle; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">Patches in the Pending State: 256 (22%) [last
 week 260 (23%)]</span></p></li></ul><li aria-level="1" style="color: rgb(0,
 0, 0); font-family: Consolas,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: none;
 vertical-align: baseline; list-style-type: disc; white-space: pre;
 background-color: transparent;" dir="ltr"><p role="presentation"
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;" dir="ltr"><a
 style="text-decoration: none;"
 href="https://autobuilder.yocto.io/pub/non-release/patchmetrics/"><span
 style="color: rgb(17, 85, 204); font-family: Arial,sans-serif; font-size:
 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent; -webkit-text-decoration-skip: none;
 text-decoration-skip-ink:
 none;">https://autobuilder.yocto.io/pub/non-release/patchmetrics/</span></a></p></li></ul><br><p
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">The Yocto Project’s technical governance is
 through its Technical Steering Committee, more information is available
 at:</span></p><p style="line-height: 1.38; margin-top: 0pt; margin-bottom:
 0pt;" dir="ltr"><a style="text-decoration: none;"
 href="https://wiki.yoctoproject.org/wiki/TSC"><span style="color: rgb(17, 85,
 204); font-family: Arial,sans-serif; font-size: 11pt; font-style: normal;
 font-variant: normal; font-weight: 400; text-decoration: underline;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent; -webkit-text-decoration-skip: none; text-decoration-skip-ink:
 none;">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">The Status reports are now stored on the wiki
 at: </span><a style="text-decoration: none;"
 href="https://wiki.yoctoproject.org/wiki/Weekly_Status"><span style="color:
 rgb(17, 85, 204); font-family: Arial,sans-serif; font-size: 11pt; font-style:
 normal; font-variant: normal; font-weight: 400; text-decoration: underline;
 vertical-align: baseline; white-space: pre-wrap; background-color:
 transparent; -webkit-text-decoration-skip: none; text-decoration-skip-ink:
 none;">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p
 style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"
 dir="ltr"><span style="color: rgb(0, 0, 0); font-family: Arial,sans-serif;
 font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400;
 text-decoration: none; vertical-align: baseline; white-space: pre-wrap;
 background-color: transparent;">[If anyone has suggestions for other
 information you’d like to see on this weekly status update, let us
 know!]</span></p></b>
<div><p class="MsoNormal">Thanks,</p><p class="MsoNormal"
 style="page-break-after: avoid;"><b><i><span style='color: purple;
 font-family: "Times New Roman",serif; font-size: 16pt;'>Stephen K.
 Jolley</span></i></b><b><i><span style='color: purple; font-family:
 "Tahoma",sans-serif; font-size: 16pt;'><o:p></o:p></span></i></b></p><p
 class="MsoNormal"><b><span style='color: blue; font-family: "Courier New";
 font-size: 8pt;'>Yocto Project Program Manager<o:p></o:p></span></b></p><p
 class="MsoNormal"><span style="color: black; font-family: Wingdings;
 font-size: 9pt;">(</span><span style='color: teal; font-family: "MS Sans
 Serif"; font-size: 9pt;'>&nbsp;&nbsp;&nbsp; </span><b><span style='color:
 teal; font-family: "Comic Sans MS"; font-size: 8pt;'>Cell</span></b><span
 style='color: teal; font-family: "MS Sans Serif"; font-size:
 9pt;'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 </span><span style='font-family: "MS Sans Serif"; font-size: 9pt;'>(208)
 244-4460<span style="color: black;"><o:p></o:p></span></span></p><p
 class="MsoNormal"><span style="font-family: Wingdings; font-size: 9pt;">*
 </span><b><span lang="FR" style='color: teal; font-family: "Comic Sans MS";
 font-size: 8pt;'>Email</span></b><span lang="FR" style='color: teal;
 font-family: "MS Sans Serif"; font-size: 9pt;'>:</span><span lang="FR"
 style='font-family: "MS Sans Serif"; font-size:
 9pt;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><span
 style="color: blue;"><a
 href="mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a></span></u></span></p>
 </div>
<div><br></div></body></html>

--oiForXRlL4xkBhXQA1RGnThtnZmi9=_cgb--


