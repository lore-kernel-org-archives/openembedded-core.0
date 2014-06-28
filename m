Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-122.rediffmail.com (unknown [203.199.83.122])
	by mail.openembedded.org (Postfix) with ESMTP id 499DC60030
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 04:05:11 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-122.rediffmail.com (Postfix) with SMTP id 1E1AB30802D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 09:26:40 +0530 (IST)
Received: (qmail 18219 invoked by uid 510); 28 Jun 2014 04:04:57 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=St3Ef+ESbo5jRNFYrUHFQQayj2d7K/BNuBavJNIxCTKCmhfEcLc+JQTf0WsrfpOOFMYT44pxdKWnUWQth6TrFVAaMiCdzoAI2NcQ/BQCBAbMi55/8oc5f9cNisgtwFWIZOkKL+FYOUVC4m1xeuU/nBxZSjILoFTU5qgIXchbhRQ=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160205.53AE3EE9.0017, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 28 Jun 2014 04:04:56 -0000
MIME-Version: 1.0
To: "Mats K rrman " <Mats.Karrman@tritech.se>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 122.177.77.183 by rediffmail.com via HTTP;
	28 Jun 2014 04:04:56 -0000
Message-ID: <1403871626.S.1994.10180.H.Tk1hdHMgS~Rycm1hbgBSRTogW09FLWNvcmVdIEhp.RU.rfs303,
	rfs303, 732,
	588.f4-234-218.old.1403928296.18095@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Re: Hi
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
X-List-Received-Date: Sat, 28 Jun 2014 04:05:13 -0000
Content-Type: multipart/alternative;
	boundary="=_04abeeec90a2a5dff51894124e9f3b4b"

--=_04abeeec90a2a5dff51894124e9f3b4b
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

But I don't have meta-networking directory in my poky-dora-10.0.0

From: Mats K  rrman &lt;Mats.Karrman@tritech.se&gt;
Sent: Fri, 27 Jun 2014 17:50:26 
To: "Himanshu  Pandey" &lt;pandey_himanshu80@rediffmail.com&gt;, "openembedded-core@lists.openembedded.org" &lt;openembedded-core@lists.openembedded.org&gt;
Subject: Re: [OE-core] Hi
Hi Himanshu,



On Friday, June 27, 2014 1:14 PM, Himanshu Pandey wrote:

&gt; Can some one help me to write a receipe with all these requirements?



How about starting out with meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb and add your own .bbappend to tweak the things you must?



BR // Mats


--=_04abeeec90a2a5dff51894124e9f3b4b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

But I don't have meta-networking directory in my poky-dora-10.0.0<br><br>Fr=
om: Mats K  rrman &lt;Mats.Karrman@tritech.se&gt;<br>Sent: Fri, 27 Jun 2014=
 17:50:26 <br>To: "Himanshu  Pandey" &lt;pandey_himanshu80@rediffmail.com&g=
t;, "openembedded-core@lists.openembedded.org" &lt;openembedded-core@lists.=
openembedded.org&gt;<br>Subject: Re: [OE-core] Hi<br>Hi Himanshu,<br>
<br>
On Friday, June 27, 2014 1:14 PM, Himanshu Pandey wrote:<br>
&gt; Can some one help me to write a receipe with all these requirements?<b=
r>
<br>
How about starting out with meta-networking/recipes-protocols/pptp-linux/pp=
tp-linux_1.7.2.bb and add your own .bbappend to tweak the things you must?<=
br>
<br>
BR // Mats<br>
<br><A HREF=3D"http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.redi=
ffmail.com/signatureline.htm@Middle?" target=3D"_blank"><IMG SRC=3D"http://=
sigads.rediff.com/RealMedia/ads/adstream_nx.ads/www.rediffmail.com/signatur=
eline.htm@Middle"></A><table cellpadding=3D"0" cellspacing=3D"0"><tbody><tr=
><td><div style=3D"font-family: Arial, Helvetica, sans-serif; font-size:14p=
x">Get your own <span style=3D"padding-bottom: 0px; background-color: #cc00=
00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, s=
ans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></=
span> website,  <span style=3D"padding-bottom: 0px; background-color: #c00;=
 padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans=
-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></spa=
n> domain &amp; <span style=3D"padding-bottom: 0px; background-color: #c00;=
 padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans=
-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></spa=
n> mobile app with Company email. &nbsp;</div></td><td><a href=3D"http://tr=
ack.rediff.com/click?url=3D___http://businessemail.rediff.com/email-ids-for=
-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13___&cmp=3Dhost&=
lnk=3Dsign-1-10-13&nsrv1=3Dhost" style=3D"font-family: Arial, Helvetica, sa=
ns-serif; color: #fff; font-size: 14px; color:#0000cc" target=3D"_blank"><b=
>Know More ></b></a><!-- <in-put type=3D"button" cl-ass=3D"button" on-click=
=3D"parent.location=3D&#39;http://track.rediff.com/click?url=3D___http://bu=
sinessemail.rediff.com/company-email-hosting-services?sc_cid=3Dsignature-23=
-9-13___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhos=
t&#39;" value=3D"Know more &gt;"> </input> --></td></tr></tbody></table>

--=_04abeeec90a2a5dff51894124e9f3b4b--
