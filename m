Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id 31CB6731B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 23:53:25 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id a143so969965vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TiurNjyhlAyWAE5BB07G8iqvD71Nl8eM9bKKSXYVy+k=;
	b=URtkoEEmD46IGWJgAxP3TziiA1PpigLM/6hJayJPIXYEqZmeinUBlLejwJE18/oPrd
	YZzNEKrUVq2Qv+OFIHTHS88r7c9xswtSv7RHmxmcZUruuNyoAHYZ5hcEQuvPlaNV2rw0
	pdYQe1pvg3OKVR+c4r8BfJndqDXYNpCzKea80GAbj7jJwJmzww0v8OfCiGUPTWmMSD6R
	/H4mSsDYjCeHjJEydt5X982uEt670b4O4GgwpNIoa4d2KoWKXQTsQNKL6igOuJOzfqPo
	IjyyzFoG9aB/+h4QYsWCiDfkhYWjr9py3Rw+5wT1XE/VNoRbLKx7w6ohc1bm8EQvpetq
	QYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TiurNjyhlAyWAE5BB07G8iqvD71Nl8eM9bKKSXYVy+k=;
	b=SVonxkBMJo559GOHbs93nzcfEy7TEf1oZbmLR6qkCedqtJi0FaxA0zajQmoXUou0O9
	IJHDvYAh3Umh7CM1R+UBd+AyVWqjD9J+BjLEpuDKpjW6/00ZyyGT5lx87lpD0CLppl0o
	MLCcv7RQ3LdXYQq/lJ6vl6eAJ+4wqq/KPQpGSnBmz2nIgS+6PMAwWGQs2/sxU2M2Ha14
	9XihfFIEJJQ+RlBlC+izBr20Y6KtXgGrUk8ONgLtckFtXueU9d81dMkkqd+V6ljiXAq1
	oDvvAushgod1ADINyMWbbvZ1q6cm3pdETK6hNgenxi6UIt1ceIR6SPtQZgKZ43t4AQyc
	fUiA==
X-Gm-Message-State: APjAAAXNmWky6F9AdpIRyygKQrEXGv6nzoaSEYO4t6Wnc51DKphdqQGw
	w17EsS8b7G4MC0fhkpsxTSiPOVvXGnX3t4M9/ok=
X-Google-Smtp-Source: APXvYqz7yc/JtbY13jDj5FpkJVB4FAdxGRHx5Xb/RAPYqJqKEHaFPS9bTMLS2N9svEstUA4tCUhcmgTfT7QtC9+aMsk=
X-Received: by 2002:a67:fd98:: with SMTP id k24mr3912215vsq.137.1574294006016; 
	Wed, 20 Nov 2019 15:53:26 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
In-Reply-To: <CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Nov 2019 15:53:14 -0800
Message-ID: <CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 23:53:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 2:41 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
> On Wed, 20 Nov 2019 at 21:29, Ryan Harkin <ryan.harkin@linaro.org> wrote:
>>
>> I pulled the whole openssl dir from your repo, added the layer.conf changes to my layer.conf and rebuilt openssl and my image.
>>
>> Unfortunately, I still have no /usr/bin/openssl in my disk image. So I've added the RPROVIDES from Andre's in a vain attempt to get it to work:
>>
>> RPROVIDES_${PN} += "openssl-bin"
>>
>> ... although I'm not hopeful it'll do the trick...
>
> It didn't work. Once thing that's puzzling me: where is the package "openssl-bin"? I can only find references to it, but no package.

The "openssl-bin" package is created by the openssl 1.1.x recipe.

Adding "openssl-bin" to RPROVIDES in the openssl 1.0.2 recipe is a
solution for users who are switching from openssl 1.1.x back to 1.0.2
and have an image which is tries to include the new openssl-bin
package. I don't think that's what you are trying to do (?).

If you are using openssl 1.0.2 then the openssl command line tool is
in the openssl package... so to include the openssl command line tool,
add the "openssl" package to your image.

If you are using openssl 1.1.x then the openssl command line tool is
in the openssl-bin package... so to include the openssl command line
tool, add the "openssl-bin" package to your image.

But anyway, in all cases, the way to debug what's going on isn't to
try random recipe changes and then rebuild the final image. Instead
you should build your chosen version of openssl, look in the
packages-split directory to see which package includes the openssl
command line tool and then add that package to your image.

