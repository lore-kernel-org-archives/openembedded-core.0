Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBFE74AB3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:11:07 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id n40-v6so21302518otd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=0G8Vb4yTJxL+8Qtbkhl15PJP05cc7CvAk9oiveRVPEA=;
	b=bJZvIx776YBZ54K1TwrRuC17srGYOtnedi/NEVji1xPc2UnFDRML6LLBBFGnT5ae7I
	jgDU7CKp/7YAPWRhZsXcGvjXprrwfguBcPhTcJubWuhSguWl3ciTANQ2CxawWD9ddGzY
	hnZ1VAR7JAPGQ/nDlNMuo2bSYmgCYF0N+3dGv0DzFM9IIUP8GoBFP3EuHscqIdebIuw9
	LU5cvRmeQ1M+b7gjQz3s/16mMC2td2LBywOUtsyWHsYGWKhsDu1FXRknZnroFwAFUW2W
	jEQwG7XMjLvlk1RvvxENQJo5RdeirkjhHPAwzPCTGcChfY1Fx+Fz5Tm/entK96InIHnw
	K2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=0G8Vb4yTJxL+8Qtbkhl15PJP05cc7CvAk9oiveRVPEA=;
	b=D4xNAWUDAGc7oRLXimoXH4fg40F8AimVMmT1hfv/L8bTnn4cQay7iSVtylmqCLdLJt
	A7bHT5WmEqA/xNSnWRWDdJmFo/2fHVJET9gL1bZTPhFBS3boZl90Zwlw9rwARC6bSRoX
	R5U9FehSFLc0ro1hkY9TNL3wgPR/fLDEUJFmEyJWBQaWJ/7fpCCTFK+Jpm4/6WemyqZT
	4OxgshsRP98h4nnrfKe7QBu0TUbxPWZROJI8oild4nrkwo6Fo3nx3ARx0bGF02I+JII3
	VcTJHHXblLFBZbk+fBjD2emEFVpGMXIyLSvGI9rVI36bgDPd86o9Xjp6JBX2SgZ00w6Z
	JzOQ==
X-Gm-Message-State: AElRT7Fx0k8OfjXrlulNgK8IdHNd1YVb91xYGwCxfpUbpOVaNnh3+stC
	V/TFQgB48cwqlmEqtIrJ6cCRGSwT
X-Google-Smtp-Source: AIpwx49f/uuJb/xNx412sl+G6krIWOshi8rWcfDkU+mDaMmaSYaZkKPX99NaBUSP7rZ1HKUPh4InhA==
X-Received: by 2002:a9d:51cf:: with SMTP id
	d15-v6mr8672312oth.24.1522797068748; 
	Tue, 03 Apr 2018 16:11:08 -0700 (PDT)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	b41-v6sm2153352oth.60.2018.04.03.16.11.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Apr 2018 16:11:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id z8-v6so17580565oix.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 16:11:07 -0700 (PDT)
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr9122946oih.56.1522797063912; 
	Tue, 03 Apr 2018 16:11:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58ca:0:0:0:0:0 with HTTP;
	Tue, 3 Apr 2018 16:11:03 -0700 (PDT)
In-Reply-To: <20180403213259.2391.8021@do.openembedded.org>
References: <20180403210146.6040-1-otavio@ossystems.com.br>
	<20180403213259.2391.8021@do.openembedded.org>
Date: Tue, 3 Apr 2018 20:11:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr9yxFHc0SEzCiN5ekGNKUL8Z3LA_AWsY6DYn3tTYkFtA@mail.gmail.com>
Message-ID: <CAP9ODKr9yxFHc0SEzCiN5ekGNKUL8Z3LA_AWsY6DYn3tTYkFtA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2E6IFVwZ3JhZGUgMTcuMy43IC0+IDE3LjMuOA==?=
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
X-List-Received-Date: Tue, 03 Apr 2018 23:11:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 3, 2018 at 6:32 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: mesa: Upgrade 17.3.7 -> 17.3.8
...
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 4cedddb836)

I based the patch on top of sumo-next to avoid the need of rebasing it
for Ross and Richard. If it is indeed need to redo this on top of
current sumo/master please let me know and I can do it promptly.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

