Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5FE6B510
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 15:53:26 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c9so26977661lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=IUiD+z7IApAiQLyvcfeQVhYsLa6z08QHpYtrjYz7KJ4=;
	b=kgdLHonwZzBbD+Sn+wZ+lo1NFZjYHQCAdzur/g6AQdVLAm317TYq066EBZThfsvRDd
	5951hMMb3Ph7RY61jrENh0k2g/jQj5+BIkr2HDFvS+alI/sssBb9LuKTRI+iSWfv6ETc
	jhHkRoAjvKrD7dLA6j0IfJgebOm1/p4OabIbu22EIYyBBrgCLkQT9iimHoUE+ycCqcos
	tWNwZ1xyACuVKpkZFfQmfqXzducNgIVw7tVM+NPi2HRQWu03n1HTM6x3Lu4uQJrVMhgU
	KbZezQiQP+VPkDmkPwT4FKHY4GweeJirtNRuNAfruJks828ArYstNBdE+uzolgc2WpSp
	8pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IUiD+z7IApAiQLyvcfeQVhYsLa6z08QHpYtrjYz7KJ4=;
	b=pTvS7AOFl5XPIH3p5XTkEo8e+Xv+Y33e2qaNJxqIajK9bSJ550y/hyRJmQT0zF3m20
	RrWObVt6CxLJDC1qJ87+En1AVqcHh6Blz8DLch1EK1sCk+0YKmuQdsd8zAhmWkMmBq2v
	MelKLfNABEbMUrRPLscg2wckutiy2q2H5GW12+f/WnbxfaHTKpE0t4ig9CI7skFHIh51
	ct/jDJVTXfKrgjuixR520ZyIvb+3iF9kO+ZRLR6PQ/7NCyS0wEIAaSY86PGSc+6hcTZ9
	JhGvx+z9ubHWYcLAANLvtoAZjGnGNFMMRJ69BcMhkiNawp50eUpUn3e5zE8j5mAjHUWh
	BXoQ==
X-Gm-Message-State: APjAAAUrCGOvolNjHXHZ2uERZieM47ii2WbGv8FgXmRMYk/bEUiQQ5o1
	asNmBp3ET8NJvvmNYG/QN62T1tT/
X-Google-Smtp-Source: APXvYqwD6tDcODnBAKj045XgtrA2T4O4lWoRyD7hyKML7p+eA/9RLOoaQJLjkl8zGR3+UnwUeT+/Tw==
X-Received: by 2002:a19:c150:: with SMTP id r77mr34374096lff.76.1563810806363; 
	Mon, 22 Jul 2019 08:53:26 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m17sm7593171lji.16.2019.07.22.08.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jul 2019 08:53:25 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<20190722001812.14947-4-open.source@oleksandr-kravchuk.com>
	<CAJTo0LYD8ujue+Ls+oxsE64GNp0P-uXpE7xX_poEkPdb+7cj2g@mail.gmail.com>
	<CAJTo0LZQPPbMyg6UdWc=qv+1sZSMyyusBijM0oZHTHppUbZzLQ@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <38126da9-c383-84ea-bef2-44aae479d8ce@oleksandr-kravchuk.com>
Date: Mon, 22 Jul 2019 17:53:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZQPPbMyg6UdWc=qv+1sZSMyyusBijM0oZHTHppUbZzLQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] python3-git: update to 2.1.12
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
X-List-Received-Date: Mon, 22 Jul 2019 15:53:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Would it work if I resend this patch only or should I resend the entire
sequence of patches?

On 22/07/2019 12:16, Burton, Ross wrote:
> (The recipe is doing DEPENDS= and overriding the DEPENDS+= in
> setuptools3.bbclass)
>
> On Mon, 22 Jul 2019 at 11:15, Burton, Ross <ross.burton@intel.com> wrote:
>> The upgrade is failing for me:
>>
>> ERROR: python3-git-2.1.12-r0 do_configure: Function failed:
>> do_configure (log file is located at
>> /data/poky-tmp/master/work/corei7-64-poky-linux/python3-git/2.1.12-r0/temp/log.do_configure.32072)
>> ERROR: Logfile of failure stored in:
>> /data/poky-tmp/master/work/corei7-64-poky-linux/python3-git/2.1.12-r0/temp/log.do_configure.32072
>> Log data follows:
>> | DEBUG: Executing shell function do_configure
>> | Traceback (most recent call last):
>> |   File "setup.py", line 4, in <module>
>> |     from setuptools import setup, find_packages
>> | ModuleNotFoundError: No module named 'setuptools'
>> |
>> | During handling of the above exception, another exception occurred:
>> |
>> | Traceback (most recent call last):
>> |   File "setup.py", line 6, in <module>
>> |     from ez_setup import use_setuptools
>> | ModuleNotFoundError: No module named 'ez_setup'
>>
>> Ross
>>
>> On Mon, 22 Jul 2019 at 01:19, Oleksandr Kravchuk
>> <open.source@oleksandr-kravchuk.com> wrote:
>>> Got rid of python-git since there is no python2 version of the package.
>>>
>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>> ---
>>>  meta/recipes-devtools/python/python3-git_2.1.11.bb         | 2 --
>>>  .../python/{python-git.inc => python3-git_2.1.12.bb}       | 7 ++++---
>>>  2 files changed, 4 insertions(+), 5 deletions(-)
>>>  delete mode 100644 meta/recipes-devtools/python/python3-git_2.1.11.bb
>>>  rename meta/recipes-devtools/python/{python-git.inc => python3-git_2.1.12.bb} (86%)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-git_2.1.11.bb b/meta/recipes-devtools/python/python3-git_2.1.11.bb
>>> deleted file mode 100644
>>> index ac320fa56b..0000000000
>>> --- a/meta/recipes-devtools/python/python3-git_2.1.11.bb
>>> +++ /dev/null
>>> @@ -1,2 +0,0 @@
>>> -require python-git.inc
>>> -inherit setuptools3
>>> diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python3-git_2.1.12.bb
>>> similarity index 86%
>>> rename from meta/recipes-devtools/python/python-git.inc
>>> rename to meta/recipes-devtools/python/python3-git_2.1.12.bb
>>> index f973e9f42c..99e59cbb8a 100644
>>> --- a/meta/recipes-devtools/python/python-git.inc
>>> +++ b/meta/recipes-devtools/python/python3-git_2.1.12.bb
>>> @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
>>>
>>>  PYPI_PACKAGE = "GitPython"
>>>
>>> -inherit pypi
>>> +inherit pypi setuptools3
>>>
>>> -SRC_URI[md5sum] = "cee43a39a1468084d49d1c49fb675204"
>>> -SRC_URI[sha256sum] = "8237dc5bfd6f1366abeee5624111b9d6879393d84745a507de0fda86043b65a8"
>>> +SRC_URI[md5sum] = "33bfbc89fe616ca22b6336be80d570f4"
>>> +SRC_URI[sha256sum] = "7428f1cc5e72d53e65c3259d5cebc22fb2b07f973c49d95b3c3d26c64890a3c3"
>>>
>>>  DEPENDS = "${PYTHON_PN}-gitdb"
>>>
>>> @@ -29,4 +29,5 @@ RDEPENDS_${PN} += " \
>>>                     ${PYTHON_PN}-unixadmin \
>>>                     git \
>>>  "
>>> +
>>>  BBCLASSEXTEND = "native nativesdk"
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

