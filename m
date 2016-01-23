Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B63276639
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 14:03:39 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id z14so8958137igp.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NFVAKgmbvuP66MI48bOFGrNYAGMVyr+h5gfMh2+L0XM=;
	b=Zy3twCrmT/yJAEzSX5IWkOjW+XSKh5YrLwkuF4rW75UPBed3IsbIdd1V1CWJ1v9uyT
	ZLPbMuy3Qnsn3NKF4pnsY2+Om+PVvzbrXJ8bA0FLOZoKK8oqGV+4hSl4SAu3nubQ1+UB
	LKlHZlfQFDW9Ih/ytaAoSFEIVs7PYFOtrTOzh5J04to+fya8TnG/JG05bo0HVSzjWiNF
	EC9dmPOVDzx5uoUCHB77A/ikJiMqP3EGudTQYYe2vLC9y1TZovpuRJNv5eGeFOhXLcGH
	kL/Kjgm2j57pxP3dVElD3DOvhyt3Wk6nbgDq2xGs4L+f8uSoweXuOtY04bVlaWsnciA1
	F2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NFVAKgmbvuP66MI48bOFGrNYAGMVyr+h5gfMh2+L0XM=;
	b=dY4RsEA9FeUPYplqkK+bdStXj7lcvvfKH6qRho1dV97/EfE/1WHoThBjgUlBn4HJCi
	Pg5HAGC7BGuZfvS7O+WxQtJaOpZ0P0YtALhfkammjHSS39oYWdFDzzUm+hnC0rAuVbz0
	VVvvS6W3vrls/V/2pUVBI8yetSUZrH7c8j7vDJUKWsfV6BB1e0s2Fo/P3IKLvK41cXzq
	95PrYeAyjZOHo8sOgcfUBm2/bexWQ5GeMBPAlNkaP/ghMhzs4chccFGe3bRwYc4ZgjHj
	iiBYPdOgj6VZUIOPldKJrNUcpL6YC34TlqHz4qVY7ZT+lEsviSnHUyKVoaSlDxroSOea
	lFEQ==
X-Gm-Message-State: AG10YOSyxUNCWF2IMFmSDjnuqbzRpISHk57zaRvTeH5oxNiUEBY1NJASsMTjQLhz85O+Co3MLKkzdfnf/OEl4g==
X-Received: by 10.50.134.129 with SMTP id pk1mr8962022igb.11.1453557819894;
	Sat, 23 Jan 2016 06:03:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sat, 23 Jan 2016 06:03:10 -0800 (PST)
In-Reply-To: <CAJTo0LYPF=bkqU_OGwCU5NZOgDja70Xsr338xJo6rJCf6MNpxA@mail.gmail.com>
References: <cover.1453427632.git.Qi.Chen@windriver.com>
	<2123a9457649d41670e9c35ad4b77a80064c95ed.1453427632.git.Qi.Chen@windriver.com>
	<CAMKF1sobhDsXQ1ag9ZfrdHQyka7Y88C-thvzvMADa_V5C=9rqg@mail.gmail.com>
	<CAJTo0LYPF=bkqU_OGwCU5NZOgDja70Xsr338xJo6rJCf6MNpxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Jan 2016 06:03:10 -0800
Message-ID: <CAMKF1sqBv67DS+8=vSJJQfRXdWJLgHxS8ur8p7ET0qFa3nks=A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: work around the boot problem on qemuarm64
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
X-List-Received-Date: Sat, 23 Jan 2016 14:03:39 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 23, 2016 at 1:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 23 January 2016 at 04:52, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This is general aarch64 problem, so make this across all aarch64
>> this is the original problem
>>
>> https://github.com/systemd/systemd/pull/1190#issuecomment-166294683
>
>
> And according to that link, is a binutils problem.  Can't we just fix that
> instead?
>

We can. May be try out the binutils patches I posted and see if that fixes it
https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26


> Ross

