Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 19961707BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 22:27:01 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f12so383529qad.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XTHyWBVYdBRY7NLc1CWnuXG51MocHmW+3rnS+WvZ6H4=;
	b=G4fZRXBg+zHVPw2snFDhvcuEI+M9ul2N1s7Z2Qm0N97B6Rs6mAd2mSxTODWfUJR7SJ
	q8lNg5haF/39Ce9B4nIyVCl4YDs7smgHmNHxzGMdMsucPzTrcY0ZU4qxi1c/h4rji8aM
	AFPQZHehLJLtQuwNoee4DrBQcqkK4G5Pr/PzqaiLU4i0Squ4jbunKeAz1EXBha1qonES
	n13BaPHPei/qzd+7XZbE4lN5fGgTRFIiu++VstCd+kvQ0NznfoJkiawoV33GwkXg8CL/
	NN5csjweapOGXgTLMeorOkufHg9jjbMEBDCHQhNGb/OtztPbX7AcW7Lx1reQmSAurCQr
	ZeBQ==
X-Gm-Message-State: ALoCoQn0x9v6mTw3tvm2X/Q3hg4laD6FkvK6jzdnYb6VirHf5wmqmJC0r76G+45xCJ5SCAW07Jw8
X-Received: by 10.140.109.164 with SMTP id l33mr56013113qgf.72.1406068022375; 
	Tue, 22 Jul 2014 15:27:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 22 Jul 2014 15:26:41 -0700 (PDT)
In-Reply-To: <1406011764-4955-6-git-send-email-b50113@freescale.com>
References: <1406011764-4955-1-git-send-email-b50113@freescale.com>
	<1406011764-4955-6-git-send-email-b50113@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Jul 2014 23:26:41 +0100
Message-ID: <CAJTo0LZ7GxHDhgrjoAEB+NOBkM-tS_MQBT0O7zNCa8J2_LnZNA@mail.gmail.com>
To: Wang Zidan <b50113@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-base: get caps from src pad when query caps in gsttagdemux
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
X-List-Received-Date: Tue, 22 Jul 2014 22:27:02 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2014 07:49, Wang Zidan <b50113@freescale.com> wrote:
> +https://bugzilla.gnome.org/show_bug.cgi?id=728312
> +
> +Upstream Status: Pending

Shouldn't you be attaching the patch to that bug, and setting
Upstream-Status: Submitted?

Ross

