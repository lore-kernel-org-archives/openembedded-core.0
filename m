Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5091EC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 07:00:36 +0000 (UTC)
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by mx.groups.io with SMTP id smtpd.web09.8860.1660028427466293648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 00:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=CS8YOQQM;
 spf=pass (domain: amazon.de, ip: 52.95.49.90,
 mailfrom: prvs=2133f8a6a=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1660028428; x=1691564428;
  h=from:to:date:message-id:references:in-reply-to:
   mime-version:content-transfer-encoding:subject;
  bh=KYjIIUtYJUkhPfjHWswQDq4A3kYiHDbNXpj3HCOa9ck=;
  b=CS8YOQQMopD6tDm8fLeiuxXaYiykf3f73e8X1ddeZ5CGTKbhScr1Vior
   eHwbfneE1eEaXXzaRlqHBuepylyaa/3uClQClDxv3iRdch/7Q8Z1ETP5g
   Y5GTDWRD7JxKJ02Wdo0/DUuMpHToRpjzy65VV6XzqPTcaNpQnBzpRSpdC
   s=;
X-IronPort-AV: E=Sophos;i="5.93,223,1654560000";
   d="scan'208";a="230796872"
Subject: AW: [OE-core] [PATCH v2] oeqa devtool: Add tests to cover devtool
 handling
 of various git URL styles
Thread-Topic: [OE-core] [PATCH v2] oeqa devtool: Add tests to cover devtool
 handling of
 various git URL styles
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-11a39b7d.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 07:00:14 +0000
Received: from EX13D16EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2a-11a39b7d.us-west-2.amazon.com (Postfix) with
 ESMTPS id 7173B44404;
	Tue,  9 Aug 2022 07:00:13 +0000 (UTC)
Received: from EX13D16EUA003.ant.amazon.com (10.43.165.51) by
 EX13D16EUA002.ant.amazon.com (10.43.165.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Tue, 9 Aug 2022 07:00:12 +0000
Received: from EX13D16EUA003.ant.amazon.com ([10.43.165.51]) by
 EX13D16EUA003.ant.amazon.com ([10.43.165.51]) with mapi id 15.00.1497.036;
 Tue, 9 Aug 2022 07:00:12 +0000
From: "Roos, Thomas" <throos@amazon.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Index: AQHYqvcuO8hJ5opULEOoETXWZiHm3a2krmNMgABOzICAAB8SgIABCOqn
Date: Tue, 9 Aug 2022 07:00:12 +0000
Message-ID: <1660028411623.65190@amazon.de>
References: <20220804134920.167173-1-throos@amazon.de>
	 <20220808091813.6a467409@booty> <1659947998632.6878@amazon.de>
	 <20220808151959.22790acf@booty>,<91ae37e140b97207709b75e3e54a925ecb40b6ec.camel@linuxfoundation.org>
In-Reply-To: 
 <91ae37e140b97207709b75e3e54a925ecb40b6ec.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.134]
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 07:00:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169137

Hi Richard, Hi Luca,
thank you!

Cheers, =

Thomas
________________________________________
Von: Richard Purdie <richard.purdie@linuxfoundation.org>
Gesendet: Montag, 8. August 2022 17:11
An: luca.ceresoli@bootlin.com; Roos, Thomas; openembedded-core@lists.openem=
bedded.org
Betreff: RE: [EXTERNAL][OE-core] [PATCH v2] oeqa devtool: Add tests to cove=
r devtool handling of various git URL styles

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you can confirm the sender and know the=
 content is safe.



On Mon, 2022-08-08 at 15:19 +0200, Luca Ceresoli via
lists.openembedded.org wrote:
> Hi Thomas,
>
> On Mon, 8 Aug 2022 08:39:59 +0000
> "Roos, Thomas" <throos@amazon.de> wrote:
>
> > Hi Luca,
> > thank you for this - will update my patch and try with the sendemail.fr=
om parameter.
> > The correct procedure will be creating a v3 patch and send as new again?
>
> The correct thing would be to configure your git sendemail.from
> parameter, fix the issues I reported, and send a v3 with those fixed.

I think I merged this into master-next in the meantime so there isn't a
need for a v3 in this case.

Cheers,

Richard



Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094





