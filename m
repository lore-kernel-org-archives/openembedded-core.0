Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29E42789BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 00:08:15 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id c6-v6so20264599oiy.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EIBy5P7XOfryUMt9JkI6gACt+9BjG1WyNvl91QjDCVU=;
	b=f7wjk4N6vO4BrqT9hSPUdWsAp2lYVRuYj2kLZeGkeSAHo+XQxzBCPnkiRc2cfpfET9
	GDfYJUzshFmx7oatu/9I8flrYXjT6il7N9liM88Q/BO8e0DfdbC9oO1JOEheWTVPCitZ
	3BgIlLCzahK0SK5ENCfggyO3uIWm3GaK9fdaqps6t8Blr6sQWwDH3xXHpsbuaFdVDN/Q
	jT9PAH32UwIOO3SLoNgWHIQp3GovVe01+DMgvnohDr31+eX046ujyCdBNqQu2dgIbuXk
	qioB7OW9GGxdQCtAy8yup8a6VgGZg5qGempCM5UkybNFw/WDrvXe1wfEU4HCAtTZbFU5
	AXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EIBy5P7XOfryUMt9JkI6gACt+9BjG1WyNvl91QjDCVU=;
	b=jtiR06tsaiQfgCweRcL9wsmMa27bmzwY/j+RrW42ffcemoRoOgfqXLi3W5uUP/n1lC
	9YAXmJo1jamDveAjIRSQdSFsrcev3GlfZqWCUJazJpJzEVJkGOcGWYMfgvtyQ5WngtuQ
	yaOwEsTIRCH0soxNCvn9FTaTkxNVwcNlAL/yt8mPhgk7Q9H8qv3Q0Db19h4n+KdfGliP
	cvOJBCM8JdHhvhD6zSwvess+U6VpmZ93VkGEw7kC2h209erg8BnFGA9MtjsJDKyOSAEg
	S7i8+Pf0DQqjVU9v6sYDrjrYR5Lu/g/VeW7rLH5NVPNEqfCNnqOqX9cWh3ZUtTt6nY8q
	aHOw==
X-Gm-Message-State: APt69E3dYyDcu4K5Cnfxpz5mm941+j4EfMRWqOgU0YTDG04sK2ftv2jd
	NqBw8g0SwY08zpx6YnZRljIOiufS4ERouvSgryYmvg==
X-Google-Smtp-Source: AAOMgpceqAiN6GS1tIHYXsQJ6GXI7WfY2VVpkGz3KMzI4n5qqrUw5qmS1V42Qh7ZIuFn17CGnKnVRKb16I5NKbdXqEs=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr9636692oia.170.1530835696205; 
	Thu, 05 Jul 2018 17:08:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 17:07:55 -0700 (PDT)
In-Reply-To: <CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
	<CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jul 2018 01:07:55 +0100
Message-ID: <CAJTo0LaUkxKcPhasnQh6KAsh2kv5rEmy-jMW3oXKxttS-kd1mQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 00:08:15 -0000
Content-Type: text/plain; charset="UTF-8"

On 6 July 2018 at 00:39, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jul 4, 2018 at 5:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 4 July 2018 at 01:55, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>  DEPENDS += "${PYTHON_PN}"
>>> -DEPENDS_class-native += "${PYTHON_PN}-native"
>>> -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
>>> +DEPENDS_class-native = "${PYTHON_PN}-native"
>>> +DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"
>>
>> Whilst there's nothing wrong with this patch, as the BBCLASSEXTEND
>> handles DEPENDS-munging isn't this a better fix:
>>
>>   DEPENDS += "${PYTHON_PN}"
>>  -DEPENDS_class-native += "${PYTHON_PN}-native"
>>  -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
>
> Removing the over-rides completely results in both the native and
> nativesdk variants gaining a new dependency on
> python-distribute-native (courtesy of setuptools.bbclass).

setuptools.bbclass:DEPENDS += "python-distribute-native"

If python-distribute-native is a build dependency for target then its
a dependency for native and nativesdk too, right?

Considering python-distribute is just an alias for python-setuptools
(its a RPROVIDES in the recipe, and the pip entry is just a
dependnecy) I guess the setuptools class should follow setuptools3 and
depend on python-setuptools-native instead of
python-distribute-native.

Context is this from 2015:

commit c4553e07cdbec5c29a74a43e0c5fdb2bb5583f7a
Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date:   Thu May 14 16:49:56 2015 +0000

    python3-distribute: Upgrade to python3-setuptools 15.2

    python3-distribute was merged back to python3-setuptools in 2013,
    and it is no longer being maintained, this upgrade also provides
    functionality that will be needed for python3-pip.

The same needs to be applied to the py2 classes, as both Py2 and Py3
use the same version of setuptools.

Ross

