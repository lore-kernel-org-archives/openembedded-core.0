Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id DF5016E687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 22:03:23 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id uo6so349075587pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=FWbipancd9PYYJSKnsBqZdxiy3hLji/xI9eFoWNccNI=;
	b=T8Lr2aT1aeMyDRGGiScsV0A+uuJEeZyWMGuf+Zcw4E6BHPOxtFnnACaNpgPencWeYI
	qJSyJ4UgcqWMCgaAxqDcBnz2lc2vLfsLAGwxtFBfJbVS2XCQ2AFaSmhPO8uUFzeIjaaW
	FyAv4aWW0y6sBBPaK4z3iy7jZDDpEnk7Y11IRGigSx11Yrmrsst/vEOhVhtstSBMRkFU
	K4big5dgnmvcW5mH1OMQCdSGkqJmtedgiT90/4CEobp77iYMsdX+OSUtjVuZJB3Hrqtr
	zqlkLoFLw7cEJwXYigoQgeWyuCIA1/UVssaeqhTVEYl2ONlb64s3LcTLYSPtcJgF1rWg
	tc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=FWbipancd9PYYJSKnsBqZdxiy3hLji/xI9eFoWNccNI=;
	b=OK7914tujqAjhSM6M2ybwU0r/PAq0xvzxW384yClNSqJVroCNXq3hkX+fA0/py77QN
	4DV/GI5juHCjVu6ultdl0Zyd96y0Hr5Ar27WgKjdcC+NakgZ0j1lyDkwEUFeMZB9jy3W
	B5lHNk7foDl2kr64gk+vhq92rkGJhrUty//5FX+804kKdNQnk15csjUjlNtL40P6Qf7a
	CxpWF3512lcpMtCJm+6JPCMYXGsM157Orhpz49QYaAF7oK8KI3a8gG5Z4rv2sAHg1CPV
	lvv6mSAAaVDnwzc7s829bnkZ4j77aZoQ+oDo/SfnHOzejUPGKMy/lL8H235rPV6+wkch
	Udjg==
X-Gm-Message-State: ALoCoQlv7OpvAMH1P+HvDB7Xj+9wXym9ltSncN9prknkbeE9/izDogBrPL8WjeypB+SuIhHzRo3EM2G9NlSkRAhggXMb3akXNA==
X-Received: by 10.66.236.162 with SMTP id uv2mr711716pac.101.1452722603876;
	Wed, 13 Jan 2016 14:03:23 -0800 (PST)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171])
	by smtp.gmail.com with ESMTPSA id 11sm4700262pfq.87.2016.01.13.14.03.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 14:03:21 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id n128so87820079pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 14:03:21 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.135 with SMTP id c7mr731401pfj.129.1452722601282; Wed,
	13 Jan 2016 14:03:21 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 14:03:21 -0800 (PST)
In-Reply-To: <1452721632-11855-1-git-send-email-ross.burton@intel.com>
References: <1452721632-11855-1-git-send-email-ross.burton@intel.com>
Date: Wed, 13 Jan 2016 20:03:21 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr64JMKDAFRSSDev9_NgdfvR_bH-kOFs+dxkvupd1c5LQ@mail.gmail.com>
Message-ID: <CAP9ODKr64JMKDAFRSSDev9_NgdfvR_bH-kOFs+dxkvupd1c5LQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools: don't output the full config.log on configure failure
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
X-List-Received-Date: Wed, 13 Jan 2016 22:03:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 7:47 PM, Ross Burton <ross.burton@intel.com> wrote:
> The config.log written by autoconf includes many pages of useless output,
> followed by an obfuscated error message, and then more pages of every variable
> that's been set.  It's only understandable if you're well versed in how autoconf
> behaves, and often in simple failure modes doesn't actually make it clear what
> the problem was.
>
> Instead of outputting config.log to the console when do_configure() fails, just
> use bbfatal_log so the human-readable configure output (not the config.log) is
> shown to the user.
>
> [ YOCTO #8856 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

What about printing the config.log files so it is easier to copy and
paste for checking?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

