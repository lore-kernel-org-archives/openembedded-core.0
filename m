Return-Path: <pab@pabigot.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Apr 2015 13:05:05 UTC
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 64C0B605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 13:05:05 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id Ccxx1q00G0BVjqb01cxyAL; Mon, 06 Apr 2015 05:57:58 -0700
Message-ID: <552282D7.6040108@pabigot.com>
Date: Mon, 06 Apr 2015 07:57:59 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1428070227.git.cristian.iorga@intel.com>	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Mon, 06 Apr 2015 13:05:07 -0000
Content-Type: multipart/alternative;
	boundary="------------010105000406060308010606"

--------------010105000406060308010606
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 04/06/2015 02:31 AM, Iorga, Cristian wrote:
>
> I thought of 1.9 as the preparatory stage for complete removal of 
> bluez4, so that in 2.0 it would be very easy to remove the support for 
> bluez4. Continuing to have bluez5 added to DISTRO_FEATURES create the 
> impression that BlueZ5 is still a second class citizen compared to 
> BlueZ4, and it is not my intention to sustain this opinion via code.
>
> I hereby standup for my solution. At the moment, we are 1to1. “We 
> think” – Who are the others persons, Ross?
>
> /Cristian
>

While I fully support moving to bluez5 and use it in all my images, I do 
think it's a bit abrupt to make it the default in the first stable 
release that provides a usable bluez5.  On the other hand, Yocto's late 
to the bluez5 party and it's going to be harder to support bluez4 now.

Six of one; sign me up as weak support for delaying the move to default 
bluez5 until 1.10.

Just an opinion.

Peter
>
> *From:*Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* Monday, April 6, 2015 12:41 AM
> *To:* Iorga, Cristian
> *Cc:* OE-core
> *Subject:* Re: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as 
> the default BT stack
>
> On 3 April 2015 at 15:13, Cristian Iorga <cristian.iorga@intel.com 
> <mailto:cristian.iorga@intel.com>> wrote:
>
>     -# Define a variable that expands to the recipe (package)
>     providing core
>     -# bluetooth support on the platform:
>     +# Define a variable that expands to the recipe (package) providing
>     +# core bluetooth support on the platform:
>      # "" if bluetooth is not in DISTRO_FEATURES
>     -# else "bluez5" if bluez5 is in DISTRO_FEATURES
>     -# else "bluez4"
>     +# else "bluez4" if bluez4 is in DISTRO_FEATURES
>     +# else "bluez5"
>
>
> That wasn't the behaviour that 1.8 sets.  We think we should continue 
> to respect the bluez5 DISTRO_FEATURE and add it to 
> DISTRO_FEATURES_BACKFILL.
>
> Ross
>
>
>


--------------010105000406060308010606
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 04/06/2015 02:31 AM, Iorga, Cristian
      wrote:<br>
    </div>
    <blockquote
cite="mid:969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D">I
            thought of 1.9 as the preparatory stage for complete removal
            of bluez4, so that in 2.0 it would be very easy to remove
            the support for bluez4. Continuing to have bluez5 added to
            DISTRO_FEATURES create the impression that BlueZ5 is still a
            second class citizen compared to BlueZ4, and it is not my
            intention to sustain this opinion via code.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D">I
            hereby standup for my solution. At the moment, we are 1to1.
            “We think” – Who are the others persons, Ross?<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D">/Cristian</span></p>
      </div>
    </blockquote>
    <br>
    While I fully support moving to bluez5 and use it in all my images,
    I do think it's a bit abrupt to make it the default in the first
    stable release that provides a usable bluez5.  On the other hand,
    Yocto's late to the bluez5 party and it's going to be harder to
    support bluez4 now.<br>
    <br>
    Six of one; sign me up as weak support for delaying the move to
    default bluez5 until 1.10.<br>
    <br>
    Just an opinion.<br>
    <br>
    Peter
    <blockquote
cite="mid:969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p></o:p></span></p>
        <p class="MsoNormal"><a moz-do-not-send="true"
            name="_MailEndCompose"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p></o:p></span></a></p>
        <p class="MsoNormal" style="margin-left:.5in"><b><span
              style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
            Burton, Ross [<a class="moz-txt-link-freetext" href="mailto:ross.burton@intel.com">mailto:ross.burton@intel.com</a>]
            <br>
            <b>Sent:</b> Monday, April 6, 2015 12:41 AM<br>
            <b>To:</b> Iorga, Cristian<br>
            <b>Cc:</b> OE-core<br>
            <b>Subject:</b> Re: [OE-core] [PATCH 5/5] bluetooth.bbclass:
            set bluez5 as the default BT stack<o:p></o:p></span></p>
        <p class="MsoNormal" style="margin-left:.5in"><o:p> </o:p></p>
        <div>
          <div>
            <p class="MsoNormal" style="margin-left:.5in"><o:p> </o:p></p>
            <div>
              <p class="MsoNormal" style="margin-left:.5in">On 3 April
                2015 at 15:13, Cristian Iorga &lt;<a
                  moz-do-not-send="true"
                  href="mailto:cristian.iorga@intel.com" target="_blank">cristian.iorga@intel.com</a>&gt;
                wrote:<o:p></o:p></p>
              <blockquote style="border:none;border-left:solid #CCCCCC
                1.0pt;padding:0in 0in 0in
                6.0pt;margin-left:4.8pt;margin-right:0in">
                <div id=":98">
                  <p class="MsoNormal" style="margin-left:.5in">-#
                    Define a variable that expands to the recipe
                    (package) providing core<br>
                    -# bluetooth support on the platform:<br>
                    +# Define a variable that expands to the recipe
                    (package) providing<br>
                    +# core bluetooth support on the platform:<br>
                     # "" if bluetooth is not in DISTRO_FEATURES<br>
                    -# else "bluez5" if bluez5 is in DISTRO_FEATURES<br>
                    -# else "bluez4"<br>
                    +# else "bluez4" if bluez4 is in DISTRO_FEATURES<br>
                    +# else "bluez5"<o:p></o:p></p>
                </div>
              </blockquote>
            </div>
            <p class="MsoNormal" style="margin-left:.5in"><br>
              That wasn't the behaviour that 1.8 sets.  We think we
              should continue to respect the bluez5 DISTRO_FEATURE and
              add it to DISTRO_FEATURES_BACKFILL.<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal" style="margin-left:.5in"><o:p> </o:p></p>
          </div>
          <div>
            <p class="MsoNormal" style="margin-left:.5in">Ross<o:p></o:p></p>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------010105000406060308010606--
