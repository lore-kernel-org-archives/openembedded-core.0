Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SeSyP-0002Da-HS
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:25:37 +0200
Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Jun 2012 08:13:56 -0700
Received: by vbzb23 with SMTP id b23so2939223vbz.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 08:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=RmSkgfz4HW9nxdf2dy6WXhu7ks9kRy1uIKv1a+lkd6Y=;
	b=V7IHcmT04uSQcNx6dUzOWilv3Js/jjMqq2OUKg0DIx6E6QvfRmaXQhPaxWFGizk36v
	BNmobGmtfkqv3eK7ZcwQLf1xSfVfUj5Nykjmdbd2csngyKpCsbQMddMywlamkxIpMFvC
	3HyZG9m01feMScKZIqvdtMUy9NmQSCyGydTf4v/JI0LrZKYEsjttmpvwKKz0YNlYqrCI
	NjDArAW3HFA0bjAmi1/YSk4/Qbylyz0CnWWK3+cfUpCie9mWWUCUolR8ONVhykzO3jND
	bS2ch5FbibSMD+56X76MGnKtCuQ2GPmBulDf3pi0uo1wd9mfTdWggZgw0tu8XzdkB9ES
	cGFg==
Received: by 10.220.223.212 with SMTP id il20mr14870034vcb.71.1339514035522;
	Tue, 12 Jun 2012 08:13:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Tue, 12 Jun 2012 08:13:35 -0700 (PDT)
In-Reply-To: <CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 12 Jun 2012 18:13:35 +0300
Message-ID: <CAMZjud3vpBnst6PWtSq-io+5CPZZdCCM7whOOSWbi9YCzbE7sQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkrX3RGvkExW+HkrABR8Roy9RmieNbgduQ00NthQpH7CZvWLZ45SsdLcDPh0SrwFm/NfITv
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Tue, 12 Jun 2012 15:25:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Tue, Jun 12, 2012 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 12, 2012 at 12:59 AM, Bogdan Marinescu
> <bogdan.a.marinescu@intel.com> wrote:
>> new version doesn't seem to use sigmask anymore.
>
> You have to build it on uclibc to see if you can drop this patch or not.

Thanks for your reply. I built with uclibc and the build succeeded.
Not sure how to test it though. Is there a 'standard' image that I can
build in order to test? I tried core-image-lsb, but it fails with an
error.

Thanks,
Bogdan

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


