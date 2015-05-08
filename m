Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 047A360034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 11:07:36 +0000 (UTC)
Received: by widdi4 with SMTP id di4so23332661wid.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 04:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=LkEikE467DlpRN8C9tSuIXT8ceu98pcBwSKFH5IKbCQ=;
	b=isqf2BlxliuqNLGn7tNDz/xFKooGrCi7/LbHU2+ybB0Y/kZCQu2t82MKRhG2VwGWet
	vWVyJCPrrJONAe+LhIZSDOdtrUrrFj275sgbf1aCMDgXE5TymVZ+1G313tRTv6HO+gZS
	lNQ3Rb9zc947WnLdmMVRrudsdPVp8nuh06qLD/PthF3Ks2pFoD0refl+NGlJwzkgB01n
	VNGwsUQkNIPVKbuX8ITxTgRnp02B3R03FjuAsq2Ois8D4zhPRUtvwU1ERm8yZbDfMB21
	lebDRz2b6oh9gqYeZaSvPhcH9uYE7lfmApKnxAfCjMXCeB0yP/bgevctOgsAypJdHSq6
	Ne8g==
X-Gm-Message-State: ALoCoQmovDNyvkUObSwvYW0StgKGmxgaX+Si9GSgxNJWOD2hKzBLzNFSke9yHGKv3qwG2YW60mOE
X-Received: by 10.180.8.34 with SMTP id o2mr5231223wia.18.1431083256917;
	Fri, 08 May 2015 04:07:36 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id vz8sm7849739wjc.27.2015.05.08.04.07.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 04:07:36 -0700 (PDT)
Message-ID: <554C98F7.5090005@dresearch-fe.de>
Date: Fri, 08 May 2015 13:07:35 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: WARNING: The license listed CLOSED was not in the licenses collected for foo
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
X-List-Received-Date: Fri, 08 May 2015 11:07:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Since switching from dizzy to fido we've some warnings related to some of our own closed source packages.

WARNING: log_check: There is a warn message in the logfile
WARNING: log_check: Matched keyword: [WARNING:]
WARNING: log_check: WARNING: The license listed CLOSED was not in the licenses collected for foo

The recipes contain lines like this one:

LICENSE = "CLOSED"

How should we fix the recipe to avoid the warning?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

