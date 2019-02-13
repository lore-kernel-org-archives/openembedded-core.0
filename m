Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6250F6B8AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 10:00:52 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id e27so1290322lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=p6LoD1V9IE7run6ZT+OB6Pol/Ld8BFd4u+5wROpy07c=;
	b=sM/+E7CHRs2uWlJiIhYe99jDol69BjQ2DLIf1sCJkW9t36lgt6gU3zVucRtcOz3C64
	vc7iIyf5fQWNcZ1ykLOdluVFDd5xiWB3yB59yoT7u/XVWpYXTXoC7CiQOtj6pQvlihjj
	x4GMg+GCdxC4a+0Y67GOx6OoqaWj3GaLEzOrfmVQOH8F4+AWoqYzczvXEMqthPDFakSm
	FNBxedPJrAL2wBqyUTpTYnu6+ZVXFNfmIHCDvIggARH+M7X1cMSFYmOSVP47542lCVVO
	e+LHtYJG7c1avSVWtu9lmV4xG3AoRI3vO0O+RX9fdyeYvUuvQotqQAIRlLBTUOBtbm6Q
	DDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p6LoD1V9IE7run6ZT+OB6Pol/Ld8BFd4u+5wROpy07c=;
	b=OJI3Bd58LJzP0NvvFl4s/QVfXZg93VRPPnvKiOI/mcPFH8HJmZeS6YCMlfm4qSnHTr
	ezKkXdtIHhaO27+vnRdfhkgFUmADCNu+D3JkUVcNXP5zcbpniOSmaAXYQfIOiCtjRN7e
	yhTz7/LzFwSjFpghMflgiatg0tsGERpbJr9/amS/E9FQo6wHkgwzTR8dHjj8beuZf6dW
	exGgPOYRtwrf5KerM2sVQVc6GtLq4uT0QspKDAh+n17V3NGf14WKi/YaR5epsG8d6LH8
	2TKaaDuxZN6UFpjgkxVkHBfNrP7ACvYKTY4BTR/4c/DT7pZ6tN1jYCLKvBYU91UY+/pV
	0vew==
X-Gm-Message-State: AHQUAuZfpOtBi9t4yjHsJeMPdSH5n6l9+Gw9Lwa6/ShF77GEqTgSbqK6
	bBt+AntCEHIPFqxWbdsDZce7FqQXhKJw6Q==
X-Google-Smtp-Source: AHgI3IbWYOC1IbJj+uyJC7HTy4+i5TSEvtDM8YlCPN+qHHyOE0eYAc6ca1JGseQxtbfzfWwfu6I8oQ==
X-Received: by 2002:a19:c70f:: with SMTP id x15mr5308789lff.34.1550052052331; 
	Wed, 13 Feb 2019 02:00:52 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm3360555ljj.55.2019.02.13.02.00.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 02:00:51 -0800 (PST)
To: Mikko.Rapeli@bmw.de, git@andred.net
References: <20190211120433.16148-1-git@andred.net>
	<b5314b5aba8fc6e7ec104246463769932469576e.camel@andred.net>
	<20190211121551.GZ7474@hiutale>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <64408b4d-195b-f89f-4202-5591f6c5c78b@norrbonn.se>
Date: Wed, 13 Feb 2019 11:00:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190211121551.GZ7474@hiutale>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Wed, 13 Feb 2019 10:00:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/02/2019 13:15, Mikko.Rapeli@bmw.de wrote:
> On Mon, Feb 11, 2019 at 12:08:46PM +0000, André Draszik wrote:
>> Please ignore this patch. Looks like a red-herring. Sorry for the noise.
> 
> FWIW, I would like to see this patch merged. Had some issues in the past
> with busybox umount and added same change as a bbappend.

I'm also carrying a patch locally for this with the following explanation:

systemd passes the "-c" parameter (do not canonicalize) to the umount 
command and busybox's umount does not understand this parameter.

/Jonas

