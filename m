Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id E15FA7EC64;
	Mon,  2 Dec 2019 22:51:38 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id s10so699444plp.2;
	Mon, 02 Dec 2019 14:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NgT65rqBXWFWiykUt/5o6eIc1kh3/cmgfpKXbIs63vg=;
	b=Hhzln7chxtB+Nf9WpQSaMb7sOH2BehT4oMjd6Cx/4DkPWl4aQsUQOhIYMlUJ1Tw7Yg
	jurCyifbPqA4JsZ8vblfESlnmUV3krRFbVPilel2E8qVU0yRs2o9o5uYNG5rrroUYIJh
	Nmy5QMMxDWLbZWHFI/vcaYx4ORuom6EobRCinskZvX90PhQg7GrGi7ZiLlZxlah25Tc4
	NaH3NjJPiMlRnQCuWBj9e6UDkpKd5P+NWcJp+DVqQ14dHzROx+LG/Eck+30aifjGJmSE
	q8nJ7sICfX4JprepI6ufKkpikX7CR5F0aWY/kYpwcDFXBCLS4Udqay+ilLd6sFeqnp4w
	kELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NgT65rqBXWFWiykUt/5o6eIc1kh3/cmgfpKXbIs63vg=;
	b=D4l9ljj5ELoEtZyUqKsSuiW7/Qeg3JQs5U2Lb3Qy0PF0BESs5n87e/dK0Y4c6FjpXd
	k0yg9z7MYtOu6qQ3+olDHmUfBrGYhcfwqoQ1T13feOWNgFV2XS8nkkjgEwI+p39PRG2F
	6/RPuvIdiEW3OPHS52DEtRTPZh854C3ahjqFYQHRoLcf5QZN46DnL7dt4WMU3mSl9BHc
	MUdE2k6foQhRaj8eqWj1RQnOClOyW7hPqPDlHDOeQm0Hm7b/sRGroe/hbzU4fOWV5Unr
	ibpvpN2Yz3CVpRRsmHPuD06CNaC3U1BmbEnns8YZbcOvlSTP/bjfucmd5uT7iqe69Xcz
	FISQ==
X-Gm-Message-State: APjAAAWI5ks/+g/KJ9VoxMmLU7ypcUWHmBm4qryLpF4L/co7gDsXvr4t
	vPd2TUqsnSPG1ldsuCfkciY=
X-Google-Smtp-Source: APXvYqwqGhvGJSbeAF9r1Gqm+7ngY/YKQBsK3OIMEF+NWhlsLdRuKvSNWxM3bHFwmpuuqKo5gxaA1w==
X-Received: by 2002:a17:90a:86c7:: with SMTP id
	y7mr1768358pjv.102.1575327099914; 
	Mon, 02 Dec 2019 14:51:39 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:51a5:502e:8fc:9836?
	([2601:202:4180:a5c0:51a5:502e:8fc:9836])
	by smtp.gmail.com with ESMTPSA id h2sm650709pgj.45.2019.12.02.14.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Dec 2019 14:51:39 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
References: <7ae3e998-5fd8-7d40-bdad-a3558b172f78@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a04b5f90-3492-7f2b-1e7a-0222e1727ad4@gmail.com>
Date: Mon, 2 Dec 2019 14:51:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7ae3e998-5fd8-7d40-bdad-a3558b172f78@intel.com>
Subject: Re: Removal of Python 2 from oe-core
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
X-List-Received-Date: Mon, 02 Dec 2019 22:51:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 12/2/19 2:27 PM, Ross Burton wrote:
> At the time of writing, pythonclock.org tells me that Python 2.7 will
> retire in 29 days and 1 hour.
>
> This means no more releases of Python 2.  No more security fixes.  No
> critical bug fixes.  No support at all.
>
> As such, we're removing Python 2 from openembedded-core on Monday 9th
> December.  Python 2 isn't required by anything else in oe-core so if
> you just use oe-core this won't have any impact on you.  If you use
> other layers, then these layers may need to be updated.
>
> The recipe will be moved to the newly created meta-python2
> repository[1] for anyone who needs to continue to use Python 2, but
> remember that from 2020 it will not be supported upstream so please do
> simply use Python 2 as a stop-gap before migrating to Python 3.
>
> If you have any questions about this, feel free to ask.

If folks do have security or bug fixes against 2.7.17 for zeus or
warrior branches, you are welcome to send them for possible inclusion
for the stable branches.

- armin
>
> Regards,
> Ross
>
> [1] https://git.openembedded.org/meta-python2/


