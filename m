Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C37E6D74B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 19:16:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so4336315wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=LAJ1NR/HscoqJIoGs7Q01qIxFpEl3yhbWetpm/EhYqM=;
	b=OeWc6XfSY5HPgjt80L5+ucTx+LMA2HnH4ePMHJ9lYHvksupc6s0f0L6Ap1Vu/fGf6o
	2O938hROkQawjpE3JMzCkwhRKei1FF0c3mjspAjCISOgnDlOAfANXPKgnKTxHr2fU6GB
	OLh7AB8IWK5qsTl+Spity/D+ezFp9jvTmh2bzbNpv1Jx0e5yDva21RgC8x+7HGnQYnVz
	PfusRuClroJNbfuVu+5bhAAOovmJg4WI5XG0FoAQJSYLIH2PDuYBMd1WKJuItMlx7VDc
	lNJ2ClswgwE9XYNb8BLj0wgptB6aGMhw6ERybTnXyi3ZG7jWxwJ1aoWX+9YNnrIKUeHc
	ZmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LAJ1NR/HscoqJIoGs7Q01qIxFpEl3yhbWetpm/EhYqM=;
	b=hFTleIlxInDBywJlx3vmkh/gkOmWcBdEF/XTlKoT+InY804LVn8UoqC++tvPDYs8Zr
	6i8oJyxc8qaKyQfp7AeSwcE1wbLZEaBV7tBkNcku4r89nCvxTGJ2z0FsRyTtm6JALA4p
	pbIoPxLmpYc2+bdEnUor7G6q7ETzVydVX9Au6Fp/YbY/HmWGvQsvwS+cvvMBLrrpOTUx
	34yTK/KKzyu5kjbOZ7Knyojz7t5G6l0UTwHzgRfuPQXQ4RR43vmZqlawcwF/ESq0P28C
	Gomcd46G6r21DT2dx5dECyFaclmjp4+dpqA3d32m4wUYiXWPH8cDiCpfk94dS/XoOXSC
	Tl5A==
X-Gm-Message-State: APjAAAU7qHBQGYygMldF4V1oisswzkr+IrxcVrtPPl2rx0VVt5S4C+1M
	iUCtuCgmMxRl4SbEd0zWRn40D3CHTgU=
X-Google-Smtp-Source: APXvYqxe/qRt9O8o2eD/HZs9MVfO6NomLXWc8FJCJJIs6ea3XugoAtiEoLzyQ+Yb74g9wWefq5WitA==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr4375322wrw.387.1570648583898; 
	Wed, 09 Oct 2019 12:16:23 -0700 (PDT)
Received: from [192.168.17.155]
	(host109-149-206-9.range109-149.btcentralplus.com. [109.149.206.9])
	by smtp.gmail.com with ESMTPSA id
	q10sm6110058wrd.39.2019.10.09.12.16.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Oct 2019 12:16:23 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20191009170543.74807-1-andrei@gherzan.ro>
	<20191009170543.74807-2-andrei@gherzan.ro>
	<1d21f37ebf6e5b9bdbb82be87f57c0f226eec85d.camel@linuxfoundation.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <cc4d9d1c-64d7-4921-ce73-56c575c6b281@gherzan.ro>
Date: Wed, 9 Oct 2019 20:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1d21f37ebf6e5b9bdbb82be87f57c0f226eec85d.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] image-buildinfo.bbclass: Introduce IMAGE_BUILDINFO_GITDESCRIBE
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
X-List-Received-Date: Wed, 09 Oct 2019 19:16:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/10/2019 18:58, Richard Purdie wrote:
> On Wed, 2019-10-09 at 18:05 +0100, Andrei Gherzan wrote:
>> This knob can switch in between having full revisions and having git
>> describe references in the build info file. By default it is set to 0
>> to
>> maintain the old behaviour.
>>
>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> ---
>>   meta/classes/image-buildinfo.bbclass | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> I'm not sure we want to even encourage this. We probably do want to
> print/store the full hashes as output from this class as they may be
> used by CI or in bug reports. The could be unique at the time of
> printing but clash later. The output is also dependent on the fetched
> tree.

Wait. There is indeed an issue: it should fallback to full hashes when 
human readable tags are not available. I'll address. When tags are 
available, the describe will give you the hask as well including a delta 
integer. Is that what you were concerned about?

-- 
Andrei Gherzan

