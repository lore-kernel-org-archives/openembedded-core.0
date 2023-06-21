Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED36EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 06:48:55 +0000 (UTC)
Subject: Re: [PATCH v6 1/2] RFC: cve-check: add option to add additional patched CVEs
To: openembedded-core@lists.openembedded.org
From: "Siddharth" <sdoshi@mvista.com>
X-Originating-Location: Delhi, National Capital Territory of Delhi, IN (182.74.28.237)
X-Originating-Platform: Linux Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Jun 2023 23:48:54 -0700
References: <SJ0PR11MB671700F100D6C2720EF36474DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB671700F100D6C2720EF36474DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
Message-ID: <17916.1687330134854739736@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OyzPgaRo0v5AF3XZtYAL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 06:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183170

--OyzPgaRo0v5AF3XZtYAL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Sanjay,

I feel the that the proposal by Andrej is a simpler one and makes me more i=
nclined towards using it as compared to going to VEX status. I do agree tha=
t VEX is something which can be mapped but at the end of the day its always=
 "simpler the better" and easy to maintain. Definately, as mentioned by Ric=
hard there would be a bit of copy/paste going way forward but will be easie=
r to maintain and understand rather than leaving confusing trails at some p=
oints down the line. 2 status having one similar adoption can also add to c=
onfusion going forward.

the proposal by andrej inline with https://lists.openembedded.org/g/openemb=
edded-core/message/182855 and is better suited to avoid confusion.

Cheers,
Siddharth

--OyzPgaRo0v5AF3XZtYAL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Sanjay,&nbsp;</p>
<p>I feel the that the proposal by Andrej is a simpler one and makes me mor=
e inclined towards using it as compared to going to VEX status. I do agree =
that VEX is something which can be mapped but at the end of the day its alw=
ays "simpler the better" and easy to maintain. Definately, as mentioned by =
Richard there would be a bit of copy/paste going way forward but will be ea=
sier to maintain and understand rather than leaving confusing trails at som=
e points down the line. 2 status having one similar adoption can also add t=
o confusion going forward.<br /><br />the proposal by andrej inline with&nb=
sp;<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18=
2855" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/o=
penembedded-core/message/182855</a>&nbsp;and is better suited to avoid conf=
usion.<br /><br />Cheers,<br />Siddharth</p>

--OyzPgaRo0v5AF3XZtYAL--

