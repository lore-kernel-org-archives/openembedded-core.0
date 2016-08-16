Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBAF6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 22:00:42 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 74so7558527uau.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=85E8L4UXDO05NrH6g84rrk9U14SFGadmwFEw2415d0Y=;
	b=HR1dxglu2HUUnUB4ln5hWe2S+5UDGK6JrE1XbhW1mIZYzo/n90UMPmoMwxz/KC30k6
	UuOiGmPEdgo65O8aFsl8Dz08X1WiC7pmjqy+5F/Ohp7lyBHkLe8YiF2OBgYy85QnB9dK
	rg492hogMH9rdUbn7nOq7Bv9ByuaK1572KgkrQk5C2ypL6pqbDM7/QLO+oriFinAeo9J
	7fuCNuBD3hLQlXJ9IzVUR8vkWa6LDwTbJ9nKuFd7+QVKvf38kR7csq1dj+7tfK0jQdFe
	ZHpLTeUWeEn+kqJNlyMzxNVb+6KGdznu1vn5gvwvbPdBtXGGEcEoYkrxIT1jNsr76OBF
	VIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=85E8L4UXDO05NrH6g84rrk9U14SFGadmwFEw2415d0Y=;
	b=WQAhaibt44Oj97NlzUmk17c9nbsh2omKjkcx8l+7dIJncgyrDbwCDQnBzMvh1mCUrL
	dfumlXH0KKZKZnxSMdQ+6N0AuO3gXfxm2CPl2QvhrEzo9XrzJ/Pdv1yQjTQKuW4ddw4G
	0SGDc2BbDFoClC2OFXkHC5LpbQmPlPMztUy/bYUT8uHRDZODhk98BnjbBzPeJ4hJVSQr
	ND0ioN4+crjCUi23KgMfilFwzIfN9k0KdIfGWkTJtrpIPXkkWa/ED/CrYli3XJqfysVF
	ybPuRZVn0zKzz82CTtaYrb1Yo5NGSdDHMWqOs5hRjeUBnJVoOvvTE9fm0Bw7p48DKwCv
	Greg==
X-Gm-Message-State: AEkoouto+J6785XBJGStOg7mSJDke3gRfTMHwkgpuqQ/Oomp0Gahd3G/MTi5sqeqqx+uVQ==
X-Received: by 10.159.36.206 with SMTP id 72mr4786491uar.126.1471384842571;
	Tue, 16 Aug 2016 15:00:42 -0700 (PDT)
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com.
	[209.85.217.175]) by smtp.gmail.com with ESMTPSA id
	u16sm6077514uau.25.2016.08.16.15.00.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Aug 2016 15:00:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f175.google.com with SMTP id 74so144700543uau.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:00:41 -0700 (PDT)
X-Received: by 10.176.64.196 with SMTP id i62mr6642689uad.154.1471384841114;
	Tue, 16 Aug 2016 15:00:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Tue, 16 Aug 2016 15:00:40 -0700 (PDT)
In-Reply-To: <00da7e65-bfa1-0ffc-a2bb-1b44e0978864@xilinx.com>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
	<00da7e65-bfa1-0ffc-a2bb-1b44e0978864@xilinx.com>
Date: Tue, 16 Aug 2016 19:00:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp7XCfL7ozG0GU2x6KfKXW1KJ5jLbVi6guWWKPnpKKLHg@mail.gmail.com>
Message-ID: <CAP9ODKp7XCfL7ozG0GU2x6KfKXW1KJ5jLbVi6guWWKPnpKKLHg@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 16 Aug 2016 22:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 16, 2016 at 6:28 PM, Manjukumar Harthikote Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
> Hi Otavio,
>
> On 08/16/2016 05:48 AM, Otavio Salvador wrote:
>>
>> On Tue, Aug 9, 2016 at 2:15 PM, Manjukumar Matha
>> <manjukumar.harthikote-matha@xilinx.com> wrote:
>>>
>>> This patch enabled out-of-tree builds for u-boot. This also helps
>>> building
>>> u-boot using EXTERNALSRC flow
>>>
>>> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
>>
>>
>> It seems to have mixed changes; why you are changing the install behavior?
>>
> Previously all the build fragments were available at ${S}. With this patch
> the build fragments are now at ${B}. So changing do_install to get the fetch
> the build fragments from ${B}

But you removed the suffix from the binaries it seems.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

