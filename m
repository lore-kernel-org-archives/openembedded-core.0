Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id BDC3D71A31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 16:33:37 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id t6so5781466pgt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 08:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=E0Iastm9e0bZHLZLYz6bhmy0ck6FThhLr6VKhgDRZE8=;
	b=FLTR2ZM6ePN8sPKsPDr8kzPsXHEQ+xD1L4HqsnTv4riillpxhCmcdETPDTYtXssDOH
	AFoSSRxvlrfV/Ak7yL07RY0Z/5tx9rq9ttJJ0qm5yLX1hzGRoyXx/a1btmmiTexBWBRF
	IlYKtRMRLnkBrrL0p1uHXxi7rJ0Nuyxere90rDLjCJNyF9E3Sbj2VP96V2bVzqEG0chh
	lD0ZuS+HU2I+kqledjWa9G0ZirYxrP6SEXbaEN2gt5XtbQTzuAPBDy7rQHQnwfoOKcIe
	wt3uIsutyU+NHTuKz1lgvnEsUvFZH41qnizfKWOhLnVOPUpjGx3Kis7rBLKW8LxEgzu3
	aIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=E0Iastm9e0bZHLZLYz6bhmy0ck6FThhLr6VKhgDRZE8=;
	b=Wqim9/A6R3c+5RgTbxlfEFJOJ9mYKlgjLxPpZW51VQWOyeRZ9XVPFaMi4TXRSZdB2p
	qbCoiikgV0Al/pnhxR+2KPuFyQ4r7aCK1j8PVdgzcN4pKEe7QvhjpW53ahj8NzFmE9/R
	oN5dPJ5MHTwLcfXorv65zqDMAeZAcwj2gw7Boq5uBTmlxD7LssFmXIUFWIr2lSXtAtM1
	K0k1Q1LzBhS4G0YXdQntAMPut3yn1/gsu33tK+5Ufd2yVgg/zXwPrhvP9AoDeEddoEag
	wQ/P2liCipk3rBoEJz2WiFhCh5xdi2ZCd3GMSZMwHPHAwA/H+uvbCqbfhzSfvemaS74I
	rgLQ==
X-Gm-Message-State: AIkVDXIUEbyGrguMo5iqVDEahSq6YDb3VZVvLhn1fggmw2zJ2ryfA1ledwMQBYF1PJn0/A==
X-Received: by 10.84.231.205 with SMTP id g13mr6429517pln.118.1484757217720;
	Wed, 18 Jan 2017 08:33:37 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id 66sm1952370pfx.29.2017.01.18.08.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 08:33:37 -0800 (PST)
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1484046651-61364-1-git-send-email-sona.sarmadi@enea.com>
	<e5f879c8-8ea6-d2a6-0e4f-9da16d838f6b@gmail.com>
	<3230301C09DEF9499B442BBE162C5E48AC10E985@SESTOEX04.enea.se>
From: akuster808 <akuster808@gmail.com>
Message-ID: <76c23cb3-4f0d-04ed-293c-822172087575@gmail.com>
Date: Wed, 18 Jan 2017 08:33:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48AC10E985@SESTOEX04.enea.se>
Subject: Re: [PATCH][morty] libxtst: 1.2.2 -> 1.2.3
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
X-List-Received-Date: Wed, 18 Jan 2017 16:33:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to my staging.


thanks


On 01/12/2017 03:34 AM, Sona Sarmadi wrote:
>> On 01/10/2017 03:10 AM, Sona Sarmadi wrote:
>>> Upgrade libxtst from 1.2.2 to 1.2.3 to address:
>> What else changed in this update?
>> - armin
> Hi Armin,
>
> I believe the only changes between 1.2.2 and 1.2.3 is one commit
> " Remove fallback for _XEatDataWords, require libX11 1.6 for it" see below:
>
> https://cgit.freedesktop.org/xorg/lib/libXtst/
> Age	Commit message	Author	Files	Lines
> 2016-10-04	libXtst 1.2.3	HEADlibXtst-1.2.3master	Matthieu Herrb	1	-1/+1
> 2016-09-25	Out of boundary access and endless loop in libXtst	Tobias Stoeckmann	1	-4/+39
> 2013-11-23	Remove fallback for _XEatDataWords, require libX11 1.6 for it	Michael Joost	2	-18/+1
> 2013-05-31	libXtst 1.2.2libXtst-1.2.2
>
> //Sona
>
>
>


