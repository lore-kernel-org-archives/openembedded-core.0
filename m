Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C00B62252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 05:54:55 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so12034078pab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 21:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=3s2YXjX7FxYPxvG+OUdTXY/mQWuYwx2lmOBart0VZDw=;
	b=O5iluseDZwPeZTifWFTL9KmmOoF/Ljy6ajrotW7gKycO2GsqKE2xZu0C02TxO322Dt
	MavIvPLNJ7wVzDEJ3bYIcVnkk06hqT3X6n9rGtmSBQX1yrhfBu3CHZ8lGuuv3N1KWEYp
	JQpbpNRNPnKwut88IpB4jRxYLjP+J22NOn3iIp8hqh3YQU9PlSuQXKEXS/uz+LXHjH0i
	DRC4O5rEWS6Aq8mRiOb8HtGLrHditPlEf9hdKFGeyLZ63hm38MjHSfVZP9Q3yrGrd9/x
	1ngFsscvf3veZS5cZHHEns0g+E9fSHhw2Bzpfp9Mri+25Gop7lwgK8ABxXn55/9BmgF3
	C7Cg==
X-Received: by 10.66.124.136 with SMTP id mi8mr45937483pab.105.1415771696429; 
	Tue, 11 Nov 2014 21:54:56 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:5d34:bd2e:5ccb:3cce?
	([2601:c:9380:601:5d34:bd2e:5ccb:3cce])
	by mx.google.com with ESMTPSA id
	fn2sm20972609pdb.75.2014.11.11.21.54.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 21:54:55 -0800 (PST)
Message-ID: <5462F625.6080207@gmail.com>
Date: Tue, 11 Nov 2014 21:54:45 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Chong Lu <Chong.Lu@windriver.com>
References: <cover.1415260194.git.Chong.Lu@windriver.com>
	<CAJTo0LZKsp1UvRNVMiFobDo92okUwDdjUCMj84Sx2xTjHBvNsw@mail.gmail.com>
In-Reply-To: <CAJTo0LZKsp1UvRNVMiFobDo92okUwDdjUCMj84Sx2xTjHBvNsw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] nss: CVE-2014-1568
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
X-List-Received-Date: Wed, 12 Nov 2014 05:55:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Would I upgrade nss for dizzy or backport the cve fix (leaning towards 
back porting).

- armin

On 11/07/2014 04:34 PM, Burton, Ross wrote:
> Hi Chong,
>
> On 6 November 2014 07:50, Chong Lu <Chong.Lu@windriver.com
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     The following changes since commit
>     0add8abc12b850e38a6ec7dcf2856fab2c0107b6:
>
>        buildtools-tarball: package all of Python (2014-11-05 23:30:49 +0000)
>
>     are available in the git repository at:
>
>        git://git.pokylinux.org/poky-contrib
>     <http://git.pokylinux.org/poky-contrib> chonglu/nss
>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nss
>
>     Chong Lu (1):
>        nss: CVE-2014-1568
>
>
> Sorry, but we've just merged Saul's upgrade of NSS to 3.17 so this
> doesn't apply, and as we're unfrozen now an upgrade to the fixed 3.17.1
> seems like the sensible way forwards.  Could you do this upgrade?
>
> Ross
>
>

