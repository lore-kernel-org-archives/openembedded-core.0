Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2F53E7142B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 11:24:46 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2773290wib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 04:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=ja6CEDtf+VHN4WjzJ3P6ATlQW41f4HwFKn4HDQqRh3E=;
	b=AycIJywsFtxHFlBB833Ig+yxIgNMdxp6kwKuQ5zViBKKi+/SNaEoCa5j5ZkSdqFY71
	Wrj0jDKfubpAu4DLWyot5zht5IBQFFNrWNRtw7vP9LX5ctbX71PJJSbA2t7wYNS8dMZA
	VwXiQ+6CAOfVV1yG0+DGIebfQUFIepGGvthRwYTlDzbifPCmTqfwHn3WLN2tBfhkufoX
	F2D8eXJGuJWnuLCzJ4/MHw19HNRM+7B3sWuu02hlOgrsqsEGr1akepvt8sDicpiSnVRr
	h2Dq3dogZBUQGsOfvdtmYZvqcLHlv1L9aqrfN4seCSzfg7m4dtV9LflsssbVfe3BSTnw
	uIUQ==
X-Gm-Message-State: ALoCoQnqAt61FCrW2nmY0F4pA/nRaKYuU8SgEPaSO1sUORBl/X/01iguzROrtoV7nOQDKLGsn+jC
X-Received: by 10.180.211.233 with SMTP id nf9mr35535804wic.33.1410348287570; 
	Wed, 10 Sep 2014 04:24:47 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id c7sm2080139wib.12.2014.09.10.04.24.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Sep 2014 04:24:46 -0700 (PDT)
Message-ID: <541034FD.4090900@dresearch-fe.de>
Date: Wed, 10 Sep 2014 13:24:45 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: hash generation for PR Service?
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
X-List-Received-Date: Wed, 10 Sep 2014 11:24:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I'm not sure if this is the right mailing list for our problem. Please forgive me if not (and tell me the right one).


We're investigating some problems related with package versions going backwards using a PR Service[1].

Can someone give some hints where we can get information about generation of the hashes which are used to request values from the PR service? Especially which data/files/directories are involved..


[1] <https://wiki.yoctoproject.org/wiki/PR_Service>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

