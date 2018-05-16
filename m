Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 853D57488B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 15:04:35 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id w3-v6so402144pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GMIQJScNOr5bSxgomYaSZUJcpQoOtCUvJC9L1HQEnmM=;
	b=aru6D7bXq5rXRxnLW/dIMOVcPopll6w1/+u9X0kBMoA3Y5h1Dut1haSA93lm91OuYT
	c2OGHaA2ycEx1NmGG4JfSXOTWvHrzRL2sy5l1/M9uxsGCqUaWDiu1SImHZUTwO4U0U/Z
	HfdKvLOZvvNKgyU3WG6Vxs+jWzuShHEhNbtwZ4pq3/suZuLKYue2ObtWrLVjAdGgLonU
	BH5zna1oRA3XvUDtI9AqSmt1Xn4OLZ4IWHv4IYijfVRP+MUP1F4xpFJhpE+s8DL3dWdG
	4wt4ZVf41hm1RTXJh4gbT+PoRSuoS0dpax4FA1d7QpOChEYqQbrdWaJsxCuvu+hBYIRX
	KbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GMIQJScNOr5bSxgomYaSZUJcpQoOtCUvJC9L1HQEnmM=;
	b=LKIW6hbTThs8r225AudxGizCtto/JZRuSJ4aHxAmDe2B7IpfMc7WKj5lEvYetB3IOJ
	u1KVwnjkNv46RYa47ERfwTReZlveB63YxGBrhpexhBuGKc5VpLP2UjNjwtfCcEK/Hgps
	96kFgwXAnTx2BtB146dZFPueUQOE5t505RIDVc1YkCN+DbByqdMH7IXwTVjtrhOLrs+Y
	2k42vsqkVG8lMD5IWBlMoJy0Qbu1Q9z49MY6DoNzAOa4aBPomysB7PX1VizjckvJ9fGQ
	DjDO8Uv2t9O33RAHVEDmy1+lmr95I9AZUoCc7aOaVq09Z+YGerLX/RcMFMqabgaID5r7
	r6LQ==
X-Gm-Message-State: ALKqPwdtGCHkaGCGYJAUBJd3JEn52YucXRDnsPUiQry6siVYK70lTf+V
	KX3KY/k7Qw4qRIzEj0+DMkJxkHHz7ilqhceQ4uU=
X-Google-Smtp-Source: AB8JxZqfJoZpOAcRa1rQtSI8Jtw8+yxj3d2e7+fxf3l/68wSx2NNANFYC/C5bb9fvtFTl3gjZAVvsqv956NI+k3+Jq8=
X-Received: by 2002:a65:6510:: with SMTP id
	x16-v6mr1056559pgv.204.1526483076065; 
	Wed, 16 May 2018 08:04:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Wed, 16 May 2018 08:04:05
	-0700 (PDT)
In-Reply-To: <CAJTo0LaSp5M6=4MRaKwHgXdM=j+ftM2i0grf60d_eb4++=Fd_Q@mail.gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<13936651721b14a74b51c673c35c2b514299ca6c.1526452205.git.raj.khem@gmail.com>
	<CAJTo0LZL0Fs7i-+tm2KVw7htYkgFJFpYfEkCq1=Dda_0n9rpYQ@mail.gmail.com>
	<CAMKF1spJ-jTxMw4c65mqwH18P=CvLrJzA7Crcizfbr-pEM58Kw@mail.gmail.com>
	<CAJTo0LaSp5M6=4MRaKwHgXdM=j+ftM2i0grf60d_eb4++=Fd_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2018 08:04:05 -0700
Message-ID: <CAMKF1sqt3i3y4RFjiAoAgdceOph88XhSb=fwG4Qh4VRdxG6gDQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] musl: Make dev package rdep on staticdev
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
X-List-Received-Date: Wed, 16 May 2018 15:04:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 7:38 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Surely in that usecase you can add musl-staticdev yourself?  Forcing
> it into every SDK seems wasteful.
>

I guess thats a fair argument I can accept it. Please ignore this patch then

> Ross
>
> On 16 May 2018 at 14:32, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, May 16, 2018 at 4:09 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Surely if you want to support static linking in the SDK, you just need
>>> to add staticdev-pkgs to the SDKIMAGE_FEATURES?
>>>
>>
>> In some usecase, compiler runtime and c library is only required everything
>> else is external. Adding whole staticdev bundle would conflict with that
>>
>>> Ross
>>>
>>> On 16 May 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
>>>> This is needed for enabling static linking with SDK
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>>>> index a0a098f5b4..d7d201df9d 100644
>>>> --- a/meta/recipes-core/musl/musl_git.bb
>>>> +++ b/meta/recipes-core/musl/musl_git.bb
>>>> @@ -66,7 +66,7 @@ do_install() {
>>>>         done
>>>>  }
>>>>
>>>> -RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
>>>> +RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev ${PN}-staticdev"
>>>>  RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>>>>  RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
>>>>
>>>> --
>>>> 2.17.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

