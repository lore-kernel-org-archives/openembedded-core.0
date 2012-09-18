Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TE6LK-0008WE-55
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:32:34 +0200
Received: by eaad12 with SMTP id d12so94191eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TSBOC9Zky/yqSdMlNEUqUkMgqcc47OZ2ucd+/mgpymY=;
	b=VvmFTIQs7O037D7YenVU/IuFeHxDo+dBlD52JrcLWoNCVlrT2QuKoi7QrAguHlNNeU
	GqoglEH49fQQKAefc+nfqGKFA6lmqfmh0A0RHaZpkRujam8fBVhEJLc0QwLq6+RbPeJ9
	4YPK8YrsMVv8VK6X+9I8eqTagADGwjSE95NYoIGUs1zEkwcAckfS2VCgqH+WEXj0XAWJ
	fNCUHkU37Uxgvi2uBm5nYaNwzSK9CDDdKLTW75sFIPakXO6f1mWgCDlc5aroz4UBaB+V
	JJ19JGeAywIjzLvJUo71mViXYg0YF7JJeDiS7dvTAnK67q8GaQrd2H6FgfmvDyZXye++
	W3xg==
Received: by 10.14.202.71 with SMTP id c47mr1471248eeo.42.1348006793958; Tue,
	18 Sep 2012 15:19:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 18 Sep 2012 15:19:23 -0700 (PDT)
In-Reply-To: <1348006091-14992-4-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-4-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2012 15:19:23 -0700
Message-ID: <CAMKF1srn10MhO5HT5G4VVnPp_n2t67rkTqN=pEhPH0mcLyZjTg@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-ppce6500.inc: add e6500 tune files
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
X-List-Received-Date: Tue, 18 Sep 2012 22:32:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 18, 2012 at 3:08 PM, Matthew McClintock <msm@freescale.com> wrote:
> Also supports a new altivec TUNE_FEATURE

is altivec feature specific to e6500 ? I thought there should be more
tunes using it


