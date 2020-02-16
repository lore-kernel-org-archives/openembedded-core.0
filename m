Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id 174EE6141C;
	Sun, 16 Feb 2020 16:38:17 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id p2so5280624uao.9;
	Sun, 16 Feb 2020 08:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=soC39zjO8kXgOamffm2q6heDNn/hkHF8cCOilRZlZV8=;
	b=Obkp4znGfIgOP9YGrStVRB3jEUjPYsqt52JwsMQLvKWjX1OeYHJrAMaNCcdnJDJFRE
	oM9hDCnEhb0Wm2HayE5OtbgfMHAkNLKKs+NNnw8SA1s1TvM3xfPXwbea7ZuApI9BkuNA
	8+Eol+5KF9+8TZRxmS0RqRliXJNxxUNM0HaasYhCsQvECFX4JeedbD7RbZ471jsLOeYr
	/f+Igi1zjKtIUirBeJwdWkdHtLgc71N1DTHzKdt6QVlEJmwYELEXG09mP/CdESJkDsdO
	Fvq0JbyoiCGj0pIisbHqH9c03VeuJEV0ngL8LrTHGD2ER9iXHV8p6jsCr8Pd0K0/3+j4
	xVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=soC39zjO8kXgOamffm2q6heDNn/hkHF8cCOilRZlZV8=;
	b=et8fSBf3G29e9p3Mk03qO/lsrn5eLTYJIdjmKTa1MTgBkZR0xIG0iAG9W3fO2T9kWg
	j9Z1RqbBuhoLYmQdIBZE7gEYkuqG5uPG7sP1Qz4Fjuy6YMTrqiZkuIpvG5huGCCZHTKO
	OsXSyN2EutivBCsCEZ9Q9v1zIzfinw7Wxf19BdymMd3jLYhzs2JZja7iklAiFt5gqkI/
	CZHZUfUTz3WP/eGimlXkuhPfbCugWBlyumcOcsLPnFK5YqEK1mwwW9ciuzbhFoVVRmQY
	AmOrQOQSg6DcyvohO85Ijodmk+F+qVVZEOc1/5Y7UW3hX+OyYPPKzVlhreQrrI57b8up
	TAYw==
X-Gm-Message-State: APjAAAX7COyA9BIwfNr+5o/988MEJu8hL026EfL3m/0eepOvlaRj1QMh
	EtPwTbpLxJiheQO4el43hByDVVhz1JbbMD3pQLNwy+Fh
X-Google-Smtp-Source: APXvYqwWyu75IfVdRw2zRliMeOCt+osEaJ0rSbv5a9ssu8PAXz9uuK65UGkTGLps7MbF26rZ5plC+d2Vttp3N8VoHKY=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr5663952uap.93.1581871098599;
	Sun, 16 Feb 2020 08:38:18 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
	<20200211141347.GB3234@localhost>
	<CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
	<8b9de58b-7d65-dc89-69ec-4b5d40667184@kernel.crashing.org>
	<CANNYZj8L1q+Dy2Xuh-q+E_npiyhXS4CUqPtinwH1Nk1E+c4Bmw@mail.gmail.com>
In-Reply-To: <CANNYZj8L1q+Dy2Xuh-q+E_npiyhXS4CUqPtinwH1Nk1E+c4Bmw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 17:38:07 +0100
Message-ID: <CANNYZj-1D7hGoy74bwa4oT3rpeaMqmaAkF6W1x1XFRysrOk7qQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Sun, 16 Feb 2020 16:38:18 -0000
Content-Type: multipart/alternative; boundary="000000000000e99d1d059eb41026"

--000000000000e99d1d059eb41026
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2020 at 18:46, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 11 Feb 2020 at 16:58, Mark Hatle <mark.hatle@kernel.crashing.org>
> wrote:
>
>>
>> I also don't think oe-core itself needs a 'real' UI, and as my previous
>> response
>> said -- we do need something though to test that the graphical framework
>> is
>> working properly.
>>
>> In the past this often comes back to needing a LOT of a UI in order to
>> adequately test all of the components of the system.   If wayland/weston
>> has a
>> proper test suite that exercises all of the various parts of and pieces
>> of the
>> systems -- then the need for a UI drops considerably.
>>
>> (but we still have the need for some sort of example/demostration...)
>>
>
> Wayland/weston do have test suites, neither of which we currently use. I
> don't know how much they exercise all the moving parts, but the tests do
> exist.
>

I have now ran these tests on my host system to see what they do. Both
wayland and weston tests are fast (a few seconds each), and here's the
outputs for both. I think once these are packaged as ptests and ran on the
AB, all that's left is a reasonable demo UI (which as I said could be
simply epiphany with working HW acceleration).

libwayland:
 1/23 wayland-egl symbols check               OK       0.08 s
 2/23 cpp-compile-test                        OK       0.02 s
 3/23 scanner-test                            OK       0.18 s
 4/23 array-test                              OK       0.02 s
 5/23 client-test                             OK       0.01 s
 6/23 display-test                            OK       0.57 s
 7/23 connection-test                         OK       0.17 s
 8/23 event-loop-test                         OK       0.17 s
 9/23 fixed-test                              OK       0.01 s
10/23 interface-test                          OK       0.01 s
11/23 list-test                               OK       0.01 s
12/23 map-test                                OK       0.01 s
13/23 sanity-test                             OK       4.44 s
14/23 socket-test                             OK       0.02 s
15/23 queue-test                              OK       0.02 s
16/23 signal-test                             OK       0.01 s
17/23 newsignal-test                          OK       0.01 s
18/23 resources-test                          OK       0.01 s
19/23 message-test                            OK       0.01 s
20/23 compositor-introspection-test           OK       0.01 s
21/23 protocol-logger-test                    OK       0.01 s
22/23 headers-test                            OK       0.00 s
23/23 os-wrappers-test                        OK       0.02 s

weston:
 1/26 config-parser                           OK       0.05 s
 2/26 string                                  OK       0.02 s
 3/26 vertex-clip                             OK       0.03 s
 4/26 timespec                                OK       0.05 s
 5/26 zuc                                     OK       0.22 s
 6/26 bad-buffer                              OK       0.12 s
 7/26 devices                                 OK       2.53 s
 8/26 event                                   OK       0.42 s
 9/26 keyboard                                OK       0.23 s
10/26 linux-explicit-synchronization          OK       0.63 s
11/26 internal-screenshot                     OK       0.19 s
12/26 presentation                            OK       0.19 s
13/26 pointer                                 OK       0.53 s
14/26 roles                                   OK       0.18 s
15/26 subsurface                              OK       2.08 s
16/26 subsurface-shot                         OK       0.28 s
17/26 text                                    OK       0.13 s
18/26 touch                                   OK       0.18 s
19/26 viewporter                              OK       2.03 s
20/26 xwayland                                OK       0.48 s
21/26 ivi-shell-app                           FAIL     0.68 s (killed by
signal 6 SIGABRT) (needs some image resources in /usr which I didn't
install)
22/26 plugin-registry                         OK       0.04 s
23/26 surface                                 OK       0.04 s
24/26 surface-global                          OK       0.07 s
25/26 ivi-layout-internal                     OK       0.14 s
26/26 ivi-layout                              OK       0.18 s


Alex

--000000000000e99d1d059eb41026
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIDExIEZlYiAyMDIwIGF0IDE4OjQ2LCBBbGV4YW5kZXIg
S2FuYXZpbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXgua2FuYXZpbkBnbWFpbC5jb20iPmFsZXgu
a2FuYXZpbkBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGly
PSJsdHIiPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21h
aWxfYXR0ciI+T24gVHVlLCAxMSBGZWIgMjAyMCBhdCAxNjo1OCwgTWFyayBIYXRsZSAmbHQ7PGEg
aHJlZj0ibWFpbHRvOm1hcmsuaGF0bGVAa2VybmVsLmNyYXNoaW5nLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPm1hcmsuaGF0bGVAa2VybmVsLmNyYXNoaW5nLm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+PGJyPg0KSSBhbHNvIGRvbiYjMzk7dCB0aGluayBvZS1jb3JlIGl0c2VsZiBuZWVk
cyBhICYjMzk7cmVhbCYjMzk7IFVJLCBhbmQgYXMgbXkgcHJldmlvdXMgcmVzcG9uc2U8YnI+DQpz
YWlkIC0tIHdlIGRvIG5lZWQgc29tZXRoaW5nIHRob3VnaCB0byB0ZXN0IHRoYXQgdGhlIGdyYXBo
aWNhbCBmcmFtZXdvcmsgaXM8YnI+DQp3b3JraW5nIHByb3Blcmx5Ljxicj4NCjxicj4NCkluIHRo
ZSBwYXN0IHRoaXMgb2Z0ZW4gY29tZXMgYmFjayB0byBuZWVkaW5nIGEgTE9UIG9mIGEgVUkgaW4g
b3JkZXIgdG88YnI+DQphZGVxdWF0ZWx5IHRlc3QgYWxsIG9mIHRoZSBjb21wb25lbnRzIG9mIHRo
ZSBzeXN0ZW0uwqAgwqBJZiB3YXlsYW5kL3dlc3RvbiBoYXMgYTxicj4NCnByb3BlciB0ZXN0IHN1
aXRlIHRoYXQgZXhlcmNpc2VzIGFsbCBvZiB0aGUgdmFyaW91cyBwYXJ0cyBvZiBhbmQgcGllY2Vz
IG9mIHRoZTxicj4NCnN5c3RlbXMgLS0gdGhlbiB0aGUgbmVlZCBmb3IgYSBVSSBkcm9wcyBjb25z
aWRlcmFibHkuPGJyPg0KPGJyPg0KKGJ1dCB3ZSBzdGlsbCBoYXZlIHRoZSBuZWVkIGZvciBzb21l
IHNvcnQgb2YgZXhhbXBsZS9kZW1vc3RyYXRpb24uLi4pPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxi
cj48L2Rpdj48ZGl2PldheWxhbmQvd2VzdG9uIGRvIGhhdmUgdGVzdCBzdWl0ZXMsIG5laXRoZXIg
b2Ygd2hpY2ggd2UgY3VycmVudGx5IHVzZS4gSSBkb24mIzM5O3Qga25vdyBob3cgbXVjaCB0aGV5
IGV4ZXJjaXNlIGFsbCB0aGUgbW92aW5nIHBhcnRzLCBidXQgdGhlIHRlc3RzIGRvIGV4aXN0Ljwv
ZGl2PjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaGF2ZSBu
b3cgcmFuIHRoZXNlIHRlc3RzIG9uIG15IGhvc3Qgc3lzdGVtIHRvIHNlZSB3aGF0IHRoZXkgZG8u
IEJvdGggd2F5bGFuZCBhbmQgd2VzdG9uIHRlc3RzIGFyZSBmYXN0IChhIGZldyBzZWNvbmRzIGVh
Y2gpLCBhbmQgaGVyZSYjMzk7cyB0aGUgb3V0cHV0cyBmb3IgYm90aC4gSSB0aGluayBvbmNlIHRo
ZXNlIGFyZSBwYWNrYWdlZCBhcyBwdGVzdHMgYW5kIHJhbiBvbiB0aGUgQUIsIGFsbCB0aGF0JiMz
OTtzIGxlZnQgaXMgYSByZWFzb25hYmxlIGRlbW8gVUkgKHdoaWNoIGFzIEkgc2FpZCBjb3VsZCBi
ZSBzaW1wbHkgZXBpcGhhbnkgd2l0aCB3b3JraW5nIEhXIGFjY2VsZXJhdGlvbikuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5saWJ3YXlsYW5kOjxicj48L2Rpdj48ZGl2PsKgMS8yMyB3YXlsYW5k
LWVnbCBzeW1ib2xzIGNoZWNrIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE9LIMKgIMKgIMKgIDAuMDgg
cyA8YnI+wqAyLzIzIGNwcC1jb21waWxlLXRlc3QgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBPSyDCoCDCoCDCoCAwLjAyIHMgPGJyPsKgMy8yMyBzY2FubmVyLXRlc3QgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBPSyDCoCDCoCDCoCAwLjE4IHMgPGJy
PsKgNC8yMyBhcnJheS10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgT0sgwqAgwqAgwqAgMC4wMiBzIDxicj7CoDUvMjMgY2xpZW50LXRlc3QgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAgMC4wMSBzIDxicj7C
oDYvMjMgZGlzcGxheS10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgT0sgwqAgwqAgwqAgMC41NyBzIDxicj7CoDcvMjMgY29ubmVjdGlvbi10ZXN0IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE9LIMKgIMKgIMKgIDAuMTcgcyA8YnI+wqA4LzIz
IGV2ZW50LWxvb3AtdGVzdCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBPSyDC
oCDCoCDCoCAwLjE3IHMgPGJyPsKgOS8yMyBmaXhlZC10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgT0sgwqAgwqAgwqAgMC4wMSBzIDxicj4xMC8yMyBpbnRl
cmZhY2UtdGVzdCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9LIMKgIMKg
IMKgIDAuMDEgcyA8YnI+MTEvMjMgbGlzdC10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIE9LIMKgIMKgIMKgIDAuMDEgcyA8YnI+MTIvMjMgbWFwLXRlc3Qg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBPSyDCoCDCoCDC
oCAwLjAxIHMgPGJyPjEzLzIzIHNhbml0eS10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIE9LIMKgIMKgIMKgIDQuNDQgcyA8YnI+MTQvMjMgc29ja2V0LXRlc3Qg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAgMC4w
MiBzIDxicj4xNS8yMyBxdWV1ZS10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgT0sgwqAgwqAgwqAgMC4wMiBzIDxicj4xNi8yMyBzaWduYWwtdGVzdCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBPSyDCoCDCoCDCoCAwLjAxIHMg
PGJyPjE3LzIzIG5ld3NpZ25hbC10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgT0sgwqAgwqAgwqAgMC4wMSBzIDxicj4xOC8yMyByZXNvdXJjZXMtdGVzdCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9LIMKgIMKgIMKgIDAuMDEgcyA8YnI+MTkv
MjMgbWVzc2FnZS10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
T0sgwqAgwqAgwqAgMC4wMSBzIDxicj4yMC8yMyBjb21wb3NpdG9yLWludHJvc3BlY3Rpb24tdGVz
dCDCoCDCoCDCoCDCoCDCoCBPSyDCoCDCoCDCoCAwLjAxIHMgPGJyPjIxLzIzIHByb3RvY29sLWxv
Z2dlci10ZXN0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgT0sgwqAgwqAgwqAgMC4wMSBz
IDxicj4yMi8yMyBoZWFkZXJzLXRlc3QgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBPSyDCoCDCoCDCoCAwLjAwIHMgPGJyPjIzLzIzIG9zLXdyYXBwZXJzLXRlc3QgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBPSyDCoCDCoCDCoCAwLjAyIHMgPGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+d2VzdG9uOjwvZGl2PjxkaXY+wqAxLzI2IGNvbmZpZy1w
YXJzZXIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAg
MC4wNSBzIDxicj7CoDIvMjYgc3RyaW5nIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgT0sgwqAgwqAgwqAgMC4wMiBzIDxicj7CoDMvMjYgdmVydGV4LWNs
aXAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAg
MC4wMyBzIDxicj7CoDQvMjYgdGltZXNwZWMgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBPSyDCoCDCoCDCoCAwLjA1IHMgPGJyPsKgNS8yNiB6dWMgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAg
wqAgMC4yMiBzIDxicj7CoDYvMjYgYmFkLWJ1ZmZlciDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoE9LIMKgIMKgIMKgIDAuMTIgcyA8YnI+wqA3LzI2IGRldmljZXMg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAg
wqAgMi41MyBzIDxicj7CoDgvMjYgZXZlbnQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAgMC40MiBzIDxicj7CoDkvMjYga2V5Ym9h
cmQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBPSyDCoCDC
oCDCoCAwLjIzIHMgPGJyPjEwLzI2IGxpbnV4LWV4cGxpY2l0LXN5bmNocm9uaXphdGlvbiDCoCDC
oCDCoCDCoCDCoE9LIMKgIMKgIMKgIDAuNjMgcyA8YnI+MTEvMjYgaW50ZXJuYWwtc2NyZWVuc2hv
dCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBPSyDCoCDCoCDCoCAwLjE5IHMgPGJyPjEy
LzI2IHByZXNlbnRhdGlvbiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oE9LIMKgIMKgIMKgIDAuMTkgcyA8YnI+MTMvMjYgcG9pbnRlciDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBPSyDCoCDCoCDCoCAwLjUzIHMgPGJyPjE0LzI2
IHJvbGVzIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IE9LIMKgIMKgIMKgIDAuMTggcyA8YnI+MTUvMjYgc3Vic3VyZmFjZSDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9LIMKgIMKgIMKgIDIuMDggcyA8YnI+MTYvMjYg
c3Vic3VyZmFjZS1zaG90IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE9LIMKg
IMKgIMKgIDAuMjggcyA8YnI+MTcvMjYgdGV4dCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9LIMKgIMKgIMKgIDAuMTMgcyA8YnI+MTgvMjYgdG91
Y2ggwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sg
wqAgwqAgwqAgMC4xOCBzIDxicj4xOS8yNiB2aWV3cG9ydGVyIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgT0sgwqAgwqAgwqAgMi4wMyBzIDxicj4yMC8yNiB4d2F5
bGFuZCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9LIMKg
IMKgIMKgIDAuNDggcyA8YnI+MjEvMjYgaXZpLXNoZWxsLWFwcCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBGQUlMIMKgIMKgIDAuNjggcyAoa2lsbGVkIGJ5IHNpZ25hbCA2
IFNJR0FCUlQpIChuZWVkcyBzb21lIGltYWdlIHJlc291cmNlcyBpbiAvdXNyIHdoaWNoIEkgZGlk
biYjMzk7dCBpbnN0YWxsKTxicj4yMi8yNiBwbHVnaW4tcmVnaXN0cnkgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAgMC4wNCBzIDxicj4yMy8yNiBzdXJmYWNl
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE9LIMKgIMKg
IMKgIDAuMDQgcyA8YnI+MjQvMjYgc3VyZmFjZS1nbG9iYWwgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBPSyDCoCDCoCDCoCAwLjA3IHMgPGJyPjI1LzI2IGl2aS1sYXlvdXQt
aW50ZXJuYWwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT0sgwqAgwqAgwqAgMC4xNCBz
IDxicj4yNi8yNiBpdmktbGF5b3V0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgT0sgwqAgwqAgwqAgMC4xOCBzIDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkFsZXg8YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo=

--000000000000e99d1d059eb41026--
