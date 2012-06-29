Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkUWx-0005iS-Us
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 08:18:11 +0200
Received: by eekd49 with SMTP id d49so1148209eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=F/a/ECkWIOjCCphUHjNvM4Fl7deVdbCnQmIEkMF7U04=;
	b=LOZ/QMkJEfoneTnCRoZkV6lHyRYihXSd3dqAJpvjhQUC910d67TMbqjFwfz/qFl7hJ
	XSdJrs7kwjPDm4o4ftsT1UOSDA45vJMiKtcxEo4R9qCRbQBckNzlt8j5mRl+Pid7885s
	b1WwTanH1m06xwoNQ/+tfN20/bqbziaFiM9NfIJfciWl46SrVa+K8DvM7/tMXE9ik0sn
	Xfsn+8X/x/CBwQ0Y9WxUhkiXg7VRo0JDV3nrHnRzU6tQaY9L/pjlZM65vMLx+RpPlZbU
	8s3CTRT4C9BJp3vkGs0vE16B7/Z6n1Qt11mY5DFzXEsd7Bo4R/QyaR8JfQ5DPNsX94cN
	P7+Q==
Received: by 10.14.185.137 with SMTP id u9mr164962eem.220.1340950036667; Thu,
	28 Jun 2012 23:07:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 23:06:46 -0700 (PDT)
In-Reply-To: <4FED3CA3.60605@windriver.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
	<63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
	<4FED0AD9.5010102@windriver.com>
	<CAMKF1spBJ-iVuHC_BxscqAw355gUMCYnh_g6zwT4oOwz91hxyA@mail.gmail.com>
	<4FED3CA3.60605@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 23:06:46 -0700
Message-ID: <CAMKF1sp_BL7R9PZgTnZXh4y9Rp0MdFUpeyGqfbV5He4XJqkLwQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] icu 3.6: do_install failed: Segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 06:18:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 28, 2012 at 10:26 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> We should still use a constant size since the length of the command
> is unknown (or not obviously known):

thats the point. Cant you use srtlen(cmd) ?


