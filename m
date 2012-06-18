Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SgS8E-0001U9-Je
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 04:55:58 +0200
Received: by eekd49 with SMTP id d49so1401559eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 19:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ZiSki8d/OdEzrGYWs1Kp1lp0+jByMUWVVdtvlPlEX1A=;
	b=SDWytu0DDdOETz5eRR+thtCANzIyPHY2mCLo7nc0R749EOZwMKe27npm+2LfnLm2S7
	9DbEWENQY/4rLSZaQl/63d/m+IzdNVUseIAmv8J1GGVO2PkSC+UaPRRH3eNk2Tyb2Qa6
	rQfzzHMxdhvaLfM6fbaXt9CwU7eQUpSrdHb993J73jV2WJTcqcsegSC4oilAc09Lkfnl
	+JBYNf2P7x2Obl1ZRe+fagXXRbcV8i/qBTf/je+v2W1e1VzTB9MoZU25uiKklSd2OVw6
	nIg5xGwenTVa5wm/BK/4fTGMHFTXHXwpvYr6LiMP6ZXvTy+Usv0n1gv8YSWeRuUNJVGj
	colg==
Received: by 10.14.187.141 with SMTP id y13mr2995033eem.79.1339987516922; Sun,
	17 Jun 2012 19:45:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sun, 17 Jun 2012 19:44:45 -0700 (PDT)
In-Reply-To: <1339986813-17890-1-git-send-email-james@digitalmatter.com.au>
References: <1339986813-17890-1-git-send-email-james@digitalmatter.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Jun 2012 19:44:45 -0700
Message-ID: <CAMKF1so1rWbtjGh_w_00D-YpeYhaPx5=Xp2Y1vGXMYu2tt93ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] debian.bbclass: invoke target objdump
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
X-List-Received-Date: Mon, 18 Jun 2012 02:55:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gU3VuLCBKdW4gMTcsIDIwMTIgYXQgNzozMyBQTSwgSmFtZXMgTGltYm91cmlzCjxqYW1lc0Bk
aWdpdGFsbWF0dGVyLmNvbS5hdT4gd3JvdGU6Cj4gVXNpbmcgdGhlIGhvc3Qgb2JqZHVtcCBjYW4g
bGVhZCB0byBlcnJvcnMgbGlrZToKPgo+IG9iamR1bXA6IGxpYnJhcnkuc28uMS4wLjA6IEZpbGUg
Zm9ybWF0IGlzIGFtYmlndW91cwo+IG9iamR1bXA6IE1hdGNoaW5nIGZvcm1hdHM6IGVsZjMyLWxp
dHRsZWFybSBlbGYzMi1saXR0bGVhcm0tc3ltYmlhbiBlbGYzMi1saXR0bGVhcm0tdnh3b3Jrcwo+
Cgp5ZXMgZm9yIHRhcmdldCByZWNpcGVzIHdlIHNob3VsZCBhbHdheXMgdXNlIGNyb3NzIGJpbnV0
aWxzIHNpbmNlIGhvc3QKb2JqZHVtcCBtYXkgbm90IGhhdmUgYWxsIGJmZCBlbXVsYXRpb25zIGJ1
aWx0IGluLgoKPiB3aXRoIGNlcnRhaW4gY29uZmlndXJhdGlvbnMgb2YgYmludXRpbHMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBMaW1ib3VyaXMgPGphbWVzQGRpZ2l0YWxtYXR0ZXIuY29tLmF1
Pgo+IC0tLQo+IMKgbWV0YS9jbGFzc2VzL2RlYmlhbi5iYmNsYXNzIHwgwqAgwqAyICstCj4gwqAx
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9tZXRhL2NsYXNzZXMvZGViaWFuLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvZGViaWFu
LmJiY2xhc3MKPiBpbmRleCAzNjM3ZTJlLi5iYjRhZTExIDEwMDY0NAo+IC0tLSBhL21ldGEvY2xh
c3Nlcy9kZWJpYW4uYmJjbGFzcwo+ICsrKyBiL21ldGEvY2xhc3Nlcy9kZWJpYW4uYmJjbGFzcwo+
IEBAIC02MCw3ICs2MCw3IEBAIHB5dGhvbiBkZWJpYW5fcGFja2FnZV9uYW1lX2hvb2sgKCkgewo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9yIGYgaW4g
ZmlsZXM6Cj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiBzb19yZS5tYXRjaChmKToKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZwID0gb3MucGF0
aC5qb2luKHJvb3QsIGYpCj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjbWQgPSAoZC5nZXRWYXIoJ0JVSUxEX1BS
RUZJWCcsIFRydWUpIG9yICIiKSArICJvYmpkdW1wIC1wICIgKyBmcCArICIgMj4vZGV2L251bGwi
Cj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBjbWQgPSAoZC5nZXRWYXIoJ1RBUkdFVF9QUkVGSVgnLCBUcnVlKSBv
ciAiIikgKyAib2JqZHVtcCAtcCAiICsgZnAgKyAiIDI+L2Rldi9udWxsIgo+IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZmQgPSBvcy5wb3BlbihjbWQpCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW5lcyA9IGZkLnJlYWRsaW5l
cygpCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBmZC5jbG9zZSgpCj4gLS0KPiAxLjcuMy40Cj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gT3BlbmVtYmVkZGVk
LWNvcmUgbWFpbGluZyBsaXN0Cj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5m
by9vcGVuZW1iZWRkZWQtY29yZQo=


