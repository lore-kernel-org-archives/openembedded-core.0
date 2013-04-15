Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URgjV-00023A-Ha
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:34:02 +0200
Received: by mail-vb0-f52.google.com with SMTP id w8so3578204vbf.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=keJBpMfpTnhxCJYsO/Nd08uX1QQ0GATMDbV0WmvVlk0=;
	b=hHPMnbz1eGfYS3K9dVT+NHLv9xDUOpVwztQxjWP2ar5XRIPgUUd/CpKK4EUiQSruFB
	/wFDSiBlpkNUjunmyQcXi8dSSKsWD99DVYov9nTjVaywLjKvLW/fQYaJ/zJDUfgkhD69
	xi/9v7Gsbj7gGOxl6ifDjQm0OmCRuYmBCUKaienAGsUi9qQnlMEVjqsxD9ztwUyN25ED
	lg9s+9wEFxfHtz9XgcASRtT8lMspnd6pblGPYXyNPkOs31z3AONzHI6ITNZR50wRVtCJ
	Cg9aKLr2jM++7DpaYFVcRd7mCu555OKBsC12z2Einu/fe6MihSNNnmjfQFXQY1RY+bm6
	6zdw==
X-Received: by 10.52.73.234 with SMTP id o10mr13300478vdv.29.1366020988442;
	Mon, 15 Apr 2013 03:16:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 03:16:08 -0700 (PDT)
In-Reply-To: <9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 11:16:08 +0100
Message-ID: <CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnrwBj8h7ipRRFuLm111Ky2t9xfiRr8M8MGA8Dg4mKs7Zk4YObKt8S6weAL2l54HUF7gSoy
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 10:34:10 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 11:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Does busybox produce any useful errors as to why it's not working?
>
> No, it pretends everything is OK and the remount succeeded.

Thanks busybox!

/me sighs

Ross


