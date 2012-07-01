Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SlTWc-0004wf-38
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 01:25:54 +0200
Received: by eekd49 with SMTP id d49so1897285eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2012 16:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=V+7aN26PUTdePNRVzNnhfmxBrn/qeLQwqlL0Hm4GZQM=;
	b=AEta/nwd+zYt4taqU9lVUi6U19n4VGHBO5aBNAdadHSrQQLE5HjNikjEVg7RXtg1uc
	IMTb5AMzTYBRRz3F+i98le7jSaTpR0bQ43mrezvt8Pcqzi5TQs5PMz9K/Ke/j7v4EjFf
	CpVoYDc9JD5MkdRCb4+KI1QpuX4XyXOk5oK3McUOvcVK05FLmXrLiWo2QXI0siTrr6RN
	4EEn51Eyy2zg4p592YSJWmTVZT5JDIXtarJ89Iz7pN+xm0aeJTciUz8whkIcPZfBk0xE
	++NGgnYNNdk246NnbIZ3WtZ1B8BCVs9vc8rmdM5dGS0cEJezI8dio/2YtaPXEKPVCEUa
	Y4Yw==
Received: by 10.14.97.16 with SMTP id s16mr2393667eef.117.1341184494107; Sun,
	01 Jul 2012 16:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Sun, 1 Jul 2012 16:14:23 -0700 (PDT)
In-Reply-To: <4FF0C930.4000104@linux.intel.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
	<4FF0C930.4000104@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Jul 2012 16:14:23 -0700
Message-ID: <CAMKF1squMsnS32n76Nz1jOo+x9_H5igyeNyUpE4LcWvUpso49Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] u-boot: Don't make the -Os removal part of global settings.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Jul 2012 23:25:54 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 1, 2012 at 3:03 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> -# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
>> -EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
>> -

instead of deleting it I think this should be

EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"

>>   python () {
>>         if not d.getVar("UBOOT_MACHINE", True):
>>                 PN = d.getVar("PN", True)
>
>
> Not sure what else changed, but I think you removed the TARGET_PREFIX or
> something else broke, but building with the Autobuilder, the following
> errors occur.
>


