Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D05E96E713
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:40:11 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so2390685wib.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 03:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=h6lLdRcYLDsjOYaC7negnitESkKwexffeYpNh+8o0gA=;
	b=XuO4qmYj3CNfIgsup/H7Y7GwFglO/H8OQeiVa8WRa+9XKBc0J4Wqg4DeVPGbUkm2cx
	UL8pyaRyiPmvM+KDrGZpofj7JDxQas4vk3mcVILCICXxttkOTRtUptAhgNRwl//RarI0
	VCc9fNLm3ViNkLqvf3wCSFW+2v9MucWdvXZVG6LEtj2VyVVqdywye0ovFeGb/6DoLy30
	Jy0whX3UVnGULMJL+7vFCd2WE11xEfk5sr0QWzX+9hmtKEUJdfIpVRsU3VQwfT738IPO
	T5E9Ban1Hq5fVbe1Eo4uEirtFtOiJP21dfq4BW8NJPQYGGGbGiPXM3QNfzFYgCiSlE+M
	LHAw==
X-Gm-Message-State: ALoCoQnNxEDy17td2VEprNHR/tIaFh8zGw68TYjEdcAr6Ld9g7w3ECXcva+liGhTmJyQTQmZO76d
X-Received: by 10.180.207.10 with SMTP id ls10mr3458711wic.22.1396608011948;
	Fri, 04 Apr 2014 03:40:11 -0700 (PDT)
Received: from ?IPv6:2001:610:612:0:2ad2:44ff:fe4b:bc17?
	([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id y7sm18683731eev.5.2014.04.04.03.40.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 03:40:11 -0700 (PDT)
Message-ID: <533E8C0A.7080304@linaro.org>
Date: Fri, 04 Apr 2014 12:40:10 +0200
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>	
	<20140404101456.GI2132@jama> <533E89CD.206@linaro.org>
	<1396607920.2910.109.camel@ted>
In-Reply-To: <1396607920.2910.109.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 10:40:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2014 12:38 PM, Richard Purdie wrote:
> On Fri, 2014-04-04 at 12:30 +0200, Koen Kooi wrote:
>> On 04/04/2014 12:14 PM, Martin Jansa wrote:
>>> On Fri, Apr 04, 2014 at 10:53:37AM +0200, Koen Kooi wrote:
>>>>    FILES_${PN}-lib = "${libdir}/lib*.so.*"
>>>>    RRECOMMENDS_${PN}-lib = "${PN}"
>>>> +
>>>> +FILES_dbus-launch = "${bindir}/dbus-launch"
>>>> +RDEPENDS__dbus-launch = "${PN}"
>>>> +RRECOMMENDS_${PN} += "dbus-launch"
>>>
>>> Is there special reason for not using ${PN}-launch?
>>
>> PN is 'dbus-1', not 'dbus'
>
> $ bitbake dbus -e | grep PN=
> PN="dbus"
>
> I suspect you're thinking of the name after debian.bbclass is done with
> it.

Indeed, I'll change it to use PN!



-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

