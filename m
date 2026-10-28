Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.465.1793228493846777700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 16:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vZJW3e3D;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1183379f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793228492; x=1793833292; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c9H6M7BeWXkDf/8YVrvpcKXIaQJ/4gAxrJHcKyjtqjY=;
        b=vZJW3e3D0oygwUVuJY2xIv+M1/BF/SnxphiVgva/rW7KPAzrTvhbYqHhqdFoFOt3Nh
         AQjlnEvCB5mSn8xFqUj8Y0fTLnQ93HG4f1cIRhjLDz6Aih71sItoMwDmtTngJJ/h3kZo
         gSeD9HbLySQRhHY5Mr2tpR+9wKNHGBP/yfw+Llw0TOPqqUpYaZuKcFUbhtoGWtvnUBjT
         QTEligrSNOmXcqXabpbiKcpSDJGMPU0Rcf3Tt66QpcToLvO98UrlK8sNyZ3vMJs+wLO2
         jH7uA+0qbL4Y2F3F0YyIOPoI1jhH2ugYfbKIBPl/dWWAf1CcXUPBtt21yxlEwff9dP7O
         OasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228492; x=1793833292;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9H6M7BeWXkDf/8YVrvpcKXIaQJ/4gAxrJHcKyjtqjY=;
        b=qmJcRttwXaYap3RNTyNt53LGHU0eZ7CHKdx2Rrq0qMGdUNPuXmQ08bKqsa3d+Y5ECP
         UaH3i6JndVDJzW6ZrTS390XP2Bid1CpELM8k7qjlJRhV105dK25iq0P31pxj61ME1E3M
         DmgKL3mZiJy9EkFKQPYSN5X4dB8KFPoAlZgrWG50cFXFZ7sXEbssOmeAkIEDdIvy+Oa0
         Ydp6R/XMJ2dq7jlrVjfqlO2/WYpGgalSLj0Y72In+72e7fi+hP0LEfArm5TiJuRwvzQV
         hPoehtbJKQwmI9YwSF/bCZCrggt6Yw+K5mBqT55JO4mOXGiSQTpAuYoYH6eBbuTWYu8T
         bAkA==
X-Forwarded-Encrypted: i=1; AKwUvBzYOO0FlcqPwKcvGNws9LdfpIpWkE6I9XmiJ89z84KeDHmRpIX+dndVEXKcduWqKAd9dZsom9t2/QeHKiR0EgUJ6w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKSjD/Y3KclAYMRNRxw09vQ4bbJvmCVircQrc3hLRNmmzWkZNok
	y7AF//g5u7ILt8P5QEAq20PinHRbqloS0JA5hW+nD/+tn2tTz1a+CO1J
X-Gm-Gg: AYBFou0DGPAbUX2+ta73Q+IEAGrSqABQwIQzcqcNUzczwyVG2IjkJndbvowyWJv1Ume
	hcLjW9s11bBqp8r0vf0gPsxp66YDk/XS5jW735SKZqDz1EPfhCYxgFtw/O7rIQj/RI44jTMmW2V
	1RWTSCGYz2v76Zd5BM/Re6+Quw1CSLSK720AyKPEH2z8oqQUbw3+abaPURcRZjp5yaCkmBGLWgt
	fpC6Xq1D7rmtWbNjHcuLSt6fUZ2FvzG9W34jyBeO0cOxrBMLFq2PRvIDYfui7KBXf+aa5o99IIf
	fsw8Uxu1bUvvoQA34YeE1okX1/pdG9Q/kBZpXpFLQeDnu7fIko23xM26vQtJYGsCEy03EPOnG+K
	Yp1j8gLwsXeRHNekaxWzqN/C5SPGwe+ZY2xt9Pzg33hbygt6ZF1GF4kuYl6gLTwkAPUQYsTgzkY
	zNPx0e9FKW63I3jRphxgOCctdT06vq9q6jeBK1GQ5rg/UkNk2KKpDcucSE29kQMoJm94I1SCT1x
	LGkr9xQc1tt79hdjakdFuH5qLMHFMKuwkt7OhvGjlOSP3MDAqIRgS7mU2R/4A4PwOD2qDYNXTxC
	WFLUtTBnaV9vpwE9L9MiNdZ5qx0bX3lh7Gl2kSfPV0SsUx02zsuc7VzEoGAzGstVwi35CSFm5Pk
	h8A==
X-Received: by 2002:a05:6000:40d9:b0:48d:f14a:9183 with SMTP id ffacd0b85a97d-48e5d2e4ae9mr9706506f8f.15.1793228491872;
        Wed, 28 Oct 2026 16:01:31 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dd7sm31067668f8f.15.2026.10.28.16.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:01:31 -0700 (PDT)
Message-ID: <fdb7127ca6cab5aff93c4db18a298464f81a7725.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 10/20] devtool: ide-sdk: order install after
 optional build task
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 29 Oct 2026 00:01:31 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-10-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
	 <20261026-devtool-ide-sdk-cargo-v1-10-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248849

T24gTW9uLCAyMDI2LTEwLTI2IGF0IDA5OjU1ICswMTAwLCBFbmd1ZXJyYW5kIGRlIFJpYmF1Y291
cnQgdmlhCmxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gTGV0IGJpbmFyeSB0YXNrIGdl
bmVyYXRpb24gb3B0aW9uYWxseSBpbnNlcnQgYSBidWlsZCB0YXNrIGFuZCBtYWtlCj4gaW5zdGFs
bC9kZXBsb3kgZGVwZW5kIG9uIGl0LiBDYXJnbyBidWlsZHMgb3V0c2lkZSBCaXRCYWtlLCBzbyB0
aGlzCj4gb3JkZXJpbmcKPiBlbnN1cmVzIGl0cyBhcnRpZmFjdHMgZXhpc3QgYmVmb3JlIGRvX2lu
c3RhbGwgYW5kIGRlcGxveS10YXJnZXQgcnVuLgo+IAo+IEFJLUdlbmVyYXRlZDogVXNlcyBHaXRI
dWIgQ29waWxvdAo+IFNpZ25lZC1vZmYtYnk6IEVuZ3VlcnJhbmQgZGUgUmliYXVjb3VydAo+IDxl
bmd1ZXJyYW5kLmRlLXJpYmF1Y291cnRAc2F2b2lyZmFpcmVsaW51eC5jb20+Cj4gLS0tCj4gwqBz
Y3JpcHRzL2xpYi9kZXZ0b29sL2lkZV9wbHVnaW5zL2lkZV9jb2RlLnB5IHwgMTYgKysrKysrKysr
KysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbGliL2RldnRvb2wvaWRlX3BsdWdpbnMvaWRl
X2NvZGUucHkKPiBiL3NjcmlwdHMvbGliL2RldnRvb2wvaWRlX3BsdWdpbnMvaWRlX2NvZGUucHkK
PiBpbmRleCBiNWZmMzQ0ZThhLi44MDMxNGJmYjg5IDEwMDY0NAo+IC0tLSBhL3NjcmlwdHMvbGli
L2RldnRvb2wvaWRlX3BsdWdpbnMvaWRlX2NvZGUucHkKPiArKysgYi9zY3JpcHRzL2xpYi9kZXZ0
b29sL2lkZV9wbHVnaW5zL2lkZV9jb2RlLnB5Cj4gQEAgLTY3NCw3ICs2NzQsNyBAQCBjbGFzcyBJ
ZGVWU0NvZGUoSWRlQmFzZSk6Cj4gwqDCoMKgwqDCoMKgwqDCoCBJZGVCYXNlLnVwZGF0ZV9qc29u
X2ZpbGUoCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuZG90X2NvZGVfZGlyKG1vZGlm
aWVkX3JlY2lwZSksIGxhdW5jaF9maWxlLAo+IGxhdW5jaF9kaWN0KQo+IMKgCj4gLcKgwqDCoCBk
ZWYgdnNjb2RlX3Rhc2tzX2JpbmFyeShzZWxmLCBhcmdzLCBpbWFnZV9yZWNpcGUsCj4gbW9kaWZp
ZWRfcmVjaXBlKToKPiArwqDCoMKgIGRlZiB2c2NvZGVfdGFza3NfYmluYXJ5KHNlbGYsIGFyZ3Ms
IGltYWdlX3JlY2lwZSwKPiBtb2RpZmllZF9yZWNpcGUsIGJ1aWxkX3Rhc2s9Tm9uZSk6Cj4gwqDC
oMKgwqDCoMKgwqDCoCBydW5faW5zdGFsbF9kZXBsb3kgPQo+IG1vZGlmaWVkX3JlY2lwZS5nZW5f
aW5zdGFsbF9kZXBsb3lfc2NyaXB0KGFyZ3MsCj4gaW1hZ2VfcmVjaXBlLm5mc19kZXBsb3lfZGly
KQo+IMKgwqDCoMKgwqDCoMKgwqAgaW5zdGFsbF90YXNrX25hbWUgPSAiaW5zdGFsbCAmJiBkZXBs
b3ktdGFyZ2V0ICVzIiAlCj4gbW9kaWZpZWRfcmVjaXBlLnJlY2lwZV9pZF9wcmV0dHkKPiDCoMKg
wqDCoMKgwqDCoMKgIGRlcGxveV9hcmdzID0gWyItLXRhcmdldCIsIHJlc29sdmVfZGVwbG95X3Rh
cmdldChhcmdzLAo+IGltYWdlX3JlY2lwZS5uZnNfZGVwbG95X2RpcildCj4gQEAgLTY4OSw5ICs2
ODksMjEgQEAgY2xhc3MgSWRlVlNDb2RlKElkZUJhc2UpOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAiYXJncyI6IGRlcGxveV9hcmdzLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAicHJv
YmxlbU1hdGNoZXIiOiBbXQo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+ICvCoMKgwqDCoMKgwqDCoCB0
YXNrcyA9IFtidWlsZF90YXNrXSBpZiBidWlsZF90YXNrIGVsc2UgW10KPiArwqDCoMKgwqDCoMKg
wqAgaW5zdGFsbF90YXNrID0gewoKVGhpcyBpcyBub3cgc2V0IHR3aWNlLgoKUmVnYXJkcywKQWRy
aWFuCgoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibGFiZWwiOiBpbnN0YWxsX3Rhc2tfbmFt
ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidHlwZSI6ICJzaGVsbCIsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgImNvbW1hbmQiOiBydW5faW5zdGFsbF9kZXBsb3ksCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgImFyZ3MiOiBkZXBsb3lfYXJncywKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAicHJvYmxlbU1hdGNoZXIiOiBbXQo+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gK8KgwqDCoMKg
wqDCoMKgIGlmIGJ1aWxkX3Rhc2s6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5zdGFsbF90
YXNrWyJkZXBlbmRzT24iXSA9IFtidWlsZF90YXNrWyJsYWJlbCJdXQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGluc3RhbGxfdGFza1siZGVwZW5kc09yZGVyIl0gPSAic2VxdWVuY2UiCj4gK8Kg
wqDCoMKgwqDCoMKgIHRhc2tzLmFwcGVuZChpbnN0YWxsX3Rhc2spCj4gwqDCoMKgwqDCoMKgwqDC
oCB0YXNrc19kaWN0ID0gewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidmVyc2lvbiI6ICIy
LjAuMCIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInRhc2tzIjogW2luc3RhbGxfdGFza10K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidGFza3MiOiB0YXNrcwo+IMKgwqDCoMKgwqDCoMKg
wqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgZm9yIGNyb3NzX2RlYnVnX2NvbmZpZyBpbiBzZWxmLmNy
b3NzX2RlYnVnX2NvbmZpZ3M6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIGNyb3NzX2Rl
YnVnX2NvbmZpZy5tb2RpZmllZF9yZWNpcGUgaXMgbm90Cj4gbW9kaWZpZWRfcmVjaXBlOgo+IAo+
IAo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyNDg2NDgpOgo+
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3Nh
Z2UvMjQ4NjQ4Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbXQvMTIxOTM4NzkxLzQ0NTQ1ODIKPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZwo+IFVuc3Vic2NyaWJlOgo+IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbCj4gYWRyaWFu
LmZyZWlob2ZlckBnbWFpbC5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0K

