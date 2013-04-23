Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUeuK-0007re-BW
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 17:13:24 +0200
Received: by mail-vb0-f48.google.com with SMTP id p13so656158vbe.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 07:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=xTQhGOK13ogLmfjbb3nAZ3fEy5LjGLtqYYPTP2AlPu4=;
	b=kmLfBiIN1zRBW+zwSH4+En4jOVQ5r/XVpmrbxKLAkndnuepaVwPAzLxtWEnecptqG1
	JWPwaMrqzN0TdGeYYto7sFq4l3uUd7hw05KN3ynFMGz3A6h5FvY5gX+VW05+LJszdERG
	MNlshQVCxbADC0KAmUtubIe47RqoVu3xKslgVw/Q7tSIyhqVFaVjgNZgRtJpdrPyqwm0
	ujxhYGZYCVEbBuHj+pLLDQGHfD3nWt0AMJll7nD+v5ZTb+Nn6f+2gazXzVfz32jio5t5
	c9/UOXbj7lBtjFOPyVGkPG9ceF90xDpemjWFJff2AO1o/NtJsj/aRLJuePgMPInEISpZ
	JQmg==
X-Received: by 10.220.74.2 with SMTP id s2mr19450187vcj.53.1366728943523; Tue,
	23 Apr 2013 07:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 07:55:23 -0700 (PDT)
In-Reply-To: <CADV-EXFj=PKMXS5ZO0dPBK2hx91Piotp_MZBgkH6t_e29X1SKw@mail.gmail.com>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
	<1366725166.23738.63.camel@ted>
	<CADV-EXH6gLETd1-1uMX5e2KSdyw_ph_OGG9cveFy4ysf8Fq_NA@mail.gmail.com>
	<CAJTo0LYPFJooqAA92hcyD5uX1URKW1wvNu-hv0pA1mMOkmXJzA@mail.gmail.com>
	<CADV-EXFj=PKMXS5ZO0dPBK2hx91Piotp_MZBgkH6t_e29X1SKw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 15:55:23 +0100
Message-ID: <CAJTo0LbFimqaWEDm1EB_b0Pg9XHKR-3p74x=d+q3P4hSqqbbvg@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Gm-Message-State: ALoCoQkZD5HmokT2Yd39r92Jh7I21OkedxT8E0lIIJotQ559cDaLsBBpGF+bDK9TejjZ/SbEsv7f
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 15:13:26 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2013 15:42, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> OK, and what about -dbg?

I'd suggest adding that to systemd-dbg, it's going to be so small it's
barely worth the overhead of a package.

Ross


