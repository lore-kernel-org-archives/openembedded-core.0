Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D58616067D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 22:31:55 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id m184so184740935iof.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=cdB8zLTJwyAsZJigPhvgODzzb7hLRcpklOEY0A7AMCM=;
	b=CRxBRCWWL7jp6h84Stbm9c86VqmgfHVmrE+VmmsUig0Iy1D8fLVDCk+KLCNYNQn6yF
	Ytp07jMT/7E6TO+hvmG6ymrQ+B5GCuceBnAEnoC6+MYGP96uleZwMxdkh4dg8+NSAWdy
	Zv5ovrD+cecR1d5v8C6eWxYol5wzfN2Vi0VmB35N69R8G6X++UUsjot82SnOLElqsfjZ
	yNuyfKzbtWTdV7U/7C1e96ZLLhCTICiSgBhc0FL4G7lBjF4AsRkuLgIZQ8JQZWd3uPfo
	GcyycCW0FUq9Jf5+AFpLAjmu8Ei/hYk5G/gdUgZr9S8VfUpjz2kX6zWTXZc2wW+QcNhh
	0tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=cdB8zLTJwyAsZJigPhvgODzzb7hLRcpklOEY0A7AMCM=;
	b=PKXNCCW4hRIReOw0lyaqX9Es9gf6cINntfeYqCf4AHYdUiCVa3C0u8ycUwzsJ38deJ
	eDl3voosnmFahJwG2e7JQoQf5sOGj3RaH3aZUHpqxcPDUA2Bz03XQshiddgyfIsdxKoA
	Wj8tbcuUHVsVYWvncTLCaMly38vSpqVuDPK4aRTTQF7shAX6nS05I++prUtwuNUYXb6B
	c+iqReW7mAy9WdMEJkJlbOPRFdQ1rKqDYFJMrH8pA99mQV4/VLNlnaAma9NUJl9ZLT4Y
	7tkPP46YcRkvGQPPt2Rt4ufVRKMXSoFgrTlHIrCBTq1oLiTwKk/f1uDXPEzxQt/46eVk
	t9Uw==
X-Gm-Message-State: AD7BkJLZLxESxsChbp2mOAWjnefeLu74eGjcjUr1YSfPs90Qz14qPELAOfs6kOF6OhIuRw==
X-Received: by 10.107.169.35 with SMTP id s35mr18428374ioe.91.1457821916191;
	Sat, 12 Mar 2016 14:31:56 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	k2sm6326637ioe.19.2016.03.12.14.31.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2016 14:31:55 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
	<56E39AD3.4000503@gmail.com>
	<CAJTo0Lb23TkQYmVBUpTmOpCgtB-odj9MDZzSrAn4ZzyQKaw6gQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E498E3.8000106@gmail.com>
Date: Sat, 12 Mar 2016 17:32:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb23TkQYmVBUpTmOpCgtB-odj9MDZzSrAn4ZzyQKaw6gQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 22:31:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/16 16:54, Burton, Ross wrote:
>
> On 12 March 2016 at 04:28, Trevor Woerner <twoerner@gmail.com 
> <mailto:twoerner@gmail.com>> wrote:
>
>     openembedded-core/meta =
>     master:00d3fd571a8d261d065b43f5cf3076a381843984
>         meta-openembedded/meta-oe =
>     master:a1e135a499998add7575682bf53db5e02e753580
>         meta-openembedded/meta-gnome =
>     master:a1e135a499998add7575682bf53db5e02e753580
>         meta-rpb          =
>     master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>         meta-96boards     =
>     master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>         meta-qcom         =
>     master:32fcda819acb8ec485d9ab05108d554f807bf75d
>         meta-browser      =
>     master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>         meta-linaro/meta-linaro-toolchain =
>     master:367f784b831938dc508b7d472342d2d0d6ed9769
>         meta-poky/meta    =
>     master:37b61b059031e3c272a929b834e12fd83f46598c
>         meta-poky/meta-poky =
>     master:37b61b059031e3c272a929b834e12fd83f46598c
>
>
> Why are you pulling oe-core/meta and poky/meta into the same build 
> considering they're literally the same layer?  You should either drop 
> oe-core/meta or poky/meta from your bblayers.

Ok, thanks; good point.

>
> However the output showing the full remote URLs seems a sensible 
> improvement to me.
>

My hesitation is whether we want to replace the existing 
buildhistory/metadata-revs with my "improvements" or whether I should 
just create a second file with the updates. I don't want to break 
anyone's process should they have come to rely on that file being as it is.

