Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33143.1792973384795733468
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 17:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d7uMFmQq;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2756395e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 17:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973383; x=1793578183; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SlRCSbbfosDszALTcJkOeg2ivL7STo0bCDTq3vITszo=;
        b=d7uMFmQqs6Llv6jhH0snWjxdk24wPiA2NNT53cpaXIQ9mun0FpRVJNB8hVP2zF38V3
         lkcyIQA0bojjV61dm2s/xmTycON9geKDVGsoNa/U7YQso1aLl8STNPjrxmdDawh3wLpw
         sgXrweZxcxo3XOqJqD9kquVHIyBaTSAXv5XfEnlIwsHH0pUzSWRO3Ui/wUlQWOeiAKZe
         W875xy4u0R7kOYlXu0OgNstiiXVlzaY3YTvGYKAyYeZipU/TY8rUmPo8NkDFG9KuSN10
         U5JNNxsholVQBlshFay6hWnbL7wzHndSASIXF3SPsv+HWUvj079YyQzC28QXJ75O+Zem
         Xweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973383; x=1793578183;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlRCSbbfosDszALTcJkOeg2ivL7STo0bCDTq3vITszo=;
        b=M+jfhCRMCskODV9KZj409obmWE6CjKJlmlk0eFVl1LHRNnClD3IhWRmebBf1b3Wdqz
         AZFRTDtqjXtrX0jUDC2cEi4YIoy10osH/s7M603NdGnc5Y7Segi43f1Hxs0UXnEjaD8k
         bKd7igf7FOp0c9gSTuq6CyaIoGRbSanWDiy9G6btfiRHKqMzsEQvem+Zpen7/ZOnwcan
         3IijCViwQQ7f7TtJrHVgeULOraf/oX4RxfK4S19iIJVIOL+yFWIy0peuYF+3IuhCD8RW
         w+Zwo8Eg3OKkH2fuOX2Tv6176usJ68CnfeMiTNt45P0XWfD0tsyLzz2c51NfVA5ktrn/
         Rclw==
X-Forwarded-Encrypted: i=1; AKwUvBwG5vmtxsKsnezH63NYoPvy8xSdgg/jXUH4mS2GTob/8/iYXrm8D4W+ezKrNo8cET+FWUtbKvblL+ytC7Q51E//wQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL1ihCGJWeZzjyJUIAjUGGxGkngLJInT9prz7TPHjsa47zSy0+Y
	K1V6BxKmVAS8qU3WMeYfPp6cjcrhcfFz2v8LnL+qnx4N5xH0hEInuXyQ
X-Gm-Gg: AYBFou12pazJV5dzQzwM5150DjzkJ35a8uP9GE32KupWXybyzL+bSB/qDgUKHphIAKO
	EuwhsPPTDMVdJHC4lK+LzwpjUQ22yGxen+Vkrccvqv6QW8pdUZgNo47BvkSlmYghEgYEKwv623W
	/EJz7+rRuAM8kiOF/w3x1/+mas8ViXsc0QmCa5BqJ3snJky1C4uSul7Epx7xbzjizqO1ydsrSuF
	c0h54rWzSQOwuOz17ro3/MT8ogWLv45XCoUiGVOQ8DAUXjX4ZNzaG1UZB7Zl/rRVcIilijsteB4
	y4D0ur/EgJfePKsrv1UwgSNjV8/Muaf/xho2644BY/wJoGrtj5N/7PIpHclH5LKfF/lV4/RKTg8
	CFDJyOYygi7jSfzBOKWtGi3XG/s/zYd5tdXomv32DLBimOkyAvNRYM5m/Jb11nwiPFLbHaQeHpt
	maMI6RVND83x5VDXVU9E2TYhAZrp3z+4LFVVgpXlBZofmpMi1D8l8vhl1VFImRKEWRglwcFNn4g
	AilgzibK5ArpyXc2oAe2CGmFDDHPPDBPAs1IxzUaHo/XP7vphABgZ6igKk7xnzKrnC3SdsrefBv
	RroHaWYlg8/4iRNKuyFgsLn9vNzAiCsrCcUshKOFC7RqNLnRJA==
X-Received: by 2002:a05:600c:8581:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a35da23c55mr62725935e9.14.1792973382750;
        Sun, 25 Oct 2026 17:09:42 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm13551329f8f.51.2026.10.25.17.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:09:42 -0700 (PDT)
Message-ID: <fe9ebfd9a22724c0387504cee4b5e857482a17e9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] devtool: Support multiconfig workflows
 and fix kernel extraction
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: anusmita.duttamazumder@arm.com, openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2026 01:09:41 +0100
In-Reply-To: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 00:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248629

Hi Anusmita,

Thanks for working on this, multiconfig support in devtool is long
overdue (YOCTO #13933). Handling the mc: prefix when devtool calls
bitbake is clearly needed. Before going further, I'd like to agree on
the long term design of the workspace, as my series works on the same
problem from another angle.
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf/ide=
-sdk-improvements

In most cases there is one recipe and one source tree, and what
differs is only what that source is built for: another multiconfig,
-native, nativesdk or a multilib variant such as lib32. Build output
is already separate for all of them: each multiconfig has its own
TMPDIR, and the BBCLASSEXTEND variants have their own WORKDIR. So the
question is mostly how the workspace records which variants are
modified, and which source tree they build.

Your series puts the appends in a directory per multiconfig
(appends/multiconfig/<mc>/) and selects them through BBFILES with
BB_CURRENT_MC. This is small and makes it explicit which
configuration is modified. The workspace is still keyed by the bare
PN though, so a recipe can only be modified in one configuration at a
time. This matches the current restriction to one BBCLASSEXTEND
variant per recipe.

My series keeps one bbappend per recipe file and scopes all settings
with pn-<pn>, so that e.g. foo, foo-native and lib32-foo can be in the
workspace at the same time. By default they share one source tree. A
variant gets its own tree only if its SRC_URI, SRCREV or S differ, or
if a variant builds in the source tree (B =3D S). The oe-workdir and
oe-logs symlinks in the shared tree are named per variant, e.g.
oe-workdir-native or oe-workdir-mc1. This does not cover BBMULTICONFIG
yet: PN is the same in every configuration, so pn- cannot tell them
apart, and something like a multiconfig specific override would be
needed in the shared bbappend.

The two approaches overlap but don't fit together well. With both
merged, devtool would have one mechanism for multiconfigs (separate
append files) and another one for BBCLASSEXTEND variants (scoped lines
in a shared append). read_workspace, reset, update-recipe/finish and
ide-sdk would have to handle both. Modifying e.g. foo-native and
mc:mc1:foo at the same time would combine both mechanisms.

So my question: what is the better long term design, also with
-native, nativesdk and multilib in mind? Separate workspace appends
per configuration or variant, or one append per recipe file with the
modified variants scoped inside it and one shared source tree?

Regards,
Adrian
