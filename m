Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id E97D675681
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 16:32:55 +0000 (UTC)
Received: by qgdy38 with SMTP id y38so36067991qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5ZAFuNOuMO+1Cy1VfLKITBU7E6kquf3dum2uJywdtus=;
	b=jwTSuyF/2g5ybHQ/dJzoxHsua+1lzvI70DZOHn1gETzhjkveU7Y0PJjQszndAVVg0Q
	d4ZWTvjVCYMl02lDXeSf9QyhPk9SMBu6aGCMaUIKQLuVd8ZQqzNItMnYboR655FvRXR6
	nwb+/ieq3uSvX/PywWS9UGznT2BF8DaRLfKbm44InR+BR/bXyMKKzCXdmHY+dM1BQt13
	FXrzlzpajDKYesmrDVllFJzY9q4CUQCbi/oXxn3FNxe7pOvZvh4xyxsmqe2ZD8Qvas1U
	KWW5/yFAn4XRAeTsQRR0A0EcK5s+XXGCXpZN2khuKnQXJSaqcYpGfAXJhscKZOONm7RH
	mAUg==
X-Received: by 10.140.107.101 with SMTP id g92mr29217481qgf.58.1433262776326; 
	Tue, 02 Jun 2015 09:32:56 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:d61:d5ba:dacd:77e2?
	([2601:c:a700:3ba7:d61:d5ba:dacd:77e2])
	by mx.google.com with ESMTPSA id c20sm7671054qka.21.2015.06.02.09.32.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jun 2015 09:32:55 -0700 (PDT)
Message-ID: <556DDAB0.5080903@gmail.com>
Date: Tue, 02 Jun 2015 09:32:48 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433167180.git.akuster808@gmail.com>
	<CAJTo0LZHhxEYk2m4_gS_THgssWF9cVHGULprcrUEwoeQjk1C2Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZHhxEYk2m4_gS_THgssWF9cVHGULprcrUEwoeQjk1C2Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Gnutls 3.4.1 update
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
X-List-Received-Date: Tue, 02 Jun 2015 16:32:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ross,

On 06/02/2015 03:23 AM, Burton, Ross wrote:
> Hi Armin,
>
> On 1 June 2015 at 15:12, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     core-image-minimal builds but not sato or oe-core world. I am
>     providing this so those who want can test their apps with these changes.
>
>
> What's the scale of the breakage when building oe-core world?

Not sure, I will need re-run world and I will get back to you.

Sato builds now (neon fix). The neon fix has been push to the same 
contrib branch.

- armin
>
> Ross

