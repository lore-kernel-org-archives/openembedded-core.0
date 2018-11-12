Return-Path: <anonumiko@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 99B3B606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 17:32:45 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id b20so6745781lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 09:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+IgOkH4YWIfy1+r5plPKPgdKDTTmpZsQvFjNvhAVAcQ=;
	b=KvvJVhVj/txL8SphmBlUUllzHk5pk3PzQkFxZ1P6vm6vVnrkm4a3hn4tJ7e4/VsTD2
	lj/xXE3MNrWna5Ueoi6IWr17jJU9KqvHDCZfI9RHo9jfjXR0yXm8e/XLGgOzHVSky2iv
	DH9IvPbCi1r+61UbjKaJm5hkonOfS+pwWDf3nn8ywdtJILU6NtNv1tK01yaQTFeXBrtC
	Xrflmyxc8r9L2dp4H2kBfOaL4Ls31gwqhkGPSSQ053+HDUAGkJ0019zs6pN9iOx8LWH/
	Zc6l6wQhcA7GsyOFmaJj+Wtho65HoDIs8JEcOstIeSZl7uMVEPfLC+tbutHiKEqcQke9
	owOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+IgOkH4YWIfy1+r5plPKPgdKDTTmpZsQvFjNvhAVAcQ=;
	b=WzfldhmTgm4qTgmcE7bRaHrw9B2KP1HBTZCpEusqJgy2+pSZlDjFcpp9+RS/i/GjRe
	BN6Rl2/qSQr9Ocu6GABhqc4uSnBJfq/lGSTbu9LqUQ9WuDTbfy01mZH081NQqVDrZbgV
	8T3/eYgoGgQ5js7Hij3oPYp96kvhi2+0oc7PQl0DASEUZ2UL8m+qLByRN8SVONnzRtXz
	hN6af4WMeqEvY4ZOJWUCIdsO61Cf0V0lxUzbb6LlxwxHMen0HZ+EBFVvByFajrd5VtuY
	WZrTmyD/JCOGusmtCy7EQ6iAKrhCzoSHAca19vUjJQPvrrRKNGgjc6U7/3neBxgnp9DO
	fJKQ==
X-Gm-Message-State: AGRZ1gLUWvavhTTEuPFjTwUU59SzSF4EceC/3w4ThQGQoKQsiKYZfkqY
	FX3R5UvTIAqtftU4S6a2ymjlcM3Kdts=
X-Google-Smtp-Source: AJdET5dbki0fAWnZSji+Yql6VY2rDENq/0WfycnjvB2ic0EFVtpuMIt1FaYrtPmlgSDuHKHGshJFog==
X-Received: by 2002:a19:d78c:: with SMTP id q12mr1123051lfi.27.1542043965811; 
	Mon, 12 Nov 2018 09:32:45 -0800 (PST)
Received: from [82.181.15.94] (82-181-15-94.bb.dnainternet.fi. [82.181.15.94])
	by smtp.gmail.com with ESMTPSA id
	q2-v6sm2977863lfa.37.2018.11.12.09.32.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 09:32:45 -0800 (PST)
Sender: anonumiko <anonumiko@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181111153414.26447-1-niko.mauno@iki.fi>
	<CAJTo0LY05Mv=zODUjoA8C_tGvRe9eK2zfi1XuF-O7dH4SwD_jQ@mail.gmail.com>
From: Niko Mauno <niko.mauno@iki.fi>
Message-ID: <ecf65799-8407-0594-f53e-37417b9ae8e3@iki.fi>
Date: Mon, 12 Nov 2018 19:32:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY05Mv=zODUjoA8C_tGvRe9eK2zfi1XuF-O7dH4SwD_jQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-utils: Fix update-alternatives link relocation
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
X-List-Received-Date: Mon, 12 Nov 2018 17:32:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/12/18 12:55 PM, Burton, Ross wrote:
> On Sun, 11 Nov 2018 at 15:44, Niko Mauno <niko.mauno@iki.fi> wrote:
>> +Upstream-Status: Pending
> 
> I saw you post this to yocto@, so this is definitely Submitted.

Thanks, submitted v2 in which I corrected this to

  Upstream-Status: Submitted [opkg-utils]

-Niko

