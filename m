Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 301337888D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 07:01:27 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id q12so7174136uae.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=iz2NA7hto0qPA/fwP3Mh45+6/OqWLUAKKU+LTYkpLcA=;
	b=HttluqVIH1m94bz+Cgsywqm2t+kclGc4RImo/XpAqDvVIzj2rrhlHTLWuOam5M/meo
	xVZJdYec/IKiFlQ4mlw2KAq3iH6MRNP2lEWaOneNXS/lNBcXehHN3ZIyBuA9+HnSjNmo
	E2pLmk6QYgCQcmfnZbT+e34EWlYB9vNfgd5RQW1i4RbIWtD8PxIKG+0llVZUvjGj56fn
	KdcJA0EFnAuFHyQcR6NSAHwkmAxZdoh46oK/kdP6nu8yESC3W3WzGERh2rQ/snMeJHe6
	lE3HPB7goOmRzrKQ0NcSlxWvAzSfy3/WQ7CIQ4Kf6gCnuIvESWH6FIyNw4xRFeyEZlop
	7PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=iz2NA7hto0qPA/fwP3Mh45+6/OqWLUAKKU+LTYkpLcA=;
	b=BvUGzhq9BNXKKWdIU+IaS7i/DJetmsdlww0OdcmPrkzL/bsTzG0NUNVsOxppo0W/zM
	S+zvhNL404qisGwfJ4kjjI9BhgqB7tN3GsuUOM6X24tC3WZzbjxcajObdqgCnJruW0nU
	VwBhsO/UryeKAGg/WnbXu40ZldrwBf6Q5Sy8CVYt8XrCMFRZ2BMBOytEQvzOeXJ176eQ
	DIVm0K6qA42+K0gdni1gJv45n9Pos76iBvTsPU774JZU2NlSr+aTwPL8MAjVKrsS6zcB
	W8HT2fnLEm06tUbQzCnNqX4Gb1JRBQoh1hqh/iuViDk1akYXeMcW3yvqKBSpNpFSn+Fw
	Blvw==
X-Gm-Message-State: AElRT7FrMmPsJKJzUlFBhOzoOtFiZ5VxAe3pxQrFQpT9dy2kkKt4/eqW
	7VSkfull9cSxbukNpQOg2c9f3DkOLy9H59gq2cMS5XQR
X-Google-Smtp-Source: AG47ELsKtg2HtsFH5kZ3QLjkri/GAAgm8Q5elT9wzn/eOltR4EuvGwm1sHPq0SCpiKHzXDTgQ0W4f8/OTTGJ49ueWs4=
X-Received: by 10.176.29.147 with SMTP id l19mr16254999uak.23.1521788488713;
	Fri, 23 Mar 2018 00:01:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Fri, 23 Mar 2018 00:01:28 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Fri, 23 Mar 2018 12:31:28 +0530
Message-ID: <CAPGMVzHwvpvzpRVhh_EN0r8K9BsUv8gAQtkb2qOYdVwg0bj3nA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: dependency query
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
X-List-Received-Date: Fri, 23 Mar 2018 07:01:28 -0000
Content-Type: multipart/alternative; boundary="089e08264cd84b0bae05680efee6"

--089e08264cd84b0bae05680efee6
Content-Type: text/plain; charset="UTF-8"

when i open a particular recipe on layer.openembeded site it showcases
something called dependencies does it mean that those list under the
dependencies should be included in CORE_IMAGE_EXTRA_INSTALL??

Thanks

--089e08264cd84b0bae05680efee6
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>when i open a particular recipe on layer.openembeded site it showcases something called dependencies does it mean that those list under the dependencies should be included in CORE_IMAGE_EXTRA_INSTALL??<br><br></div>Thanks<br></div>

--089e08264cd84b0bae05680efee6--
