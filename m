Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2C10C71547
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 20:15:33 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id x3so4364041qcv.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AlV+UG2RG26C5QJTNSKKDKLPNNhaf8BE50mQemDPEvU=;
	b=BYVqqyDOpRf7PFM8lmLE4kuTr+LDSmgx6JN5BDT3HWjrC3CPVMTYb/etvk/Dl/RYBF
	1NhC53RWz4Y3hEqCICjEiPpqJugDqkxKPsOQC0+wMdCUKVeJv/JZ6Hmd8XF+wgl/LLKe
	CmfBqbt9G9a9p7mta7Uiux/iOcz75jy/YcRp0J3YjLKvtUG7kruOW9wgogVwfVhJfgvT
	XDN6D3CXS27pP3QQPAoePaUaJPgsXNzlv7lDzemnSCRwV7KUZIspswqFiFoVVKSpqjmk
	JIX8ot7ALviFbCTXOrxim4uf0UeRe+rcJfkTawuqc17lvE4u3coR1oWhYEWm5k+lkfp4
	hSGg==
X-Gm-Message-State: ALoCoQlOeFGLOJ9xLZzGn7wxeBqaRhUkFts5GoRsJ9NZstmsFAedsEGQNB4geEsb8X7iNzAZ/CVR
X-Received: by 10.229.238.133 with SMTP id ks5mr31350367qcb.23.1411762533513; 
	Fri, 26 Sep 2014 13:15:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 26 Sep 2014 13:15:13 -0700 (PDT)
In-Reply-To: <1411749218-11056-1-git-send-email-raj.khem@gmail.com>
References: <1411749218-11056-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Sep 2014 21:15:13 +0100
Message-ID: <CAJTo0LbE-jeFDQ0JcQEK0aDT297HtFXNOyh-sH=nB+j--vC5kQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bash: Fix shellshock vulnerability
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
X-List-Received-Date: Fri, 26 Sep 2014 20:15:41 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2014 17:33, Khem Raj <raj.khem@gmail.com> wrote:
> CVE-2014-6271

Is this meant to replace the patch I sent last night, or did you not
notice that?  It's been a funny day here, but I was about to send the
C-Pull with that integrated.

Ross

