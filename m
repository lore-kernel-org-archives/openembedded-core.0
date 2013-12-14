Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 49855610DC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2013 14:19:00 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hl1so726084igb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2013 06:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=A+F8pnX2MtkWOHRFQSUanYyZf4cSNdSARhWSR39xYJY=;
	b=CT0gjC6Nd7F7fpXiDqHnaZPt94Z18uo7UfkclmTNRu0YUTecb/c9TsgEG8JCTZPFS+
	y4MCNCy3jePc8UXPSqFwmkLWF9o2XJSxlMzpF/1m/hLmhMXGV0WT47dTXPsOj+blKX21
	oK/2T9KHE7rOPNV9xOa+djt1bbdHFXFHf2+l1msCm3X7U9WtkD6Zfg20yRBw+I/eGF6D
	R0GXgLm/O59zh1XroHZym4VwUUftX9ZgGJkz5oTkzJ+gDPjtypW/2ep0QgCkvucox9mu
	a21ENklFTWd2pyAICbMvFQaBZpDiePyFGnnIDZhLSVNWLXZJvC26K9FT19bh1sMxj4e6
	17jw==
X-Gm-Message-State: ALoCoQkvgUmvRMYnX/KVxbgbbmCosKcLAigkpV7XgQGNDthCCppyGJr/kj9g4p1/cRTTMZlL/geE
X-Received: by 10.42.62.196 with SMTP id z4mr5905211ich.49.1387030739517;
	Sat, 14 Dec 2013 06:18:59 -0800 (PST)
Received: from [192.168.141.83] (dsl-67-55-9-50.acanac.net. [67.55.9.50])
	by mx.google.com with ESMTPSA id kt2sm14717750igb.1.2013.12.14.06.18.57
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Dec 2013 06:18:58 -0800 (PST)
Message-ID: <52AC68D0.1040208@linaro.org>
Date: Sat, 14 Dec 2013 09:18:56 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1386677617-20952-1-git-send-email-ross.burton@intel.com>
	<1386677617-20952-2-git-send-email-ross.burton@intel.com>
In-Reply-To: <1386677617-20952-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 2/2] libmatchbox: use PACKAGECONFIG
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
X-List-Received-Date: Sat, 14 Dec 2013 14:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Ross,

Your commit message and your commit don't seem to agree. I.e. you say
you've removed 2 dependencies, but it looks like you've actually removed
more than just 2.

On 12/10/13 07:13, Ross Burton wrote:
> Use PACKAGECONFIG to offer some flexibility to the libmatchbox configuration,
> and remove two spurious build dependencies (expat and libstartup-notification).
[snip]
> -DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
> +DEPENDS = "virtual/libx11 libxext"

