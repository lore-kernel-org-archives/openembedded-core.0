Return-Path: <anjalik@iwavesystems.com>
Received: from sip2-98.nexcess.net (iwavesystems.com [207.32.180.10])
	by mail.openembedded.org (Postfix) with ESMTP id 13614783B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 07:59:02 +0000 (UTC)
Comment: DomainKeys? See http://domainkeys.sourceforge.net/
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=iwavesystems.com;
	b=prUSZ89mrnwp28sKELeJfiFptDbwC3L1z/cxV0nmA0sip++RhouMZARbET+a/6SYAhqAwGhK5txj70Qu6NSPjZaGU0SUsFa6x207592H0iq5qTjmS+QzryPDTQxCfHIkBqTP8YiSdkd1xdMzqmfb0CCX3K8WxJfU1ZNodG3XYMebNn1aFeKAEow/aMrzziZBOUjXDb7Gs+M2PNMCua5YVOsq0Agjc/2dsAZZqQuWSah9T4purl2D2vAc3cPseFXBOafudl+sPWmF9oM0CGJsk4O4Mxzat7q8gyZI/+r4s1l2mWaPeWlRo7UTc9YF4jYg1wXA69t9zAIE7pQeTaEKSA==;
	h=Received:To:Subject:MIME-Version:Content-Type:Date:From:Cc:In-Reply-To:References:Message-ID:X-Sender:User-Agent;
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=iwavesystems.com; h=to
	:subject:mime-version:content-type:date:from:cc:in-reply-to
	:references:message-id; s=default; bh=1oCmRI3BbuaV/qU+QqSWj8Bmvf
	k=; b=0K0LGnGffjgcrJETtk6ZtZEyx0YWvzb5rw2NNuNG9Pxc+m8IQFigloR6o7
	6YVqEc/kNYJQILXfmG5v79+z1w3DtR6E/XV96ACjIfKNqp+lnOWN9cXUHatY3N5y
	FS27hs0nWwyKxYAdNMonKGpK1q02+zonrbM9wS0yYnoz43yDtsHwMHr31IG2y1Xc
	jMBjgpQIegcDiCzMa2z4APP4KMMI5XHk0I0rE7ipsbzAFUHSc9GpB/uq8PhcT0p8
	2MllGax/hKz40OkywXIzUOZ0xfzdbGv7EebJT+hrk8tRn4sF1PzrXTQjdhz16WpS
	iW0QXOsgpRx/phPna7SVkK5MVvuA==
Received: (qmail 30883 invoked by uid 239); 14 Sep 2017 03:59:03 -0400
To: "Burton, Ross" <ross.burton@intel.com>
MIME-Version: 1.0
Date: Thu, 14 Sep 2017 03:59:03 -0400
From: anjalik@iwavesystems.com
In-Reply-To: <CAJTo0LZ7G2easoj9mgdv7VjsE40_Zp8bF6WeMNnitYr2vGBexw@mail.gmail.com>
References: <df4d255a017af31c177f2f6d19cf5724@iwavesystems.com>
	<CAJTo0LZ7G2easoj9mgdv7VjsE40_Zp8bF6WeMNnitYr2vGBexw@mail.gmail.com>
Message-ID: <113edd5bbb1fc884d416783db2d2dfe5@iwavesystems.com>
X-Sender: anjalik@iwavesystems.com (anjalik@iwavesystems.com)
User-Agent: Roundcube Webmail/1.1.2
Cc: john@iwavesystems.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Matchbox in 240x320 LCD Display
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
X-List-Received-Date: Thu, 14 Sep 2017 07:59:03 -0000
Content-Type: multipart/alternative;
	boundary="=_a7d51c581f58eb88093dbe5d537c96d1"

--=_a7d51c581f58eb88093dbe5d537c96d1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

 

Hi , 

 Thank You for the valuable information. 

 Is there any other Window manager instead of matchbox which supports
QVGA theme in Yocto 1.8? 

Thanks & Regards, 

Anjali 

On 13.09.2017 10:33, Burton, Ross wrote: 

> The default theme, fonts, padding etc all assume the screen has a higher resolution than you have. At one point there used to be a qvga theme but that was dropped several years ago. Making the font a lot smaller will solve most of your problems, then you'll have to fix the remaining problems one by one: as you can see the window decoration theme (the green bar) is far too big at QVGA. 
> 
> Ross 
> 
> On 13 September 2017 at 15:15, <anjalik@iwavesystems.com> wrote:
> 
>> Hi, 
>> 
>> Hope I m at the right place asking a query about matchbox in yocto. 
>> 
>> I am using Yocto 1.8 which is working fine in a 640x480 LCD display 
>> 
>> But I have few issues when the same BSP used in a 240x320 LCD display. All the images and fonts are enlarged . 
>> 
>> Attaching few screnschots along with this mail. 
>> 
>> Is there any constraints for matchbox to work on 240x320 display ? 
>> 
>> Awaiting for valuable suggestions. 
>> 
>> Thanks & Regards, 
>> 
>> Anjali 
>> 
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core [1]

 

Links:
------
[1] http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=_a7d51c581f58eb88093dbe5d537c96d1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>Hi ,</p>
<p>&nbsp; Thank You for the valuable information.</p>
<p>&nbsp; Is there any other Window manager instead of matchbox which suppo=
rts QVGA theme in Yocto 1.8?</p>
<p>Thanks &amp; Regards,</p>
<p>Anjali</p>
<p>On 13.09.2017 10:33, Burton, Ross wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><!-- html ignored --><!-- head ignored --><!-- meta ig=
nored -->
<div dir=3D"ltr">The default theme, fonts, padding etc all assume the scree=
n has a higher resolution than you have.&nbsp; At one point there used to b=
e a qvga theme but that was dropped several years ago.&nbsp; Making the fon=
t a lot smaller will solve most of your problems, then you'll have to fix t=
he remaining problems one by one: as you can see the window decoration them=
e (the green bar) is far too big at QVGA.
<div>&nbsp;</div>
<div>Ross</div>
</div>
<div class=3D"gmail_extra"><br />
<div class=3D"gmail_quote">On 13 September 2017 at 15:15, <span>&lt;<a href=
=3D"mailto:anjalik@iwavesystems.com">anjalik@iwavesystems.com</a>&gt;</span=
> wrote:<br />
<blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 .8ex; border-left:=
 1px #ccc solid; padding-left: 1ex;">
<div style=3D"font-size: 10pt; font-family: Verdana,Geneva,sans-serif;">
<p>Hi,</p>
<p>&nbsp; Hope I m at the right place asking a query about matchbox in yoct=
o.</p>
<p>&nbsp; I am using Yocto 1.8 which is working fine in a 640x480 LCD displ=
ay</p>
<p>&nbsp; But I have few issues when the same BSP used in a 240x320 LCD dis=
play. All the images and fonts are enlarged .</p>
<p>&nbsp;Attaching few screnschots along with this mail.</p>
<p>&nbsp;Is there any constraints for matchbox to work on 240x320 display ?=
</p>
<p>&nbsp;</p>
<p>Awaiting for valuable suggestions.</p>
<p>Thanks &amp; Regards,</p>
<p>Anjali</p>
<div>&nbsp;</div>
</div>
<br />--<br /> ______________________________<wbr />_________________<br />=
 Openembedded-core mailing list<br /><a href=3D"mailto:Openembedded-core@li=
sts.openembedded.org">Openembedded-core@lists.<wbr />openembedded.org</a><b=
r /><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-=
core">http://lists.openembedded.org/<wbr />mailman/listinfo/openembedded-<w=
br />core</a><br /><br /></blockquote>
</div>
</div>
</blockquote>
<p>&nbsp;</p>
<div>&nbsp;</div>
</body></html>

--=_a7d51c581f58eb88093dbe5d537c96d1--
