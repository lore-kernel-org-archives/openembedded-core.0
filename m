Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TECDO-0004h0-QC
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 06:48:46 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 21:35:53 -0700
Received: by obblz20 with SMTP id lz20so702226obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 21:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=63MnlLLJoTHw8ntRmtFWjlFO5FSrtFQdaX+LmUDarfs=;
	b=Up+cfC28Sz/DaJpABZuJ/lqWQP7PRwWictrTALqXXGIbO0mmtIqxMUJyQY3yW4gqBV
	PRHCG8xenl1Q1lCZOUiGhL1ZrCxe9eGuCIw2eFDfPq/qjt/HLEYKhcfd0m4q3uSHFwBC
	8Ge9YtMl5/ZPAaY76WAYmj+8oIeXAc/3pr+UI47fxnWTuNDhbHmistuks+IDAr7ieFsi
	qHWbQzVaYWtjx8tt3Zi7T4m7MphhG2WCxxRwyqCUu2oMqyeXDR+lBsNjs+1E6Inikvas
	5bX3w90oWyo6rVNykCieSO1w3P4zm1CFNKUSmFbZOXL8iV+OuPJ0YL4a1T7/MqKQ4ZkX
	IucA==
Received: by 10.182.44.7 with SMTP id a7mr2030990obm.80.1348029363602; Tue, 18
	Sep 2012 21:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 18 Sep 2012 21:35:43 -0700 (PDT)
In-Reply-To: <1348006091-14992-7-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-7-git-send-email-msm@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 05:35:43 +0100
Message-ID: <CAJTo0Lb+GUR=5CpEmPU=ifXR2wfj_8BDbhQ3-c_uVK6s99vajQ@mail.gmail.com>
To: Matthew McClintock <msm@freescale.com>
X-Gm-Message-State: ALoCoQl/5BZBpCN3ODgbyzIUyj5afpo8Thz/hDQabZy/G56O934zCwyVT1Hh6S52lzZpvsnjL6jI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] binutils.inc: binutils will build differently if this feature is enabled, so add a dependency
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
X-List-Received-Date: Wed, 19 Sep 2012 04:48:47 -0000
Content-Type: text/plain; charset=UTF-8

"this feature"?  Please use descriptive commit logs, so s/this
feature/mulitarch/.

Ross


