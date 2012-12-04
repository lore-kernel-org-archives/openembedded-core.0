Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TfgJy-0007Xs-1j
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 01:25:10 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1302353dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 16:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=h4ofKT7cr4vLQh/MbZZTv1KtM3Ntq6P1mE/txPAVg3E=;
	b=tCw4LbjCy4mnYITzE8IoLggUZVPh300hJeHua5mQKSkELoybgBmbbKREYajy8OhIX1
	7DNUEUOs64Asl9VZWy+8Qj7E4J6Z+64DK1a3MeiLl2o1bpWjC74Y58NO0c9TRwHDac/X
	oVCXT78LPv+orRmK6j5PXtk3KAjq6BeERjRnr6wj5fdNxaNhh2KbQNajr/dr8MNdHVjR
	PO925IGwSnIgef6xnUhAM5rEhDGx1uyRSr4Xur19zCaFSf5Pk1nhjmra0O0m3Hk8ecyl
	EDHHdLQu1btnkCP/G9AKcphwYeL7j5s1S6V5Zq/NPYvxm7m5UK4c60HprqJ33IVl20pt
	AqdA==
Received: by 10.68.209.136 with SMTP id mm8mr33440059pbc.146.1354579847414;
	Mon, 03 Dec 2012 16:10:47 -0800 (PST)
Received: from yiqingliang-pc.localnet ([121.237.171.139])
	by mx.google.com with ESMTPS id bd2sm8829966pab.36.2012.12.03.16.10.45
	(version=SSLv3 cipher=OTHER); Mon, 03 Dec 2012 16:10:46 -0800 (PST)
From: niqingliang2003@gmail.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 04 Dec 2012 08:09:31 +0000
Message-ID: <1658789.qkaxeOOdCV@yiqingliang-pc>
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
In-Reply-To: <CADkTA4Ma2+H12cF21C5w5Rh6ULKiwGPf+49ZLdsUEp9Zudxi5A@mail.gmail.com>
References: <3752816.NQS16Yy7Ff@yiqingliang-pc>
	<CADkTA4Ma2+H12cF21C5w5Rh6ULKiwGPf+49ZLdsUEp9Zudxi5A@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why remove yaffs2?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 00:25:10 -0000
Content-Type: multipart/alternative; boundary="nextPart1887403.P8XnHVH41N"
Content-Transfer-Encoding: 7Bit

--nextPart1887403.P8XnHVH41N
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Sorry! my mistake.

just for oe, why remove yaffs from image types?




On Monday, December 03, 2012 08:52:46 AM Bruce Ashfield wrote:

On Mon, Dec 3, 2012 at 9:03 AM, <niqingliang2003@gmail.com> wrote:

Hi, All:

I have untouched oe for several months, and recently found that yaffs is
dropped, and also in official kernel, why?



Can you clarify ? Which kernel ? Yaffs has never been a mainline filesystem, but
I have it in the yocto released kernels.


http://git.yoctoproject.org/cgit/cgit.cgi/linux-
yocto-3.4/commit/?h=standard/base&id=a8291fa6f723b0182d2b7033b5d59f412ba7cf72



Cheers,


Bruce


 


Yi qingliang
Nanjing Jilong

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core






-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee at 
its end"




--nextPart1887403.P8XnHVH41N
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/=
REC-html40/strict.dtd">
<html><head><meta name=3D"qrichtext" content=3D"1" /><style type=3D"tex=
t/css">
p, li { white-space: pre-wrap; }
</style></head><body style=3D" font-family:'Sans Serif'; font-size:9pt;=
 font-weight:400; font-style:normal;">
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sor=
ry! my mistake.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">jus=
t for oe, why remove yaffs from image types?</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On =
Monday, December 03, 2012 08:52:46 AM Bruce Ashfield wrote:<br /></p>
<p style=3D" margin-top:12px; margin-bottom:12px; margin-left:40px; mar=
gin-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"=
>On Mon, Dec 3, 2012 at 9:03 AM, &lt;<a href=3D"mailto:niqingliang2003@=
gmail.com"><span style=3D" text-decoration: underline; color:#0057ae;">=
niqingliang2003@gmail.com</span></a>&gt; wrote:<br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:44px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">H=
i, All:<br /><br />I have untouched oe for several months, and recently=
 found that yaffs is<br />dropped, and also in official kernel, why?<br=
 /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">C=
an you clarify ? Which kernel ? Yaffs has never been a mainline filesys=
tem, but</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I=
 have it in the yocto released kernels.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/com=
mit/?h=3Dstandard/base&amp;id=3Da8291fa6f723b0182d2b7033b5d59f412ba7cf7=
2"><span style=3D" text-decoration: underline; color:#0057ae;">http://g=
it.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/commit/?h=3Dstandard/=
base&amp;id=3Da8291fa6f723b0182d2b7033b5d59f412ba7cf72</span></a><br />=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">C=
heers,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">B=
ruce</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">=C2=
=A0</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:44px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /><br />Yi qingliang<br />Nanjing Jilong<br /><br />________________=
_______________________________<br />Openembedded-core mailing list<br =
/><a href=3D"mailto:Openembedded-core@lists.openembedded.org"><span sty=
le=3D" text-decoration: underline; color:#0057ae;">Openembedded-core@li=
sts.openembedded.org</span></a><br /><a href=3D"http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-core"><span style=3D" text-de=
coration: underline; color:#0057ae;">http://lists.linuxtogo.org/cgi-bin=
/mailman/listinfo/openembedded-core</span></a><br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br=
 /><br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:40px; margi=
n-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><=
br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">-- =
<br />&quot;Thou shalt not follow the NULL pointer, for chaos and madne=
ss await thee at its end&quot;<br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br=
 /><br /></p></body></html>

--nextPart1887403.P8XnHVH41N--
