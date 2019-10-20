Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7E87CE5F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 12:32:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i16so10379411wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version;
	bh=ekAgD6IyMfd9EURQIIhzmpUmRBR3/t0uV0pV1lMAsag=;
	b=Czdbof47hhSzwaYgkz5hW86TwTPBPPPRrJhtE/FarTitGttAd2bnO8yE1Na+SCPhCT
	l5r+EMldWpXSYfwc52DU8M7ixqcUq16FXV5HQ+c9sHL8UMvd3wK6zmfUtCsmuhlUHQZ+
	AvNQ1wdSibtew0E5XmzEsMPqwHqUN6nycwXV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version;
	bh=ekAgD6IyMfd9EURQIIhzmpUmRBR3/t0uV0pV1lMAsag=;
	b=J46quCS7I8EUOlsfw6v7ihvWcQExyxlLT9EkEcZ369Kngd+uqBvyHOk5Cr7DF0yrkI
	uY5r2MCgmnHMQq+OLfYeR6e73xX+FF+yXrGr7ngemjjRTx63QNXyzsjMvrPEGW73ERVC
	2ATnbgszT1MCPcThw6f3LdIIIpIpRSdj5AcDS1vEgOmQWYELjbjJZHw9+dqUcwKOU0wQ
	RM/QRDR9gN7a3fNU5vgfOApreNIrahekDt8m1R+uOU8f99ipONy4Z1dAl54ArsxTmA3h
	/EvpX57HKeqferYesl/hCpizhyoIC4ZbjMZuHZEtSFIffmkV8kaahYPmM/phr8kp3cib
	HxFQ==
X-Gm-Message-State: APjAAAUu+TzeEprc28cEVlCLReiqjGoUJ9rbnvHIed6ZOabrz2V7xv8L
	/o66EshLIEqNoyJpauZcRUj3Qw==
X-Google-Smtp-Source: APXvYqxqaWeaLeCTnFWKkj4gxt7OkjliSLl4nzqaQDX3Isaz7eZjLp7o6pfAOiXrGlAXur/aqo0ZYg==
X-Received: by 2002:a1c:6002:: with SMTP id u2mr6247903wmb.43.1571574743105;
	Sun, 20 Oct 2019 05:32:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t83sm18250641wmt.18.2019.10.20.05.32.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 20 Oct 2019 05:32:22 -0700 (PDT)
Message-ID: <311c58c4bbfdd575f4b0c3123d8f833482f580d1.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2019 13:32:20 +0100
In-Reply-To: <CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
	<CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Sun, 20 Oct 2019 12:32:23 -0000
X-Groupsio-MsgNum: 130250
Content-Type: multipart/mixed; boundary="=-AvG7upskv3FAYjmr/rIG"

--=-AvG7upskv3FAYjmr/rIG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2019-10-20 at 06:51 +0530, Khem Raj wrote:
> 
> 
> On Sat, Oct 19, 2019 at 2:56 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Fri, 2019-10-18 at 20:49 +0200, Alexander Kanavin wrote:
> > > I certainly don't mean to ignore those reports, it's just that
> > due to
> > > my ongoing health problems, and having to dedicate most of my
> > energy
> > > to the day job (https://mbition.io/en/home/), I am not currently
> > able
> > > to work on the upstream issues in a timely manner the way I used
> > to
> > > when maintaining core was actually my day job (at Intel).
> > > 
> > > The question of how much effort people who update things in core
> > > should allocate to fixing 'other' layers has been a conflict
> > point
> > > for a long time. I'd prefer to see more aggressive
> > > blacklisting/removal of recipes that no one has an interest in
> > fixing
> > > and updating.
> > 
> > If anything this would be my fault for merging things despite there
> > being concerns raised. I have to admit I'd seen other patches and
> > therefore erroneously thought the issues we mostly resolved.
> > 
> > Should OE-Core block on all issues being resolved before merging?
> > I'm
> > torn on that, I realise there are pros and cons.
> 
> If an issue is there and gets reported after it’s merged I think it’s
> fine to do whatever is needed after the fact however if testing
> master-next from oe-core and reported against it I think this will
> help you in longer run if these master-next issues are looked into
> and blocked on. We should not run Oe-core so fast that other layers
> fall way back behind where they start supporting just releases and
> you have lost free integration testing that other layers would offer
> 
> If there are too many reports then it would be questionable to block
> on it but I don’t think that’s the case 

Feeling suitably responsible for this breakage, I looked into it. The
following two patches, one for meson in OE-Core and the other for dconf
in meta-oe seem to address the problem. I'm not entirely sure they're
correct but they don't actually change the library binary so its
probably fine whilst upstream sorts it out.

If they look ok to you I'll submit them "properly".

Cheers,

Richard




--=-AvG7upskv3FAYjmr/rIG
Content-Disposition: attachment; filename="0001-dconf-Fix-build-with-meson-0.52.patch"
Content-Type: text/x-patch; name="0001-dconf-Fix-build-with-meson-0.52.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA3ZWJkNTBmOTBiM2I3ZjRlMWRjNTZmMDdhZTdlOGUwMjI3NWQ0MWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KRGF0ZTogU3VuLCAyMCBPY3QgMjAxOSAxMzoyNzowNyArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIGRjb25mOiBGaXggYnVpbGQgd2l0aCBtZXNvbiAwLjUyCgpTaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
LS0tCiAuLi4vZGNvbmYvZGNvbmYvZml4LW1lc29uLTAuNTIucGF0Y2ggICAgICAgICAgfCAyNSAr
KysrKysrKysrKysrKysrKysrCiAuLi4vcmVjaXBlcy1nbm9tZS9kY29uZi9kY29uZl8wLjMyLjAu
YmIgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZGNvbmYvZGNvbmYvZml4LW1l
c29uLTAuNTIucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZGNv
bmYvZGNvbmYvZml4LW1lc29uLTAuNTIucGF0Y2ggYi9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUv
ZGNvbmYvZGNvbmYvZml4LW1lc29uLTAuNTIucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwLi5iY2EwMjEzNDcKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLWdub21lL3Jl
Y2lwZXMtZ25vbWUvZGNvbmYvZGNvbmYvZml4LW1lc29uLTAuNTIucGF0Y2gKQEAgLTAsMCArMSwy
NSBAQAorV2l0aCBtZXNvbiAwLjUyIHRoZSBidWlsZCBmYWlscyBkdWUgdG8gZHVwbGljYXRlIHN5
bWJvbHMuIFRoZXJlIGlzIGEgZml4Cit0byBtZXNvbiBidXQgdGhlIGRjb25mIGJ1aWxkIGFsc28g
bmVlZHMgdHdlYWtpbmcuCisKK2h0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9kY29uZi9p
c3N1ZXMvNTkKK2h0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL3B1bGwvNTkzNgor
CitEZXNwaXRlIHRoZSBjb21tZW50cyB0aGVyZSBhYm91dCB0aGlzIGJlaW5nIGluY29ycmVjdCwg
bGliZGNvbmYgaXMgdW5jaGFuZ2VkCitiZXR3ZWVuIDAuNTEgYW5kIDAuNTIgYW5kIHRoaXMgcGF0
Y2guCisKK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZyBbdW5kZXIgZGlzY3Vzc2lvbiwgc2VlIGFi
b3ZlIGxpbmtzXQorU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CisKK0luZGV4OiBkY29uZi0wLjMyLjAvY2xpZW50L21lc29u
LmJ1aWxkCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09CistLS0gZGNvbmYtMC4zMi4wLm9yaWcvY2xpZW50L21lc29uLmJ1
aWxkCisrKysgZGNvbmYtMC4zMi4wL2NsaWVudC9tZXNvbi5idWlsZAorQEAgLTI4LDcgKzI4LDcg
QEAgbGliZGNvbmZfY2xpZW50ID0gc3RhdGljX2xpYnJhcnkoCisgCisgbGliZGNvbmZfY2xpZW50
X2RlcCA9IGRlY2xhcmVfZGVwZW5kZW5jeSgKKyAgIGRlcGVuZGVuY2llczogZ2lvX2RlcCwKKy0g
IGxpbmtfd2hvbGU6IGxpYmRjb25mX2NsaWVudCwKKysgIGxpbmtfd2l0aDogbGliZGNvbmZfY2xp
ZW50LAorICkKKyAKKyBsaWJkY29uZiA9IHNoYXJlZF9saWJyYXJ5KApkaWZmIC0tZ2l0IGEvbWV0
YS1nbm9tZS9yZWNpcGVzLWdub21lL2Rjb25mL2Rjb25mXzAuMzIuMC5iYiBiL21ldGEtZ25vbWUv
cmVjaXBlcy1nbm9tZS9kY29uZi9kY29uZl8wLjMyLjAuYmIKaW5kZXggOGQxYmJkZmQxLi5mZWMw
NDA3OWUgMTAwNjQ0Ci0tLSBhL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9kY29uZi9kY29uZl8w
LjMyLjAuYmIKKysrIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2Rjb25mL2Rjb25mXzAuMzIu
MC5iYgpAQCAtMyw2ICszLDcgQEAgTElDRU5TRSA9ICJMR1BMdjIuMSIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJkNTAyNWQ0YWEzNDk1YmVmZWY4ZjE3MjA2YTViMGEx
IgogU0VDVElPTiA9ICJ4MTEvZ25vbWUiCiAKK1NSQ19VUkkgKz0gImZpbGU6Ly9maXgtbWVzb24t
MC41Mi5wYXRjaCIKIFNSQ19VUklbYXJjaGl2ZS5tZDVzdW1dID0gImUxYWMwYjYyODVhYmVmZWVk
NjljYTllMzgwZTQ0ZjVhIgogU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNjhiY2U3OGIx
OWJjOTRjYjJjM2JiODU4N2UzN2Y5ZTVlMzM4NTY4YzNhNjc0Zjg2ZWRkZTljOWYxNjI0ZmZhYiIK
IAotLSAKMi4xNy4xCgo=

--=-AvG7upskv3FAYjmr/rIG
Content-Disposition: attachment;
	filename="0001-meson-Backport-fix-to-assist-meta-oe-breakage.patch"
Content-Type: text/x-patch;
	name="0001-meson-Backport-fix-to-assist-meta-oe-breakage.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBmNTIxOTRlOTgwNjAwMmU2NjIzNWY2MzE4NGEyZWVhMGIxNWMxOWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KRGF0ZTogU3VuLCAyMCBPY3QgMjAxOSAxMzoxMjozMiArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIG1lc29uOiBCYWNrcG9ydCBmaXggdG8gYXNzaXN0IG1ldGEtb2UgYnJlYWth
Z2UKCkFkZCBhIGJhY2twb3J0ZWQgY29tbWl0IGZyb20gdXBzdHJlYW0gd2hpY2ggaGVscHMgZml4
IGJ1aWxkIGZhaWx1cmVzCmluIG1ldGEtb2UuCgpTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWVzb24vbWVzb24uaW5jICAgICAgICAgfCAgMSArCiAuLi5lOTcxYmQzMjBmM2Rm
MTVjMWVlNzRmNTQ4NThlNjc5MmIxODMucGF0Y2ggfCA5NSArKysrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vZGJjOWU5NzFiZDMyMGYzZGYxNWMxZWU3NGY1
NDg1OGU2NzkyYjE4My5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi9tZXNvbi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24uaW5jCmlu
ZGV4IGFlMDA5MWMwNTFjLi44NGJjYzg0MDlkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb24uaW5jCkBAIC0xNiw2ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29t
L21lc29uYnVpbGQvbWVzb24vcmVsZWFzZXMvZG93bmxvYWQvJHtQVn0vbWVzb24tJHtQCiAgICAg
ICAgICAgIGZpbGU6Ly9jcm9zcy1wcm9wLWRlZmF1bHQucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1tZXNvbmJ1aWxkLWVudmlyb25tZW50LnB5LWNoZWNrLWVudmlyb25tZW50LWZvci12
YXJpLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbW9kdWxlcy1weXRob24ucHktZG8t
bm90LXN1YnN0aXR1dGUtcHl0aG9uLXMtaW5zdGFsbC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly9kYmM5ZTk3MWJkMzIwZjNkZjE1YzFlZTc0ZjU0ODU4ZTY3OTJiMTgzLnBhdGNoIFwKICAgICAg
ICAgICAgIgogU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ2MGY3NWYwZGVkY2M0ZmQyNDlkYmM3NTE5
ZDZmM2NlNmRmNDkwMDMzZDI3NmVmMWNmMjc0NTNlZjQ5MzhkMzIiCiBTUkNfVVJJW21kNXN1bV0g
PSAiN2VhNzc3MjQxNGRkYThhZTExMDcyMjQ0YmY3YmE5OTEiCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vZGJjOWU5NzFiZDMyMGYzZGYxNWMxZWU3NGY1NDg1
OGU2NzkyYjE4My5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi9kYmM5
ZTk3MWJkMzIwZjNkZjE1YzFlZTc0ZjU0ODU4ZTY3OTJiMTgzLnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwLi43ZWE4YTEzM2U2YQotLS0gL2Rldi9udWxsCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi9kYmM5ZTk3MWJkMzIwZjNkZjE1YzFl
ZTc0ZjU0ODU4ZTY3OTJiMTgzLnBhdGNoCkBAIC0wLDAgKzEsOTUgQEAKK0Zyb20gZGJjOWU5NzFi
ZDMyMGYzZGYxNWMxZWU3NGY1NDg1OGU2NzkyYjE4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IFhhdmllciBDbGFlc3NlbnMgPHhhdmllci5jbGFlc3NlbnNAY29sbGFib3JhLmNvbT4K
K0RhdGU6IEZyaSwgMTEgT2N0IDIwMTkgMTE6MDE6MjIgLTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0g
UmVtb3ZlIGR1cGxpY2F0ZWQgb2JqZWN0IGZpbGVzIGluIHN0YXRpYyBsaWJyYXJpZXMKKworV2hl
biBhIHN0YXRpYyBsaWJyYXJ5IGxpbmtfd2hvbGUgdG8gYSBidW5jaCBvZiBvdGhlciBzdGF0aWMg
bGlicmFyaWVzLAord2UgaGF2ZSB0byBleHRyYWN0IGFsbCB0aGVpciBvYmplY3RzIHJlY3Vyc2l2
ZWx5LiBCdXQgdGhhdCBjb3VsZAoraW50cm9kdWNlIGR1cGxpY2F0ZWQgb2JqZWN0cy4gYXIgaXMg
ZHVtYiBlbm91Z2ggdG8gYWxsb3cgdGhpcyB3aXRob3V0CitlcnJvciwgYnV0IG9uY2UgdGhlIHJl
c3VsdGluZyBzdGF0aWMgbGlicmFyeSBpcyBsaW5rZWQgaW50byBhbgorZXhlY3V0YWJsZSBvciBz
aGFyZWQgbGlicmFyeSwgdGhlIGxpbmtlciB3aWxsIGNvbXBsYWluIGFib3V0IGR1cGxpY2F0ZWQK
K3N5bWJvbHMuCisKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKK1NpZ25lZC1vZmYtYnk6IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorCistLS0K
KyBtZXNvbmJ1aWxkL2JhY2tlbmQvYmFja2VuZHMucHkgICAgICAgICAgICAgICAgIHwgIDMgKyst
CisgdGVzdCBjYXNlcy91bml0LzY5IHN0YXRpYyBsaW5rL2xpYi9mdW5jMTcuYyAgICB8ICA0ICsr
KysKKyB0ZXN0IGNhc2VzL3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL2Z1bmMxOC5jICAgIHwgIDYg
KysrKysrCisgdGVzdCBjYXNlcy91bml0LzY5IHN0YXRpYyBsaW5rL2xpYi9mdW5jMTkuYyAgICB8
ICA3ICsrKysrKysKKyB0ZXN0IGNhc2VzL3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL21lc29uLmJ1
aWxkIHwgMTIgKysrKysrKysrKysrCisgNSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCisgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3QgY2FzZXMvdW5pdC82OSBz
dGF0aWMgbGluay9saWIvZnVuYzE3LmMKKyBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdCBjYXNlcy91
bml0LzY5IHN0YXRpYyBsaW5rL2xpYi9mdW5jMTguYworIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0
IGNhc2VzL3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL2Z1bmMxOS5jCisKK2RpZmYgLS1naXQgYS9t
ZXNvbmJ1aWxkL2JhY2tlbmQvYmFja2VuZHMucHkgYi9tZXNvbmJ1aWxkL2JhY2tlbmQvYmFja2Vu
ZHMucHkKK2luZGV4IDk0N2JlMWNiZWYuLmU1NDgwOTY1N2YgMTAwNjQ0CistLS0gYS9tZXNvbmJ1
aWxkL2JhY2tlbmQvYmFja2VuZHMucHkKKysrKyBiL21lc29uYnVpbGQvYmFja2VuZC9iYWNrZW5k
cy5weQorQEAgLTI4MSw3ICsyODEsOCBAQCBkZWYgcmVscGF0aChzZWxmLCB0b2RpciwgZnJvbWRp
cik6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9zLnBhdGguam9pbignZHVtbXlw
cmVmaXhkaXInLCBmcm9tZGlyKSkKKyAKKyAgICAgZGVmIGZsYXR0ZW5fb2JqZWN0X2xpc3Qoc2Vs
ZiwgdGFyZ2V0LCBwcm9qX2Rpcl90b19idWlsZF9yb290PScnKToKKy0gICAgICAgIHJldHVybiBz
ZWxmLl9mbGF0dGVuX29iamVjdF9saXN0KHRhcmdldCwgdGFyZ2V0LmdldF9vYmplY3RzKCksIHBy
b2pfZGlyX3RvX2J1aWxkX3Jvb3QpCisrICAgICAgICBvYmpfbGlzdCA9IHNlbGYuX2ZsYXR0ZW5f
b2JqZWN0X2xpc3QodGFyZ2V0LCB0YXJnZXQuZ2V0X29iamVjdHMoKSwgcHJval9kaXJfdG9fYnVp
bGRfcm9vdCkKKysgICAgICAgIHJldHVybiBsaXN0KGRpY3QuZnJvbWtleXMob2JqX2xpc3QpKQor
IAorICAgICBkZWYgX2ZsYXR0ZW5fb2JqZWN0X2xpc3Qoc2VsZiwgdGFyZ2V0LCBvYmplY3RzLCBw
cm9qX2Rpcl90b19idWlsZF9yb290KToKKyAgICAgICAgIG9ial9saXN0ID0gW10KK2RpZmYgLS1n
aXQgYS90ZXN0IGNhc2VzL3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL2Z1bmMxNy5jIGIvdGVzdCBj
YXNlcy91bml0LzY5IHN0YXRpYyBsaW5rL2xpYi9mdW5jMTcuYworbmV3IGZpbGUgbW9kZSAxMDA2
NDQKK2luZGV4IDAwMDAwMDAwMDAuLmQxZDhlYzQ5OGMKKy0tLSAvZGV2L251bGwKKysrKyBiL3Rl
c3QgY2FzZXMvdW5pdC82OSBzdGF0aWMgbGluay9saWIvZnVuYzE3LmMJCitAQCAtMCwwICsxLDQg
QEAKKytpbnQgZnVuYzE3KCkKKyt7CisrICByZXR1cm4gMTsKKyt9CitkaWZmIC0tZ2l0IGEvdGVz
dCBjYXNlcy91bml0LzY5IHN0YXRpYyBsaW5rL2xpYi9mdW5jMTguYyBiL3Rlc3QgY2FzZXMvdW5p
dC82OSBzdGF0aWMgbGluay9saWIvZnVuYzE4LmMKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRl
eCAwMDAwMDAwMDAwLi5jMTQ5MDg1YmE0CistLS0gL2Rldi9udWxsCisrKysgYi90ZXN0IGNhc2Vz
L3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL2Z1bmMxOC5jCQorQEAgLTAsMCArMSw2IEBACisraW50
IGZ1bmMxNygpOworKworK2ludCBmdW5jMTgoKQorK3sKKysgIHJldHVybiBmdW5jMTcoKSArIDE7
CisrfQorZGlmZiAtLWdpdCBhL3Rlc3QgY2FzZXMvdW5pdC82OSBzdGF0aWMgbGluay9saWIvZnVu
YzE5LmMgYi90ZXN0IGNhc2VzL3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL2Z1bmMxOS5jCituZXcg
ZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMDAwMC4uNjkxMjBlNGJmOAorLS0tIC9kZXYv
bnVsbAorKysrIGIvdGVzdCBjYXNlcy91bml0LzY5IHN0YXRpYyBsaW5rL2xpYi9mdW5jMTkuYwkK
K0BAIC0wLDAgKzEsNyBAQAorK2ludCBmdW5jMTcoKTsKKytpbnQgZnVuYzE4KCk7CisrCisraW50
IGZ1bmMxOSgpCisreworKyAgcmV0dXJuIGZ1bmMxNygpICsgZnVuYzE4KCk7CisrfQorZGlmZiAt
LWdpdCBhL3Rlc3QgY2FzZXMvdW5pdC82OSBzdGF0aWMgbGluay9saWIvbWVzb24uYnVpbGQgYi90
ZXN0IGNhc2VzL3VuaXQvNjkgc3RhdGljIGxpbmsvbGliL21lc29uLmJ1aWxkCitpbmRleCA1ZjA0
YWFiNmExLi44Zjk1ZmM0NTQ2IDEwMDY0NAorLS0tIGEvdGVzdCBjYXNlcy91bml0LzY5IHN0YXRp
YyBsaW5rL2xpYi9tZXNvbi5idWlsZAkKKysrKyBiL3Rlc3QgY2FzZXMvdW5pdC82OSBzdGF0aWMg
bGluay9saWIvbWVzb24uYnVpbGQJCitAQCAtNjYsMyArNjYsMTUgQEAgbGliZnVuYzE1ID0gc3Rh
dGljX2xpYnJhcnkoJ2Z1bmMxNScsICdmdW5jMTUuYycsCisgbGliZnVuYzE2ID0gc3RhdGljX2xp
YnJhcnkoJ2Z1bmMxNicsICdmdW5jMTYuYycsCisgICBsaW5rX3dpdGggOiBsaWJmdW5jMTUsCisg
ICBpbnN0YWxsIDogdHJ1ZSkKKysKKysjIFZlcmlmeSBmdW5jMTcuYy5vIGdldHMgaW5jbHVkZWQg
b25seSBvbmNlIGludG8gbGliZnVuYzE5LCBvdGhlcndpc2UKKysjIGZ1bmMxOS1zaGFyZWQgd291
bGQgZmFpbGVkIHdpdGggZHVwbGljYXRlZCBzeW1ib2wuCisrbGliZnVuYzE3ID0gc3RhdGljX2xp
YnJhcnkoJ2Z1bmMxNycsICdmdW5jMTcuYycsCisrICBpbnN0YWxsIDogZmFsc2UpCisrbGliZnVu
YzE4ID0gc3RhdGljX2xpYnJhcnkoJ2Z1bmMxOCcsICdmdW5jMTguYycsCisrICBsaW5rX3dpdGgg
OiBsaWJmdW5jMTcsCisrICBpbnN0YWxsIDogZmFsc2UpCisrbGliZnVuYzE5ID0gc3RhdGljX2xp
YnJhcnkoJ2Z1bmMxOScsICdmdW5jMTkuYycsCisrICBsaW5rX3dob2xlIDogW2xpYmZ1bmMxNywg
bGliZnVuYzE4XSwKKysgIGluc3RhbGwgOiBmYWxzZSkKKytzaGFyZWRfbGlicmFyeSgnZnVuYzE5
LXNoYXJlZCcsIGxpbmtfd2hvbGUgOiBbbGliZnVuYzE5XSkKLS0gCjIuMTcuMQoK

--=-AvG7upskv3FAYjmr/rIG--
