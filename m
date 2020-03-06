Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBFF60FE6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 17:16:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m3so3188727wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 09:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pYIhm4SZ1D8uMSQHpEFPUkh4YaUZ1BCl2dh/WwC72pM=;
	b=XxuqL/hCBXAL+bILha6OQtB5aTlQ20iVBxcWsnx5LOGUBfX0IE425CKIvvdupUqdUR
	rJ5Qf68Eq52WrSHxpbOBTBpOUj4Bzr+oOuN4wUp0EihyTxq3/LqKwYDqbkVQZDoeSbYj
	6l24NzGvwYbFZJM6KmUUK9ZkHxm7bdR9RXCYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pYIhm4SZ1D8uMSQHpEFPUkh4YaUZ1BCl2dh/WwC72pM=;
	b=WbvPmutSRqvKfmLd6CuoCwK75lTNV0QpCBJf2kHTf5044IRqo4sPxmU5BkYKnllF57
	gfrx1MyMH0zlJbhLYv2lir/ztSXjIsSNrhPqsZNwosKKaonV5uO/eR4kHg8RgkZsXo/5
	s9as0kEfzM5iwh2yA9ORj7KkPOSoEVypFs6yAXlpHxztK54ixXVnuCbxqedXAxTsmtrk
	la0YNBSOqKsPWmcowdTa92UG4w8uAYyl+m134i8bU5Ks6cbHwCBft3NpiE+mAkos6nL5
	ij5CSZJtmrHtsodITRA504oAXtBC0iJzyURE8dQPQ/GqshK2mFClRJroimQ+8G0Y3RaQ
	cnVQ==
X-Gm-Message-State: ANhLgQ2exCgDVG8EeVa70CdT4DpX0IR2bs1+XbM3UkE2N5DntF8mHE3g
	bIi9yi19qEIBbfCK7r2nmOJw8Q==
X-Google-Smtp-Source: ADFU+vsC4r7Qqvlr2t463bxevNaXyYFWvbKJvQ2IpqYG/fw0OllkKBKxFktp7xbQi0NduWLN+7axLQ==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr4685649wmh.12.1583515010540;
	Fri, 06 Mar 2020 09:16:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v14sm11146178wrr.34.2020.03.06.09.16.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 09:16:49 -0800 (PST)
Message-ID: <fc1e74eeded8fc881df72be0623b528a7c0e6d5f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Mar 2020 17:16:48 +0000
In-Reply-To: <20200306153234.23875-1-andrej.valek@siemens.com>
References: <20200306153234.23875-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Fri, 06 Mar 2020 17:16:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-06 at 16:32 +0100, Andrej Valek wrote:
> "add option to append lines into local.conf":
>  - What about dropping "sdk_extraconf"?

I'm curious what you didn't find useful about the other format and why
this version is better?

Cheers,

Richard


