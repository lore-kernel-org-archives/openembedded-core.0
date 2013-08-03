Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9099960664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 20:05:02 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so3656632oah.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=doseILIlDFPHJ98CjgHw6lUhxo2Qi7MN6jckKVxIdwY=;
	b=VZI3R7lCOSFIjy25oD3k1TKvdGFZiKAZLk9zD29M9sXWXe65ALlYPBz1B3BFlBGeKz
	zCwl073/zfp48EytLN3HpJWEddmRpBt+nGDwKJ/6NXRmU9vPH9OVJJA+cl6H3bahfoIU
	oFrRlaJ+5XGIPNpu8Xt/lYfSuwdudbZg6pSQTSUasG/mQJtUsnMWO3yVhEU9VUF/+Wjj
	R3UCw1AeXtEkojI3PWAY1Uk8Ae1lA+T7W0x4u/Kkzpw8yJ/rPkOq1KPc0iLBaN+p/yVj
	h9zsafh+BCgSinA/YNFwBLtdRGQAgKMwFyeRDiSguImZeCjP9AOtvYRNLmehLh6DNb1a
	RY2Q==
MIME-Version: 1.0
X-Received: by 10.182.118.129 with SMTP id km1mr9785025obb.15.1375560302897;
	Sat, 03 Aug 2013 13:05:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 3 Aug 2013 13:05:02 -0700 (PDT)
In-Reply-To: <51FD6162.6020900@linux.intel.com>
References: <1375521469-1654-1-git-send-email-lpapp@kde.org>
	<CAP9ODKrGeOrWx6v_E9cYBY_VvBn3BLNDWMaDBekhfFR3sr4+eg@mail.gmail.com>
	<CAOMwXhOopQVMRmCXVMnGPt_ZrcL8aS0mxwmUyGgGAvLH7533Cw@mail.gmail.com>
	<51FD6162.6020900@linux.intel.com>
Date: Sat, 3 Aug 2013 17:05:02 -0300
X-Google-Sender-Auth: jdHY3o7NUsNiW5WkSOyc7rEgg5M
Message-ID: <CAP9ODKp=jqBUFgO80o4VfkW2ca1KgFnTWVLvRRpuYWX5x3rU0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Sat, 03 Aug 2013 20:05:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 3, 2013 at 5:00 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/03/2013 11:12 AM, Laszlo Papp wrote:
>>
>> It is updating the latest version while also preserving the option of
>> using an earlier one.
>>
> As has been mentioned both on the IRC and here to various other patches that
> update without out removing the older version, we ask why is the older
> version still needed.
>
> In certain cases, such as changing licenses (GPLv2 -> GPLv3), we keep the
> older version, in the case of the toolchain and eglibc, we keep n-1 around
> while we stability n.
>
> It appears that u-boot is one of those special cases, but I do not have
> enough information in the logs to determine why we are not removing the
> older recipes.
>
> Otavio, any reason we need to keep 3 older versions?

Last time it was proposed, IIRC, it was late in the release cycle and
people were worried about breaking other BSPs. I think every BSP which
has specific patches on top of U-Boot mainline should handle it on the
BSP so I see no reason to keep all those, I am all for updating to
2013.07.

As I said, we're using it in meta-fsl-arm for some time.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

