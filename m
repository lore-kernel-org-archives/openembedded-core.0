Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8193F7F530
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 18:02:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id m23so70211421lje.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=KuipBP8PQOyXr0L2cMEOey+1LhvDBDoWNRj3+GxWnAI=;
	b=oNlnGhBRCvyc5na3RVFiGeBBwVrBD58DHkzmXn0Z+x/TRLsVvo43njeVfE36EnNajM
	ufd4PJ2+5ssKBIUH41RmI0ryviJc/2zw4OwSdHV+55etqHcAB8q3aFG7p+yBMy8Lshpq
	Ph9pto+XAIaknjo3Nip16YEsHReplgwlppv11IZWpeeYlGcuupSExtSks6JEONELID6Z
	hDihbm3gkGJdAiwOfMt+im3MPcPefkMpGp/tknN1YrfpOthwqakP6xQItaLRBu0Ruxwx
	ZCecw5WP9vbXA1T221wxGjNK5xDjqrQXgteLkvpLD4kyQ5eCLNpbLJ++rf19EyX3jwT+
	r18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KuipBP8PQOyXr0L2cMEOey+1LhvDBDoWNRj3+GxWnAI=;
	b=J8cKdcXCPe88R06aSibkun6xXv/fbPa0BSa61o7d+4qfKByNAALdah6NoD51hshhKr
	jX9x6Qn4ISPMcsSTwEX3d6jiwlQPOiZtybFrgdL8sWiRcddsrfhKynXLgspsE2WX7Euv
	xk9rVDeuEDDZu1EcIQJ07jlWpXHRH/hvkpHwvm+NoiWv8rW7epSmrzrfABpDTvcZsBGw
	HCOdEJq3pLp0ze6F7NS1kxROXlLjANkMSF0BHZFSW+FFHgxVHq19oqglcWdDMURuJfQB
	R5TImebgEcx0KvvYouZDRLDzneAOQdfOHQAnSutpvZcAngSmIkcFE5DGGyx92Dt5Vl8/
	RhqA==
X-Gm-Message-State: APjAAAWBK3wEEGFIOCR/CPfx4mojvPbOgQE1XgHvJjO3FeWN5BIwN9mN
	o0Q1zKABADSnLCxJ8lA2MtSkQezP5baBZchXdnu0scE3kLs=
X-Google-Smtp-Source: APXvYqyLzCO8BP0cSZS/sf2R4kqOJOUrlnr8IX++w+UO4NHJDYTWckgRmh5ozq1t/cID/pyvbux4d4QZrJ7k7NU/TZI=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr43928407ljj.146.1564682529612;
	Thu, 01 Aug 2019 11:02:09 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 1 Aug 2019 20:01:58 +0200
Message-ID: <CAP71WjxR7OQkiAFaYULnPn_Ufj0pcxHfRxV5ia4tfzY2i05E8A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: build stat output
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
X-List-Received-Date: Thu, 01 Aug 2019 18:02:11 -0000
Content-Type: text/plain; charset="UTF-8"

hi,

I am trying to make up some sense with the bitbake output at the end
of my build. I have enabled buildstats and buildstats-summary.

What do all these numbers mean? They don't quite sum up..

Sstate summary: Wanted 15 Found 9 Missed 12 Current 125 (60% match,
95% complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 592 tasks of which 576 didn't need to
be rerun and all succeeded.
NOTE: Build completion summary:
NOTE:   do_populate_sysroot: 99.5% sstate reuse(183 setscene, 1 scratch)
NOTE:   do_package_qa: 98.9% sstate reuse(89 setscene, 1 scratch)
NOTE:   do_package: 0.0% sstate reuse(0 setscene, 1 scratch)
NOTE:   do_packagedata: 98.9% sstate reuse(89 setscene, 1 scratch)
NOTE:   do_package_write_ipk: 98.9% sstate reuse(89 setscene, 1 scratch)
NOTE:   do_populate_lic: 99.5% sstate reuse(185 setscene, 1 scratch)
NOTE: Writing buildhistory

thanks!

