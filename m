Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Sms3Y-00049F-NY
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 21:49:40 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 05 Jul 2012 12:38:34 -0700
Received: by ghbz12 with SMTP id z12so7392449ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 12:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=VbLNRU0dNU3P7padMWrYi2Dxrr7MLaf8nGzW9Q0A8bc=;
	b=dWhCJGlyr/rI9L7NT+GbAj1ItgEjMY5Xjv6MYLOCeFPI5R+s4PDyav7Bg6zQLEg2w/
	0bGJBLiQriTRcZrnCQVfOe3yPfqQ2HIucPMCufQDH2/SXOCnYdG2aIZJ151ylhvAIvjn
	CL9iNrsMMdlIJIjXDlCYwj2fXYGoX2HE+nNKHKFHM/0t2poJwdcim3vfICw8knm0ezdY
	ZkJN3+46y13cb8GjhAMD4c/5zcS1oMm5h/ohCC9GfSx/y0jwAAyaddaSPjfnrEyBrBlR
	RgWad4KMr7sjXX0txG7bdUmsfe9zzZBlTMu3vNbXtVCQnmDjg8kCcSlEdeJEFBpffZ+h
	uiQA==
Received: by 10.68.227.198 with SMTP id sc6mr30455551pbc.138.1341517113004;
	Thu, 05 Jul 2012 12:38:33 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id pe2sm20286754pbc.59.2012.07.05.12.38.30
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 12:38:31 -0700 (PDT)
Message-ID: <4FF5ED30.7070506@intel.com>
Date: Thu, 05 Jul 2012 12:38:24 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<4FEC908A.3000205@linux.intel.com>
	<CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
In-Reply-To: <CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
X-Gm-Message-State: ALoCoQkeKrRVe7fKYCnuH6gbAdvhpykAihIZqiu7PNA4/qnzpbqpzq51zaHsHoqjmRWOq6uWP7gc
Cc: Luo Zhenhua-B19537 <B19537@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-dtb: add multi-dtb build support
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
X-List-Received-Date: Thu, 05 Jul 2012 19:49:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
> this is somewhat a new feature though but it would be helpful to have
> it in denzil.

I've made a note of this, and the commit appears to apply cleanly. So I 
should be able to take it for 1.2.2.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




