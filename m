Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.720.1794930676079649274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 07:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mCRehFjO;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-381d542bc29so2701eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 07:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794930675; cv=none;
        d=google.com; s=arc-20260327;
        b=PcZDQ9MqUUTL2XMO41wCk+N+eHwrdSrmOhnyvSlQBGac/gV0KzaVtcWsNdEgi9p9jP
         89xTjXKN21ssFAmEi0C3loAPjvR5I/kg+mLGkgRGNGVK+DftlmKp/vW3YdMgGpqHdKVG
         4vdxeJn6AtZc+oMwqEAFB44afVx45/rWjA2xsExqXAs7O0wO25Rs4oVpVCul0PqQqgVH
         c2HTMz0aBQUzaIiuL386wrQndvVh7S2GBenhALsLZqbqbD70YhTwe2/G6ju4B1iyXwaY
         FYjBNRrMNZCNv6yA/+GazmnH/HowkiUR0XcVWSdQj1hLDHKubR3drhyns5OpGzo4mF+l
         GY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1Sz7s92U1fyV4sxT/YWMxrxg0sJoZp4a5P2eSx+Ek8s=;
        fh=gMDYSOg5vcaHykKTd7T/xaZplr1yrjFZzR4oj920mlE=;
        b=XUbtvPCQBR4EVRldgCkweCgJ0bt6BK6izsPixtqq5R4AENIWeU5kuAMLm2XQYXJ/4i
         FzgEZz7vF9pWTB/Av0UC3QaLxClur/E0xJ4PR/+z+LzJXjoFLYuClmiADpcrMlKhYgXG
         TKW+viwoDbC+HF2dTsUuj9cZWhpvnXGfg+CUU3aop61Aq0lZGYbkiQkQdBz2zcoBR4f6
         RVheaeH7aod0dBUTbsMIA6Bvh62kZId+UQ5MaZy+68Mq3zsb0CvgDa/s/0VV87OFeTwH
         sBH5gumYJ4mgvg6ltaalP9G0DTvOqxhHkU//+36nvTQ/i29l7PM57dZl754v5vpAftlx
         ZEIg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794930675; x=1795535475; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1Sz7s92U1fyV4sxT/YWMxrxg0sJoZp4a5P2eSx+Ek8s=;
        b=mCRehFjOw704ue+7C2RHwDpKWZVtVBFyZb04N48omHFxQhg2ux48zgM4lMfyZjGjIo
         3sqrC2BxZCgqsmKuhJhCGruoGZNwz2jVlZ6ATvpLWkafFafTKfjmDKNp5aqtMgyf1sts
         OeN7D1nUd+rxPxMW4NCKrniTo8PNIqjdzAbHq/voMeVY+CxsjbNtICliXtv3MkSCgwbt
         SFu/xej529F7Gi1g781XR1Jkb9OBOl9Lf3d+UDdtpIdWCfbZG9pDEkjzMrJt7+S+FNnp
         DgFXUEUrZT4PKav35FMBuD0qT5SWiv13ycvtTm5WEfi+aOuK9uoGFB+njAppBuCUHkJg
         +a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930675; x=1795535475;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Sz7s92U1fyV4sxT/YWMxrxg0sJoZp4a5P2eSx+Ek8s=;
        b=N2DOnOtbxfHu8GZgHhyZjqhs80m86xPIpJqvxVMMD2blCazVVsgkhNzeYg4Lv3eAP6
         VY1ubsKknQjhQmfs3sEJft252n+EnOsrIHDrcAUBdWs5jz8LUSpl8G970VBCo2Et6aCI
         rCislDGmXjxO+y9NzHNilocTTFJtwg0nuYPElq6z8aWdFfPGv9xwcFTYYpFOQ1p7hEYl
         OcgzbsjN/9tsDUmBMH0Ep2Q9x39AIkNrZKG/Ehi8uu4DXGimXGWH5clR8drMExryUoYD
         c+RPc3Jxt9546HeoAzd7Go0p67oL8tpCbZgtzMOukq2UduRulx/QbbQU8Ka/GWyJYVfz
         UNSg==
X-Forwarded-Encrypted: i=1; AL+hErGyd7N0MgnrZzGDscdLbyg+qqT5GpgcsZrlccx5p8G80O+oQRliWchK+qQhE1di54CqpyXvLmBAiaTnmK66s3RBGg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/23TXZf5x+5877pzdMTGqZESGFdIKr5CTPez9cqUgKNSSzO2ng
	bHQbEmZgc5EJYIB5ryh/YBB2YLb15dgq2Y2/xiVf8SFjgzCtptuwNQ3wpmKvXGNg8Ot0pPDlGme
	sN5VC1zVK6Fz0oqSAMPk4NW5FxRjGEuI=
X-Gm-Gg: AZFdTZeIteUEpy5Ic3H60SYOTi5pNzh9iXPttLz6FByBfLhbCQSOLR5NOWXqjukgBgO
	r9nuZn6EAsp27hOnSa0opBL1Vmy5ILgm7rYzaHiKNt8awGSDlVWtfikvuUyrKUeRsd0WpwoFcdo
	8osUKVF8XQePSAx9JHjpT1KWsMnHZQn5uhQb6+yXhAtErJXgeelWDR61VIetLJ867bNMas4ZqmQ
	9oaqdZzIW+90BjMIlgwi3bZenWf542gARNlI74IhSSz6ZlLGsgnAN3qExhv/4shWeTfTChvpgJg
	yNsK8oNDCQpNDQk1qWWJiLBYl/6fHRAaCo5UPO1GW1+FvWHKPo721w8vbW+hYXJMnn85ghFhRnY
	l0Wj7Xp06d4jMLV/YURKhA9YkJqTVd0r1kpkMNddGf4eM/8BGu+Ltm6mCG7cmq2K3NlFh8PFdUV
	Dkt/y9boP0t3mpP95ckTvAg8QBtSQCTmAPFwRWkYDaiPbwP+Pkj7sGmspkay1xwb6D+QsP7J7hg
	ND2T5gtO5YM19MpLWcvB1AMbxwYuNzTyfVHUTUI4C4F5sY/NZLTfxdoDzARjyurxXclVe5Qz40M
	7MddR8nrZj0euMBOn84a4g==
X-Received: by 2002:a05:7300:50fc:b0:382:5dd0:3bb2 with SMTP id
 5a478bee46e88-3825dd03ccemr207144eec.9.1794930673971; Tue, 17 Nov 2026
 07:51:13 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 17 Nov 2026 08:51:03 -0700
X-Gm-Features: Aa3M54otMaY7gaROnxOiClV7pXSpBLHQltkDx9t9zCJcL1h9hCX652SqiDfGt4U
Message-ID: <CAK5yBb_V45u51hFBZG=686GA1bJ-HW6h8iZ7Ge8hQU1ox9ttHQ@mail.gmail.com>
Subject: Yocto Project Status 17 November 2026 (WW47)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000037f54f06607add55"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 15:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250461

--00000000000037f54f06607add55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 6.2 M1 - Development

Next Deadline: YP 6.2 M1: w/c 2026-12-14

Next Team Meetings:

   -

   Bug Triage meeting - Thursday 19th Nov. 7:30am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync  - Tuesday 17th Nov. 8am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Yocto Project Patch Review - Thursday 19th Nov. 10am GMT and Monday 23rd
   Nov.. 9am PDT (
   https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1)


Project data dashboard: https://dashboard.yoctoproject.org/

Key Status/Updates:

   -

   YP 6.1.1 is in QA
   -

   YP 6.2 M1 is due to build in two weeks
   -

   There is a proposal and proof of concept for changes to layer
   configuration and setup out for discussion/review:

https://lists.openembedded.org/g/openembedded-architecture/message/2463

Thanks to everyone who tested and gave feedback, the branches are being
updated as improvements/fixes are collected.

   -

   The proposed layer changes will likely be more invasive than many of the
   recent changes but also incorporate a number of new features and
   improvements which will make them useful to everyone and allow various
   cleanups of existing code.
   -

   Significant cleanup changes to the oeqa test framework merged, which
   included several key bug fixes for issues which make things painful for =
day
   to day project operations.
   -

   There are patches under review for the multiconfig deadlock warnings,
   another long standing issue we=E2=80=99re happy to see fixed!
   -

   There is also a discussion about recipe specific hosttools:

https://lists.openembedded.org/g/openembedded-architecture/message/2467

   -

   SDPX deploy dir manifest handling was merged, thanks Joshua!
   -

   Multilib support for musl merged, we also updated to dnf v5 and there
   were many version upgrades.
   -

   The Yocto Project wiki has undergone significant cleanup, mostly with
   removal of obsolete pages/information. We plan to migrate the remaining
   data to a different solution. If anyone is able to help with review of
   content, please let us know.
   -

   The fix for the widely reported security issue with musl+openssh
   (CVE-2026-123158) has now been backported to scarthgap. The project has
   published details on the situation here:

https://lists.yoctoproject.org/g/yocto-security/message/1728

   -

   We had some positive response to our request for help with the issues
   highlighted from the bug triage team last week. Further help is requeste=
d
   with the following devtool & recipetool issues:
   -

      go recipes are not devtool upgradeable (#14944)
      -

      recipetool create should add tag=3D for git SRC_URI (#15816)


Want to contribute? We would appreciate help with the following areas:

   -

   We have several open issues for pseudo and limited maintainer time to
   work on them. Help from someone familiar with systems programming in C
   would be greatly appreciated.
   https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&priority=
=3DHigh&priority=3DMedium%2B&product=3DPseudo&query_format=3Dadvanced&resol=
ution=3D---
   -

   There are a large number of intermittent failures on our autobuilder,
   any help with investigating, reproducing or solving these issues would b=
e
   welcome! https://valkyrie.yocto.io/pub/non-release/abint/
   -

   Many recipes in openembedded-core would benefit from a new recipe
   maintainer. Please look at
   https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/inc=
lude/maintainers.inc
   and see if you can adopt any of the unassigned recipes.
   -

   For more ways to contribute, see
   https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9owFuC=
WbzgjOk/edit?usp=3Dsharing


New to the project?

   -

   We have a list of issues we think are good places to start contributing:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER


Tracking Metrics:

   -

   WDD 2644 (last week 2636) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total found: 1049 (last week 1047)
      -

      Patches in the Pending State: 135 (13%) [last week 135 (13%)]
      -

      https://valkyrie.yocto.io/pub/non-release/patchmetrics/


Upcoming development releases

   -

   YP 6.2 M1
   -

      Build Date w/c 2026-11-30
      -

      Release Date w/c 2026-12-14
      -

   YP 6.2 M2
   -

      Build Date w/c 2027-01-18
      -

      Release Date w/c 2027-02-01
      -

   YP 6.2 M3
   -

      Build Date w/c 2027-03-01
      -

      Release Date w/c 2027-03-15
      -

   YP 6.2.0
   -

      Build Date w/c 2027-04-26
      -

      Release Date w/c 2027-05-03


Upcoming dot releases:

   -

   YP 6.1.1 in QA.
   -

      Release Date w/c 2026-11-23
      -

   YP 6.0.5
   -

      Build Date w/c 2026-11-16
      -

      Release Date w/c 2026-11-30
      -

   YP 5.0.22
   -

      Build Date w/c 2026-11-23
      -

      Release Date w/c 2026-12-07
      -

   For future release dates, see
   https://wiki.yoctoproject.org/wiki/Release_calendar


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--00000000000037f54f06607add55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-6704cdd4-7fff-f901-d4=
82-3b68bf9ca187"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical=
-align:baseline;white-space:pre-wrap">Current Dev Position: YP 6.2 M1 - Dev=
elopment</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre-wrap">Next Deadline: YP 6.2 M1: w/c 2026-=
12-14</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">Next Team Meetings:</span></p><ul =
style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Bug Triage meeting - Thursday 19th Nov. 7:30am PDT (</span><a =
href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09"=
 style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant:normal;text-decoration:underline;vertical-alig=
n:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2ZX=
L3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:9.5pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Wee=
kly Project Engineering Sync=C2=A0 - Tuesday 17th Nov. 8am PDT (</span><a h=
ref=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" =
style=3D"text-decoration:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant:normal;text-decoration:underline;vertical-align=
:baseline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM=
2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" s=
tyle=3D"text-decoration:none"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;text-decoration:underline;vertical-align:=
baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:9.5pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre-wrap">Yocto Project Patch Review - Thursday 19th Nov. 10a=
m GMT and Monday 23rd Nov.. 9am PDT (</span><a href=3D"https://zoom.us/j/97=
762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb.1" style=3D"text-decoration=
:none"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;text-decoration:underline;vertical-align:baseline;white-space:pr=
e-wrap">https://zoom.us/j/97762397148?pwd=3D1xk0iC9hp9SjEonaTaONwTb6iWry4Eb=
.1</span></a><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p>=
</li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-al=
ign:baseline;white-space:pre-wrap">Project data dashboard: </span><a href=
=3D"https://dashboard.yoctoproject.org/" style=3D"text-decoration:none"><sp=
an style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://dashboard.yoctoproject.org/</span></a><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Upd=
ates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">YP 6.1.1 is in QA</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 6.2 M1 is due to build in two weeks</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre-wrap">There is a proposa=
l and proof of concept for changes to layer configuration and setup out for=
 discussion/review:=C2=A0</span></p></li></ul><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-left:36pt;margin-top:0pt;margin-bottom:0pt"><a href=3D"h=
ttps://lists.openembedded.org/g/openembedded-architecture/message/2463" sty=
le=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;background-color:transparent;font-variant:normal;text-decoratio=
n:underline;vertical-align:baseline;white-space:pre-wrap">https://lists.ope=
nembedded.org/g/openembedded-architecture/message/2463</span></a></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">Thanks to everyone who tested and gave feed=
back, the branches are being updated as improvements/fixes are collected.</=
span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant:normal;vertical-align:baseli=
ne;white-space:pre-wrap">The proposed layer changes will likely be more inv=
asive than many of the recent changes but also incorporate a number of new =
features and improvements which will make them useful to everyone and allow=
 various cleanups of existing code.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Significant cleanup changes to the oeqa test framework =
merged, which included several key bug fixes for issues which make things p=
ainful for day to day project operations.=C2=A0</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">There are patches under review for the mult=
iconfig deadlock warnings, another long standing issue we=E2=80=99re happy =
to see fixed!</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Th=
ere is also a discussion about recipe specific hosttools:</span></p></li></=
ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt=
;margin-bottom:0pt"><a href=3D"https://lists.openembedded.org/g/openembedde=
d-architecture/message/2467" style=3D"text-decoration:none"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fo=
nt-variant:normal;text-decoration:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://lists.openembedded.org/g/openembedded-architecture/m=
essage/2467</span></a></p><ul style=3D"margin-top:0px;margin-bottom:0px"><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre-wrap">SDPX deploy dir manifest handling=
 was merged, thanks Joshua!</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">Multilib support for musl merged, we also updated to dnf v5 and=
 there were many version upgrades.</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre-wrap">The Yocto Project wiki has undergone significant cleanup=
, mostly with removal of obsolete pages/information. We plan to migrate the=
 remaining data to a different solution. If anyone is able to help with rev=
iew of content, please let us know.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">The fix for the widely reported security issue with mus=
l+openssh (CVE-2026-123158) has now been backported to scarthgap. The proje=
ct has published details on the situation here:</span></p></li></ul><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-left:36pt;margin-top:0pt;margin-b=
ottom:0pt"><a href=3D"https://lists.yoctoproject.org/g/yocto-security/messa=
ge/1728" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant:normal;te=
xt-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https=
://lists.yoctoproject.org/g/yocto-security/message/1728</span></a></p><ul s=
tyle=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre-wrap">We had some positive response to our request for help with the i=
ssues highlighted from the bug triage team last week. Further help is reque=
sted with the following devtool &amp; recipetool issues:</span></p></li><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">go recipes are not devtool upgradeable (#14944)</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">recipetool create should a=
dd tag=3D for git SRC_URI (#15816)</span></p></li></ul></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant:normal;vertical-align:baseline;white-space:=
pre-wrap">Want to contribute? We would appreciate help with the following a=
reas:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">We have several open issues for pseudo and =
limited maintainer time to work on them. Help from someone familiar with sy=
stems programming in C would be greatly appreciated. </span><a href=3D"http=
s://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DH=
igh&amp;priority=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanc=
ed&amp;resolution=3D---" style=3D"text-decoration:none"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant:normal;text-decoration=
:underline;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.y=
octoproject.org/buglist.cgi?list_id=3D661406&amp;priority=3DHigh&amp;priori=
ty=3DMedium%2B&amp;product=3DPseudo&amp;query_format=3Dadvanced&amp;resolut=
ion=3D---</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Th=
ere are a large number of intermittent failures on our autobuilder, any hel=
p with investigating, reproducing or solving these issues would be welcome!=
 </span><a href=3D"https://valkyrie.yocto.io/pub/non-release/abint/" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;text-decoration:underline;vertical-align:base=
line;white-space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/abint/=
</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">Many re=
cipes in openembedded-core would benefit from a new recipe maintainer. Plea=
se look at </span><a href=3D"https://git.openembedded.org/openembedded-core=
/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-decoration:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
:normal;text-decoration:underline;vertical-align:baseline;white-space:pre-w=
rap">https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/i=
nclude/maintainers.inc</span></a><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant:normal;vertical-align:baseline;white-space:pr=
e-wrap"> and see if you can adopt any of the unassigned recipes.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">For more ways to contribut=
e, see </span><a href=3D"https://docs.google.com/document/d/18oxKWxLorfF813=
h82mK6yKTIHeBp_-9owFuCWbzgjOk/edit?usp=3Dsharing" style=3D"text-decoration:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt:normal;text-decoration:underline;vertical-align:baseline;white-space:pre=
-wrap">https://docs.google.com/document/d/18oxKWxLorfF813h82mK6yKTIHeBp_-9o=
wFuCWbzgjOk/edit?usp=3Dsharing</span></a></p></li></ul><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">New to the project?</span></p><ul style=3D"margin-top:0px;margin-botto=
m:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">We have a list of issue=
s we think are good places to start contributing: </span><a href=3D"https:/=
/bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DNEWCOMER" style=3D"tex=
t-decoration:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant:normal;text-decoration:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quicksear=
ch=3DNEWCOMER</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-variant:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Met=
rics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">WDD 2644 (last week 2636) </span><span styl=
e=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">(</=
span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"t=
ext-decoration:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant:normal;text-decoration:underline;vertical-align:baseline;=
white-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span=
></a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;backgrou=
nd-color:transparent;font-variant:normal;vertical-align:baseline;white-spac=
e:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant:normal;vertical-align:b=
aseline;white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li><ul=
 style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-s=
tyle-type:circle;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Total found: 1049 (last week 1047)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Patches in the Pending State: 135 (13%)=
 [last week 135 (13%)]</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><a href=3D"https://valkyrie.yocto.io/p=
ub/non-release/patchmetrics/" style=3D"text-decoration:none"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-variant:normal;text-decoration:underline;vertical-align:baseline;white-=
space:pre-wrap">https://valkyrie.yocto.io/pub/non-release/patchmetrics/</sp=
an></a></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Upcoming development rel=
eases</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;background-color:transparent;font-variant:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-=
variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2 M1</spa=
n></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" s=
tyle=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-var=
iant:normal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c </=
span><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">2026-11-30</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-variant:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-=
wrap">Release Date w/c </span><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">2026-12-14</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;font-variant:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 6.2 M2</span></p></li><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:=
baseline;white-space:pre-wrap">Build Date w/c </span><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant:normal;vertical-align:bas=
eline;white-space:pre-wrap">2027-01-18</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-variant:normal;vertical-align:baseline;white-=
space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant=
:normal;vertical-align:baseline;white-space:pre-wrap">Release Date w/c </sp=
an><span style=3D"font-size:11pt;background-color:transparent;font-variant:=
normal;vertical-align:baseline;white-space:pre-wrap">2027-02-01</span></p><=
/li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre=
-wrap">YP 6.2 M3</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wr=
ap">Build Date w/c </span><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap"=
>2027-03-01</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fo=
nt-variant:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;font-variant:normal;vertical-align:base=
line;white-space:pre-wrap">Release Date w/c </span><span style=3D"font-size=
:11pt;background-color:transparent;font-variant:normal;vertical-align:basel=
ine;white-space:pre-wrap">2027-03-15</span></p></li></ul><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-varian=
t:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.2.0</span></p><=
/li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgro=
und-color:transparent;font-variant:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:no=
rmal;vertical-align:baseline;white-space:pre-wrap">Build Date w/c </span><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant:norma=
l;vertical-align:baseline;white-space:pre-wrap">2027-04-26</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">R=
elease Date w/c </span><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">20=
27-05-03</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant:normal;vertical-align:baseline;white-space:pre-wrap">Upcoming dot rel=
eases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font=
-variant:normal;vertical-align:baseline;white-space:pre-wrap">YP 6.1.1 in Q=
A.</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial,sans=
-serif;background-color:transparent;font-variant:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;f=
ont-variant:normal;vertical-align:baseline;white-space:pre-wrap">Release Da=
te w/c 2026-11-23</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial,sans-serif;background-color:trans=
parent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 6.0.5</span></p></li><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;font-variant:normal;vertica=
l-align:baseline;white-space:pre-wrap">Build Date w/c 2026-11-16</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial,sans-serif;background-color:transparent;font-variant:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;font-variant:normal;vertical-align:baseline;white-space:pre-w=
rap">Release Date w/c 2026-11-30</span></p></li></ul><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;backgr=
ound-color:transparent;font-variant:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:n=
ormal;vertical-align:baseline;white-space:pre-wrap">YP 5.0.22</span></p></l=
i><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:circle;font-size:11pt;font-family:Arial,sans-serif;backgroun=
d-color:transparent;font-variant:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-variant:norm=
al;vertical-align:baseline;white-space:pre-wrap">Build Date w/c 2026-11-23<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;font-variant:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Release Date w/c 2026-12-07</span></p></li></ul><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">For future release dates, see </span><a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Release_calendar" style=3D"text-dec=
oration:none"><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant:normal;text-decoration:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://wiki.yoctoproject.org/wiki/Release_calendar</span></=
a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant:normal;verti=
cal-align:baseline;white-space:pre-wrap">The Yocto Project=E2=80=99s techni=
cal governance is through its Technical Steering Committee, more informatio=
n is available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/=
TSC" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;background-color:transparent;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline;white-space:pre-wrap">https://w=
iki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-variant:normal;vertical-align:baseline;white-space:pre-wrap">The St=
atus reports are stored on the wiki at: </span><a href=3D"https://wiki.yoct=
oproject.org/wiki/Weekly_Status" style=3D"text-decoration:none"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant:normal;text-decoration:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status</span><=
/a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant:normal;vertical-align=
:baseline;white-space:pre-wrap">[If anyone has suggestions for other inform=
ation you=E2=80=99d like to see on this weekly status update, let us know!]=
</span></p></span><br class=3D"gmail-Apple-interchange-newline"><div><span =
style=3D"font-family:Arial,sans-serif;font-size:12pt;background-color:trans=
parent">Thanks,</span></div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr">

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div>

--00000000000037f54f06607add55--
