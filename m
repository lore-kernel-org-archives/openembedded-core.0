Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 23C876E645;
	Tue, 30 Jun 2015 00:39:42 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so492760pdj.0;
	Mon, 29 Jun 2015 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=lfEu3jld2DHfxuN7CkpcnaKAaHNuM7lBkbDEtse9rHw=;
	b=vl/k9+w8FLOf9/APoQsENiXubjufppB243e7z+13KJzzVa52ay47S3jel4famkH4Zg
	ePHtJgaXf28V5yVqqvpHeVz5q1qtBT493vHqKVZSppF2zSnO1R/angd68BdsjxTckPhU
	22U8XpoHV1h67A8dbHM9hDjPt9SXCP0ujix+pyNNWrwJpyMM3KyVxAUuX8qXEq63wJAz
	74rVH/ci7CNfmASQ0qnl8vc40WObPxdm3/Dyc3dDsIU6ZR45F3Z9+plzwcEikdUnzUhA
	lXVPWKCQPYOWJ+3sM0nuTylT6TA9RLHJkbW0Ki2GIyw5lhfNVNfz28JYWjifGOax+LLr
	osBA==
X-Received: by 10.69.27.33 with SMTP id jd1mr37309739pbd.34.1435624783404;
	Mon, 29 Jun 2015 17:39:43 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:b8d5:58:2bde:8361?
	([2601:202:4000:1239:b8d5:58:2bde:8361])
	by mx.google.com with ESMTPSA id m3sm40805270pdd.29.2015.06.29.17.39.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 17:39:42 -0700 (PDT)
Message-ID: <5591E548.8090706@gmail.com>
Date: Mon, 29 Jun 2015 17:39:36 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 00:39:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke mariadb 
in meta-oe.

DOes  the person who updated cmake need to fix this or the person who is 
feeling the pain will be fixing it ?

- armin

