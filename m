Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15198.1795704158583041744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 06:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=MBarolXM;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f2f2edb19so592143685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 06:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795704157; x=1796308957; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:from:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQOOduICbj6gJDRl8DNp9TgUdlOo40h814sg6df3lj8=;
        b=MBarolXMbj+oN8Fzr3kvNMyIqb8lG26mzWJqu5anss8ORCwr/MN8RolSD+Yw3Unwaq
         20aWXKQG3ipFYFTj7PGjbhWknaN/d+nX5eSTUty7thvxJ2Xu0GRzNH6mZHG615H5F/K1
         D9tmExqWLWHZ14oEA7IVnEEZcS11VUy7qFWuXL2a9FXGy68exNiI3sPvZkVpQyxy2XaW
         CbmTq5kgQYa+GIs8M+ThUMmJUtUa6V6T3QgXJx+J5NcP8NtXpGxuP0yeCkxWwQ+cj9ec
         bqPi45MSMRW8nPw7CU4TEr42/elZG3wwzTJaF7pmWz2FdyAQdx83rt/8/c4kSEQYcZDl
         ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704157; x=1796308957;
        h=in-reply-to:references:subject:from:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQOOduICbj6gJDRl8DNp9TgUdlOo40h814sg6df3lj8=;
        b=q12AXJ53LAU4NdTxxF3BcXwTLv3vpAyFLYTakB5CQL66eSUSbCiBSgZFPWwEKoAIla
         EH66shqLvI2tD6+FfDzPJXVE+jC2nP25+r8OGTMNNVLjIGLtv27sb1VsJCvSHM0/KkFb
         Yvj0Nsk7GTDy2ySjeAd0t3SgLFcplwyKiPLiQc36sNDmJQ/DCaTmK1mYQGvAR8KceuPr
         veSJmTl7Lcg5IrJwhVp6w3suZ4BbVrv+HSB9cNXphgsBQj5isdHsR/+LYKr5DW2Gydms
         t9dJQ5TgH6VQCO4yrSR+RWhBqQ0Aa//vT8yJQldx1nEJ5ajq9AvoCccbW7YlrsN/t1zx
         XIKg==
X-Forwarded-Encrypted: i=1; AL+hErH6B/gwa1VC9/78o8nc03g+61aSzS150k2VyvX3q3Kb/2w68JPHi4bMnacjmWGpwBra45Xl0JsOx7MBFf3V3sNiFw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+cfapyvsz0WaAEDkLc1k8DBNuckLloYibXJtB4YaL9rmNmpefH
	3BZVqKvGiYUf1+qrDh29c7Z/7n2Csh+thJTuYzRUWeLZXQMZI/spZt4CyCFkytz8VoQ=
X-Gm-Gg: AZFdTZdGmA6FYZpahSg3Qnaf8WIcqZVxSz5lb5e+1nUOD/O26wrAHFO/1OQ9TsRYWZk
	C/Sy7BPvD8gW2rp30awBrjVV3Lm5V0ft4KKDPq6ulyzXBR13caanzthKMCg506/AYRcMU9dNmbi
	9vjCDmhOeGDEXSCV6rJJUnb8iHudGl+0n7gyLlO0UfKC3I3TiFU688QZK7ycSn0t5TbxsZCJbdz
	wt3PH+ivhjj72mIVcGeYYLrlGe93WJ+OglE/czizdhv/1xWbZo0SeMAQ9scS+Zqb5UdhbUP7DVF
	BWb9kWAdOcfEGMfZ0mVDJsq62a4NrtFhJR5BKNSQ0AASFMlSgQXJ2Ju6yjSdGCcpWTUKKw2o8Zd
	PQ8hGW5Y4+ns/sDVHJe+dGKkw1hka5Wd6qYNLBCa9e8ee7B9iVO+wWtLKBG8QKmSxa+7iGxdt81
	MGMpeo2Padz84QE78yHRZEH8lsvtkZ9WxxMYXgl/wb9q3m0Fm3FUGf4AItdnUe1+YQC4cN7xYsB
	96bj3jrYCxAPnIjiYo5FYKIPX+1iB9hoCL2KsiG1JhjjQIfLa5bZe2tttewOe9lAyyKrBzDL5zx
	NcNYPWtkhipb3ujVaMYnHbleGnsPIYtzA99bknIqLrq3LnomdLKo8daGFab6rAnz
X-Received: by 2002:a05:620a:8398:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949bab1dae7mr3892821585a.43.1795704157409;
        Thu, 26 Nov 2026 06:42:37 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm1582488285a.6.2026.11.26.06.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:42:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 09:42:35 -0500
Message-Id: <DN57ZWGII9NM.2M4OO011CBHS5@baylibre.com>
To: "Paul Barker" <paul@pbarker.dev>, "Trevor Gamblin"
 <tgamblin@baylibre.com>, <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [OE-core][PATCH 1/6 v2] hyperfine: add recipe
X-Mailer: aerc 0.22.0
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
 <20261125160821.3028875-2-tgamblin@baylibre.com>
 <DN561RGMU8LL.30LI4VXRH7MOV@pbarker.dev>
In-Reply-To: <DN561RGMU8LL.30LI4VXRH7MOV@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 14:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251309

On Thu Nov 26, 2026 at 8:10 AM EST, Paul Barker wrote:
> On Wed Nov 25, 2026 at 4:08 PM GMT, Trevor Gamblin wrote:
>> hyperfine is a command-line tool for benchmarking commands across
>> multiple runs, written in Rust. It supports configuring the number of
>> runs, enabling 'warmups', parameterizing runs, and more, with reasonable
>> defaults (e.g.  running at least 10 passes of a command when the
>> '--runs' argument is not given).
>>
>> More info at:
>>
>> https://github.com/sharkdp/hyperfine
>
> Hi Trevor,
>
> Hyperfine is incredibly useful during development, but probably isn't
> going to be shipped in most production images. Nothing else in OE-core
> depends on it, and it's unlikely that anything else will depend on it in
> the future as we typically disable benchmarking tests in ptests.
>
> I think this recipe is probably better suited for meta-oe, unless I'm
> missing the reason for including it in OE-core.

I can submit it there. My motivation for submitting it to oe-core first was
because I wondered if it might be useful for us to have an option to enable
using hyperfine in ptests/testimage runs for triage purposes.

I think patches 3-6 should still go in, since they apply more generally to
recipes using ptest-cargo.bbclass.

Trevor
>
> Best regards,


