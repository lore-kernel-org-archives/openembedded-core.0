Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2E01060053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 11:54:28 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so30514462igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 04:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=/7nVFQJqG0qyDzTTEcgt0NXxtWOLUXZwiT/EpDx0m+U=;
	b=RivX6dJX9QUyhdEZcLi62qYYPXx20/tXOfTX5NeX/Jg3lqi4mh8UjHnomllDv99f7A
	jLkF0o+UQ+36FMUQXgxUhmJoas8c2lG9l2ut7k1qNawz63JddNM4OX/qfftFTm8uITb/
	yKPm+LVOxCaq2ceWmOPdi0/t2ZKEHdXf4voZ7RdJiP6h2yrLNRYNqweLzD+hDHlsD5l9
	uCgmki4luDeWy7NNaT5QgSX+SxoizctjvAuqAm7pEknFdHSX6kKagUt7NFVxIzjXMW4+
	kfPmVrvhin5ZHzyyhe2q89Mwbcz3ypHbtT++78VgxNvqREhqjAUtPM0D82jUMP+0fHLw
	tDbQ==
X-Gm-Message-State: ALoCoQkcs/kBsVuoKUhDRymJaO1f4luM/c6tSlzsPCKeLJk6TdO1PiwA7Edip5WD85ALJ3Ng2gaL
X-Received: by 10.50.124.106 with SMTP id mh10mr15390948igb.65.1442404468510; 
	Wed, 16 Sep 2015 04:54:28 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181])
	by smtp.gmail.com with ESMTPSA id 3sm1716803igy.10.2015.09.16.04.54.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 04:54:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so228024493iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 04:54:26 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr41903488ioi.192.1442404466945; 
	Wed, 16 Sep 2015 04:54:26 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 16 Sep 2015 04:54:26 -0700 (PDT)
In-Reply-To: <55F8F5F5.5090703@windriver.com>
References: <CAP9ODKp9wA6oCdU6_e2T05ryMtdygBtA25EcyZhCGsPUtWOX+A@mail.gmail.com>
	<55F8F5F5.5090703@windriver.com>
Date: Wed, 16 Sep 2015 08:54:26 -0300
Message-ID: <CAP9ODKrjXFBHOZr4Yxo=tfk1CjjXVKSY_GeM1gKSjdSbRnEntA@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: perf triggering a QA error
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
X-List-Received-Date: Wed, 16 Sep 2015 11:54:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2015 at 1:54 AM, Rongqing Li <rongqing.li@windriver.com> wr=
ote:
> On 2015=E5=B9=B409=E6=9C=8816=E6=97=A5 03:00, Otavio Salvador wrote:
>>
>> Hello folks,
>>
>> It seems the commit:
>
>
> try this patch
>
> http://patchwork.openembedded.org/patch/103239/

Works like a charm. Ross, this one fixes the issue for me.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

