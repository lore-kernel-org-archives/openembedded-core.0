Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-111.rediffmail.com (unknown [203.199.83.114])
	by mail.openembedded.org (Postfix) with ESMTP id 2A92660196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 12:10:09 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-111.rediffmail.com (Postfix) with SMTP id 093532354E2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 11:32:37 +0530 (IST)
Received: (qmail 32368 invoked by uid 510); 25 Jun 2014 07:10:48 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=UVAFVccZ8IIP5ySbNSo0YdH9PGD6T1pFlb5kYCHSK0LMU65K91sIKWcJeMTfRHK/sRB00IDzqGZGyVtndN/bo+ZTYuRXDMBawRDPIIPcxfyyEJuIpL/1RGPiA4hZ84O4zW5/Tno6fhBeEvkiAKGG/q5mFxDFRcyBQKhUE0ZOCg0=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160204.53AA75F8.0217, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 25 Jun 2014 07:10:48 -0000
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	25 Jun 2014 07:10:48 -0000
Message-ID: <1403356395.S.2910.26443.H.TlJvYmVydCBZYW5nAFJlOiBbYml0YmFrZS1kZXZlbF0gSGk_.RU.rfs303,
	rfs303, 637,
	244.f4-235-248.replied.1403680248.32187@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Re: [bitbake-devel] Hi
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
X-List-Received-Date: Mon, 30 Jun 2014 12:10:14 -0000
Content-Type: multipart/alternative;
	boundary="=_cc377b053ab63786cbb44bf1556896ad"

--=_cc377b053ab63786cbb44bf1556896ad
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,

Script in this section is appending just after the COMPRESS_CMD_bz2 command
and the full script is executing as a single command.

I want to run my script separately just after rootfs.tar.bz2 is created.

Please help.

Thanks in advance

From: Robert Yang &lt;liezhi.yang@windriver.com&gt;
Sent: Sat, 21 Jun 2014 18:43:15 
To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;, Patches and discussions about the oe-core layer &lt;openembedded-core@lists.openembedded.org&gt;
Subject: Re: [bitbake-devel] Hi


Hello,



I think that this email should go into oe-core mailing list (see

the CC). You can refer to:



oe-core/meta/classes/image_types.bbclass:



IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C 

${IMAGE_ROOTFS} ."

COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"



I think that you can add something like the following to your recipe:



COMPRESS_CMD_bz2_append () {

&nbsp;&nbsp;&nbsp;&lt;your shell script&gt;

}



Then the script would run after the .tar.bz2 is created.



// Robert



On 06/21/2014 08:26 PM, Himanshu Pandey wrote:

&gt; Hi,

&gt;

&gt; I have a requirement that once the .tar.bz2 is created I want my shell script to

&gt; be executed finally.

&gt;

&gt; So where do I have to add this?

&gt;

&gt; So what I have to do in order to achieve this.

&gt;

&gt; Regards,

&gt; Himanshu Pandey

&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company email.

&gt; &nbsp;&nbsp;&nbsp;*Know More &gt;*

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt;

&gt;

&gt;


--=_cc377b053ab63786cbb44bf1556896ad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

Hi,<br><br>Script in this section is appending just after the COMPRESS_CMD_=
bz2 command<br>and the full script is executing as a single command.<br><br=
>I want to run my script separately just after rootfs.tar.bz2 is created.<b=
r><br>Please help.<br><br>Thanks in advance<br><br>From: Robert Yang &lt;li=
ezhi.yang@windriver.com&gt;<br>Sent: Sat, 21 Jun 2014 18:43:15 <br>To: Hima=
nshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;, Patches and discussio=
ns about the oe-core layer &lt;openembedded-core@lists.openembedded.org&gt;=
<br>Subject: Re: [bitbake-devel] Hi<br><br>
Hello,<br>
<br>
I think that this email should go into oe-core mailing list (see<br>
the CC). You can refer to:<br>
<br>
oe-core/meta/classes/image_types.bbclass:<br>
<br>
IMAGE_CMD_tar =3D "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C=
 <br>
${IMAGE_ROOTFS} ."<br>
COMPRESS_CMD_bz2 =3D "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"<br>
<br>
I think that you can add something like the following to your recipe:<br>
<br>
COMPRESS_CMD_bz2_append () {<br>
&nbsp;&nbsp;&nbsp;&lt;your shell script&gt;<br>
}<br>
<br>
Then the script would run after the .tar.bz2 is created.<br>
<br>
// Robert<br>
<br>
On 06/21/2014 08:26 PM, Himanshu Pandey wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have a requirement that once the .tar.bz2 is created I want my shell=
 script to<br>
&gt; be executed finally.<br>
&gt;<br>
&gt; So where do I have to add this?<br>
&gt;<br>
&gt; So what I have to do in order to achieve this.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Himanshu Pandey<br>
&gt;<br>
&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail=
.com/signatureline.htm@Middle?&gt;<br>
&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app wit=
h Company email.<br>
&gt; &nbsp;&nbsp;&nbsp;*Know More &gt;*<br>
&gt; &lt;http://track.rediff.com/click?url=3D___http://businessemail.rediff=
.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10=
-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
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

--=_cc377b053ab63786cbb44bf1556896ad--
