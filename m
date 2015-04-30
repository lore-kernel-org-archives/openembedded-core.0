Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9796AC38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 06:07:27 +0000 (UTC)
Received: by wgso17 with SMTP id o17so50531103wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 23:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=IhicqHwH7Qxt9OgUvE6E9Ag+rNHm/ee1YLBGb1GFS1k=;
	b=PM0fXhZx2AejAYBRyimfMQMjh1o4uNLFseAtuNV67/7tPZFBP/Jq1eLVxMvwL5PNqi
	5UhNCZxqNXmDxTz2MvUUlgtiTbvsAx/wQFHBZZdyMJRNv+r8GAFplDDACOnPT6RFLk4e
	oxzJMEmkU+5aOLdt3TVLzJkH5UT2s8XC9l4SX4B3JsQDvJjznnE6lNsROd1fMOXcpfKR
	fol3JFdT3dTas7O1qP4UGR5I5yXB7BW4J6dY9Yyz84tdkIT+ejZtKdsn8ODHcNVUrAxs
	5GjhLQaPGSC6ulEedOZh2KHqeiNEadB1UngyUgTfvERbwdXIH0AkzMEG95kocBicI4Op
	9lRQ==
X-Gm-Message-State: ALoCoQlweGBcS6kGB4PRKy8w6YLDkl0FBl2a3qyfpMQtZ3yijffGrODDZYVtHTq3bOcGL3V+yFmA
X-Received: by 10.180.78.135 with SMTP id b7mr2245076wix.65.1430374047808;
	Wed, 29 Apr 2015 23:07:27 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id jq3sm1682439wjc.22.2015.04.29.23.07.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Apr 2015 23:07:26 -0700 (PDT)
Message-ID: <5541C69D.9040307@dresearch-fe.de>
Date: Thu, 30 Apr 2015 08:07:25 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Koen Kooi <koen@openembedded.org>
Subject: [fido] orphaned bbappend in meta-angstrom
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
X-List-Received-Date: Thu, 30 Apr 2015 06:07:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The angstrom-v2015.06-yocto1.8 branch of meta-angstrom contains recipes-tweaks/linux/linux-yocto_3.10.bbappend. But the fido branch of openembedded-core does not have a recipe for linux-yocto_3.10 (just 3.14 and 3.19).

So the bbappend should be removed or updated.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

