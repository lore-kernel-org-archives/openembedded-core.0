Return-Path: <jpewhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Joshua Watt" <JPEWhacker@gmail.com>
Subject: Re: [External] Re: SPDX Data Fields in Open Embedded
References: <TYZPR03MB6077C29F32661014C935B01AC6B09@TYZPR03MB6077.apcprd03.prod.outlook.com>
 <CAJdd5Ga=85PyVEscBAKD9=WA22ED6mx6J_h7tRsEmD-q+o5wkQ@mail.gmail.com>
 <TYZPR03MB6077FE219A381756250DFD3BC6B09@TYZPR03MB6077.apcprd03.prod.outlook.com>
Message-ID: <71207551-410c-820b-f047-74de33d90e3f@gmail.com>
Date: Wed, 6 Oct 2021 15:17:09 -0500
MIME-Version: 1.0
In-Reply-To: <TYZPR03MB6077FE219A381756250DFD3BC6B09@TYZPR03MB6077.apcprd03.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------FC94687A7217AF551EEAE599"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Christopher Lusk <clusk@lenovo.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

--------------FC94687A7217AF551EEAE599
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable


On 10/6/21 1:51 PM, Christopher Lusk wrote:
>
> Below you will find a sample of the output that I am generating using=20
> the create-spdx.bbclass found within oe-core and layers like=20
> meta-doubleopen:
>
> Sample output:
>
> Text Description automatically generated with medium confidence
>
> The data field names do not match up with those set forth by the Linux=20
> Foundation for SPDX output related to SBOMs (below), i.e. name should=20
> appear as PackageName and version information would appear as=20
> PackageVersion instead of the versionInfo =A0shown above.
>
Those fields are when the SPDX document is in "tag" format. We chose to=20
write our documents in JSON format because it is much easier to deal=20
with programmatically. Even though the JSON format is not described in=20
the SPDX documentation, my understanding is that it is an allowed format=20
(you can find the schema here:=20
https://github.com/spdx/spdx-spec/blob/development/v2.2.2/schemas/spdx-sche=
ma.json),=20
and most of the SPDX tools are able to handle JSON input as well.


If you really want tag format, I believe there are SPDX tools that can=20
convert from JSON to tag format for you


> In addition to this, I was curious to know if there are plans to=20
> update the Yocto where SPDX output would map to and populate all data=20
> fields related to the NTIA=92s minimum and recommended fields for an=20
> SBOM=20
> (https://www.ntia.doc.gov/files/ntia/publications/sbom_minimum_elements_r=
eport.pdf=20
> <https://www.ntia.doc.gov/files/ntia/publications/sbom_minimum_elements_r=
eport.pdf>)?=20
>
>

We have a large amount of SBOM information that we can provide, and I=20
think we would like to eventually make it possible to include all of it.=20
I cannot say whether that is a sufficient amount of information to=20
satisfy any particular government or organization requirements. Someone=20
would need to perform an evaluation of each particular set of=20
requirements, and ideally share the results back with us.


I am unaware if anyone has evaluated that *specific* document to see if=20
what we produce would satisfy the requirements listed there (if they=20
have, perhaps they can chime in). If that is something you have interest=20
in, you might consider doing that evaluation and sharing it with us;=20
from there we can determine what the next steps might be if there are=20
areas where we are deficient.


> Thanks.
>
> ------------------------------------------------------------------------
>
> *Christopher D. Lusk*
> Product Security Analyst
> Product Security Office
> Lenovo
>
> =09
>
>
> Emailclusk@lenovo.com <mailto:clusk@lenovo.com>
>
> Lenovo.com <http://www.lenovo.com/>
> Twitter <http://twitter.com/lenovo>|Instagram=20
> <https://instagram.com/lenovo>|Facebook=20
> <http://www.facebook.com/lenovo>|Linkedin=20
> <http://www.linkedin.com/company/lenovo>|YouTube=20
> <http://www.youtube.com/lenovovision>|Privacy=20
> <https://www.lenovo.com/gb/en/privacy-selector/>
>
> =09
>
> =09
>
> *From:* Joshua Watt <jpewhacker@gmail.com>
> *Sent:* Wednesday, October 6, 2021 10:56 AM
> *To:* Christopher Lusk <clusk@lenovo.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* [External] Re: SPDX Data Fields in Open Embedded
>
> On Wed, Oct 6, 2021 at 9:44 AM Christopher Lusk <clusk@lenovo.com=20
> <mailto:clusk@lenovo.com>> wrote:
>
>     Hello all,
>
>     I am reaching out to inquire about an issue I have experienced as
>     it relates to SPDX output from the oe-core build process and
>     specifically the create-spdx.bbclass output.=A0 The data fields in
>     the output that I have produced do not line up with the SPDX data
>     field standards (see below) set forth by the Linux Foundation.
>
>     My question is if there are plans to update the create-spdx code
>     so that the output fields align with those set forth by both NTIA
>     and Linux Foundation?
>
>     *SPDX Mapped Field*
>
>     PackageSupplier:
>
>     PackageName:
>
>     PackageVersion:
>
>     SPDXID:
>
>     Relationship: CONTAINS
>
>     Creator:
>
>     PackageChecksum:
>
> Can you be a little more specific and possibly provide examples of=20
> what you are expecting to see and what it is actually generating? We=20
> are trying to adhere to the SPDX spec, but it is possible there is=20
> something we misinterpreted or are doing incorrectly.
>
>     Source -
>     https://www.ntia.gov/files/ntia/publications/ntia_sbom_formats_and_st=
andards_whitepaper_-_version_20191025.pdf
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.ntia.gov%2Ffiles%2Fntia%2Fpublications%2Fntia_sbom_formats_and_standard=
s_whitepaper_-_version_20191025.pdf&data=3D04%7C01%7Cclusk%40lenovo.com%7Cb=
db17ccb86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%=
7C637691289675514957%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DSSFfnZyYjwTHpOiNK7tcoxQ=
4Yhy1PGUlE0PhQlrhdYE%3D&reserved=3D0>
>
>     Thanks.
>
>     ---------------------------------------------------------------------=
---
>
>     *Christopher D. Lusk*
>     Product Security Analyst
>     Product Security Office
>     Lenovo
>
>     =09
>
>
>     Emailclusk@lenovo.com <mailto:clusk@lenovo.com>
>
>     Lenovo.com <http://www.lenovo.com/>
>     Twitter
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Ft=
witter.com%2Flenovo&data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17ccb86184605f=
9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C63769128967551=
4957%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DMQ%2BN6B3o9Wb7xBXpiz2pw%2B4FjqKEPQ9d7CU=
zrhYadsk%3D&reserved=3D0>|Instagram
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
instagram.com%2Flenovo&data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17ccb861846=
05f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C63769128967=
5524920%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3Dpkt6VXw51nW7eKxiGFgM3sDBfa%2Bbp9KQDe=
0fDpjyo%2FY%3D&reserved=3D0>|Facebook
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw=
ww.facebook.com%2Flenovo&data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17ccb8618=
4605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C637691289=
675524920%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3DSSQrE%2BtzY3IEs%2Fmdlyu49Dum1d6%2B=
fMSN3IGaS72to40%3D&reserved=3D0>|Linkedin
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw=
ww.linkedin.com%2Fcompany%2Flenovo&data=3D04%7C01%7Cclusk%40lenovo.com%7Cbd=
b17ccb86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7=
C637691289675534868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3D4YpV9mUkTRhb1OmxdTjScTtt=
Vntx5obeG1OD3z10iRM%3D&reserved=3D0>|YouTube
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw=
ww.youtube.com%2Flenovovision&data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17cc=
b86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C6376=
91289675544819%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3D6uSGD%2Frt%2Bm6Hgin%2FS7J6qoX=
JbzJS7lKQSxQ7spR6B%2BY%3D&reserved=3D0>|Privacy
>     <https://www.lenovo.com/gb/en/privacy-selector/>
>
>     =09
>
>     =09
>

--------------FC94687A7217AF551EEAE599
Content-Type: multipart/related;
 boundary="------------4FE146A16FDA0844A313A7D9"

--------------4FE146A16FDA0844A313A7D9
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10/6/21 1:51 PM, Christopher Lusk
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:TYZPR03MB6077FE219A381756250DFD3BC6B09@TYZPR03MB6077.apcprd03.p=
rod.outlook.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"Helvetica Neue";}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">Below you will find a sample of the output
          that I am generating using the create-spdx.bbclass found
          within oe-core and layers like meta-doubleopen:<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Sample output:<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal"><img style=3D"width:5.0555in;height:4.2986in"
            id=3D"Picture_x0020_6"
            src=3D"cid:part1.73C8450B.15B9BF3E@gmail.com" alt=3D"Text
            Description automatically generated with medium confidence"
            class=3D"" width=3D"485" height=3D"413"><o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">The data field names do not match up with
          those set forth by the Linux Foundation for SPDX output
          related to SBOMs (below), i.e. name should appear as
          PackageName and version information would appear as
          PackageVersion instead of the versionInfo =A0shown above.<o:p></o=
:p></p>
      </div>
    </blockquote>
    <p>Those fields are when the SPDX document is in "tag" format. We
      chose to write our documents in JSON format because it is much
      easier to deal with programmatically. Even though the JSON format
      is not described in the SPDX documentation, my understanding is
      that it is an allowed format (you can find the schema here:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/spdx/spdx-spe=
c/blob/development/v2.2.2/schemas/spdx-schema.json">https://github.com/spdx=
/spdx-spec/blob/development/v2.2.2/schemas/spdx-schema.json</a>),
      and most of the SPDX tools are able to handle JSON input as well.</p>
    <p><br>
    </p>
    <p>If you really want tag format, I believe there are SPDX tools
      that can convert from JSON to tag format for you<br>
    </p>
    <br>
    <blockquote type=3D"cite"
cite=3D"mid:TYZPR03MB6077FE219A381756250DFD3BC6B09@TYZPR03MB6077.apcprd03.p=
rod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">In addition to this, I was curious to know
          if there are plans to update the Yocto where SPDX output would
          map to and populate all data fields related to the NTIA=92s
          minimum and recommended fields for an SBOM (<a
href=3D"https://www.ntia.doc.gov/files/ntia/publications/sbom_minimum_eleme=
nts_report.pdf"
            moz-do-not-send=3D"true">https://www.ntia.doc.gov/files/ntia/pu=
blications/sbom_minimum_elements_report.pdf</a>)?
        </p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>We have a large amount of SBOM information that we can provide,
      and I think we would like to eventually make it possible to
      include all of it. I cannot say whether that is a sufficient
      amount of information to satisfy any particular government or
      organization requirements. Someone would need to perform an
      evaluation of each particular set of requirements, and ideally
      share the results back with us.<br>
    </p>
    <p><br>
    </p>
    <p> I am unaware if anyone has evaluated that *specific* document to
      see if what we produce would satisfy the requirements listed there
      (if they have, perhaps they can chime in). If that is something
      you have interest in, you might consider doing that evaluation and
      sharing it with us; from there we can determine what the next
      steps might be if there are areas where we are deficient.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:TYZPR03MB6077FE219A381756250DFD3BC6B09@TYZPR03MB6077.apcprd03.p=
rod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal">Thanks. =A0<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <table class=3D"MsoNormalTable" style=3D"border-collapse:collapse"
          cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
          <tbody>
            <tr>
              <td colspan=3D"3" style=3D"padding:0in 0in 0in 0in">
                <div style=3D"margin-top:15.0pt;margin-bottom:15.0pt">
                  <div class=3D"MsoNormal" style=3D"text-align:center"
                    align=3D"center"><span
                      style=3D"font-size:10.5pt;font-family:&quot;Helvetica
                      Neue&quot;;color:#333333">
                      <hr width=3D"100%" size=3D"1" align=3D"center">
                    </span></div>
                </div>
              </td>
            </tr>
            <tr>
              <td style=3D"width:300.0pt;padding:0in 0in 0in 0in"
                width=3D"400" valign=3D"top">
                <table class=3D"MsoNormalTable"
                  style=3D"width:300.0pt;border-collapse:collapse"
                  width=3D"400" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0">
                  <tbody>
                    <tr>
                      <td style=3D"width:150.0pt;padding:0in 0in 0in 0in"
                        width=3D"200" valign=3D"top">
                        <p class=3D"MsoNormal"><b><span
style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#4=
04040">Christopher
                              D. Lusk</span></b><br>
                          <span
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">Product
                            Security Analyst</span><br>
                          <span
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">Product
                            Security Office<br>
                            Lenovo</span><o:p></o:p></p>
                      </td>
                      <td style=3D"width:150.0pt;padding:0in 0in 0in 0in"
                        width=3D"200" valign=3D"top">
                        <p class=3D"MsoNormal"><br>
                          <img style=3D"width:.243in;height:.0902in"
                            id=3D"_x0000_i1030"
                            src=3D"cid:part3.ED8D5CA0.19EAEF30@gmail.com"
                            alt=3D"Email" class=3D"" width=3D"23" height=3D=
"9"
                            border=3D"0"><a href=3D"mailto:clusk@lenovo.com"
                            target=3D"_blank" moz-do-not-send=3D"true"><span
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040;text-decoration:none">clusk@lenovo.com</span></a><o:p></o:p></p>
                      </td>
                    </tr>
                    <tr>
                      <td colspan=3D"2" style=3D"padding:0in 0in 0in 0in">
                        <p class=3D"MsoNormal">=A0<o:p></o:p></p>
                      </td>
                    </tr>
                    <tr>
                      <td colspan=3D"2" style=3D"padding:0in 0in 0in 0in"
                        valign=3D"top">
                        <p class=3D"MsoNormal"><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
                              href=3D"http://www.lenovo.com/"
                              target=3D"_blank" moz-do-not-send=3D"true"><s=
pan
                                style=3D"color:#404040">Lenovo.com</span></=
a><br>
                            <a href=3D"http://twitter.com/lenovo"
                              target=3D"_blank" moz-do-not-send=3D"true"><s=
pan
                                style=3D"color:#404040">Twitter</span></a><=
/span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
                              href=3D"https://instagram.com/lenovo"
                              target=3D"_blank" moz-do-not-send=3D"true"><s=
pan
                                style=3D"color:#404040">Instagram</span></a=
></span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
                              href=3D"http://www.facebook.com/lenovo"
                              target=3D"_blank" moz-do-not-send=3D"true"><s=
pan
                                style=3D"color:#404040">Facebook</span></a>=
</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"http://www.linkedin.com/company/lenovo" target=3D"_blank"
                              moz-do-not-send=3D"true"><span
                                style=3D"color:#404040">Linkedin</span></a>=
</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
                              href=3D"http://www.youtube.com/lenovovision"
                              target=3D"_blank" moz-do-not-send=3D"true"><s=
pan
                                style=3D"color:#404040">YouTube</span></a><=
/span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"https://www.lenovo.com/gb/en/privacy-selector/" target=3D"_blank"
                              moz-do-not-send=3D"true"><span
                                style=3D"color:#404040">Privacy</span></a><=
o:p></o:p></span></p>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </td>
              <td style=3D"background:white;padding:0in 0in 0in 0in"
                valign=3D"top">
                <div align=3D"right">
                  <table class=3D"MsoNormalTable"
                    style=3D"border-collapse:collapse" cellspacing=3D"0"
                    cellpadding=3D"0" border=3D"0">
                    <tbody>
                      <tr>
                        <td style=3D"padding:0in 0in 0in 0in" valign=3D"top=
">
                          <p class=3D"MsoNormal"><img
                              style=3D"width:3.375in;height:1.7083in"
                              id=3D"Picture_x0020_1"
                              src=3D"cid:part12.B9109AD0.481F01F3@gmail.com"
                              class=3D"" width=3D"324" height=3D"164"
                              border=3D"0"><o:p></o:p></p>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </td>
              <td style=3D"padding:0in 0in 0in 0in"><br>
              </td>
            </tr>
          </tbody>
        </table>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <div style=3D"border:none;border-top:solid #E1E1E1
          1.0pt;padding:3.0pt 0in 0in 0in">
          <p class=3D"MsoNormal"><b>From:</b> Joshua Watt
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jpewhacker@gm=
ail.com">&lt;jpewhacker@gmail.com&gt;</a> <br>
            <b>Sent:</b> Wednesday, October 6, 2021 10:56 AM<br>
            <b>To:</b> Christopher Lusk <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:clusk@lenovo.com">&lt;clusk@lenovo.com&gt;</a><br>
            <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembe=
dded.org</a><br>
            <b>Subject:</b> [External] Re: SPDX Data Fields in Open
            Embedded<o:p></o:p></p>
        </div>
        <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
        <div>
          <div>
            <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
          </div>
          <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
          <div>
            <div>
              <p class=3D"MsoNormal">On Wed, Oct 6, 2021 at 9:44 AM
                Christopher Lusk &lt;<a href=3D"mailto:clusk@lenovo.com"
                  moz-do-not-send=3D"true">clusk@lenovo.com</a>&gt; wrote:<=
o:p></o:p></p>
            </div>
            <blockquote style=3D"border:none;border-left:solid #CCCCCC
              1.0pt;padding:0in 0in 0in
              6.0pt;margin-left:4.8pt;margin-right:0in">
              <div>
                <div>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">Hello
                    all,<o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">=A0<o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">I
                    am reaching out to inquire about an issue I have
                    experienced as it relates to SPDX output from the
                    oe-core build process and specifically the
                    create-spdx.bbclass output.=A0 The data fields in the
                    output that I have produced do not line up with the
                    SPDX data field standards (see below) set forth by
                    the Linux Foundation.<o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">=A0<o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">My
                    question is if there are plans to update the
                    create-spdx code so that the output fields align
                    with those set forth by both NTIA and Linux
                    Foundation?<o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">=A0<o:p></o:p></p>
                  <table class=3D"MsoNormalTable"
                    style=3D"width:170.75pt;border-collapse:collapse"
                    width=3D"228" cellspacing=3D"0" cellpadding=3D"0"
                    border=3D"0">
                    <thead>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid #C1C7D0
                          1.0pt;background:#F4F5F7;padding:5.25pt
                          11.25pt 5.25pt
7.5pt;background-attachment:scroll;background-position-x:0%;background-posi=
tion-y:0%"
                          width=3D"228" valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto"><b><span
                                style=3D"color:#172B4D">SPDX Mapped Field</=
span></b><o:p></o:p></p>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 11.25pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">PackageSupplier:<o:p></o:p></p>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 7.5pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">PackageName:<o:p></o:p></p>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 7.5pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">PackageVersion:<o:p></o:p></p>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 7.5pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">SPDXID:<o:p></o:p></p>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 7.5pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">Relationship:
                            CONTAINS<o:p></o:p></p>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 7.5pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">Creator:<o:p></o:p></p>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:170.75pt;border:solid
                          windowtext
                          1.0pt;border-top:none;padding:5.25pt 7.5pt
                          5.25pt 7.5pt;border-color:currentcolor
                          rgb(193,199,208) rgb(193,199,208)" width=3D"228"
                          valign=3D"top">
                          <p class=3D"MsoNormal"
                            style=3D"mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto">PackageChecksum:<o:p></o:p></p>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">=A0<o:p></o:p></p>
                </div>
              </div>
            </blockquote>
            <div>
              <p class=3D"MsoNormal"><o:p>=A0</o:p></p>
            </div>
            <div>
              <p class=3D"MsoNormal">Can you be a little more specific and
                possibly provide examples of what you are expecting to
                see and what it is actually generating? We are trying to
                adhere to the SPDX spec, but it is possible there is
                something we misinterpreted or are doing incorrectly.<o:p><=
/o:p></p>
            </div>
            <div>
              <p class=3D"MsoNormal">=A0<o:p></o:p></p>
            </div>
            <blockquote style=3D"border:none;border-left:solid #CCCCCC
              1.0pt;padding:0in 0in 0in
              6.0pt;margin-left:4.8pt;margin-right:0in">
              <div>
                <div>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto"><span
                      style=3D"font-size:9.0pt">Source -
                      <a
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.ntia.gov%2Ffiles%2Fntia%2Fpublications%2Fntia_sbom_formats_and_standar=
ds_whitepaper_-_version_20191025.pdf&amp;data=3D04%7C01%7Cclusk%40lenovo.co=
m%7Cbdb17ccb86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1=
%7C0%7C637691289675514957%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DSSFfnZyYjwTHpO=
iNK7tcoxQ4Yhy1PGUlE0PhQlrhdYE%3D&amp;reserved=3D0"
                        target=3D"_blank" moz-do-not-send=3D"true">
https://www.ntia.gov/files/ntia/publications/ntia_sbom_formats_and_standard=
s_whitepaper_-_version_20191025.pdf</a></span><o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">=A0<o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">Thanks.<o:p></o:p></p>
                  <table class=3D"MsoNormalTable"
                    style=3D"border-collapse:collapse" cellspacing=3D"0"
                    cellpadding=3D"0" border=3D"0">
                    <tbody>
                      <tr>
                        <td colspan=3D"3" style=3D"padding:0in 0in 0in 0in">
                          <div
                            style=3D"margin-top:15.0pt;margin-bottom:15.0pt=
">
                            <div class=3D"MsoNormal"
                              style=3D"text-align:center" align=3D"center">=
<span
style=3D"font-size:10.5pt;font-family:&quot;Helvetica
                                Neue&quot;;color:#333333">
                                <hr width=3D"100%" size=3D"1" align=3D"cent=
er">
                              </span></div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style=3D"width:300.0pt;padding:0in 0in 0in
                          0in" width=3D"400" valign=3D"top">
                          <table class=3D"MsoNormalTable"
                            style=3D"width:300.0pt;border-collapse:collapse"
                            width=3D"400" cellspacing=3D"0" cellpadding=3D"=
0"
                            border=3D"0">
                            <tbody>
                              <tr>
                                <td style=3D"width:150.0pt;padding:0in 0in
                                  0in 0in" width=3D"200" valign=3D"top">
                                  <p class=3D"MsoNormal"
                                    style=3D"mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto"><b><span
style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#4=
04040">Christopher
                                        D. Lusk</span></b><br>
                                    <span
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">Product
                                      Security Analyst</span><br>
                                    <span
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">Product
                                      Security Office<br>
                                      Lenovo</span><o:p></o:p></p>
                                </td>
                                <td style=3D"width:150.0pt;padding:0in 0in
                                  0in 0in" width=3D"200" valign=3D"top">
                                  <p class=3D"MsoNormal"
                                    style=3D"mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto"><br>
                                    <img
                                      style=3D"width:.243in;height:.0902in"
id=3D"gmail-m_2487225848235209125Picture_x0020_2"
                                      src=3D"cid:part3.ED8D5CA0.19EAEF30@gm=
ail.com"
                                      alt=3D"Email" class=3D"" width=3D"23"
                                      height=3D"9" border=3D"0"><a
                                      href=3D"mailto:clusk@lenovo.com"
                                      target=3D"_blank"
                                      moz-do-not-send=3D"true"><span
style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040;text-decoration:none">clusk@lenovo.com</span></a><o:p></o:p></p>
                                </td>
                              </tr>
                              <tr>
                                <td colspan=3D"2" style=3D"padding:0in 0in
                                  0in 0in">
                                  <p class=3D"MsoNormal"
                                    style=3D"mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto">=A0<o:p></o:p></p>
                                </td>
                              </tr>
                              <tr>
                                <td colspan=3D"2" style=3D"padding:0in 0in
                                  0in 0in" valign=3D"top">
                                  <p class=3D"MsoNormal"
                                    style=3D"mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto"><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
                                        href=3D"http://www.lenovo.com/"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">Lenovo.co=
m</span></a><br>
                                      <a
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
twitter.com%2Flenovo&amp;data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17ccb8618=
4605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C637691289=
675514957%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DMQ%2BN6B3o9Wb7xBXpiz2pw%2B4Fjq=
KEPQ9d7CUzrhYadsk%3D&amp;reserved=3D0"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">Twitter</=
span></a></span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Finstagram.com%2Flenovo&amp;data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17ccb8=
6184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C637691=
289675524920%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dpkt6VXw51nW7eKxiGFgM3sDBfa%=
2Bbp9KQDe0fDpjyo%2FY%3D&amp;reserved=3D0"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">Instagram=
</span></a></span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
www.facebook.com%2Flenovo&amp;data=3D04%7C01%7Cclusk%40lenovo.com%7Cbdb17cc=
b86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7C6376=
91289675524920%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DSSQrE%2BtzY3IEs%2Fmdlyu49=
Dum1d6%2BfMSN3IGaS72to40%3D&amp;reserved=3D0"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">Facebook<=
/span></a></span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
www.linkedin.com%2Fcompany%2Flenovo&amp;data=3D04%7C01%7Cclusk%40lenovo.com=
%7Cbdb17ccb86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%=
7C0%7C637691289675534868%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D4YpV9mUkTRhb1Om=
xdTjScTttVntx5obeG1OD3z10iRM%3D&amp;reserved=3D0"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">Linkedin<=
/span></a></span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
www.youtube.com%2Flenovovision&amp;data=3D04%7C01%7Cclusk%40lenovo.com%7Cbd=
b17ccb86184605f9cb08d988d96584%7C5c7d0b28bdf8410caa934df372b16203%7C1%7C0%7=
C637691289675544819%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D6uSGD%2Frt%2Bm6Hgin%=
2FS7J6qoXJbzJS7lKQSxQ7spR6B%2BY%3D&amp;reserved=3D0"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">YouTube</=
span></a></span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">|</span><span
style=3D"font-size:5.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040">=A0</span><span
style=3D"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#40=
4040"><a
href=3D"https://www.lenovo.com/gb/en/privacy-selector/" target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
                                          style=3D"color:#404040">Privacy</=
span></a></span><o:p></o:p></p>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                        <td style=3D"background:white;padding:0in 0in 0in
0in;background-attachment:scroll;background-position-x:0%;background-positi=
on-y:0%"
                          valign=3D"top">
                          <div align=3D"right">
                            <table class=3D"MsoNormalTable"
                              style=3D"border-collapse:collapse"
                              cellspacing=3D"0" cellpadding=3D"0" border=3D=
"0">
                              <tbody>
                                <tr>
                                  <td style=3D"padding:0in 0in 0in 0in"
                                    valign=3D"top">
                                    <p class=3D"MsoNormal"
                                      style=3D"mso-margin-top-alt:auto;mso-=
margin-bottom-alt:auto"><img
style=3D"width:3.375in;height:1.7083in"
                                        id=3D"gmail-m_2487225848235209125Pi=
cture_x0020_1"
src=3D"cid:part12.B9109AD0.481F01F3@gmail.com" class=3D"" width=3D"324"
                                        height=3D"164" border=3D"0"><o:p></=
o:p></p>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </td>
                        <td style=3D"padding:0in 0in 0in 0in"><br>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto"><span
                      style=3D"color:black">=A0</span><o:p></o:p></p>
                  <p class=3D"MsoNormal"
                    style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto">=A0<o:p></o:p></p>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------4FE146A16FDA0844A313A7D9
Content-Type: image/jpeg;
 name="image005.jpg"
Content-Transfer-Encoding: base64
Content-ID: <part1.73C8450B.15B9BF3E@gmail.com>
Content-Disposition: inline;
 filename="image005.jpg"

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
RAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQE
REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREFesPa3PrRLD2tz
60QRXBT9j+w/4DA/pgViovYXe72l7v8A3xqu8FP2P7D/AIDA/pgViovYXe72l7v/AHxoNX732JPu
LYHzjSHA9Ig+0bEwwAw+DDMMD+dWms29dQNtvNwHo0G2de84HPApQAGfaYAYZ9HzrD3Nvv0bNBl6
fXwP9YhFAHj6/rPrDoXrb8Tq3aOyrHcN1Nj+Dhlhmyfn5zhuYNgH1mYACuXXBB+8N9lSdjNXRT5b
EmdbzysHvBMOMxmj1AG9AACM8OgA17+ozNbBWoPJ84lWPEnbV3KtXqt2dW28iDqFO7zmwAMCb68z
zPA+7TvW31AIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICI
iAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgr
1h7W59aJYe1ufWiCK4Kfsf2H/AYH9MCsVF7C73e0vd/741XeCn7H9h/wGB/TArFRewu93tL3f++N
BRtz8OnrGwB45kfAp4Smc4xmefwH19itVDt30VTHDlasy8zIz9T0fgVG3XvfWrsGResbNtxyxbii
1Fg6uNgHx5gweZ/Jms6/1vt5cOdw1m3bM418bDzECxlAbOJ/bgZmAdB/SGQefsVy64ZH0sOz9kV2
yAtArBIAsZx2TwHoGmgOH34aAPyfoVtWquC907PjbmqZjU1i0prTwMwZVo7YAZ8hkwNt5wAPDAw9
wOvNbVUNEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAR
EQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQV6w9
rc+tEsPa3PrRBFcFP2P7D/gMD+mBWKi9hd7vaXu/98arvBT9j+w/4DA/pgViovYXe72l7v8A3xoK
ruDY0SwlBJKZKDV2YD3LxAwbc+MMwUmWzK6Tt9+mlC9OhyHNTe1NzlmZ55+fIMMesfdWvt57jfrr
cACDLnmdu2wTgS8Aw+AAz6PrWJxPtbeLwS3VLq/EQXwMGyedfMzjRzfAJOuhgefnAOYf/wAFco8Q
6NNp7W2pVbUq9IdTDGvaMyec0AzMzcPXrMzPXMz+zvP7f0KyLTPk/wBmLsPc9XBj0z9RV2INRLWg
jBGizwNkHDPAHDHMDPUDPLrwW5lAIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAi
IgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIC
IiAiIgIiICIiAiIgr1h7W59aJYe1ufWiCK4Kfsf2H/AYH9MCsVF7C73e0vd/741XeCn7H9h/wGB/
TArFRewu93tL3f8AvjQVi/r9tuTxKW5HCabzerzfN6v7e8c+n61LtyaLa+3jk6yo8SpHIzezzDq1
+Nax3rfWEK11i18iva1C3A3heA+ZoHz4GHR2K3Uu4XoO07q4CLrZmwTz4Ra5g85JgHYA+c+89Oj/
ANdFcvLNJjZ28tubuhyj21ZQZ0SE9yHvAugYMnhngeHZ0GB/zq2LX/CHbM3bO0miuSA9wWTp2Vs+
H/8AKc1yMNPkAMGw+QNFsBR8aIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgI
iICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiA
iIgIiICIiAiIgr1h7W59aJYe1ufWiCK4Kfsf2H/AYH9MCsVF7C73e0vd/wC+NV3gp+x/Yf8AAYH9
MCsVF7C73e0vd/740ENbXVczIFs9JGQSQAnAhm4Jn8HnAF57g3xUbY2vN3FLeJivia6C7pyj0czz
wAMMM8yIgHzfMqLveuu5dsARn7ZgGbQJWrcWBmGHxgfIPr/nXpvDZ9vvXhLfVDfmOVYuh5mbIAZ1
kgDgG42fR0GYAQZ4dHf/AGJLwyPpd9kb4jbzj2GseJLhTq6R4OdAmjoL0V/AD5ZYGYa9BgfSZd6u
C0/wJ2DabAg7kZdjnW1tlZnOgVcyX4l+GBgAGBvec88zAzHrPANWw/sW4EaIiICIiAiIgIiICIiA
iIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiI
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

--------------4FE146A16FDA0844A313A7D9
Content-Type: image/gif;
 name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <part3.ED8D5CA0.19EAEF30@gmail.com>
Content-Disposition: inline;
 filename="image001.gif"

R0lGODlhFwAJALMAAN3d3WZmZpmZmczMzERERLu7u4iIiAAAAP///wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH5BAEAAAgALAAAAAAXAAkAAAQtEMliqhUy643M+SDBjZJ3GEU6kKMZWAXLmeApbyaaArdm
xr1Z7SMKdoaHoiwCADs=

--------------4FE146A16FDA0844A313A7D9
Content-Type: image/png;
 name="image002.png"
Content-Transfer-Encoding: base64
Content-ID: <part12.B9109AD0.481F01F3@gmail.com>
Content-Disposition: inline;
 filename="image002.png"

iVBORw0KGgoAAAANSUhEUgAAAUQAAACkCAYAAADv2VfwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA4BpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2
NDM1MiwgMjAyMC8wMS8zMC0xNTo1MDozOCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
Ok9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyMzcwQjk0OENGNDMxMUU0ODdFRkU5QTJBN0Ew
NTk0OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpENDZGRkQ1MzdEOEUxMUVBOTBDMEJDRTNG
NUUxNDYzRSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpENDZGRkQ1MjdEOEUxMUVBOTBDMEJD
RTNGNUUxNDYzRSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoV2lu
ZG93cykiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozNjg1
YjQzMy1mOWIzLTg3NDctOGU4My1jZDcyODRhOTM1ZGQiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2Jl
OmRvY2lkOnBob3Rvc2hvcDplNzBiYmRkYy1iNTczLThiNGEtODc5ZS03ZjAzZGM3NjU0ZTEiLz4g
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

--------------4FE146A16FDA0844A313A7D9--

--------------FC94687A7217AF551EEAE599--
