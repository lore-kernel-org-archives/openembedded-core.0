Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DADBB6C538
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 09:17:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w17so17415814wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 01:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=whbFeV88hnR5Aon5HRbO5T5F2s8gf18LH9CiKjphD2Q=;
	b=KMRS64bSjPYcsiabMhhnLjTvhw8DxyS5HoGMWF6XAyDSwgwWsoXFlJdaqh5lCaRTjp
	olLjQP16+pMxYPO7r2DZA6DFFCwHLNStCwKvTnIGh8foo3hBNY9HDqWl/KIMUMOSbwUy
	JT10iCZX1fkNeamCLM6qGahh80kWVOSX7PjUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=whbFeV88hnR5Aon5HRbO5T5F2s8gf18LH9CiKjphD2Q=;
	b=SyHJ3tj9zh4OOqqic3V160vK0MZaRNS1ybet6Mf5ZGq2Mu9oSZpFwncAL2/PaLWmw5
	9bL4t/sJu48vPCjq4g90MXra3tLa+xuUjViZmMpOnI17VKCZiqNy+CNxQdb/SDA8Mj5C
	qsMCBWhLRSZs+0MnGqIDnDjzNG2w9JVmp/jjBHQeKuTku6qUbkKVADmCVMe59GUDOM4Q
	T7Jeqp+Lr1tJCMpORYm0QOrXfSp/Luf0cfxLSPIjDIY38ReSDLpQAiVTyORsGCa6/Pq2
	Vdho/zTdPz/7S16lNyQ78PSfcAmLZh+tvyOKhstcfVQau9E0t+qqZQ6k6jlUKY4u08Ub
	ZLng==
X-Gm-Message-State: AHQUAuZsUVdC2z7et3vBA/7gJEwYFL5p1dcZsvL2q6AiudqwM2fiuSdO
	CZnGe8wFfeLFzEf+gN/b6UscTA==
X-Google-Smtp-Source: AHgI3IbPrAFe9n1NOOMGBgkecr+1XA4darofd8Q1H6SYxa02Yk5wNWpv8RlSHDInDRpPMgBSuppH6A==
X-Received: by 2002:a5d:628a:: with SMTP id k10mr14107440wru.108.1550481452517;
	Mon, 18 Feb 2019 01:17:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c1sm10168857wrw.7.2019.02.18.01.17.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 18 Feb 2019 01:17:31 -0800 (PST)
Message-ID: <ae9b31eccc209c029e1f79d8b9b87fbf46868c90.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Feb 2019 09:17:30 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D043481860AF@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D043481860AF@PGSMSX109.gar.corp.intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Mon, 18 Feb 2019 09:17:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-18 at 08:33 +0000, Yeoh, Ee Peng wrote:
> Hi RP,
> 
> I have a question for "TESTSERIES".
> * Formalised the handling of "file_name" to "TESTSERIES" which the
> code will now add into the json configuration data if its not
> present, based on the directory name.
> 
> May I know why was "TESTSERIES" was added as one of the key
> configuration for regression comparison selection inside
> regression_map? 
> regression_map = {
>     "oeselftest": ['TEST_TYPE', 'MACHINE'],
>     "runtime": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME',
> 'MACHINE', 'IMAGE_PKGTYPE', 'DISTRO'],
>     "sdk": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE',
> 'SDKMACHINE'],
>     "sdkext": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME',
> 'MACHINE', 'SDKMACHINE']
> }
> 
> Firstly, from the current yocto-testresults repository, I noticed
> that "TESTSERIES" was mostly duplicated with "MACHINE", or "MACHINE"
> & "DISTRO", or "TEST_TYPE" for selftest case.

The store_map doesn't use TESTSERIES as a key since I didn't think it
was needed for the git file layout. Particuarly for the runtime tests,
it does mean we end up with a larger number of results under the
qemux86* files in particular.

When performing regression analysis it seemed like a useful way to know
which results to compare and lowered the number of inexact matches we
had to make.

> Secondly, since "TESTSERIES" was created based on directory name from
> the source directory being used, will this introduce unexpected
> complication to regression comparison in the future if directory name
> for the source was changed? If directory name was changed even
> slightly, example for runtime_core-image-lsb, if the source directory
> name changed from "qemuarm-lsb" to "qemuarm_lsb", I believe the
> regression comparison will not able to compare the result id set even
> though they were having same configurations and they were meant to be
> compare directly. 

For Yocto QA usage, the directory names are going to come directly from
the autobuilder target names so they should be consistent. I'd be fine
with adding a parameter to control it, right now it does add useful
information we need for the autobuilder though as it makes the results
more accurate (and hints to the user which autobuilder target the
change came from too).

Cheers,

Richard




