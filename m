Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.469.1793228380168673771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uNqcNVoW;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15932175e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793228378; x=1793833178; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8dV9DFMwqg46hyETR9sxU3is8VtOrDFU86izEo+X/i4=;
        b=uNqcNVoWKIfObPLXiORBjQCu+P/++zK+U5obd9mtk0jEihDkv2bLE3fwq54rWqNCy8
         djNMdFm+2bgxxcGehGZni/KGLRva5ozbXNzaWOfnZ8mSGVZAKu4csluO8eyhC8sH7jfe
         ijaqCNLwjy+St+IJPFLWk0A6l8OsZMMhnJr79s5uUZM1z4Tgaf9Wx6JH9X8bQp8D7Bsz
         f9RekSKDtHS2rlRjUdb15OtQ8DzXUBeFjfkVppVpf6ULFZ7tgnONmoFZrMb78CKMRMvu
         AKyGGNsz+/EKUURye5wWnMsbFE171ZoSe6bQRWk3oFc+/cFphOAkyKg1DiYXvR6Z6ID0
         BIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228378; x=1793833178;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dV9DFMwqg46hyETR9sxU3is8VtOrDFU86izEo+X/i4=;
        b=Gs+CghZCRbn0CxQEVk94FStxXAAuFclkdNQjU3Q0wMTooHPgHSv+FcXX13blOX7edM
         84CRroehVpSha5Zg7Qng0Ek6dTb7X5S82A8fsRFtg593C7nlTNVU5i9zERGAPewY5uL7
         l+VVbmi4f1zkkKG+t931fSOJgIyJhdhg+xadI2ZP82f8JxY+t5znDJOy8llPAO9h02B2
         WU+2njvEFsgV0shl7y2b9KLN8tSKJJhCcRiLFNaJkw8/tvPALT0DKxRa9t1xgxbwwTSY
         hSm1odIX0O4KqUB1sSHGSj+MBKU87cqkJ7x1BlOYCXi1HnB0I2xHJWd5307gjGs4E0Qe
         BxUg==
X-Forwarded-Encrypted: i=1; AKwUvBwaNBTaAb5wBl+Pitw2InJpaxyZg8REyCI7OqZyQsQkzsT0SgJ4CYFlD0Iye9HP7As6kUQVruixMyefOA7ocM+1NA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLEGWhHcGTfZwFn1JNJCx1/nnqNTCcljaHC6oHmDGFfrHAsbpLj
	j0iNR2X7ClZq0/DWyqNOm+PazbK/5aGGpf93zwa6+0C/Ud7i9EWqFqmg
X-Gm-Gg: AYBFou3asOtUiW+NghaDfzht+yBJyTuCyJYR7kn+OoaovRfTQKbtP6ULxyMGNoPqse3
	fwFzLxboeh/vBLTq8wZlXSbJ3TvcD50B4iKchNpVDA/2/C+baQeUm3/W9E65eSV3ysxB4KI/Xls
	Bhrr6Y5EI5jSVcMNYGUIYmNGAWmLYcemeYY/Cyo0IBtHJWxddK3X8qL4OYTjHwgQyTqygI3lqub
	Rk0EIVecynbSNTt3mE86uCrpFn1lNzvoyC90j5qvNI6cyMX26Hq2XYepCXO/tfhg43kUje2bxmg
	PD2a7gEeXrdH94njxRGYKpg10pj69MlhvwOfw9j3747WqDMf9h6JA6AEhjmYou2c6JMLdPsCqoK
	jUfKmOAOPsUokc6oXyHF+L7tmO+k4zq1zdtim3zhfacFlqfHq7ZP5LBS2iOsIPjZmI3NjTFzDZT
	o27btUzBgwN0/eIhs9lTDE0nsZPrEGc9d6hMXgPhIV8zCKlNP0sDfkYapLyKw9PXO4TOWSg/4Of
	lvyKoixqtr9Tuwfk60Q8IsXLdTgHAGWReUDeeVt51A/FXsRFDTNPxwbZpZMhVVtnxo8Ug6iC5/B
	S3/Tf+XN4qjxkku/3HVrOSDPaxik3QVfi292NLG+ahaAkCyUSNt5dJJSYt85EZ6F5FhCiSqFK6D
	cUw==
X-Received: by 2002:a05:600c:6384:b0:4a7:a309:6b73 with SMTP id 5b1f17b1804b1-4a9647ac3fcmr75708895e9.1.1793228378262;
        Wed, 28 Oct 2026 15:59:38 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm25897695e9.11.2026.10.28.15.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:59:37 -0700 (PDT)
Message-ID: <c4208dc56a7610228b69f4e7749c38862e289319.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 07/20] devtool: ide-sdk: configure Cargo C++
 IntelliSense
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Wed, 28 Oct 2026 23:59:37 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-7-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
	 <20261026-devtool-ide-sdk-cargo-v1-7-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248848

The crate in the example has no C or C++ code, yet but a
c_cpp_properties.json is generated. cpptools starts as soon as the file
exists, and ${workspaceFolder}/** recursively reaches the whole workdir
through the oe-workdir link, plus rootfs-dbg/usr/src/debug/**
(including kernel sources).

Why is this needed at all? I'm not very rusty. But I would assume that
with Yocto C/C++ libraries linked by Rust binaries should go into
separate packages rather than building the C/C++ code bundled. That
would then mean that ide-sdk would generate either a Cargo or a C/C++
configuration for the IDE without a need for mixed setups.

If there is a need for bundled C/C++ setups this should probably come
with test coverage and therefore also with a example using this
features.

Regards,
Adrian
