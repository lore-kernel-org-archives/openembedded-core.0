Return-Path: <scott.branden@broadcom.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E678F61691
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:13:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j7so197500plt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Zis+SYMy00Rx4SFqhuE/92C8HCOjoCCKllfPYJDgL/4=;
	b=TS4kDs2rnw010e5DjN1XLCscUzFfWY1S5lQj6AVhhYSTQLuOEYbcM1dkFkE9MC3ru2
	hCqjiQ5P6W2BcRa2PoIejZBRMeFJjiNqxlrbnPhUx4Q+/dRj2CXMpsj22YJ4IgJfWCxL
	f4vMaxjI0mhVCNIFEGY+5WC3nJ2UHPWOW3Whk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Zis+SYMy00Rx4SFqhuE/92C8HCOjoCCKllfPYJDgL/4=;
	b=CoemlYobdrLZqSvngHB1Ak34bAfmuY5MG65ypC0dV1PJC/Kc3YPaRb0fUZmzRyr/Wb
	Tu1IHwOEosEGjQGeDrFXaf+NordBgqeYZz0WSVEtDZtGSLH1b9ptIuimhZ6GUobVnKu2
	pDM0jtOhhfaj7yM1fz56a6epUB9nAa2rrWJA9gHtwnzr5vmwgy/3o85/9JJdDBlQSwaN
	Wn9L0+OWkv0oTV1yR7nRpD0m+5dNhUHMC2vD1uTAtziWncoF8rcmW49MoXjbq6Vy77sr
	gBR9X0riEYXQpwv0PnrWZt0OCibSuOmRMy6zPbTTOZtnLb8ItXsaoNBg43bEgnSD6BT/
	PZQA==
X-Gm-Message-State: APjAAAXHisRSK5B4ny66KOih55KWbRa9gTWJV96Bcx8GALrpjD/oBAar
	P7mQsGCdBfre0sMhwgp0YjoTEQ==
X-Google-Smtp-Source: APXvYqz3Lh462Kh4/LiNKvsG8Imbbwq98CaUg398TCTNGLN/Bi9nadMk9l/OpyLnFXsY2E/yfEGiaQ==
X-Received: by 2002:a17:902:ba94:: with SMTP id
	k20mr37084pls.104.1582658028973; 
	Tue, 25 Feb 2020 11:13:48 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	fh24sm4100841pjb.24.2020.02.25.11.13.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 11:13:48 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200225001115.18188-1-scott.branden@broadcom.com>
	<628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <f67bc5ca-b6c3-ef92-538c-f2b61c1a761a@broadcom.com>
Date: Tue, 25 Feb 2020 11:13:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: Re: [PATCH 1/2] common-license: add fdk-aac license file
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
X-List-Received-Date: Tue, 25 Feb 2020 19:13:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 2020-02-25 2:46 a.m., Richard Purdie wrote:
> On Mon, 2020-02-24 at 16:11 -0800, Scott Branden via Openembedded-core
> wrote:
>> From: Mircea Carausu <mircea.carausu@broadcom.com>
>>
>> Add Fraunhofer FDK AAC Codec Library license.
>>
>> Signed-offby: Mircea Carausu <mircea.carausu@broadcom.com>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> I'm not sure this belongs in Core? Is it a commonly used license? This
> recipe isn't in OE-Core? Does the license have an SPDX identifier (I
> couldn't see it on https://spdx.org/licenses/)?
If we do not add this license the following WARNING is emitted:

WARNING: fdk-aac-2.0.1-r0 do_populate_lic: fdk-aac: No generic license 
file exists for: Fraunhofer_FDK_AAC_Codec_Library_for_Android in any 
provider

We have submitted the fdk-aac recipe to 
meta-openembedded/meta-multimedia here:
https://patchwork.openembedded.org/patch/170495/

Please suggest the appropriate place to submit this license.
It is an open source license but does not have and SPDX indentifier and 
is only used for fdk-aac at this time.

> Cheers,
>
> Richard
>
Thanks,
  Scott

