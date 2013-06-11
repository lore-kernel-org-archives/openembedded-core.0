Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id CF8986A997
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 14:46:48 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so5825389pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TX+Cv2QiLNh9mP17bFpunLR1qQ45BeYP/zy8svqxGrw=;
	b=UvmWaF0zEbUMrs54a8w1nOLWWc+sNoyMmexhNpMt4HOTSyey9C7mZ80vgQkfDYviOz
	4fWgcxHcF/DMFQGuGpfHVDZjofdLL/XNnu10mfHCpMQucrJCwIthsaP9xdm3Meh8Z+ym
	qMxJBkvjs1iz4kffbfWWykth69N0r0YkeqRxHIAcDB09PXpABe8uGM/5J64dRdOq6DzL
	0vZsfFF5i5YnfK8mcqBggAmX/zxBSHZwjtlE5x/F7w1HlgHU+cd8abOzlYVugPqHGAsr
	pOSGqz+Eob9/+RZfm60pQpweReQSeoJXwlI93oyX1dmWP09yEeGS77jpuB/SC6BK2pso
	XPFg==
X-Received: by 10.66.145.34 with SMTP id sr2mr12335060pab.94.1370962010106;
	Tue, 11 Jun 2013 07:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Tue, 11 Jun 2013 07:46:29 -0700 (PDT)
In-Reply-To: <51B73535.8000504@linux.intel.com>
References: <1370949528-4946-1-git-send-email-ross.burton@intel.com>
	<51B73535.8000504@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2013 15:46:29 +0100
Message-ID: <CAJTo0Lb0+6CY835QED3LcJDL=iGy9J5pbjgznR36+XRa6Q+aYA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQncdt2wj0tiXDlrZPwc/6VF0yC92pWgioxiYuaq48rJd8pnSTVsFNa62H1EYj4d5GAh+C2Y
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: drop Makefile.in hunks from patch
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
X-List-Received-Date: Tue, 11 Jun 2013 14:46:48 -0000
Content-Type: text/plain; charset=UTF-8

On 11 June 2013 15:33, Saul Wold <sgw@linux.intel.com> wrote:
>> Patching a generated file is prone to conflicts, and we'll be replacing
>> this
>> file anyway when configuring, so drop the Makefile.in hunks.
>>
> Is there any replacement for  this patch, did you check that glib-2.0 will
> still build correctly for x32?

The Makefile.am patches are still there, and as we run a full
autoreconf the Makefile.in patches will be overwritten.  I didn't test
x32 but if it breaks we've got bigger problems!

(I'll do a build now just to verify)

Ross

