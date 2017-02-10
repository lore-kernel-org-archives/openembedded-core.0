Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CEF57739B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 18:35:45 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so3694294pge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 10:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=NMXZ198e2RnU/On6069yDXbxB4zMUagb94lcOK7Zj4U=;
	b=sntPk/kXzUCFHGNYXZfFyE5jLLSYS/xfK/1wfc6oJanTgTglzy/ZJV2pvWIGTeETmZ
	AKh/WZq/+7kolWFf12bnWc6V8HehSVeh6Vxy7oShggCgW2Q0js8/gk8hFf6RciqqpQTc
	u9juqU9sfjT13ZG6uZ6T+YY3o9j6pcf9of2bmOo1PUP1vF1RY6KVZy6Y55Hvm+WuJMDr
	xJM+8TPy+hlc5DVZZVbk8glpEfVvzmjaN8WRgdkgxkbRsdd0flqQRt8lTMHOZIAaZ9Zc
	q2WKvOsBHlafXy9AvwRx2KoDaxywjXvKfWvFmpQDqQKyrz7fRDUPZXlg8qYsp+K1c2tP
	QuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NMXZ198e2RnU/On6069yDXbxB4zMUagb94lcOK7Zj4U=;
	b=ZiRELCY2Y5r1XUJQH77dciK4RO/M6Va3uDG1SgDrc/4btgghHWUF7o/mTXJvT2Y7v1
	YRnyPyXrC74EB8Bm+mG2GBiN4YBVPUl6RyPStgfgkUR+vTFuVgHThL8IoQSgVVoXRd/l
	7Kwa4IrMG10jAYqJPpkQ+U5YgU3rLOTfn6zaZPwOPWNd/S3vR2/tDCrJt7SLO8aQ7DMG
	pPHSA46ITa3cWRx/m7UDP848cLCNepFGrG7rker2tqIUcxRyEHLiC7K05DUPu4GBoH/1
	9HxG+XA48lGYa3Jds3VHs7fg924bJhyFvd4iQmj2LUwc77vYUQaTutRRmcBGBMppI+Rh
	ijDw==
X-Gm-Message-State: AMke39lkXnDq1Ex8c4nhZxPkSpdpKGqubJ+TnU9bQ7MBTn+dmQa5S3CoPTNjcFQm7PcGLg==
X-Received: by 10.98.102.196 with SMTP id s65mr11802885pfj.137.1486751745196; 
	Fri, 10 Feb 2017 10:35:45 -0800 (PST)
Received: from CACSVMO-14452.local ([73.93.153.65])
	by smtp.gmail.com with ESMTPSA id a62sm732177pgc.60.2017.02.10.10.35.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 10:35:44 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CA+chaQd519TOCHMNPzFnnWgZFi6=aWNC231-8=ihqf_Mfr-9Hw@mail.gmail.com>
	<49e5214c-5a23-05c0-c35d-636997dc7310@gmail.com>
	<CA+chaQe0PXA=4gA==O06bZP6c6oz2JXVAhCiqELZzs7KthQkRQ@mail.gmail.com>
	<CAMKF1sr8=kWBQCMZmou_hvkKNWmZQb0eQRFeb3GTR0L+v8oMfQ@mail.gmail.com>
	<20170130195613.GG15833@denix.org>
	<CAHUNapQQyURQr_ievuvxEw9u96dXg9dBPw+2vGr3sdTyudiNZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <537c21a4-c7d5-158a-83bc-a330ca783657@gmail.com>
Date: Fri, 10 Feb 2017 10:36:25 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAHUNapQQyURQr_ievuvxEw9u96dXg9dBPw+2vGr3sdTyudiNZA@mail.gmail.com>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Fri, 10 Feb 2017 18:35:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/10/17 10:32 AM, Trevor Woerner wrote:
> On Mon, Jan 30, 2017 at 2:56 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Thu, Jan 26, 2017 at 06:21:48PM -0800, Khem Raj wrote:
>>> On Thu, Jan 26, 2017 at 6:19 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>> I did try 2.6.3 but it was even worse as reported,
>>>
>>> thats just sad.
> 
> Has anyone made a decision on this? I wasn't able to compile libsepol
> from meta-security due to flex-2.6.2. I also tried upgrading to 2.6.3
> but that caused binutils to fail. Reverting to 2.6.0 seems to fix the
> issues I'm seeing.
> 

Can you help by sending a revert request and lets close it

