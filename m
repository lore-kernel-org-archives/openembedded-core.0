Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E5C377CF7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 14:35:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z24so347685wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VBrRHoUmTJiLfmMq+XBAzM50sCLuOXh9MGKhJahiMyQ=;
	b=d0Bz/HKxfxiKpnCKl+W6qR0F4Pw6Y4FrzMzKKTbsSntA196KSw/AORWfSQus6Ig/aY
	7EfzvuYBXJJejPbxZpxQj/hMhYzHrBDt2v89dQQKSfXv4uJc1zh/LDgTCt63pzRq+pqY
	A1+MOH26Eh4xStjZ4AadgmWzMmPWj3nHaJFfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VBrRHoUmTJiLfmMq+XBAzM50sCLuOXh9MGKhJahiMyQ=;
	b=osBYXtZTT8o3W6Y6M0/DdNfXKR2fAuYB/FqQFndLUW5eXsNtVaEC2tGgTvRX7ausd4
	qhwYHFdQTCvQnTr7EmxuS313L8fq1u9M3w8fK98Bu7DQxZvOVfQX5iPOJUdYBwJ12czK
	MOC0TS9LVXGOQoMyZgW72QKG2fGqzH3+y0GkfP/n8iUKqGTd60rKjX3AeSHxBYEJ1+nY
	AG18apFzgcnKjiewsBmHzQqWSP6QAMFRZmA+vnF67/T7/Bt7x5yNN7aynsmA4vqp+QJj
	XgtFlrLkAz9lF9/yWcIAHeh1WMUFRXbCQy6LqboXjkJlK8XHpae3kdvnFdwMw53nXDY9
	SvtA==
X-Gm-Message-State: APjAAAVtwpBiarFFpgs3l1fT4l6NtKW6TbBGFihZ1RHdjlo6k2ZXIrTN
	yfjMy9uMoGmKKT2V4KfpLeiKVQ==
X-Google-Smtp-Source: APXvYqxMBarcJ4SU90l+/TTV74Xm0Gy4BmQra2LdkrYNPP7e8gVfqSCP6pSgQr4gfiHLzKa+olPACA==
X-Received: by 2002:a1c:a803:: with SMTP id r3mr2720248wme.78.1556030132636;
	Tue, 23 Apr 2019 07:35:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o4sm20080719wmo.20.2019.04.23.07.35.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Apr 2019 07:35:31 -0700 (PDT)
Message-ID: <24835a616c9ec53fba5e4424f12b72f9e0f8d94d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>, "'yocto@yoctoproject.org'"
	<yocto@yoctoproject.org>, "Eggleton, Paul" <paul.eggleton@intel.com>, 
	'Michael Halstead' <mhalstead@linuxfoundation.org>, "Erway, Tracey M"
	<tracey.m.erway@intel.com>,  "'sjolley.yp.pm@gmail.com'"
	<sjolley.yp.pm@gmail.com>, "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Apr 2019 15:35:30 +0100
In-Reply-To: <015AB11D45F2C442929CB2765DAE738634DD6D05@PGSMSX110.gar.corp.intel.com>
References: <015AB11D45F2C442929CB2765DAE738634DD6D05@PGSMSX110.gar.corp.intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: QA cycle report for 2.5.3 RC3
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
X-List-Received-Date: Tue, 23 Apr 2019 14:35:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-04-18 at 04:58 +0000, Jain, Sangeeta wrote:
>  
> QA cycle report for 2.5.3 RC3:
>  
> No high milestone defects. 
> Test results are available at following location:
> ·        For results of all automated tests, refer to results at
> public AB [1].
> ·        For other test results, refer to attachment [2].
> ·        For test report for test cases run by Intel and WR team,
> refer attachment [3]
> ·        For full test report, refer attachment [4]
> ·        For ptest results, please refer to results at public AB [5]
> ·        For ptest report, refer to attachment [6]
> No new defects are found in this cycle.
> Number of existing issues observed in this release is 2- toaster [7]
> and Build-appliance [8]
> For ptest, regression data is not available for this release. No
> timeout issues.
> Test result report on Public AB shows no failures.

I've been discussing with Tracy and Vineela how to best handle the test
results for the release for 2.5.3. In the end I:

a) Copied in the ptest results to the right place. This will happen
automagically in all future builds:

https://autobuilder.yocto.io/pub/releases/yocto-2.5.3/testresults/qemux86-64-ptest/

b) Copied in the intel test results to their own directory:

https://autobuilder.yocto.io/pub/releases/yocto-2.5.3/testresults-intel/

c) Manually generated an updated test report for the combined results
with the commands:

$ cd /srv/autobuilder/autobuilder.yoctoproject.org/pub/releases/yocto-
2.5.3
$resulttool report . > testreport.txt

d) Added a header to the report which consisted of the report from QA
with details of the bugs etc.

This means we have a top level testreport file which contains all the
test information about the release.

I'd like to make this the standard procedure for release. The release
notes and announcement can refer to the test report included with the
release and the test results as its there all together.

Ultimately I'd like to improve the formatting of the report (separate
out ptest regressions from the other regressions, maybe html, maybe
graphs, better regression information) but that is something for the
future.

Does that work for everyone?

Cheers,

Richard



