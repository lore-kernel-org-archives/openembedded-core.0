Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15412.1795517345816430167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QeYU5MLh;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so41528835e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 02:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795517344; x=1796122144; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjBeeSgPBJtNQ5x0KLESOevyx1kDPIUeHTqh+KSFAV0=;
        b=QeYU5MLh/KdifKbZf7DD4/MUXeDiOynwGtQHKDeA7DTe7gXDG5Zox8MjsYmNRJr+2W
         nEZKHmWEATt3Pu+dNAgEbf1RYgliVi7OzFhMRVu0xvMHetlescSuo48lqCR0p8Gc4RYz
         GMKH4Jl3rckuY5tvFLuabKSUd/FW7rPAHtz8ppGavVnqkGT8ujECya9NIg/nZr7ZQiOL
         HsnpkBw452ameNyWkmtIJC0ETUoF/1oJZ0nMPWb5wQoiqKp0foPtADzibBokFZidkTmQ
         HeNjRkINHHWSNzTsIZgaYdJcOvEBekWPWz6epMrrkX9AlYcAfxPP8lEWmUvgXsN4afFt
         y1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517344; x=1796122144;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjBeeSgPBJtNQ5x0KLESOevyx1kDPIUeHTqh+KSFAV0=;
        b=d1zei1H91wemzWJXChpYNNkla346wHx6/O++eEQ8bdOsU1YmYb7tpoq4dwxyZB+WAa
         PUVNcdza8ML98XF5JgfkNPVDO8+nfTaUuV0ku89k/ySEdxDCLrPOXZehPDVMjeKvq9S4
         PctKuMRB65ZQh97bRnfyyaTMx4Vm1zuFqdw9c0T0VF5YtNXGw/fxuFNOkDVx55Lk4Jhy
         fT1HyppMnOWWN9kkUHRgsjLICP5VY90SeuEJG92HMsK9BYPBFW1Eky22GI7lI0S6y4re
         WfNVAfQyymylw7oXRzkhWRagxa/hr2fwAFe1NMQ9Jap35ksNnXf0rSe5uVAk95ipEFKa
         3wwA==
X-Forwarded-Encrypted: i=1; AL+hErGyufzueNjMTXySiKofqoGYDnBUqeEcUwtCVUsu6sUcRr4OA3d+oPsgFLwd3VUbM7I+4beAnw3iJ00nowoJs1qjPg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9XQZ3F3IdubyAvu/O+mTPahyLK0+dyoiBjo15jQGDtiM8dz3Ua
	nDSdJrzIPPt9S2jJyRzycmjOFCFDELSpFJCU7A/D9BbjHGvh1QSzZl8oYB8uJ153ozk=
X-Gm-Gg: AZFdTZc7hc8brJ//IMORbuOdrwgEdZk/GF22v2BPKXS6CIfrGOhb/X9zJGVINGaBAif
	AK96ZKB1L0yBClLhNEN+61Kj7nnEAoLJVdzi0dtteYvW22DmXsjWjeWM0aN25QFnXfwNblx3P86
	G+tQOyuquWapUQJd92BaqYhoUBCIpJGmh1piqPpfPbDecGJnKCLFZxRinUsq1KZ2RZ3e52gVuKG
	sdZlrSoFX6FJT8wNCWi0uNFrmHrUt6+tNgPlj4T8xMou3SjJdNLu/mUxL1fDwd0Qg0EEAK5HRJW
	lSeFCRiQyhRkQkBdaFMYt755NIG71i0OgcnVMIql95FNqB3QRdxA+Aa6xo3EknsPfTHiV874bEx
	WENByRT6gfAJwKNhpjfHdWWMV13VRGzrYYH8PYVrpGAYZ03oQrBQyjZgIwpNIavmEwk0D+TFGdz
	WeUugMTX7J6Az1KEQyCPx5stYV166g62ukIhHiylk/gKojZq2C8AlT3FnR1y8l/RnWv2oB8qcVY
	rg3dBX/pHlU1Uhn0FxwwrvnIrnK5Nsg6cf7peZd/2iPv0yu+NFO2F9bdFtoy56zp+/QM1DO7otE
	5BB0OMNWUYuIr2B8HBTCGLL0T5jT933OwIB4jaD+5BSR+GUnF0brp6zY0by3RCNSSswRkGnB+xB
	x9XUvJhkziEsO+TY7
X-Received: by 2002:a05:600c:4e0d:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb88922c6amr273120155e9.15.1795517344054;
        Tue, 24 Nov 2026 02:49:04 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm417802055e9.15.2026.11.24.02.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:49:03 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 11:49:03 +0100
Message-Id: <DN3DS0CF7X1P.FR3PJ9D80YAR@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260831061447.180612-1-hthakar@cisco.com>
 <7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev>
 <PH7PR11MB85988110C1425A7BD276918FAD982@PH7PR11MB8598.namprd11.prod.outlook.com> <92b3723f22c7eaef6c21cedbde230c4eb3f3ee38.camel@pbarker.dev> <1226682.1795512665754697582@lists.openembedded.org>
In-Reply-To: <1226682.1795512665754697582@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251006

On Tue Nov 24, 2026 at 10:31 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> On Mon, Oct 19, 2026 at 04:39 PM, Paul Barker wrote:
>
>>=20
>> On Mon, 2026-10-19 at 09:52 +0000, Hetvi Thakar -X (hthakar - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
>>=20
>>> Hi Paul, Yoann,
>>>=20
>>> Thanks for the review.
>>>=20
>>> The go.mod, go.sum, and vendor/modules.txt changes are not required for
>>> this Go 1.22 backport, as the upstream Go 1.25 commit updates the entir=
e
>>> x/net dependency to revision a9171bc8 [1].
>>>=20
>>> For Go 1.22, the required security fix is applied directly to
>>> src/net/http/h2_bundle.go [2]. The fix addresses the infinite CONTINUAT=
ION
>>> frame loop described in the CVE.
>>>=20
>>> Updating only the dependency metadata without updating the complete
>>> vendored x/net source would be inconsistent. Since this is a focused
>>> security backport, the dependency update is not needed.
>>>=20
>>> The additional validation-related change in the upstream commit is not
>>> applicable to Go 1.22, as the corresponding code is not present in this
>>> version [2].
>>>=20
>>> References:
>>> [1] https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e36135=
9ed5307%5E%21/
>>>=20
>>> [2] https://github.com/golang/go/blob/go1.22.12/src/net/http/h2_bundle.=
go
>>=20
>> Hi Hetvi,
>>=20
>> If you've checked this and you're confident that the go.mod/go.sum
>> changes are not needed then this patch can go ahead.
>>=20
>> Best regards,
>>=20
>> --
>> Paul Barker
>
> Hi,
>
> Just following up on this patch, as it appears to be still pending review=
.
>
> Could you please let me know if any further changes are required or if it=
 can be considered for merging?

Hello,

Sorry, I lost track of that one. Thanks for the ping.

I've added it to my review series as it still applies.

Regards,
--=20
Yoann Congal
Smile ECS

