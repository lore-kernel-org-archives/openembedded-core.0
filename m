Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45CA5605D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 10:50:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m3so1870261wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 02:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=KpziWdyeTMOS0RRXmAEHFddfcs05EM89qGiQfa/3eFI=;
	b=Fxk9vIf0Oss0WAG4vsYODMn9JV8c3CFC2UrIbFaoIGlL4ulCU2cKLjxhlG60i1YI3a
	jqNWiHgMoLUIdpPrKUrhnwENW+bvU58ASLqXoABubNgvXfqQTdR/FuZXuUmqlVtdv3uc
	FRf9VxkmFtX6FoBP3JZYlZjwoYzhNULKB9giE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KpziWdyeTMOS0RRXmAEHFddfcs05EM89qGiQfa/3eFI=;
	b=q8rqdVW4HtjXmqxZPQiJCn4Ylf5seEy7vSSJL7iSf7dwPyn9koWAGOYL5+rPLhFZTC
	1xX9vfmjv+lyJWVR6txfbfoGp9IDLH1D8sxjFQF+Qd+dy5n7vYhcDH+l3gDamq+AXlnq
	aN7yvQQoqnZP7RvFpLaAcV8ZiR9DY1L5Ki/ZwR6HGhNBJtlTRoaTLWlM4iILajGngxgN
	ENNXY2X60umwd5pjup9/Tb8NNayStB633i1CjgMIgWm5z3Bhe3yXC1EmfpDBfw2sHbUA
	HarGjA2VCoqTBiKrQSJ7hpdubxnE1z/vSWcIlMpD5wjVs0+R7NHcryaUf24xxo1H3nFg
	qg7w==
X-Gm-Message-State: ANhLgQ2nJOlboTzC1IBahFB/cfzmTSWEDwYURI1Arbt9XVP0/u4yTQZX
	4S6YBx8uF5ttm5MSIAVrW0TXjuImewE=
X-Google-Smtp-Source: ADFU+vt2fPY18BRxTR5t822AvuQE1bupVGdTBtVSp4jH1qmfaSJ/dNjdFHOzFntcMD+STJFKjxXs3w==
X-Received: by 2002:a05:600c:291a:: with SMTP id
	i26mr3546731wmd.161.1583491809845; 
	Fri, 06 Mar 2020 02:50:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm49496180wrm.86.2020.03.06.02.50.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 02:50:09 -0800 (PST)
Message-ID: <fff8d16e4f5d8774c008a9b703c232420f748354.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ernst =?ISO-8859-1?Q?Sj=F6strand?= <ernst.sjostrand@verisure.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "hnathan918@gmail.com"
	<hnathan918@gmail.com>
Date: Fri, 06 Mar 2020 10:50:08 +0000
In-Reply-To: <ce62fe04f23ee6e89bb2f2ae92e99488f27c110b.camel@verisure.com>
References: <20200305154119.120789-1-hnathan918@gmail.com>
	<ce62fe04f23ee6e89bb2f2ae92e99488f27c110b.camel@verisure.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] mesa: updated to 20.0 release
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
X-List-Received-Date: Fri, 06 Mar 2020 10:50:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-03-06 at 07:41 +0000, Ernst Sjöstrand wrote:
> Mesa usually says "This is a .0 release, and you may want to continue
> to to track 19.3.x until
> 20.0.1 comes out in two weeks. 19.3.5 is planned to be the final 19.3
> release and is planned for next Wednesday."
> 
> Luckily, 20.0.1 came out now!

I'm aware the .0 releases are not recommended but given where we are
with feature freeze and LTS, I decided 20.0.0 was a better bet and
merged it. I'll take an update to 20.0.1 despite the feature freeze.

Cheers,

Richard


