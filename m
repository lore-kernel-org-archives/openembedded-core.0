Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3087D716
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 16:07:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n25so20744115wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LFJUxJ4wvZjmiMnrp97BiFBMjp0B0NXtH5Om5AC5c/o=;
	b=btxeDww2gbp7bmWJdxLQ/lRVKSHRp88ywsqMOz/5vXXSBdxHW+fe6Pi+l8jrmMsmf+
	8djE2glTx8pVa4LAJtOE1J1iyWkz5XTegy9OFlltgiIHgt3wSL3YWNpETj04TnwoyhaE
	Yi+rNtjPtgXTrJI02oNhs+ZiUPMIvA8I0xBA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LFJUxJ4wvZjmiMnrp97BiFBMjp0B0NXtH5Om5AC5c/o=;
	b=Qpf6zsfiS6ekEfVi1MYygIe1/0WnTouNFkpy/TO8FGkdqvYQaq7GLmnut01fX+9RDi
	OyTf3RbxCdsCMYHY1ic7S+TsgjV1WOflMX1GMr34QPzDrMNnManE0K9xFLAafGD7VJhA
	cOnHGYxd9A1ShvV3Yq14SSEnJXpBU0znqjymAi8UMMbB+fHIIKeExyCrqctvsHc8EU9S
	ybxHvDFMkdmKnbxHxuTzA0k4CfOH9s8HlcmMcJHD940xLsNCqFPhysZNWx498/9BlCzv
	XbfTbZWDP7ENstEO4QW99mrCARXSnM58K0QNJuZHvQ6riGotyaSd3XlnNnuLjkJwP4MO
	2pAQ==
X-Gm-Message-State: APjAAAUB+QfNzjWDMmIHsUdnigPmIk68e7PwjRtHkGqD/hcpOcTKYygU
	ltEM9v2JFyl1Jt11KVA70oOF7A==
X-Google-Smtp-Source: APXvYqx7QLaYscXp3TfM5xxevEoTTEdzkjLWkvr3sH+jmRzCu5KIzlUnv/OoA5Bnf2vdr6Mf/qHv6Q==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr21123360wmk.112.1557245238112;
	Tue, 07 May 2019 09:07:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p18sm20659553wrp.38.2019.05.07.09.07.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 07 May 2019 09:07:17 -0700 (PDT)
Message-ID: <c84ab03819b7a919c71bd9a43bda2582837a5a17.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster <akuster@mvista.com>, yocto@yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 May 2019 17:07:16 +0100
In-Reply-To: <e05a97c2-a59a-08da-6ba5-5ab8da34a1b9@mvista.com>
References: <bc464027bd8df4d402b4cc476f856a5276e09c74.camel@linuxfoundation.org>
	<e05a97c2-a59a-08da-6ba5-5ab8da34a1b9@mvista.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [yocto] Yocto Project Status WW19'19
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
X-List-Received-Date: Tue, 07 May 2019 16:07:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-07 at 08:00 -0700, akuster wrote:
> > Key Status Links for YP:
> > https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status
> > https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule
> > https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features
>  
> Don't we need 2.8 now ? 

We do, this was on the agenda for the 2.8 planning meeting. We need
dates for the milestones, I'm proposing we use:

M1 Apr. 29, 2019 to June 21, 2019
M1 RC1 June 9th
M2 June 10, 2019 to July 26, 2019 
M2 RC1 14th July
M3 July 15, 2019 to Sept. 6, 2019 
M3 RC1 25th Aug
M4 Aug. 26, 2019 to Oct. 25, 2019
M4 RC1: 30th Sept
M4 RC2: 7th Oct
M4 RC3: 14th Oct 

I updated this into:

https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule

If anyone foresees any problems with this or has any other feedback on
the dates please let us know!

Cheers,

Richard


