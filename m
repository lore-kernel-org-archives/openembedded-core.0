Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TlUkb-0001s5-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 02:16:41 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so1582735pbc.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 17:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=r600e9hOO81ysPvujKPZQTMhF8qcwRxDaR1/dLJ4nMA=;
	b=tq9mu9F3zpJTf55M2JP1BWFAp9JLVrrtrDMgdCow7pP0+e19HUTNpjCd3QLJd7JCXR
	UtCY57hE1K6PC46NxrQimIH7c7licv1kLbHz8pVZqtu5NVQ4LkqEtfrBaq5az+nZLJbl
	5hzATYWMOTIwKGWjCF/FsyVf/zYxbHN6HRSMuymQ6yCVYrZmyFxnfqki4z83hFogzDzJ
	jp6xOFgpHs2tp1rGL77oVi+dwtffhvYBHtws9cu0or81vRfxCGysisa/hybiwOGOjOh5
	cPBJQg+3uDCjTvrbickiGowm1cxbN1znHVnZRmQomqmuWadCnx/3ZU3iZAbV8dPAEvoA
	/14Q==
X-Received: by 10.68.236.100 with SMTP id ut4mr24518094pbc.92.1355965315741;
	Wed, 19 Dec 2012 17:01:55 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.53.92])
	by mx.google.com with ESMTPS id jo6sm297521pbb.5.2012.12.19.17.01.52
	(version=SSLv3 cipher=OTHER); Wed, 19 Dec 2012 17:01:54 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 09:00:26 +0000
Message-ID: <1638569.ITDdzWabfu@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.4 (Linux/3.6.9-1-ARCH; KDE/4.9.4; x86_64; ; )
In-Reply-To: <50D1F76D.4070000@intel.com>
References: <50D1F76D.4070000@intel.com>
MIME-Version: 1.0
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 01:16:49 -0000
Content-Type: multipart/alternative; boundary="nextPart2511996.ppMQ3HUO25"
Content-Transfer-Encoding: 7Bit

--nextPart2511996.ppMQ3HUO25
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

GREAT!!!

I have asked systemd status in yocto, maybe I can use your branch instead!

THANKS!


On Wednesday, December 19, 2012 07:20:45 PM Radu Moisan wrote:

Hi guys,
    I have prepared a branch on poky-contrib (rmoisan/systemd) where I pulled 
systemd from meta-openembedded. The goal is to merge this into oe-core, so 
please take a look and give me your feedback on stuff that needs work or things 
that I might have done wrong, so that I can prepare it for merge.
    At this point core-image-minimal and core-image-sato both boot fine with 
systemd. There still are a few warnings but not critical(at runtime), at least 
in my opinion, you may want to take a look at those too.
    You can activate systemd by  DISTRO_FEATURES_INITMAN = "systemd"

Radu




--nextPart2511996.ppMQ3HUO25
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
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">GRE=
AT!!!</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I h=
ave asked systemd status in yocto, maybe I can use your branch instead!=
</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">THA=
NKS!</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On =
Wednesday, December 19, 2012 07:20:45 PM Radu Moisan wrote:<br /></p>
<p style=3D" margin-top:12px; margin-bottom:12px; margin-left:40px; mar=
gin-right:40px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"=
>Hi guys,<br />=C2=A0=C2=A0=C2=A0 I have prepared a branch on poky-cont=
rib (rmoisan/systemd) where I pulled systemd from meta-openembedded. Th=
e goal is to merge this into oe-core, so please take a look and give me=
 your feedback on stuff that needs work or things that I might have don=
e wrong, so that I can prepare it for merge.<br />=C2=A0=C2=A0=C2=A0 At=
 this point core-image-minimal and core-image-sato both boot fine with =
systemd. There still are a few warnings but not critical(at runtime), a=
t least in my opinion, you may want to take a look at those too.<br />=C2=
=A0=C2=A0=C2=A0 You can activate systemd by=C2=A0 <span style=3D" font-=
size:small; font-weight:600;">DISTRO_FEATURES_INITMAN =3D &quot;systemd=
&quot;</span><br /><br />Radu<br /></p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br=
 /><br /></p></body></html>

--nextPart2511996.ppMQ3HUO25--
