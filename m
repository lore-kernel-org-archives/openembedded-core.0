Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 287276025E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 01:54:31 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b84so139806257wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 18:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=zfFN2y3nhvENT/F8dOF7O9+jPlfnIsWrUzOeQpkLjvA=;
	b=D55dAEIUOd/Z4B4+TwkecNTfa3IYJolhyE3SPw4cs14ThpQhKapidghMxcvozZ99eS
	DVjx3o1fNlagyy6y4rY5M/gNsja0rUxIxzyZc1tqgXQkIrmaujNQncFjnMxpPX5upTK3
	xaEEGma0Z38hFE8QzTlA+S8+G3lu88PBqRUpQGUc9qmroXofPvPby028YsguggsWZX9R
	pPU8DCB1lH9IP/3QVwViPrkK5xIhVpsBMXtjM/Dp8DFQ3DkxqcqKMnuRm+SiI2T0OP4p
	zZwlJMKMx5YeB4qddav6pDKsj9dAj8doe9EK0q8VXkAVCZ9uMnhUUthlYym5zx21kcDB
	6muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zfFN2y3nhvENT/F8dOF7O9+jPlfnIsWrUzOeQpkLjvA=;
	b=JrRd5180fDjUOD4TSbyw0bvborNfNhpBPTYQbgi+OxPMd12hQMRi1YRMu42Qxrdl5K
	1eCGjiY1DxLhKByctEdvsADUMZ0FhkWZ978SBXQk10J34cLOlr5Uak7EVhiq3Sgw4ODR
	bG6TMPcKAFD3c11DfYZsXZOQRAvXvt5nTYWYX/UxZVrGq6h3/m7Qo/q5a9runy/BdW1J
	j+Tq0LqC45z+ckW3cgtGrvN7jU+F5G1GMS2siPdJk2PR0cTuvHgVitWQ6czkEMkN0wq8
	YVjivNbDktuZ8m5Em7Lr8h3WdqBm5ErUDe57nf3xKfTEjCw72unlhvAU9eyRIJior0cn
	0PQw==
X-Gm-Message-State: AODbwcB261tTSoE8ZX9taUU8Va2hObh7w0dFA8xQV86+kUfE63n8Yrr6
	4CFm0maj4kq+JBobxD+R9gZs8qOzgw==
X-Received: by 10.80.182.35 with SMTP id b32mr23438721ede.123.1496282072558;
	Wed, 31 May 2017 18:54:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Wed, 31 May 2017 18:54:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 May 2017 18:54:02 -0700
Message-ID: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>, 
	Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: AS_NEEDED and rpm4
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
X-List-Received-Date: Thu, 01 Jun 2017 01:54:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

We added entry for disabling AS_NEEDED for rpm5, now that  we have move to rpm4
is that entry sitll required in "conf/distro/include/as-needed.inc"

Thanks
-Khem

