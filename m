Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBB565C9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 06:42:31 +0000 (UTC)
Received: by wgoe14 with SMTP id e14so75044001wgo.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=xxTcFe3ffwHFbeVRZLpZEd1R1kjml6mY6YRo8V0C3gI=;
	b=ltB4c5gVUcK2xvDnMl76QCHF14EchS4g3VgPatBSpAQk6xaBgAfdUWkk2oFmRZFS4O
	aCR0GTgNyKlLUdqHZKfAFyeG+fQAzRE3fSqgrpJRrYODTarN08LBB4kcYi3GL4csDRcY
	yLTue5KhkS2f7Eoqmt5UnhojxNt0KG1niLbgfpzmmv3Wn63RB8l09CJRoEmqm6SYScRs
	VKPij5FMJSuQUFuLZm3UCT9zTlqpMooaHpozt/bITRtYNd1xg67nsERpm36TrCuKr18M
	LdoQwIsrjCTkTx78WM33dW80MTwC/tLwKBfUTZZY+Ww6SwuEIGEuwfEyZF+QhbMiJEDK
	0bTA==
X-Received: by 10.194.8.99 with SMTP id q3mr92729722wja.88.1427956952558;
	Wed, 01 Apr 2015 23:42:32 -0700 (PDT)
Received: from [10.41.0.24] (089144212024.atnat0021.highway.a1.net.
	[89.144.212.24]) by mx.google.com with ESMTPSA id
	hd10sm28593697wib.7.2015.04.01.23.42.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 23:42:31 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
References: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 02 Apr 2015 08:42:25 +0200
To: Junling Zheng <zhengjunling@huawei.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <34C00CB4-D932-4317-A2B6-E6C7346464A0@gmail.com>
Cc: peifeiyue@huawei.com
Subject: Re: [PATCH] uclibc: fix undefinition of '_dl_strchr' in	libdl.a
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
X-List-Received-Date: Thu, 02 Apr 2015 06:42:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On April 1, 2015 12:00:25 PM GMT+02:00, Junling Zheng <zhengjunling@huawei.com> wrote:
>The orign_path.patch introduced '_dl_strchr' into ldso/ldso/dl-elf.c,

Please fix the origin patch directly.
Thanks,


