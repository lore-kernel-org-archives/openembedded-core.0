Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.77])
	by mail.openembedded.org (Postfix) with SMTP id 8105C609B2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 02:25:06 +0000 (UTC)
Received: (qmail 30092 invoked by uid 510); 1 Jul 2014 02:24:56 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=Z1RuzU1sqQUTxkfCQdrH8KTSEZf2oRkO9UVrtmn5zpAv66+ALcAC4kYa/lc4Fi9eTLcTHNTmXJteeP1mobnR8XryC4ER1fZg+VnAwmtq5GlH8766Vek5KS50apgI1rlfHVSj+w7o9jCxcw6RcvS0IpDJBUmuR5Ck2S2iCZ2AsTg=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160203.53B21BF7.001B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 1 Jul 2014 02:24:55 -0000
MIME-Version: 1.0
To: "Henning Heinold " <henning@itconsulting-heinold.de>
Received: from unknown 122.177.151.163 by rediffmail.com via HTTP;
	01 Jul 2014 02:24:55 -0000
Message-ID: <1404156712.S.4100.6220.H.Tkhlbm5pbmcgSGVpbm9sZABSZTogW09FLWNvcmVdIFJlYWdyZGluZyBtZXRhLW5ldHdvcmtpbmc_.RU.rfs301,
	rfs301, 416,
	31.f4-234-181.old.1404181495.30000@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Reagrding meta-networking
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
X-List-Received-Date: Tue, 01 Jul 2014 02:25:11 -0000
Content-Type: multipart/alternative;
	boundary="=_05f28f0219491af53919271fbe22e547"

--=_05f28f0219491af53919271fbe22e547
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

So, do I have to set&nbsp;IMAGE_INSTALL variable in local.conf and&nbsp;packagename_XXXXX is what to be followed for the addition of each package.
Regards,Himanshu

From: Henning Heinold &lt;henning@itconsulting-heinold.de&gt;
Sent: Tue, 01 Jul 2014 01:01:52 
To: "openembedded-core@lists.openembedded.org" &lt;openembedded-core@lists.openembedded.org&gt;
Subject: Re: [OE-core] Reagrding meta-networking
On Mon, Jun 30, 2014 at 01:29:26PM -0000, Himanshu &nbsp;Pandey wrote:

&gt; Hi,

&gt; 

&gt; Since I want dhcp and pppoe, so I downloaded the same from git and included meta-networking layer in bblayers.conf. This layer is getting compiled but somehow dhcp and pppoe are not getting included in the final image. So what I have to do inorder to add dhcp and pppoe in the final image.

&gt; 

&gt; Please help.

&gt; 

&gt; Regards,

&gt; Himanshu



IMAGE_INSTALL += "packagename_dhcp packagname_pppoe"



Be aware that recipe(bb)-name is mostly not the resulting packagename.



Bye Henning

-- 

_______________________________________________

Openembedded-core mailing list

Openembedded-core@lists.openembedded.org

http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=_05f28f0219491af53919271fbe22e547
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

So, do I have to set&nbsp;<span style=3D"font-family: sans-serif; font-size=
: 14px; background-color: rgb(255, 255, 255);">IMAGE_INSTALL variable in lo=
cal.conf and&nbsp;</span>packagename_XXXXX is what to be followed for the a=
ddition of each package.<div><br></div><div>Regards,</div><div>Himanshu<br>=
<br>From: Henning Heinold &lt;henning@itconsulting-heinold.de&gt;<br>Sent: =
Tue, 01 Jul 2014 01:01:52 <br>To: "openembedded-core@lists.openembedded.org=
" &lt;openembedded-core@lists.openembedded.org&gt;<br>Subject: Re: [OE-core=
] Reagrding meta-networking<br>On Mon, Jun 30, 2014 at 01:29:26PM -0000, Hi=
manshu &nbsp;Pandey wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Since I want dhcp and pppoe, so I downloaded the same from git and inc=
luded meta-networking layer in bblayers.conf. This layer is getting compile=
d but somehow dhcp and pppoe are not getting included in the final image. S=
o what I have to do inorder to add dhcp and pppoe in the final image.<br>
&gt; <br>
&gt; Please help.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Himanshu<br>
<br>
IMAGE_INSTALL +=3D "packagename_dhcp packagname_pppoe"<br>
<br>
Be aware that recipe(bb)-name is mostly not the resulting packagename.<br>
<br>
Bye Henning<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
http://lists.openembedded.org/mailman/listinfo/openembedded-core<br>
</div><br><A HREF=3D"http://sigads.rediff.com/RealMedia/ads/click_nx.ads/ww=
w.rediffmail.com/signatureline.htm@Middle?" target=3D"_blank"><IMG SRC=3D"h=
ttp://sigads.rediff.com/RealMedia/ads/adstream_nx.ads/www.rediffmail.com/si=
gnatureline.htm@Middle"></A><table cellpadding=3D"0" cellspacing=3D"0"><tbo=
dy><tr><td><div style=3D"font-family: Arial, Helvetica, sans-serif; font-si=
ze:14px">Get your own <span style=3D"padding-bottom: 0px; background-color:=
 #cc0000; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvet=
ica, sans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE=
</b></span> website,  <span style=3D"padding-bottom: 0px; background-color:=
 #c00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica=
, sans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b=
></span> domain &amp; <span style=3D"padding-bottom: 0px; background-color:=
 #c00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica=
, sans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b=
></span> mobile app with Company email. &nbsp;</div></td><td><a href=3D"htt=
p://track.rediff.com/click?url=3D___http://businessemail.rediff.com/email-i=
ds-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13___&cmp=
=3Dhost&lnk=3Dsign-1-10-13&nsrv1=3Dhost" style=3D"font-family: Arial, Helve=
tica, sans-serif; color: #fff; font-size: 14px; color:#0000cc" target=3D"_b=
lank"><b>Know More ></b></a><!-- <in-put type=3D"button" cl-ass=3D"button" =
on-click=3D"parent.location=3D&#39;http://track.rediff.com/click?url=3D___h=
ttp://businessemail.rediff.com/company-email-hosting-services?sc_cid=3Dsign=
ature-23-9-13___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsr=
v1=3Dhost&#39;" value=3D"Know more &gt;"> </input> --></td></tr></tbody></t=
able>

--=_05f28f0219491af53919271fbe22e547--
