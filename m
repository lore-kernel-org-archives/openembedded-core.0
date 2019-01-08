Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 76A0E7BD86
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 14:58:33 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l15-v6so3627367lja.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MbbfYogQUcQWzayY6pZvtySKStOj3uh8A9c3Q0dGC/Q=;
	b=XoObDwrM5gX7K/HmSlYv4NVggaMIFO27foT/1Wf6gl+uP/iLoco7oMgzJmIORxAnpZ
	XKgNeYGyYG6bsTsC9UlNJPUp/nOB49FUHvvNBzofp92/G1DZnhAsgfPj8eeuxkVjZA35
	2wfNEWiZT637eX5d307P4uHP3wXdLhJ9936f+oqD/75XlclfsO3CaK3aiC3lMJei5wDr
	d+LbxhX35Z+Z3dcV6q5pg+qlOH0MS4WHwMEGfbcJCN24ZxPmEs2dCtfALT3NY3rtsqJb
	O+GZIhkvDwvsaOP9sJr6bb7783IOuWFKCVLIc2GxP2pNPMjvH69lVgGZ12tC54VZt90x
	NLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MbbfYogQUcQWzayY6pZvtySKStOj3uh8A9c3Q0dGC/Q=;
	b=mkTkCZWfPt7+urh4teazNMzxtDMQYeAElXe0P7wPhTAzSkIEjq96S1owt3DoFZn0Kl
	8vElpZJcP/TYiHn9+CAmd1Ow9LkkZ2bOjNxyOTvWC0+eHEmKFaPBEYCGoVMWVRJmW8TG
	EwotGPiRQ0CPOV5gxHfqfkYbteAcgflQ9kbvz81qnoz+yaIYLeB32M5yDIB6ucVxshBy
	OWbikc5h7NQ/tDgRs2PRyAJm9jFjzmnCMieJZfjAKuPuHjR3GVOM16sk+4yt2Y6tEkw4
	EYatEtKwqPgOaKyRI832QrKA1/0xMmpHphbxfNkNavVIPfm+xuirjb2V5VNH++pzuJqi
	R2tw==
X-Gm-Message-State: AJcUukcGHF41CIgagEoIKvn/T8AHoKtseJJqS5XzewIKL3gz3Skcwbl7
	BSpE71YW+0Vp/zXb5gLAoNffceLvFGI=
X-Google-Smtp-Source: ALg8bN4p3sXCdoyjPH41PixvJmAZiB53+n+4ny12U9EFh86gJ//KA2u8NpQFxSftxoCbt+3h/kThbA==
X-Received: by 2002:a2e:710a:: with SMTP id
	m10-v6mr1266084ljc.66.1546959513575; 
	Tue, 08 Jan 2019 06:58:33 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	m4-v6sm14080560ljb.58.2019.01.08.06.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 06:58:32 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20190102161144.11264-1-jonas@norrbonn.se>
	<20190102161144.11264-4-jonas@norrbonn.se>
	<ea694a7d32b44158870c954912b1ecb7@XBOX04.axis.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <eecec76b-0215-087a-ec8a-dd9a21dfcde9@norrbonn.se>
Date: Tue, 8 Jan 2019 15:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <ea694a7d32b44158870c954912b1ecb7@XBOX04.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/5] systemd: create preset files instead of installing in image
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
X-List-Received-Date: Tue, 08 Jan 2019 14:58:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter,


On 07/01/2019 17:43, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Jonas Bonn
>>
>> +    def systemd_create_presets(pkg):
>> +        action = get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
>> +        presetf = oe.path.join(d.getVar("PKGD"), "/lib/systemd/system-preset/98-%s.preset" % pkg)
> 
> Using "/lib" above does not take into account the usrmerge distro
> feature. My suggestion is to use ${nonarch_base_libdir} instead of
> /lib, or maybe even better is to use ${systemd_unitdir} instead of
> /lib/systemd, i.e.:

Yes.  I already had this fixed up locally but using ${systemd_unitdir} 
is smarter than what I've got so I'll do it that way before resubmitting.

Thanks for the review!
/Jonas

