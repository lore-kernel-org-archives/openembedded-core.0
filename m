Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmngR-0000RN-SE
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 17:09:31 +0200
Received: by eekd49 with SMTP id d49so3241244eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=g7GshNRXrPpRDyCyahqEwLLqzIkbJT/HWgwPqT8R6sg=;
	b=z/QOnz8QiC8s5T1jTybG0RwwhYfhHLx0wy98t/v+S06OsA7iy/7d8cWOG4BAq8oAa3
	7O0Begq3eX6dhRo9FL73aT0bVnQjVR6jSHuykE3db3iZ4kMTsdQCEeExpunJlgUQeI32
	H3PBFh85TqQevz+aQ2H3QkjtCoWJnu6uLzkEIgQYlyZOPRx/wS1/sJ3JZx7gqxEaB2vE
	LYhFEOqUsbgrd4cdkbAWbcZpxAYXszDKmbTkbpTPK8KR/WI02F5IerfslGnuXMlMCdLN
	NXPY/QrpSNMQub3Gwpv3zdMwNkKbhve5xQKyd690QbqmWEzsynQrVOHQOvfjqoNj5nLA
	Gl/A==
Received: by 10.14.37.76 with SMTP id x52mr399826eea.102.1341500307426; Thu,
	05 Jul 2012 07:58:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 5 Jul 2012 07:57:57 -0700 (PDT)
In-Reply-To: <4FF577CC.3040205@windriver.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
	<4FEC0EC7.6050800@windriver.com> <4FEC807C.1040803@gmail.com>
	<4FF577CC.3040205@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2012 07:57:57 -0700
Message-ID: <CAMKF1sqqiaXyxxzrreU2+00mmdCAmtpSNXnrXVgF1F5a4b07_g@mail.gmail.com>
To: Pascal Ouyang <xin.ouyang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Thu, 05 Jul 2012 15:09:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 5, 2012 at 4:17 AM, Pascal Ouyang <xin.ouyang@windriver.com> wrote:
>
> So, I still don't know what is your opinion of this patch.

I think we still need the CC and CFLAGS to appear in CCFLAGS since
they sometimes decide ABI etc. that we use and without that
the modules will be incompatible. So may be
appending to CCFLAGS would work instead


