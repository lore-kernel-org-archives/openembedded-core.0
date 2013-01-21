Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxKyr-000283-PN
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 18:16:34 +0100
Received: from mail-qc0-f199.google.com ([209.85.216.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 09:00:51 -0800
Received: by mail-qc0-f199.google.com with SMTP id b14so4067494qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 09:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=377ZWdbvFHz0q9fTQa7s7vwAOvUtLSe7z7ojuCqF8Ro=;
	b=HuUeZ+A+CWbb0IFK5cmeYVre87NUmjbDbeVd4WMpkrqxvJlF1lVTY/LlBlwQk3Dgx9
	PdmB8A+1AcFK0W0mIWENWJwWgREAMJ/hcNdliUKP4dMsgzdJcsKSslZEvnkSHOfYuNKH
	nYGMzFOdU1oEvSyRPnNpbN2JbT8BqiDvXJYmschI1LdgauufYPTGWsezKYC5yUadVJqe
	+4eb58VUfCTchM8jqMGnYihC/1oFiNR8C7IEijg/s0VInuXPUQRlh3LmF54mP/kf3ZWH
	A1C74GwUPxEaW2l9QLYLgtGq3fy803F/DuYj+oEJb6wmPWZ7tUJLm1lQr0OU9NV4J5Ro
	IDYQ==
X-Received: by 10.52.72.232 with SMTP id g8mr17633689vdv.69.1358787650195;
	Mon, 21 Jan 2013 09:00:50 -0800 (PST)
X-Received: by 10.52.72.232 with SMTP id g8mr17633680vdv.69.1358787650092;
	Mon, 21 Jan 2013 09:00:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 09:00:30 -0800 (PST)
In-Reply-To: <50FD737C.9030003@linux.intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<1358739008.2945.29.camel@jethro.cheepee.homedns.org>
	<CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
	<50FD737C.9030003@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 17:00:30 +0000
Message-ID: <CAJTo0LZGrOQdqGsnvj9iUsbsaKZbkJKkEncN8xVKZFpxE3Fxkg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnzkjHpw/OQh8I8YElZQ91rr1rdyzGjrpWB7tn9zEtqZn/U9ESzQqS4cebcwwocOcyKnkzCXdwHSiSMwSdzfvL3WDVrGAqPNfDIs5U4mUmhMDlmgMVn4hGDh6g4g/RuEKsUYpRErt2G7tw6o4w+KwySe+jFB436qGh1DfG4hQScV+Dh6DlP0h4r4rje4SF6odDi9cxR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 17:16:35 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2013 16:57, Saul Wold <sgw@linux.intel.com> wrote:
> Ouch, I thought that this was one of the goals of the select your init
> system, ie don't use either sysvinit or systemd.  Poky-Tiny has a single
> file rc.local script to do the initialization of the system.

And presumably a poky-tiny image doesn't pull in any actual services,
as they'd have been installing /etc/init.d/* files and invoking
update-rc.d.

Well, as of yesterday, that is.  Now that update-rc.d is a no-op
without sysvinit, at least the postinsts don't happen.

Ross


