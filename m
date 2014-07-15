Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id C99A77063E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:34:49 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so2944695pdj.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=KCul3X0I9R9LqtP5rmBp+VRf+Nr3Sfp3tOLvrOOUwkY=;
	b=WncFRuY30K7x5D0YxZIisA08m3K627ZXy0VypwBi2xkCRCvfSlN/AdRUAfMWTJF9bI
	QLC9LTnG1+5V43NQjmN4QoPCRLXF09+1MeD7e/j4rZ2FsXs5cxmwWORh+rK7i0Ys/jEx
	VLxwNiEcubYIlsO6uDlUwa/1gScs+o2FMFw8Zm2oCtJlmUOQl+T2YBHxWTTV+5geqARw
	NiVdPSwiP1EUdK/+/0PdnKE1KcsgX5vqGx8cR5kRCP0LH2kEpQAjYSdKO3P/cCLkEJ96
	KuMOrdb4d67xKqup0iDdCCiUAxVoQkcZ6GE54Agw+QlkbKq/eEesiW87AMoYlkGOgCDL
	geBg==
X-Gm-Message-State: ALoCoQkMruZmS/S9o9mormjOFCzypf4XAlfgPuvTqQiYY5yQIzmWHjlmbtdGkPiW/9tyCiolMz8W
X-Received: by 10.70.129.81 with SMTP id nu17mr23802204pdb.56.1405438490700;
	Tue, 15 Jul 2014 08:34:50 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	se3sm14297064pbb.80.2014.07.15.08.34.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 08:34:50 -0700 (PDT)
Message-ID: <53C54A18.4030907@mvista.com>
Date: Tue, 15 Jul 2014 08:34:48 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1405437238-28782-1-git-send-email-akuster@mvista.com>
	<CAJTo0La7owsx7Bpz9NDm2AdUtU08n_bWVkVYh-T2MTGRcOxzgw@mail.gmail.com>
In-Reply-To: <CAJTo0La7owsx7Bpz9NDm2AdUtU08n_bWVkVYh-T2MTGRcOxzgw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:34:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/15/2014 08:24 AM, Burton, Ross wrote:
> On 15 July 2014 16:13, Armin Kuster <akuster@mvista.com> wrote:
>> +LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"
> The manual says:
>
> "Nettle is dual licenced under the GNU General Public License version
> 2 or later, and the GNU Lesser General Public License version 3 or
> later. When using Nettle, you must comply fully with all conditions of
> at least one of these licenses."
>
> So I think you mean LICENSE="GPLv2+ | LGPLv3+"
>
> I'm undecided whether this means we can drop the old Nettle or not...

Ok. I will wait for the dust to settle before I submit patch v3.

- Armin
>
> Ross


