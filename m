Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3B2778D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 01:38:51 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id t68so87150057iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 18:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=+DpTwww8kHpKDcohTEwUEVytCkzMSHpjQQGkKYJ/vcM=;
	b=MkjiK8kKPbeVW14GruTDNHDSyE/tv2NIf8NYGc2qwZaBx0SpLwKCHw7y92sAhkUiTU
	ugkT5saXXoCr3utxOXjsCORyfgT2rKm+LH4v7r5VMSBtz9BhPa1mAD1KM7TlX+nDMEqn
	Du2AJ7kCdoAsgQdHW4QSQrOxpG483/uOv64J1OpcokD1WNskn7r3PgetgI6kp88mB7ZQ
	xXh4Tienh5Xz/xe/C1AyvFkW0cmQc9gMZl3U4XIhMd03MG1b4Cqa785CBr11pHzrxMNV
	wxBJ58K9cfo2jltINoRubtlX4rpajXZAOFmkj/+gH+koQnYZI4Brxgs8kzQbfsghPR/m
	0uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=+DpTwww8kHpKDcohTEwUEVytCkzMSHpjQQGkKYJ/vcM=;
	b=IsknDzFMfhjeV2m2kpxtKFv6Enb8cvHCJO8YBcRt582/gH07cY5AmWq3XrIoYZKHrs
	ItPbD1r85vQ5DTZbK07pewULBkRectMIufpIm/NZfcvHBYgPTh8cUAK5lwDFyXoqEuZh
	6WoeIHLMF4SlLfAAb6rSQM0b2qyYU9nTYBSAI26yxgKlYdgPjmXv7eD/7gd460B8JCES
	nzaozA7U1B9Cs8xYxEsKX0mR/qJl4rasT4Ne0SwFAUmTuZPm0y0/IoKEsVmfoDmYX15u
	cgVdXTUL/Ls9SjOXutzqO06/fLL8NIXZZngTIFQRNhGmT44wH60p4QTrUkSf7QAOqZFY
	davA==
X-Gm-Message-State: AFeK/H36+h8nuxJ8MjQbUZSPR+cwnm643jJGSUNIsdxqqgnpmGqtaEb4YR64yVDtgZhXXw==
X-Received: by 10.107.37.133 with SMTP id l127mr49982476iol.162.1491874732941; 
	Mon, 10 Apr 2017 18:38:52 -0700 (PDT)
Received: from linux-uys3 ([45.72.141.78])
	by smtp.gmail.com with ESMTPSA id 39sm3405106iod.13.2017.04.10.18.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 18:38:52 -0700 (PDT)
Date: Mon, 10 Apr 2017 21:38:50 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170411013850.GA25337@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: drew_moseley@mentor.com
Subject: having llvm available for gallium
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
X-List-Received-Date: Tue, 11 Apr 2017 01:38:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I think this might be a casualty of RSS, but when trying to build mesa for the
gizmo2 I get:

	| checking for wayland-scanner... no
	| checking for XCB_DRI2... yes
	| checking for x86_64-oe-linux-llvm-config... no
	| checking for llvm-config... no
	| checking for RADEON... yes
	| configure: error: LLVM is required to build Gallium R300 on x86 and x86_64

There already is a dependency on llvm${MESA_LLVM_RELEASE} so I'm not sure what
magic is required to make llvm-config available.

