Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5A74865DB1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 19:08:28 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c9so10057595qcz.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 12:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fUbwx2lZ78o3jbWNBrp2O0mu7FGmUJh0hvnPEYflybo=;
	b=OuoxJDNYxQP67qqCRhDikKhZKyJrQ2umZJrEGpV2r8wkZtthDhuqHtXzR9EXF23hDZ
	vuzfUkBUW7eeKq+SggFZtOtGoKJu2gyrAeQuzXKTojNqr6duGqYNEvaFadhB6E/mzpOQ
	/1AEi6cluFLksWhdYx7KahzQhIZcq1qm10ymDAbun4Qvxr9CLcC0dyhdzZexhxyQZCPY
	lcVOaWGKwStiYxAIb+VJm+IpxzeUz9X1o2mZrcgoIzrWoc4HYZLY0lGwZf/E9YUgSR6C
	h61VlkaY62+9vKM8jctdSPZSfYh8vP5IF7O7ndzz+VPyx++lsqGhVxsObs6MzEkv0xX0
	NZKw==
X-Gm-Message-State: ALoCoQl5fhevyvUOusDBnKSpdugsDkSzEhJH+q8HUP8uDuaRsIWO/fnfIDGps/bjSqTy9skqeada
X-Received: by 10.229.51.201 with SMTP id e9mr83734247qcg.2.1404328109941;
	Wed, 02 Jul 2014 12:08:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Wed, 2 Jul 2014 12:08:08 -0700 (PDT)
In-Reply-To: <CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
References: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
	<CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Jul 2014 20:08:08 +0100
Message-ID: <CAJTo0La=tmVmk8vKFqr4xBd2LfgdQMHut0OcExV1o7xXTmAo7A@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Wed, 02 Jul 2014 19:08:29 -0000
Content-Type: text/plain; charset=UTF-8

On 2 July 2014 18:37, Christopher Larson <clarson@kergoth.com> wrote:
>> Add usleep in to support sleeping some number of microseconds.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>
>
> Maybe it's just me, but initscripts seems like a horrible place to put this.

Agreed.  Also is there a rationale for adding this?

Ross

