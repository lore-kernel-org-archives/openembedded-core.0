Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id B5F667865E;
	Sun, 25 Mar 2018 16:08:40 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id f5-v6so10404418plj.13;
	Sun, 25 Mar 2018 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=1nKr74DgGfsLpFPbi3XHkAJG8RWSu5Jl0P8wUXw1Vkk=;
	b=ef+Nx/DpLqxOVCeYgeVfSsn4oiXT1Xts13138MRhIZgH+oRPjWgulCflkYERZzgKKi
	yj5wHehKh6RhZ2+k72QaYgo/3jW180uSf1jbtG4vpkTTSjXg/ZKPFaQNZrPXeDT/ChRV
	KY4phfnuR1A23yJZCX7d3oJE2SpSI+mAajCTRW1n/nYqQNAyvjrxm38IDN2QEZS6WoHy
	QNURlDj+9IRbv6IrEdRFhC/QA9McxjvoxmHITwBHtvzakxDBKpWbhvthUgdExIQrMZc5
	JJ9ddxVIy18JgYwT3FF4PtREzJxU8yUbeQauurmtwD8p/TsSTOhaNbwtW4YqVY7oBAlw
	bIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1nKr74DgGfsLpFPbi3XHkAJG8RWSu5Jl0P8wUXw1Vkk=;
	b=ROt3QcoryFmwUOCKwuU6/NyIjwuiCbmsBIM+1JISfS8n3Af3UbjY766ze5YGsZRfqS
	JJvf/N0Pq3dDTIyEGOEhCtYX6Z625B8tdbS6S9IVwyVYsehV3v+PAPkClAZ9IyczZDcf
	GE2FHA1ck0NOuA9x0hHEHox4+rSIW/OE2Nst8cbRj7DtAVSWuiKTggIlGGR4ALELRsHw
	c+VsMEi1PFbt+B6X1vvnSmGmohwoQwAysyg+rWK4YGj+ZLwJzvZpf/RKlkhwg4HOfUiq
	XD0TyxMVsugBScleUgUsNvKNbCFx2RGs5bx2ThU3M204vzx989c+J56pZfeEBw5bvY93
	8QzA==
X-Gm-Message-State: AElRT7E3REbs2vGIE0B1YcCH0Fpn/5ngPnOTXqDVQpfvdJ9ditjcXH11
	cg+Rkz9iEoZRgz1kXkahnw6h4A==
X-Google-Smtp-Source: AG47ELu7oDQnP6WqHDJQkhPrJDNFm4XM4Smw96gVIHVBeiDvQ2oEnaUs9QBBHm/h3jAcV3MZ1mE2AQ==
X-Received: by 2002:a17:902:2c83:: with SMTP id
	n3-v6mr26039996plb.140.1521994121560; 
	Sun, 25 Mar 2018 09:08:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:2db3:d824:9df5:a117?
	([2601:202:4000:1184:2db3:d824:9df5:a117])
	by smtp.gmail.com with ESMTPSA id
	i127sm27481383pfc.136.2018.03.25.09.08.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Mar 2018 09:08:40 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>
References: <9a608e4c-0752-eeb2-306c-f8804c584be2@gmail.com>
	<CAHUNapSXZk0Ocmc9xeG2NAcVioF=5xjpzSxMXVxa9hAcGDKLZA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d6f1a3fc-f65f-8ca2-f9f5-576f5d01df48@gmail.com>
Date: Sun, 25 Mar 2018 09:08:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapSXZk0Ocmc9xeG2NAcVioF=5xjpzSxMXVxa9hAcGDKLZA@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: X11 proto changes
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
X-List-Received-Date: Sun, 25 Mar 2018 16:08:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Trevor,


On 03/25/2018 08:23 AM, Trevor Woerner wrote:
> Have the Xorg developers provided any sort of timeline for this switch?

https://lists.x.org/archives/xorg-announce/2018-February/002835.html

As of 3/1/2018 the last commit in all the proto headers indicate they
are deprecated.

- armin

