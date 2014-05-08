Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (unknown [209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 03E8E65F41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:14:45 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x13so2984520qcv.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 08:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p5DvWiIJP80S/aTlrBnCTkJmnziECUjzdJsVCFjIPqE=;
	b=mqXs0XJWzyCD/ObniuL0JnsjH8OTewTC9A5WPOy6vfKKJZ2ggd2qgJHf2qsBuLD/Dx
	D5vOQ2lZIH2ZnHFyZbCeqR3x+pppsgoXgJdpD/3W8c59ZZjdmehdPGaz7BdBJdTuG4Vj
	9U9TdsJ+lkGxng/ZCCzHF8vdZqsH/tZisZ1W1Dvm7TW+0Sqo5mvX8265wI6lhR0nJx7Z
	6DNY7AclHP3qPf4jF2P/dBDrXjpPXMQvYN/8H/QLE37eCxho97vO9lvwKU2vBg7s34MW
	VrLZufZkrdtuwGD9iP10wX3IUQq7BkqLySC/AnrF0TwKkE8OgXc1QjcIePQPWfZcrfsF
	g/Rg==
X-Gm-Message-State: ALoCoQl6b0XNSt+QSaaMBunkS/ECrPQMBaYWebKu3h3juseWAjnhZoCf72+506uRbTnz6CevpQw9
X-Received: by 10.140.28.3 with SMTP id 3mr5476775qgy.71.1399562086422; Thu,
	08 May 2014 08:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 08:14:26 -0700 (PDT)
In-Reply-To: <4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 16:14:26 +0100
Message-ID: <CAJTo0LbxkJxeqThO1EYGv0Gb-KQcYaC+od_JAa-2c8bzEsogXA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:14:47 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2014 16:07, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> The next question is does that mean for the "old" libav (which gst-ffmpeg
> depends upon), do we move that as well or drop it?

If gst-ffmpeg is the sole consumer, then certainly yes.

Ross

