Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SiVP5-0001C1-5t
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 20:49:51 +0200
Received: by eekd49 with SMTP id d49so883503eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2012 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ieEDoTwEWFxxopEpDJ7URhEjMMS+jS1Krqa3VUe1mRY=;
	b=HPb4KMjWR6vSSnykO5EYoB4HW7c8fALGuAsXhrpMBxt2UHo+R8FHSLpW5eFpoIJJpt
	2cJlIVGIkBo7hJMPs42OU5sTpAYJLxi4zgW9NaD76b/MqKAB1yqLDGV2/8U2ZvqKYzBz
	Nthb12A7sZcshqe+IiU5p+MU95kk1FYXhv/EPvwEozo6efTtrlhgXKHKGZmfpTKFR6zm
	8NTLvmRSy9sFmNk7+kW2IYSvtq3ApSI2ht/SYvQUm0UbM3PcO4+0BEBkrW7eoVoc0p+4
	90WqGoXGLxp2z2HwbngeLr/L6sdD6SrDeVaz7iTkmFICQKv6ARe7Bug6c6Opojl1iVZH
	gfEw==
Received: by 10.14.97.16 with SMTP id s16mr1175104eef.117.1340476742498; Sat,
	23 Jun 2012 11:39:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Sat, 23 Jun 2012 11:38:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1206231434100.16912@oneiric>
References: <alpine.DEB.2.02.1206231405330.16744@oneiric>
	<CAMKF1srVzNYz-yippAtJAK3+j3E5bDY=W=tccMebNU_XP1vctg@mail.gmail.com>
	<alpine.DEB.2.02.1206231434100.16912@oneiric>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jun 2012 11:38:32 -0700
Message-ID: <CAMKF1sps_ACfYwd8S1EumeWM6TR2uvSXES5fs0jbbN0j_75gEA@mail.gmail.com>
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
X-List-Received-Date: Sat, 23 Jun 2012 18:49:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gU2F0LCBKdW4gMjMsIDIwMTIgYXQgMTE6MzQgQU0sIFJvYmVydCBQLiBKLiBEYXkKPHJwamRh
eUBjcmFzaGNvdXJzZS5jYT4gd3JvdGU6Cj4gT24gU2F0LCAyMyBKdW4gMjAxMiwgS2hlbSBSYWog
d3JvdGU6Cj4KPj4gT24gU2F0LCBKdW4gMjMsIDIwMTIgYXQgMTE6MDcgQU0sIFJvYmVydCBQLiBK
LiBEYXkKPj4gPHJwamRheUBjcmFzaGNvdXJzZS5jYT4gd3JvdGU6Cj4+ID4KPj4gPiDCoHNlZSBz
dWJqZWN0IC0tICJhcm0yNiIgaXMgbm8gbG9uZ2VyIGEgdmFsaWQga2VybmVsIGFyY2gKPj4gPiBz
dWJkaXJlY3RvcnksIGl0IHdhcyByZW1vdmVkIGJhY2sgaW4gMjAwOC4gwqBzaG91bGQgaSBzdWJt
aXQgYSBwYXRjaCB0bwo+PiA+IHRha2Ugb3V0IHRoYXQgY2hlY2s/Cj4+Cj4+IHdoZXJlIGRvIHlv
dSBzZWUgdGhpcyBjb2RlID8KPgo+IMKgbWV0YS9jbGFzc2VzL2tlcm5lbC1hcmNoLmJiY2xhc3MK
PgoKSSBoYXZlIG5vIHN0cm9uZyBvcGluaW9uIG9uIGl0LiBZb3UgY2FuIHN1Ym1pdCBhIHBhdGNo
LgoKPiByZGF5Cj4KPiAtLQo+Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gUm9iZXJ0IFAuIEouIERheSDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBPdHRhd2EsIE9u
dGFyaW8sIENBTkFEQQo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaHR0cDov
L2NyYXNoY291cnNlLmNhCj4KPiBUd2l0dGVyOiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBodHRwOi8vdHdpdHRlci5jb20vcnBqZGF5Cj4g
TGlua2VkSW46IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGh0
dHA6Ly9jYS5saW5rZWRpbi5jb20vaW4vcnBqZGF5Cj4gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE9wZW5lbWJlZGRl
ZC1jb3JlIG1haWxpbmcgbGlzdAo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcKPiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWNvcmUKPgo=


