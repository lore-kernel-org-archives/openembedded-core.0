Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id AFFEA771EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:39:24 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id i7so2382909wjf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Za+Uk0MtB8zqa+Xtvb02yqorxplP2w4z66i5OgUBcRU=;
	b=jvRi44Mtq6aWuSVoOmxM8LnqPu8N3H4lWNUiSUGveTQRWteubk+zKX2sxDrfW6TAjB
	Cd4yyaoG8vutByE8B3BgqqQLPzuTRO466Iv2UH5u7RVpjtoWF22L6qfIe69fGQGTh6IE
	1Osl00Jv/wEFraDyWh7dbWfAglccIprGZX3I0TicH3DiHKoltx1tZCOImF06jfRnc1XV
	bq3PwuP/dkPKLsZnZ640KjsGGCJxDN1NLeVJP1wrSg4zZToBMqqm9kOjdappdzLp7CF4
	Ae0c+KEaHXGxPLNE30tjvSZ9euzddO5K+M/BZOxwC2crh0gVGQ3OaAL31KIjlAioDgCo
	hbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Za+Uk0MtB8zqa+Xtvb02yqorxplP2w4z66i5OgUBcRU=;
	b=cD43ZBQWX8sAvhJ7kAobeCkNoR6/tR09zy5B2XpgdE5nkRsatFPDaCrrMd40LvocFw
	uzuOmtWZ3vc0Gr9W8NSSKKJclR4+k14vGGjbBsnMoVjhtgQacqtPrSftiw1dGpEkM2/R
	d+XaaIeA3P1mVQKkOJel8Suba3FQNNONY7azZZlZ9rRVI3uxl3sByUVLkUPyMQwdEWFb
	2zSe7JYXHz34Nr/67LXJJQIp4/xBxtpe+3clyytfxWNZnnqLUM2EAebPqtWBF+h2wt55
	HHV+fPzRrH+LTEGWuLDIWimm0Z/PFogi7a0peYhXCUAuI3qGWpZj+YF0kp0sIQ9aNyDW
	jQ8g==
X-Gm-Message-State: AIkVDXKx9mmBqfx+P2gJWzoeYp1AVPzFS3IuctayzG+DBkgWSDrvDjhIGUydceoYUbarYw==
X-Received: by 10.223.152.18 with SMTP id v18mr24446916wrb.78.1485189564410;
	Mon, 23 Jan 2017 08:39:24 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	z90sm15598792wrc.24.2017.01.23.08.39.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jan 2017 08:39:23 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Mon, 23 Jan 2017 17:39:21 +0100
Message-ID: <3671180.cChI1EznzE@crde-port-20.cahors.local>
In-Reply-To: <7663fdf5-3dce-1147-e3f5-5460986d72c2@linux.intel.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<4532053.H3eoubo94G@crde-port-20.cahors.local>
	<7663fdf5-3dce-1147-e3f5-5460986d72c2@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IE1ha2Ugc3NoZC1jb25maWcgYSBwYWNrYWdl?=
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
X-List-Received-Date: Mon, 23 Jan 2017 16:39:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On lundi 23 janvier 2017 10:08:04 CET Leonardo Sandoval wrote:
> David, This is what I get from the command line
> 
> oe-core$ git pw mbox 4904 | git apply --check
> error: documentation/ref-manual/ref-variables.xml: No such file or directory
> 
> Meaning that you have a patch on your series that is targeted for the
> documentation folder, which is not part of the oe-core project. The
> latter need to be sent to:
> 
> documentation:
>      Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
>      Mailing list: yocto@yoctoproject.org
> 

OK, my bad, I patched directly against my poky clone. I didn't know that 
documentation was handled elsewhere. So, I will resubmit it removing the 
latest patch.

But since these patches are related, is there a specific procedure to follow ? 
I didn't found anything in the contribution guidelines on the wiki...

Sorry for the inconvenience,
David

