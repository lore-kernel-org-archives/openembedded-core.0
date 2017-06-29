Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8D80B781F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 16:31:29 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id i2so78846873qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y5rk6hjkRpX6MpAou3ruERHTQdlz0o1ZnAva5Ade3dc=;
	b=DkHbD08XvYFG4D5eg15CvPBdhA6PWYMiWCj3ODaDfjNhuaaE8myBIYdS5XWBeul1U0
	OUBAVcsTKI34DsrQvMa1cBjyOVW8W8N/+YwIbiZPIPD1vhv1Z+QibXz+E+qgPAVINF/o
	a1qlW5UoGHxd/BjMEbWKEbFmMau/oT4NaZDhPmph2vYMNFQvGynK6wrsnPDSa/PFpokC
	MOpucSxFBwZmim+QOQBZotqANlo48PXwl6tlIqP7GUD0BWDri8MiXPXv1tHvPP2ey12p
	OYDLZJUUkyY22yOHynlhXoZ1vqrbxniMIsygIozD6C3AkcghmS2h+bKl2bpWPJlKN1y4
	nhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y5rk6hjkRpX6MpAou3ruERHTQdlz0o1ZnAva5Ade3dc=;
	b=ePoXTE+FvRMBD/Lr+wP14v3IHdzo3ztmemgbPuNLnEE3IxI2ddDgN+Z/DQQF71b7hQ
	s6t7Cs290TNy3HZSmfJwEKmdHdpv0SMU2WsoPL0aFe6HMAs67Eahl8yoDEb8whrca2Zi
	aI9O3SfAq28p2iqsHvV/34iuETYa0/IKAhFIRs1V3G+4RtLkjEW7fnMZfQL3jmjqqZSV
	HnwpnNn8gnDvmF1ibDumOBtZ9u4xj9mKAOJZgI573aRrqFN0JpNr3a9S8/HJOavLq//k
	pylvMxg5jNjaG4f/7iPkXoS1sysb1AtGWX7w4qj6v0XCDy0n2/feOGkb8zSEvbDYPxGd
	SmJw==
X-Gm-Message-State: AKS2vOzNAyuG1AO6JDOwPBVic96m9Y7hgT15Md09xhefuqcQwRkjPH2A
	B9FxnZY8lJLgC4vvo0LVjqAwWRoMI/EC
X-Received: by 10.200.43.105 with SMTP id 38mr21909599qtv.6.1498753890808;
	Thu, 29 Jun 2017 09:31:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Thu, 29 Jun 2017 09:31:10 -0700 (PDT)
In-Reply-To: <c240efbb-9c3d-999e-3aa7-d77af977edab@gmail.com>
References: <c240efbb-9c3d-999e-3aa7-d77af977edab@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jun 2017 17:31:10 +0100
Message-ID: <CAJTo0LbjkNV9ZEy--a70KAkO7F9p_1BdFyoAfghrqupFJG8y8A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: revert e7fca5d looks wrong.
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
X-List-Received-Date: Thu, 29 Jun 2017 16:31:37 -0000
Content-Type: multipart/alternative; boundary="001a113d00a644976305531bd5f4"

--001a113d00a644976305531bd5f4
Content-Type: text/plain; charset="UTF-8"

On 28 June 2017 at 17:58, akuster808 <akuster808@gmail.com> wrote:

> Please double check the revert in master. Is the commit message wrong or
> did the wrong thing get removed?
>
>
The revert in master:

libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all entities loading
even local"
 .../libxml/libxml2/CVE-2016-9318.patch             | 207
---------------------

-From 7fa1cd31552d52d50a9101f07c816ff6dd2d9f19 Mon Sep 17 00:00:00 2001
-From: Doran Moppert <dmoppert@redhat.com>
-Date: Fri, 7 Apr 2017 16:45:56 +0200
-Subject: [PATCH] Add an XML_PARSE_NOXXE flag to block all entities loading
- even local

So the commit message matches the summary of the patch being deleted.

The addition of this patch:

    libxml2: CVE-2016-9318

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
b/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
new file mode 100644
index 00000000000..3581ab83df1
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
@@ -0,0 +1,207 @@
+From 7fa1cd31552d52d50a9101f07c816ff6dd2d9f19 Mon Sep 17 00:00:00 2001
+From: Doran Moppert <dmoppert@redhat.com>
+Date: Fri, 7 Apr 2017 16:45:56 +0200
+Subject: [PATCH] Add an XML_PARSE_NOXXE flag to block all entities loading
+ even local

So the addition of the patch also matches.

The revert actually happened upstream:

https://git.gnome.org/browse/libxml2/commit/id=030b1f7a27c22f9237eddca49ec5e620b6258d7d

Conclusion: I think the patch is good.

Ross

--001a113d00a644976305531bd5f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 June 2017 at 17:58, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><p>Please double check the revert in master. =
Is the commit message
      wrong or did the wrong thing get removed?</p>
    <p></p></blockquote></div><br>The revert in master:</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra=
">libxml2: Revert &quot;Add an XML_PARSE_NOXXE flag to block all entities l=
oading even local&quot;</div><div class=3D"gmail_extra">=C2=A0.../libxml/li=
bxml2/CVE-2016-9318.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 207 -=
--------------------<br></div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_extra">-From 7fa1cd31552d52d50a9101f=
07c816ff6dd2d9f19 Mon Sep 17 00:00:00 2001</div><div class=3D"gmail_extra">=
-From: Doran Moppert &lt;<a href=3D"mailto:dmoppert@redhat.com">dmoppert@re=
dhat.com</a>&gt;</div><div class=3D"gmail_extra">-Date: Fri, 7 Apr 2017 16:=
45:56 +0200</div><div class=3D"gmail_extra">-Subject: [PATCH] Add an XML_PA=
RSE_NOXXE flag to block all entities loading</div><div class=3D"gmail_extra=
">- even local</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">So the commit message matches the summary of the patch being delet=
ed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Th=
e addition of this patch:</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 libxml2: CVE-2=
016-9318</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">diff --git a/meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2016-9318.patch<br></div><div class=3D"gma=
il_extra">new file mode 100644</div><div class=3D"gmail_extra">index 000000=
00000..3581ab83df1</div><div class=3D"gmail_extra">--- /dev/null</div><div =
class=3D"gmail_extra">+++ b/meta/recipes-core/libxml/libxml2/CVE-2016-9318.=
patch</div><div class=3D"gmail_extra">@@ -0,0 +1,207 @@</div><div class=3D"=
gmail_extra">+From 7fa1cd31552d52d50a9101f07c816ff6dd2d9f19 Mon Sep 17 00:0=
0:00 2001</div><div class=3D"gmail_extra">+From: Doran Moppert &lt;<a href=
=3D"mailto:dmoppert@redhat.com">dmoppert@redhat.com</a>&gt;</div><div class=
=3D"gmail_extra">+Date: Fri, 7 Apr 2017 16:45:56 +0200</div><div class=3D"g=
mail_extra">+Subject: [PATCH] Add an XML_PARSE_NOXXE flag to block all enti=
ties loading</div><div class=3D"gmail_extra">+ even local</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So the addition of th=
e patch also matches.</div><div class=3D"gmail_extra"><br></div></div><div =
class=3D"gmail_extra">The revert actually happened upstream:</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"https://g=
it.gnome.org/browse/libxml2/commit/id=3D030b1f7a27c22f9237eddca49ec5e620b62=
58d7d">https://git.gnome.org/browse/libxml2/commit/id=3D030b1f7a27c22f9237e=
ddca49ec5e620b6258d7d</a><br></div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Conclusion: I think the patch is good.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></=
div></div>

--001a113d00a644976305531bd5f4--
