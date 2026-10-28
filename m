Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66.1793227218420608942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lVomYdky;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so15255475e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227216; x=1793832016; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NiDlweREisp7S7DsPIMBkiQCxzYpJYJqvr95PO0Xgx4=;
        b=lVomYdkydfrBMTtqYgjGuE+z40hbmGJIwD9gIjOAEn/LmAVWVtE+AQ3WoKpmWHVKkz
         388EagIVnMV/rF0v1VgQyGQBp/5CwAsA00vzcDCQ8Eq+xi6TqF/reliuWIi925ggLtxP
         CLc/h+poq7OaaCaNh8vz7KYwbhqvzkeDUDCqzWrb2+V5gS5SS3SFmYCfPdllesN6L+QL
         4pjM0xYa1sZ6/VZ1iM+lVPhX8/QGVsQlcyOcDIs1AJsh53g8aXDc6q8byrZiLWi+Lx7M
         Eu4AgbqSG1+VFkkYPGrdAX8zcSb6/wS0Z2ftcmoSFTJKFRAs08r8X5qT3mUL84flFU0c
         AOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227216; x=1793832016;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiDlweREisp7S7DsPIMBkiQCxzYpJYJqvr95PO0Xgx4=;
        b=pDGFOQ8FK161sIdtGmepGMAGq5kl2UGBSQtsKsW8AQAAfa5WdrnAaX5hjnW4urKKa9
         s0tLwEIXr41RE6KKuCXssF3Bulj9pykY6OV4KMJM3byPCM5870OLUkEX5Rq3MbMHCjxl
         DDHBFTbhKndO2XgrsnaTiZJHTx8zJh2EvjiNJH9moAS8dvu2S5o3RMc8eMhjyIMtmmJK
         prdeuGpk3ASOjmYiM/WgU9P3LssQgwSkx7sjn7E59URQK6TNhzsdMEqhEw+pwnA64ihj
         yo8zm8+6SHj1fR4+gz4W7DgT9LpPmRFT2ib51TB2fSr1GDBg1tqdAhfUXLG1sfRViEBK
         T54g==
X-Forwarded-Encrypted: i=1; AKwUvBwiCGsD3r0XLokJRyp3J+ODFOrxNzDuXf061J1fCOgx8EGJRmqwJsJM6Dh39RoxTSMlZw5FvGIGl3Z7KTw0zcBfmw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLO3/8I733IEPsatDfo83rkIwmLRe6QLSVS4T/S4YHMYwxfvSzN
	m1Bo+U8uGoQ7025c1xu3NaynhuRn0h55TPPQPAWooqWn+0pXmVi9NSnR
X-Gm-Gg: AYBFou3hkb/qLhQhhAUtODJ0R0c0tCyh4vvrBOWkiY+tDPdbrff3fME7LvIhKYg7j+K
	buTnV9GQ0x9mKqEWuftDD9hvXt5BF5hPg56Uw17+xQxR9GZTtWnB6gD4nnuaX8ufOuQGESCuyA9
	9VfSIEssjIH1DmUkeOwx1gM6zFJJs8zpqdSjdfU1PhRhMcKNrF2OTqJPmGE7YcaId1NW3/HRg7+
	g4HKactitSK6lpTALtYBlamai5idfch3YuB2CuwhKdoVnpq3FKPwcS7RV+n2kOffFa3IgAXbs6U
	xbIJDipOlZOLOQI0/IwsVBdpFZKy+DLqKKkFX6iOTzN+xb0NlN7ZCGUZl4uWuh2gPhmNuwmhSW3
	0gHG4fzuBJQUfKqTxSqIQP0SUHRsSIUSp0ho75YDw/3TkzFysthVu84aDqwDE1bUTm1kk75x1Lb
	Tq2KOPLjBewTsWpccxeDYpDW42lYfZqSTkEsW7q6RIRjrRu1Qn57XE3GGylEUzHXuOJuJJfK73h
	PbtunSPtrb7OZ/qRUYl3ZAdVwoBpfYoQT1FRHY4OwNFgDs4Mo+EtWYJkH4L5QEEhfX2ls/JbUnA
	KDY1bVBJqRe4rXbK1PKKM6dySB8N2YK16+rdsKW/+TFEvfKzChMpuoyRoMvgvcpvv4N5YWFSjid
	wSA==
X-Received: by 2002:a05:600c:8183:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4a966a55283mr73991515e9.14.1793227216275;
        Wed, 28 Oct 2026 15:40:16 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9ead8aa0fsm22507015e9.4.2026.10.28.15.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:40:15 -0700 (PDT)
Message-ID: <069783d91f3cea538769103632abdc6e85f4b47c.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 03/20] devtool: ide-sdk: export recipe Cargo
 configuration
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Wed, 28 Oct 2026 23:40:15 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-3-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
	 <20261026-devtool-ide-sdk-cargo-v1-3-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248846

There are probably two issues with set_toml_table_values() which should
be fixed.

Multi-line values
The helper only replaces the first line of an existing key. If
config.toml already has a multi-line value, e.g. rustflags =3D [\n "-
C",\n "link-arg=3D-lfoo",\n], the key line is replaced with the new
single-line value but the continuation lines ("-C", "link-arg=3D-lfoo",
]) are left behind, which is invalid TOML.
It also doesn't recognise a header written as [ build ]. It appends a
second [build] table instead of updating the existing one.

Trailing comments
New keys are inserted at the end of a table, and the end is found by
searching for the next [ line.
Blank and comment lines before that next header are treated as part of
the table. In the generated cargo-config.toml, the # BUILD_SYS comment
(which describes the next table) ends up above the injected rustflags.
Please insert new keys after the last key/value line of the table
instead.


A tomllib.loads() check of the generated file in a selftest would also
be cheap.

Thank you,
Adrian
