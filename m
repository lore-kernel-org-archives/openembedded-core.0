Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyKZk-0005by-U9
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 12:02:33 +0100
Received: from mail-yh0-f70.google.com ([209.85.213.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 02:46:58 -0800
Received: by mail-yh0-f70.google.com with SMTP id z41so2144966yhz.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 02:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=gPTIVHF6X9k1q7OTk4hOeT4t4SoiHhurA4vg+YV1WzI=;
	b=Q7Ej8Zt8wBKq1mM4v/yMo4p7BuXSoDvHAbHKOkQIjKKt/X0+/54XczPHyTIUHJt8tR
	KYRmgmGQawF8ZCgWnawFMYvnCmDpTcSLpSDhF3ZXhSRaM5o92vjjnoRu2yQNCqDj6Wtb
	lPCMnoBP/yGMvSen8798uzait5W7F/mD42fRrxhIs1YmAAtO+fpudf37LWm6i9P3k8su
	jje7j72Cv/c4ftJ7Oh+uOS1QLWrn0rhtxuFso+R1niSCxRLYnC8zh8PE267cibnAjTb+
	QSkMrnbCildOP7VdMNvUZ9cLzC6nT3J9jQiIXb3XJmg3nkyUTJAo5F8G+HJfWL8931cW
	7fWA==
X-Received: by 10.52.76.7 with SMTP id g7mr1157423vdw.95.1359024417913;
	Thu, 24 Jan 2013 02:46:57 -0800 (PST)
X-Received: by 10.52.76.7 with SMTP id g7mr1157419vdw.95.1359024417837; Thu,
	24 Jan 2013 02:46:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 02:46:37 -0800 (PST)
In-Reply-To: <5100D477.9040305@windriver.com>
References: <1358908276-14786-1-git-send-email-Xin.Ouyang@windriver.com>
	<CAJTo0Lbg6OyQ=eWun_fp_01AbX8Ybcf+Cmw+9MKPVk7tLxoZqA@mail.gmail.com>
	<5100D477.9040305@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 10:46:37 +0000
Message-ID: <CAJTo0LbOV+zqSf56dokUGD7DePK01F-CP9d=mV7knAhfMPKNoA@mail.gmail.com>
To: Pascal Ouyang <xin.ouyang@windriver.com>
X-Gm-Message-State: ALoCoQk4rh73wjLlv6qJ7lXYFb50cKGw5zm/BAOqStXrZZhjJto/NCg5Iaz01xjcM7Mh/Cnq3GbOw5mimQJ9bUEKYlbElgsPTgs7K3RYJanoA/+J4dToBn8QR99Dtsisn5m34TLUfMi5a8ePrZj3iPF8N8+Ew4ZRRedPjS/6lVOF06TXT01tsj3AX1DdHOmfV3yW0Uz+gDQj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Thu, 24 Jan 2013 11:02:34 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 06:28, Pascal Ouyang <xin.ouyang@windriver.com> wrote:
> I do not use --libdir because pkgconfig/dev-so files should always installed
> into ${libdir} instead of ${base_libdir}.

Good point.

>> Finally, no PR bumps are needed in oe-core.
>
> Why no PR bumps needed?

Because oe-core assumes the PR service is being used.  Search the list
for that term for more background.

Ross


