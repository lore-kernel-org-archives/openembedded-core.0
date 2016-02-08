Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B5C0B65CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:52:11 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 128so169627755wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YjyjPDl9cgJi9SJow7x96mIuJ7hyxptTkPPHK4TJd5A=;
	b=UWBS/f9eDHG20/n/B9EAvzMqwlXZ4V+4c68riGEFdzSMU5MwGVKaO7gBIKTCOOBwXP
	yfjNuhizFqQXiVcA4FM7+358ttdyR23/cMzbvyNfEfJG8FkXWryzABVmUNCAQAOZYz84
	H8wWNVzdJ9YHi5IODrLeMbyr2sOFo9htoHZBG+qzd6hX+hK3yCL+abHc+nqEq6Qth3jv
	t2hUmX4oc8seBqMt5S9VL/pWhiBEs0HxBj1rZ0Dgo+h85a2QGyQxck61PmaxTkVgqEWA
	+bXps68YNBCrKwm8Y5RyLAV/2+LYnY8WiCsVm5ax0NjxfU8uEvpZDR/N0rxXsQv/eLml
	1Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=YjyjPDl9cgJi9SJow7x96mIuJ7hyxptTkPPHK4TJd5A=;
	b=IaugeI85QFP7pCqPOv8MQ5qATWyMSzRDPpj3iqgfOTFQTI+DGarBNBQX0FwvJREhGm
	BJFoG1FHZWOXbQE4p291uNyUgFubcm7TWsnV4QZVtAwalGZ4iDhfxxM+kR6aSDbfNnhi
	Manquit08R/ugUYultn2zhpjbI+6VteQsRdbSvmRPGvmShO6X6EkX1SRdPPbTCwYjat/
	IBVC8OyqDHrKrzYibpTPAG8fb60i5v9+oF/Ll6rCs3DhZ8m/dn5ULTOTbpsR2wKMAJv7
	6prvYmiH4+2U7LULCi/6iVxwI8JUnO6zQs8H2gPT82uP1gqy/LlJtw0nBxxp/z12ah3N
	InkQ==
X-Gm-Message-State: AG10YOT1M78GafzzrhUF/UMVJYK2j79KCu0HrHp9+XThytYqjNQmRFvj5ICEWDwrDgPAImWiHRcaovUaFOqCQQ==
MIME-Version: 1.0
X-Received: by 10.28.146.8 with SMTP id u8mr562272wmd.72.1454961131788; Mon,
	08 Feb 2016 11:52:11 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 11:52:11 -0800 (PST)
Date: Mon, 8 Feb 2016 11:52:11 -0800
Message-ID: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Mon, 08 Feb 2016 19:52:11 -0000
Content-Type: text/plain; charset=UTF-8

Although I don't see it on the mailing list, oe-core master now
contains the following patch:

  http://git.openembedded.org/openembedded-core/commit/?id=ff2c8af73046f55aa733ce8289b6236c88300290

Is this necessary? Aren't TARGET_CFLAGS by definition only used for the target?

