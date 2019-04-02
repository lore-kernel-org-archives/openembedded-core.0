Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 216626C108
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 09:08:16 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id c4so10246752ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=32yBTCgKVMHZinBJk/5MIRFg71CtooiCZFCUBTaP+BI=;
	b=fPhSLB1Ic19khnSZNcmTXsF3kPBWUXYwvMr3dw1qt9EncUka51rYERnRHhQONTQgd9
	RT3O6yGIue7ung9OxxVsfHCiCDZvND7PRq3sHrYfktoaHM0UA454AE3M9f/mfAL/AyFk
	/VHsSe4cpxCjn3cyTFXmE/8RxCsQ4vUl1oVWFtrAuUngVpDat5WN3O1vsMbwYxo5ojOl
	3XGqlHkU7uJlGY/gNQ7lQSyztxvWlV+aCfYTBYwmscep/19HlBIAXX+jdT0NQRgE1fvt
	ZU/sLiM0/nNJ2OTxqMEpDtDF/JTPmQEHO6Wx2m4AT5FaI1PNDzTlEo2vQ5YSV7dlqMn2
	h8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=32yBTCgKVMHZinBJk/5MIRFg71CtooiCZFCUBTaP+BI=;
	b=MmR+Nq2bt3QhvLp9UGn7iEnnnUO54427fq5QYII2+BTwzTmbKjNwbZIjIY/Pu4jXgH
	FAM8JfEn0WlQu/+cHfuNj5XKBWzoFjnAkr7sDPXNtegeT3wPzxS5FOi1uxMyxlJeZdYF
	3xhRqE46E7dWqj6WFbGjop317cF4bJda09/oNS11kC9a5Va/1HvShexLARsilDcOAv+f
	xvrUkTyJrU7ynV3QyZguqbWFN1OuRwMEdsn+1MGLOvjf0Px4M2yrqljqSrXlTTANr5Ek
	2awz5jCYODBUJUkldxyjfZfkRorvAgGSbGk3xL5CGoHLQULulLm+BFxDlVkjKD1Puxbo
	FXjQ==
X-Gm-Message-State: APjAAAXWEIXUG5DxkfIGqCMuN6LFKjV2tFU6rpkTM6qFPsN465kUlFGx
	2wtAjD6GURLEjur4Vl2jNeSMG35qakIP1xLX36aaAg==
X-Google-Smtp-Source: APXvYqydieWiER5SI7VDA6ysan3DgGExe3+zyi6dBwT170c21sl51sKW8ZnCJp6cnav6J0WofwDT51R7XpkLtxgF7FM=
X-Received: by 2002:a5d:8d88:: with SMTP id b8mr30114105ioj.58.1554196098070; 
	Tue, 02 Apr 2019 02:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190402074427.26561-1-kai.kang@windriver.com>
	<CAJTo0La4V_Wo74ZntnALqPfAYsrKsSGkibnx60mRwjqAG5Sn9A@mail.gmail.com>
	<a1341e2d-8687-2dcc-9d93-78e4cc46fed5@windriver.com>
In-Reply-To: <a1341e2d-8687-2dcc-9d93-78e4cc46fed5@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 10:08:07 +0100
Message-ID: <CAJTo0Lbm4uesR8Nw_9z2CGVZUU+6aUeibVoOv5xbbfv0dqXABg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] avahi: fix CVE-2017-6519
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
X-List-Received-Date: Tue, 02 Apr 2019 09:08:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2019 at 08:49, Kang Kai <Kai.Kang@windriver.com> wrote:
> I have checked CVE-2018-1000845 which is rejected that it is duplicate
> of CVE-2017-6519. That why didn't list CVE-2018-1000845 in patch and
> commit message.

Okay it's actually been rejected, so tooling shouldn't be seeing it.

Thanks,
Ross

