Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SiVJ0-00014I-Is
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 20:43:34 +0200
Received: by eaal1 with SMTP id l1so876397eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2012 11:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=kEra+bnAYCirsROeiER8jxcCRlcEpIffumlbHB63q54=;
	b=G3BjZRTURw57a+PyXKEkw5dWoV+Qng84bkk8dBkl5u7OkxOt+j0BMV+rfCX4mRh4VT
	1oN/MEPyDGmUPkfyPCTPLVK4jOEFuFatNnpitoBoHR3nphSyIAhUW9DmPKOetRfysOM8
	1KkwzNpCeaccDthjloxPh5X3pX/ubKb7FTSWKjT7KChU2iD64Eru0PnfUtGSjvL0oGH9
	S/uFG1e6U18xJ2/gp+RSB5bsddX+rtEp3ICme/xJtGCqKp5IXDAj8E3CWv0vBzx2FyrN
	8qIUSzzIcCt50BVxeIE33L6DqeVKwxecE4rFkA4Xz1rrFIx/wmVgn3g+sF8NuxAITsSc
	K2Tw==
Received: by 10.14.119.202 with SMTP id n50mr1255105eeh.33.1340476365522; Sat,
	23 Jun 2012 11:32:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Sat, 23 Jun 2012 11:32:15 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1206231405330.16744@oneiric>
References: <alpine.DEB.2.02.1206231405330.16744@oneiric>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jun 2012 11:32:15 -0700
Message-ID: <CAMKF1srVzNYz-yippAtJAK3+j3E5bDY=W=tccMebNU_XP1vctg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: should kernel-arch.bbclass be returning "arm26"?
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
X-List-Received-Date: Sat, 23 Jun 2012 18:43:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gU2F0LCBKdW4gMjMsIDIwMTIgYXQgMTE6MDcgQU0sIFJvYmVydCBQLiBKLiBEYXkKPHJwamRh
eUBjcmFzaGNvdXJzZS5jYT4gd3JvdGU6Cj4KPiDCoHNlZSBzdWJqZWN0IC0tICJhcm0yNiIgaXMg
bm8gbG9uZ2VyIGEgdmFsaWQga2VybmVsIGFyY2gKPiBzdWJkaXJlY3RvcnksIGl0IHdhcyByZW1v
dmVkIGJhY2sgaW4gMjAwOC4gwqBzaG91bGQgaSBzdWJtaXQgYSBwYXRjaCB0bwo+IHRha2Ugb3V0
IHRoYXQgY2hlY2s/Cgp3aGVyZSBkbyB5b3Ugc2VlIHRoaXMgY29kZSA/Cgo+Cj4gcmRheQo+Cj4g
LS0KPgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+IFJvYmVydCBQLiBKLiBEYXkgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT3R0YXdhLCBPbnRhcmlvLCBDQU5BREEK
PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGh0dHA6Ly9jcmFzaGNvdXJzZS5j
YQo+Cj4gVHdpdHRlcjogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaHR0cDovL3R3aXR0ZXIuY29tL3JwamRheQo+IExpbmtlZEluOiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBodHRwOi8vY2EubGlua2Vk
aW4uY29tL2luL3JwamRheQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5n
IGxpc3QKPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gaHR0cDov
L2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC1jb3JlCg==


