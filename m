Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CA9807718A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 07:50:40 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so13815945wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 00:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=331biGub/xbbMLv4cgoVDzCc491xB07qgdfBjAPBYRY=;
	b=UlH3Px55MNI8FOO/bIsOvfXjWmFRIjUojkkeSMzaxl3pX3YE7p0qALtbhr2RDfXfi3
	d/3Esj5RzXVEYRxr2TQiz+H51DdFwWS2UfXIVVxkLxlZvCMSIp1bYJ9p8xNoxQo9ZxoX
	hlDV1Glm7ToimOw6mI0kgLH3VqwPUi+/SEAL77DZz5XUqQHxiXNgWe08nz9paio3X3o8
	cDLErFb4/dx9nJA0ibvrD5/PDCdhzUmNch5H7Nq/yfYx15UVPHnn72+soHneHZvzk3tY
	QknMoKvXPFtQb6wKGlwWMdAVLcuzGv3CzW/CnQxOhNDwbwith+cT3fPNzZHH7LNnsGk1
	pQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=331biGub/xbbMLv4cgoVDzCc491xB07qgdfBjAPBYRY=;
	b=S5ivu3TT/QAo8w0TNfW5GXEPEWztPs23vERisIvdz5SW8BFfiH1xCcfpQ8Fkl18O8J
	yH0BvGhnYZyEWD2uzi1klFVE2LgG6l+bKG+Yt3VuRaHuQ3sZ882ys2+DXincMgIbtmx7
	SxRsA/hlpM2utrb3Omcfvumb1M1Cw9C/u4hifgqyspo43P8/LXWhJMmDKo5FJWoyRMF/
	MvxD2uXCE4RDxuTb5q8DstV0Z4YapkXEScY17wECJnFy+yE1UCfmRVH0SGOsMb9+mBT4
	1UxBus9u9r6N4Bn55CryT8W7BBSQIxarz23tvtpIftf+KtrIpTQUxw9cVldpBKDdZaHg
	K8Lg==
X-Gm-Message-State: AEkoouu/J4C2Ut7g55t0r2BlQqCFCc6gp/bjI+w5akNAiLbsZW5vKosN3EtxE6a/qXkklA==
X-Received: by 10.46.1.163 with SMTP id f35mr25499952lji.52.1470642640533;
	Mon, 08 Aug 2016 00:50:40 -0700 (PDT)
Received: from skeletor.greyskull ([89.253.118.72])
	by smtp.gmail.com with ESMTPSA id f3sm5527331lff.21.2016.08.08.00.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 00:50:39 -0700 (PDT)
To: bavery <brian.avery@intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1470627445.git.brian.avery@intel.com>
	<238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <69466223-31ca-9ddf-e7f7-5ca6ec5dab27@gmail.com>
Date: Mon, 8 Aug 2016 09:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 07:50:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2016 08:27 AM, Jacob Kroon wrote:
> On 08/08/2016 05:43 AM, bavery wrote:
>> The openssh-sftp-server was already part of the pakagegroup. Adding
>> the openssh-server
>> lets the sftp server start up correctly.
>
> If openssh-sftp-server cannot run without openssh, shouldn't it RDEPEND
> on it instead ?
>

Or rather, since there are multiple providers of ssh-server(openssh and 
dropbear that I know of), shouldn't there be a 
PREFERRED_PROVIDER_virtual/ssh-server, that openssh-sftp-server could 
RDEPEND on ?

>>
>> YOCTO #9362
>>
>> Signed-off-by: bavery <brian.avery@intel.com>
>> ---
>>  recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git
>> a/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
>> b/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
>> index c45463f..c32fef5 100644
>> --- a/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
>> +++ b/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
>> @@ -6,4 +6,5 @@ RDEPENDS_${PN} = "\
>>      gdbserver \
>>      tcf-agent \
>>      openssh-sftp-server \
>> +    openssh \
>>      "
>>
>


