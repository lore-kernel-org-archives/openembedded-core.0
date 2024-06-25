Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0338C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 14:45:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.174744.1719326700934991752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 07:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aHMXcAGF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-424720e73e0so48952455e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719326699; x=1719931499; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBizNrHvtXZqAuMvLo02aGnfc3sQ+HEp/viwSQbgrDk=;
        b=aHMXcAGFk9jS+NHhiYZfZ+C5+kT1nfITGmjEu4oIVhjTpQQ+y7U4Q5AL9Ad927QbYq
         Ff1mFPjcjO9v+/xshKxx+kdKn+wFjlFD7fgiexxJWmu6tfDQXOc5qTkvNme76CnNbM/S
         py0wnFQs9wjL1+P8wRjOfHGMKdycQVWT2q7+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326699; x=1719931499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OBizNrHvtXZqAuMvLo02aGnfc3sQ+HEp/viwSQbgrDk=;
        b=ZtmHsbyChGVldClND0Ma4qHYaWYYUGMJ7qlwjUceJ+E2CEhwqgiRycaWMnikh7Xp/Q
         GphXb4iDg4Wi5VDrqYBGjN2FG/uwxgKCpb4Xea6c8/fX8ECLXTUCPj0dndkeixzfenDt
         75UyvosC157RHRN4/niHoK1BnmUAphUjyHVOtgfxk/vkD6kUVc6NlsaPD6LQML+PX/fU
         iI+mP1HVPBLvcAGZ2+xunKuTtQTGu7vBTM2b2mI72d/3p/hXvOAz7aWUFSU+vikcmIWQ
         d4rrNU1AK8WaUoluOZdGQjHPNsIbsfKb00HoDMOG4kjb1wD3Cf6LoV85ObAz5X/Vcoqt
         iLBg==
X-Forwarded-Encrypted: i=1; AJvYcCXc6+abFhTftYI3hslensJePsk2C+ZgT1JHKzjn76zuZcLv5dJeCr1KEb01aatMe5ZirHTubaEFCCrhxeMQDbvgDiKF7+BNytpAYqvUe0FpEQ3BVG9GaUUp
X-Gm-Message-State: AOJu0YylQfeTnVnGCCDNp9wtaLX/yE4sRd5kwCB9beJ35+uq/qBshfpm
	6aCTvGQ91XP4YC/Ht1s5Jv1qS9frNmwtoUIsrnfB7D6zWQMvsrTxLVCinxVgYrtjiOMsX3vdLpt
	q
X-Google-Smtp-Source: AGHT+IHlEKrPeg29d6PZ81CTxRVfed5aMeIoH3u/MRUgfYUkC2P1kfrSfcTy0j3UgKBFqmJE117ycg==
X-Received: by 2002:adf:f345:0:b0:360:7f79:b4cc with SMTP id ffacd0b85a97d-366e7a52045mr4747624f8f.68.1719326699180;
        Tue, 25 Jun 2024 07:44:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e? ([2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f66bbsm13198135f8f.78.2024.06.25.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:44:58 -0700 (PDT)
Message-ID: <2b67292a8d2cf14782de6f34f1430323082c8eee.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 03/10] classes/create-spdx-3.0: Add classes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2024 15:44:58 +0100
In-Reply-To: <20240624193151.1645802-4-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
	 <20240624193151.1645802-1-JPEWhacker@gmail.com>
	 <20240624193151.1645802-4-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 14:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201137

T24gTW9uLCAyMDI0LTA2LTI0IGF0IDEzOjEwIC0wNjAwLCBKb3NodWEgV2F0dCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiArcHl0aG9uIHNwZHgzMF9idWlsZF9zdGFydGVkX2hh
bmRsZXIgKCkgewo+ICvCoMKgwqAgaW1wb3J0IG9lLnNwZHgzMAo+ICvCoMKgwqAgaW1wb3J0IG9l
LnNib20zMAo+ICvCoMKgwqAgaW1wb3J0IG9zCj4gK8KgwqDCoCBmcm9tIHBhdGhsaWIgaW1wb3J0
IFBhdGgKPiArCj4gK8KgwqDCoCAjIENyZWF0ZSBhIGNvcHkgb2YgdGhlIGRhdGFzdG9yZS4gU2V0
IFBOIHRvICJiaXRiYWtlIiBzbyB0aGF0IFNQRFggSURzIGNhbgo+ICvCoMKgwqAgIyBiZSBnZW5l
cmF0ZWQKPiArwqDCoMKgIGQgPSBlLmRhdGEuY3JlYXRlQ29weSgpCj4gK8KgwqDCoCBkLnNldFZh
cigiUE4iLCAiYml0YmFrZSIpCj4gK8KgwqDCoCBkLnNldFZhcigiQkJfVEFTS0hBU0giLCAiYml0
YmFrZSIpCj4gK8KgwqDCoCBsb2FkX3NwZHhfbGljZW5zZV9kYXRhKGQpCj4gKwo+ICvCoMKgwqAg
ZGVwbG95X2Rpcl9zcGR4ID0gUGF0aChlLmRhdGEuZ2V0VmFyKCJERVBMT1lfRElSX1NQRFgiKSkK
PiArCj4gK8KgwqDCoCBub25jZSA9IG9zLnVyYW5kb20oMTYpLmhleCgpCj4gKwo+ICvCoMKgwqAg
b2Jqc2V0ID0gb2Uuc2JvbTMwLk9iamVjdFNldC5uZXdfb2Jqc2V0KGQsICJiaXRiYWtlIiwgRmFs
c2UpCj4gKwo+ICvCoMKgwqAgYnVpbGQgPSBvYmpzZXQuYWRkX3Jvb3Qob2Uuc3BkeDMwLmJ1aWxk
X0J1aWxkKAo+ICvCoMKgwqDCoMKgwqDCoCBfaWQ9b2Jqc2V0Lm5ld19zcGR4aWQobm9uY2UsIGlu
Y2x1ZGVfdW5paGFzaD1GYWxzZSksCj4gK8KgwqDCoMKgwqDCoMKgIGNyZWF0aW9uSW5mbz1vYmpz
ZXQuZG9jLmNyZWF0aW9uSW5mbywKPiArwqDCoMKgwqDCoMKgwqAgYnVpbGRfYnVpbGRUeXBlPW9l
LnNib20zMC5TUERYX0JVSUxEX1RZUEUsCj4gK8KgwqDCoMKgwqDCoMKgIGJ1aWxkX2J1aWxkU3Rh
cnRUaW1lPW9lLnNib20zMC5zcGR4X25vdygpCj4gK8KgwqDCoCApKQo+ICsKPiArwqDCoMKgIGhv
c3RfaW1wb3J0X2tleSA9IGQuZ2V0VmFyKCJTUERYX0JVSUxEX0hPU1QiKQo+ICvCoMKgwqAgaWYg
aG9zdF9pbXBvcnRfa2V5Ogo+ICvCoMKgwqDCoMKgwqDCoCBvYmpzZXQubmV3X3Njb3BlZF9yZWxh
dGlvbnNoaXAoCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW2J1aWxkXSwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBvZS5zcGR4MzAuUmVsYXRpb25zaGlwVHlwZS5oYXNIb3N0LAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG9lLnNwZHgzMC5MaWZlY3ljbGVTY29wZVR5cGUuYnVpbGQsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW29ianNldC5uZXdfaW1wb3J0KCJTUERYX0JVSUxEX0hP
U1QiKV0sCj4gK8KgwqDCoMKgwqDCoMKgICkKPiArCj4gK8KgwqDCoCBpbnZva2VkX2J5ID0gb2Jq
c2V0Lm5ld19hZ2VudCgiU1BEWF9JTlZPS0VEX0JZIikKPiArwqDCoMKgIGlmIGludm9rZWRfYnk6
Cj4gK8KgwqDCoMKgwqDCoMKgIGludm9rZWRfYnlfc3BkeCA9IG9ianNldC5uZXdfc2NvcGVkX3Jl
bGF0aW9uc2hpcCgKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbYnVpbGRdLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG9lLnNwZHgzMC5SZWxhdGlvbnNoaXBUeXBlLmludm9rZWRCeSwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZS5zcGR4MzAuTGlmZWN5Y2xlU2NvcGVUeXBlLmJ1aWxk
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtpbnZva2VkX2J5XSwKPiArwqDCoMKgwqDCoMKg
wqAgKQo+ICsKPiArwqDCoMKgwqDCoMKgwqAgb25fYmVoYWxmX29mID0gb2Jqc2V0Lm5ld19hZ2Vu
dCgiU1BEWF9PTl9CRUhBTEZfT0YiKQo+ICvCoMKgwqDCoMKgwqDCoCBpZiBvbl9iZWhhbGZfb2Y6
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2Jqc2V0Lm5ld19zY29wZWRfcmVsYXRpb25zaGlw
KAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW29uX2JlaGFsZl9vZl0sCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZS5zcGR4MzAuUmVsYXRpb25zaGlwVHlwZS5k
ZWxlZ2F0ZWRUbywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9lLnNwZHgzMC5M
aWZlY3ljbGVTY29wZVR5cGUuYnVpbGQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpbnZva2VkX2J5X3NwZHgsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKQo+ICsKPiArwqDC
oMKgIGZvciBvYmogaW4gb2Jqc2V0LmZvcmVhY2hfdHlwZShvZS5zcGR4MzAuRWxlbWVudCk6Cj4g
K8KgwqDCoMKgwqDCoMKgIG9iai5leHRlbnNpb24uYXBwZW5kKG9lLnNib20zMC5PRUxpbmtFeHRl
bnNpb24obGlua19zcGR4X2lkPUZhbHNlKSkKPiArwqDCoMKgwqDCoMKgwqAgb2JqLmV4dGVuc2lv
bi5hcHBlbmQob2Uuc2JvbTMwLk9FSWRBbGlhc0V4dGVuc2lvbigpKQo+ICsKPiArwqDCoMKgIG9l
LnNib20zMC53cml0ZV9qc29ubGRfZG9jKGQsIG9ianNldCwgZGVwbG95X2Rpcl9zcGR4IC8gImJp
dGJha2Uuc3BkeC5qc29uIikKPiArfQo+ICsKPiArYWRkaGFuZGxlciBzcGR4MzBfYnVpbGRfc3Rh
cnRlZF9oYW5kbGVyCj4gK3NwZHgzMF9idWlsZF9zdGFydGVkX2hhbmRsZXJbZXZlbnRtYXNrXSA9
ICJiYi5ldmVudC5Db25maWdQYXJzZWQiCgpSZWFkaW5nIHRocm91Z2gsIHRoaXMgY2F1Z2h0IG15
IGV5ZS4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gZG8gdGhhdCBhdApDb25maWdQYXJzZWQ/IEkgc3Vz
cGVjdCB5b3UnbGwgaGl0IHRoaXMgYSBsb3QgbW9yZSB0aGFuIHlvdSBleHBlY3QKc2luY2UgZWFj
aCBuZXcgZXhlY3V0aW9uIHRocmVhZCBjb3VsZCBwYXJzZSB0aGUgY29uZmlnIGFuZCB0cmlnZ2Vy
CnRoaXMuIFdvdWxkIEJ1aWxkU3RhcnRlZCBub3QgYmUgbW9yZSBhcHByb3ByaWF0ZT8KCkknbSBh
bHNvIHdvcnJpZWQgYWJvdXQgZGV0ZXJtaW5pc20gaGVyZS4gSSBkaWRuJ3QgbG9vayBpbnRvIHdo
YXQgZGF0YQp0aGlzIGlzIHdyaXRpbmcgb3V0IGJ1dCBpdCB3b3JyaWVzIG1lLi4uCgpDaGVlcnMs
CgpSaWNoYXJkCg==


