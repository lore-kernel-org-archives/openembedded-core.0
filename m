Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id A3E2B74C26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 14:15:56 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id e80-v6so4694576oig.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CgJBhL2BdRSxxnq+i5YaYoVTe4C70gLhhYsxOypXKf4=;
	b=swMfEgMUdpVQrBvNStD6TvPDcEtkeRG99MeM5CugFqJ8o+xQviMjV0ix468qB7T9y5
	3IsU6D4+NgzIcdgmVdNDCpu/8Hf+ItPkz9lAkJYiFtbX5GXZqMvubV8Rv5OoZip/dvqp
	0rmnBx9vnN2DM+i0TtRmnWCy+LN0E1JKNzpHNxwy7zy6bPXBMAMwZ93rOi184Om3DMxv
	0vOXkqJLBIQmhVuA/MWTuUdSgoP2iwEq1jtJzck/azsK7rADcXrEkxQQcM0xa/QRccfF
	cI+8waNIeyYYgDqSvj1lB7WpDzUr7EqKiYpjsGVDUzkKe1qULWr58wI+myOSLedqmThV
	BRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CgJBhL2BdRSxxnq+i5YaYoVTe4C70gLhhYsxOypXKf4=;
	b=QGuTMOrX2+dxuwngF7guJaY73pGAF9QOxd1tCu6Ic2vWGo8bhEUPrm1EUYGw1ffbPP
	RQOW32Tdszok7A1d5dDu7XA8EyLHUpGs+yhSDnpRx39h5+ue0+OBnN89UpjOuM7cj2st
	MBwvkjBBPSi5Pa4d/+LYK3u8Z/DtPE6WSSd19nEop8eWjHrhU0mbfJcTlhWLV+Mfd+JM
	F8s1d0D4B6K/NIhHL9HON6kVxLlK7UoPxGuDp2asg7xrXn8H+W0IUGP/HPwpsKFaCjd2
	jCkSfve3BMkDMFcpSRRdyBeMShV7DXTflrtp0T+nZenrbokglJLyylZczMSCYbBn/58g
	mU8w==
X-Gm-Message-State: ALKqPwccIPcq03a/kL7hj8ltzkkPzx9Fkeut82OVEpyF6RCAwikErru/
	YdqXZ4SKLP1/OQO9U2dftiFVcx002DFnpkkOtoU=
X-Google-Smtp-Source: ADUXVKJYB9gYNfReXgcsLHoZa5RpBkXTgTTEWRAxlBx03PgXHaCvOip4DXu+G3G25VvBYxxWqQbYvcNgqERWcDbfaWk=
X-Received: by 2002:aca:42d5:: with SMTP id
	p204-v6mr1309530oia.265.1527257757108; 
	Fri, 25 May 2018 07:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2927:0:0:0:0:0 with HTTP; Fri, 25 May 2018 07:15:36
	-0700 (PDT)
From: nick83ola <nick83ola@gmail.com>
Date: Fri, 25 May 2018 15:15:36 +0100
Message-ID: <CABPh3UMLJt-AarmZ8Nt=7BNWEeAX2i1imyR5OR-FcJzh9QgeHw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 3/3] Mosquitto add a mosquitto conf and logging to the default mosquitto recipe
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
X-List-Received-Date: Fri, 25 May 2018 14:15:56 -0000
X-Groupsio-MsgNum: 111761
Content-Type: multipart/mixed; boundary="00000000000017edcc056d08685f"

--00000000000017edcc056d08685f
Content-Type: multipart/alternative; boundary="00000000000017edc5056d08685d"

--00000000000017edc5056d08685d
Content-Type: text/plain; charset="UTF-8"



--00000000000017edc5056d08685d
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--00000000000017edc5056d08685d--

--00000000000017edcc056d08685f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0003-mosquitto_1.4.14-add-log-file.patch"
Content-Disposition: attachment; 
	filename="0003-mosquitto_1.4.14-add-log-file.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jhm1tk4y0

RnJvbSA4MTY0NDZmZDE5OWExNjk0OGY4MzI2M2FkN2EyZTZmZjZmZjAwNGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNvbGEgTHVuZ2hpIDxuaWNvbGEubHVuZ2hpQGpjaS5jb20+
CkRhdGU6IEZyaSwgMjUgTWF5IDIwMTggMTQ6MzQ6MTMgKzAxMDAKU3ViamVjdDogW1BBVENIIDMv
M10gbW9zcXVpdHRvXzEuNC4xNDogYWRkIGxvZyBmaWxlCgplbmFibGUgbG9nZ2luZyBieSBkZWZh
dWx0IGFuZCBjcmVhdGUgdGhlIG5lY2Vzc2FyeQpmaWxlcy9mb2xkZXIKCkNoYW5nZS1JZDogSTY4
YTIzZTg5MWU1YmM5MjhjMzM2MzRjOTJkMGI5ZmFhOGRiNjI0YWEKU2lnbmVkLW9mZi1ieTogTmlj
b2xhIEx1bmdoaSA8bmljb2xhLmx1bmdoaUBqY2kuY29tPgotLS0KIC4uLi9tb3NxdWl0dG8vZmls
ZXMvbW9zcXVpdHRvLXlvY3RvLmNvbmYgICAgICAgICAgIHwgIDEgKwogLi4uL21vc3F1aXR0by9t
b3NxdWl0dG9fMS40LjE0LmJiICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmlsZXMvbW9zcXVpdHRvLXlvY3RvLmNvbmYg
Yi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vc3F1aXR0by9maWxlcy9tb3NxdWl0dG8t
eW9jdG8uY29uZgppbmRleCA5YjQzMzIzZjMuLmE2OTVkNTQyOSAxMDA2NDQKLS0tIGEvbWV0YS1v
ZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmlsZXMvbW9zcXVpdHRvLXlvY3RvLmNv
bmYKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmlsZXMvbW9z
cXVpdHRvLXlvY3RvLmNvbmYKQEAgLTEsNCArMSw1IEBACiBwaWRfZmlsZSBATE9DQUxTVEFURURJ
UkAvcnVuL21vc3F1aXR0by5waWQKK2xvZ19kZXN0IGZpbGUgQExPQ0FMU1RBVEVESVJAL2xvZy9t
b3NxdWl0dG8vbW9zcXVpdHRvLmxvZwogCiAjIFBsYWNlIHlvdXIgbG9jYWwgY29uZmlndXJhdGlv
biBpbiAvZXRjL21vc3F1aXR0by9jb25mLmQvCiBpbmNsdWRlX2RpciBAU1lTQ09ORkRJUkAvbW9z
cXVpdHRvL2NvbmYuZApkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9t
b3NxdWl0dG8vbW9zcXVpdHRvXzEuNC4xNC5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbW9zcXVpdHRvL21vc3F1aXR0b18xLjQuMTQuYmIKaW5kZXggY2UyMTM3OWY2Li41MTU1NjU1
YzUgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRvL21v
c3F1aXR0b18xLjQuMTQuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3Nx
dWl0dG8vbW9zcXVpdHRvXzEuNC4xNC5iYgpAQCAtNTUsNiArNTUsMTggQEAgZG9faW5zdGFsbCgp
IHsKICAgICAjIGNyZWF0ZSBhbiBlbXB0eSBjb25mLmQgZGlyZWN0b3J5IHRvIG1ha2UgbW9zcXVp
dHRvIGhhcHB5CiAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9tb3NxdWl0dG8vY29u
Zi5kCiAKKyAgICBpZiBbICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywnc3lz
dmluaXQnLGQpfSBdOyB0aGVuCisgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7c3lzY29uZmRpcn0v
ZGVmYXVsdC92b2xhdGlsZXMKKyAgICAgICAgZWNobyAiZCBtb3NxdWl0dG8gbW9zcXVpdHRvIDA3
NTUgJHtsb2NhbHN0YXRlZGlyfS9sb2cvbW9zcXVpdHRvIG5vbmUiIFwKKyAgICAgICAgICAgID4g
JHtEfSR7c3lzY29uZmRpcn0vZGVmYXVsdC92b2xhdGlsZXMvMTBfbW9zcXVpdHRvCisgICAgZWxp
ZiBbICR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywnc3lzdGVtZCcsZCl9IF07
IHRoZW4KKyAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS90bXBmaWxlcy5kCisg
ICAgICAgIGVjaG8gImQgJHtsb2NhbHN0YXRlZGlyfS9sb2cvbW9zcXVpdHRvIDA3NTUgbW9zcXVp
dHRvIG1vc3F1aXR0byAtIiBcCisgICAgICAgICAgICAgPiAke0R9JHtzeXNjb25mZGlyfS90bXBm
aWxlcy5kL21vc3F1aXR0by5jb25mCisgICAgZWxzZQorICAgICAgICBiYmZhdGFsICJjb3VsZCBu
b3QgY3JlYXRlIG1vc3F1aXR0byBsb2cgZGlyZWN0b3J5IG1pc3Npbmcgc3lzdGVtZCBvciBzeXN2
aW5pdCIKKyAgICBmaQorCiAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5
c3RlbS8KICAgICBpbnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9tb3NxdWl0dG8uc2VydmljZSAk
e0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbS8KIApAQCAtNzQsNiArODYsOCBAQCBGSUxFU18k
e1BOfSA9ICIke3NiaW5kaXJ9L21vc3F1aXR0byBcCiAgICAgICAgICAgICAgICAke3N5c2NvbmZk
aXJ9L21vc3F1aXR0byBcCiAgICAgICAgICAgICAgICAke3N5c2NvbmZkaXJ9L2luaXQuZCBcCiAg
ICAgICAgICAgICAgICAke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtL21vc3F1aXR0by5zZXJ2aWNl
IFwKKyAgICAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMn
LCAnc3lzdGVtZCcsICcke3N5c2NvbmZkaXJ9L3RtcGZpbGVzLmQvbW9zcXVpdHRvLmNvbmYnLCAn
JywgZCl9IFwKKyAgICAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVB
VFVSRVMnLCAnc3lzdmluaXQnLCAnJHtzeXNjb25mZGlyfS9kZWZhdWx0L3ZvbGF0aWxlcy8xMF9t
b3NxdWl0dG8nLCAnJywgZCl9IFwKICIKIENPTkZGSUxFU18ke1BOfSArPSAiJHtzeXNjb25mZGly
fS9tb3NxdWl0dG8iCiAKLS0gCjIuMTcuMAoK

--00000000000017edcc056d08685f--
