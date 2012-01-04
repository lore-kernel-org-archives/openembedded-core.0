Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiF2z-0003aK-RG
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:49:41 +0100
Received: by lami14 with SMTP id i14so6047971lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 16:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=NyexUBjypUC/ICGKlXaoywu6REsMLRRMrqPwDtcPV64=;
	b=naBjQktZhmQoMTWUqsSQOZXLCI+7k6qxp3KNsRGOWaIfbImXNKHmAvpsj6tZZfoFOw
	T7FDQ82diAAxEJm/lLN2qj8IyBo+zlSn6odpd2TMLeDFXkNJdK4B8KF2B6MnrYAkWlXa
	k5itmeWbnXLFlzNNuIPKgN+jKGhaDuvv1OZpk=
Received: by 10.152.113.131 with SMTP id iy3mr43334509lab.39.1325637739259;
	Tue, 03 Jan 2012 16:42:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Tue, 3 Jan 2012 16:41:47 -0800 (PST)
In-Reply-To: <3dfd63a9d3cd981ee53a5f56a4ff2733fa721f76.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
	<0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
	<3dfd63a9d3cd981ee53a5f56a4ff2733fa721f76.1325536389.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2012 16:41:47 -0800
Message-ID: <CAMKF1srER+fe7pokxYY5R-nF6LicM1ZM0SVSGdGNiPNNZn6Jzw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 05/15] autotools.bbclass: fix cp error for empty dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 00:49:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gMiwgMjAxMiBhdCAxMjozOCBQTSwgIDxuaXRpbi5hLmthbWJsZUBpbnRlbC5j
b20+IHdyb3RlOgo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgY3AgJHtTVEFHSU5HX0RBVEFESVJ9L2FjbG9jYWwvKiAke0J9L2FjbG9jYWwtY29weS8KPiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICMgZm9yIHNjcmF0
Y2ggYnVpbGQgdGhpcyBkaXJlY3RvcnkgY2FuIGJlIGVtcHR5Cj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjIHNvIGF2b2lkIGNwJ3Mgbm8gZmlsZXMgdG8g
Y29weSBlcnJvcgo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgY3AgLXIgJHtTVEFHSU5HX0RBVEFESVJ9L2FjbG9jYWwvLiAke0J9L2FjbG9jYWwtY29weS8K
Cm1heSBiZSB5b3Ugc2hvdWxkIGNoZWNrIGZvciBleGlzdGVuY2Ugb2YgZGlyZWN0b3J5IHRoZW4u
Cg==


