Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAC56FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:48:30 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 4so47919265pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=TwG4ejMGYZ/PuB0nJinc+R0tee1f4TdF14UKNpJA0Uo=;
	b=DNK+BKkk1J7O2Aw2s/TeNYNAyO76fbVANqwtKaswGJ4i1I+tGxxWbPyGs1ejvPGsLb
	j6J7KtlkgkZsD1D+EseSKE+9YNPzq3G8HrORAllbSzN8W70CVdEF3fY8HEVj84ZgIAHb
	PMUxdQB+SgVj+yD4rpy8WrQoa2Z5EPR84ebOoTZ8FiWvNm5IECwEWKSTenCFCK3/cVUw
	isUIGcwa6tejKo1klPiodItvkMOOuCBm9Opdhi8u4peCcBeSLLz3fmRLDmIDE5LZtfx+
	TFraoWdNl437KXG4KNWTq7jyCPmUYFSmA4vWf0CnQLX5GO3yoXsn0wY2taKSJ2AaSzS0
	KXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=TwG4ejMGYZ/PuB0nJinc+R0tee1f4TdF14UKNpJA0Uo=;
	b=YTRAb6qgC5eiLjzRvp7xop1ACXa6PzblX2okLHnlJiuGayy27J0iU99pmVzjKy+e7x
	Uf6D+HlLkRfPA5EC0BdIX2pCkDkDCvj4KpJoC8R0XauEMfc40TSzooP5Goq0+Ok4N3Lu
	9kqLWA2CwXOrE0JUPyO6KdcfQugNrE7wiCuMHI/MPp8jADCyVvpqqOpkibR1CioPhc1u
	qHvXZbVroRt8/LOjKjVBW6Q0j2tfgl4t1VfMAHqXET6q7g9AvXZ7QFx5gm3Z7xr0Bd07
	jwF5WOQvToJ9oH0ieENbYzLl5YDk06MZH4tPAbuX7TJqXWDre38K7MtES8ohiwIRraVD
	MwSw==
X-Gm-Message-State: AD7BkJJcUT9pSt6bK1z3sBplMmVPyoy44AL163/UoUjdCiwdWGAfrYCwawrQJ/5zi3MUkw==
X-Received: by 10.66.152.231 with SMTP id vb7mr25932424pab.132.1458326910920; 
	Fri, 18 Mar 2016 11:48:30 -0700 (PDT)
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com.
	[209.85.192.177]) by smtp.gmail.com with ESMTPSA id
	ac1sm22662137pad.41.2016.03.18.11.48.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 11:48:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f177.google.com with SMTP id u190so179161160pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:48:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.11.205 with SMTP id 74mr25764813pfl.98.1458326909258;
	Fri, 18 Mar 2016 11:48:29 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Fri, 18 Mar 2016 11:48:29 -0700 (PDT)
In-Reply-To: <56EC1FC2.1020502@digi.com>
References: <1456337541-4269-1-git-send-email-javier.viguera@digi.com>
	<56E06C6D.5020008@digi.com> <56EC1FC2.1020502@digi.com>
Date: Fri, 18 Mar 2016 15:48:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoF0kqMr9UAiGLsqC9DZytTJnuHa21kQ0npNtUDM8QJ5w@mail.gmail.com>
Message-ID: <CAP9ODKoF0kqMr9UAiGLsqC9DZytTJnuHa21kQ0npNtUDM8QJ5w@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Fri, 18 Mar 2016 18:48:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 18, 2016 at 12:33 PM, Javier Viguera
<javier.viguera@digi.com> wrote:
> On 09/03/16 19:33, Javier Viguera wrote:
>>
>> On 24/02/16 19:12, Javier Viguera wrote:
>>>
>>> This includes a proper D-Bus service file for obexd in systems that do
>>> not support systemd.
>>>
>>> Signed-off-by: Javier Viguera
>>> <javier.viguera-i7dp0qKlBMg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>
>>
>> Ping.
>>
>
> I know people is probably busy enough trying to stabilize the upcoming 2.1
> release, but could this be considered for master?

Agreed; this is good to be included as it does address an issue for a
lot of users. Ross, could you queue it for MUT please?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

