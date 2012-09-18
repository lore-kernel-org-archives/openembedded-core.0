Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TE6ZT-0000Y5-Gi
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:47:11 +0200
Received: by eekb57 with SMTP id b57so130776eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4chf84WX9u2SX5IDCji5Tiijt84pkI9Xn6r7OfgCnb8=;
	b=CeANmV7mQY+v3pxeW+JuQg1X0/5nY/dOtcgQfGVPzsdRjp1jsT5HZFIv3T8BQ+nDKw
	qxUDUjWbU9ODkjCMfwg75hMq1EfqURBn6Hbe4OOWBxU538jKcvbdArlJfPyNwBmK+WNo
	gc2m03v5FsSxMrG5Ne9njjkSljlF9eV1t80V3xgXuLWf1anoBUs/olLxqA8ypHo3jbin
	wlFjBLXAiDQA6IfXZ2QA6ZYk7MAoewq97D50D/1VKU7Zj9+U4Vcpmdd+NvscwSToXl8w
	w4w/8A2KfyMQ0WIR2M/4qpg0Fh3EnpHUl6qoHOYoVjRkG+qlQUX0JQl6lxFtFgCA1kHW
	/csA==
Received: by 10.14.218.134 with SMTP id k6mr1604413eep.14.1348007666295; Tue,
	18 Sep 2012 15:34:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 18 Sep 2012 15:33:56 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A68B723@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B581@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1sqSCx4pc_mH6a9VoACPyn6RyLiSgqEoCjbfVgStz=PADw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B656@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1spFAru3unZSvd18cu555mgOCLgFf4on0xkZx=xeBM+5Xw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B723@039-SN1MPN1-001.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2012 15:33:56 -0700
Message-ID: <CAMKF1soL2o+CmBxevKcLPXjvcuwEvgLuFeQ8hY916_rzQVbdhg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.16.bb: replace patch with updated version that supportds e6500
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
X-List-Received-Date: Tue, 18 Sep 2012 22:47:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 18, 2012 at 3:32 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>
> Internal patch name. I can change it if needed. But, then I have to
> track patch names differences between internal and external.

Not that I am opposed to it but its hard to review as I said.
cant internal be changed ?


