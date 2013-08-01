Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id A363F6B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 11:14:10 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w16so1909760vbf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 04:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=szDK/V1N5eB+9Oyon+cn2FexXhsLQ988jg4Lwc+ngjw=;
	b=RyTCwLF7bDWV2MnXqkN7+3eBkEdlfe3uOcq2aBXKoXVcMhgZ4qWI0WHxNDqtFNQBbj
	m80UhE9C50djKrRvWQosd1FYYDsAn4BgugWPEwop0ZAda7dbBE/akrtCQVoaYPHyolia
	9AUC2eb/jqD91j+7zUUS6aXaPqd+E8JFSbMtHeH0GlcsyD/em/Y0nz0PPM9v3BMxtvbE
	luJCcK6mAjufGKVRpNFkg76+S6DKas268a6Rcr/7jQRbXSF811JSlS42kKgJhe0+1bq0
	IPfBAIzTrE4yPSd+QoXNhtrCkIXBEC4xqzv1v/bJ4jYj6cAOOCPzgx7e8FMJyEsRnHC9
	/kpA==
X-Received: by 10.58.219.232 with SMTP id pr8mr275307vec.80.1375355650742;
	Thu, 01 Aug 2013 04:14:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 04:13:50 -0700 (PDT)
In-Reply-To: <CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 12:13:50 +0100
Message-ID: <CAJTo0LY0Ua6rxpKx6CxwvA-XaZB_Kj01s_Zd5figzCo-n2MQgg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQm+EJjJsNyezFv3GdD49suKfIc6usSwDoYWHX25lRpqVvsYU7/dFgqxDSvCEuRprvkNtRN6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 11:14:10 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 11:56, Burton, Ross <ross.burton@intel.com> wrote:
> On 1 August 2013 11:50, Laszlo Papp <lpapp@kde.org> wrote:
>> Speaking of gerrit terms: I would prefer that you didn't submit this.
>>
>> I would like it to be more specific. If it cannot be more specific, it
>> should provide further information to get more specific information. Note,
>> machine configuration can be the command line as well, so this would still
>> be vague.
>
> It cannot be more specific without dumping the entire machine
> configuration, which won't help because a variable is *not* set.

Alternatively, let's approach it the other way.  When the user does
"MACHINE=qemux86 bitbake u-boot" what do you think the error message
should be?

Ross

