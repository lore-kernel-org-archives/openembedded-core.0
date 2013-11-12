Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 673EC6D125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 04:08:56 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id to1so3308110ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 20:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=L+nCuzDho1XFd6x1T3qpXtLnd6/bK9Lc0gWi9sPp0BY=;
	b=VCvg9fcOUy4lTFIoczuiTOoHaAzudFzMgOEPM7RNA8BEd9i5K61KCeGEV4ujaxL0Qr
	hDVFR3Eh/PLfv6dUnBqerLyo+IxFgVo0Z8oXdoLV23sffjD062FeMQFKka9rMJ6eHTwL
	2aRdDZm9ecQPNWXXs45At2ZUXODaEO0PTLrhy35fipTJlenmBmwNemOvEQPCg9HEJVWh
	9B/KzrcGhyneg8KExTSCcHdccoUT+ciabX7NVuVdT8ZQs4q0rdssZGiJp6zPi8Mq4lnK
	365WeaC3XWTi3EmhX0dghuRCEAn89VhEMdCpKjgn5turhahF/BOMlYzIhps3ybDHdLX2
	Gojw==
X-Received: by 10.50.22.67 with SMTP id b3mr14489428igf.39.1384229337568; Mon,
	11 Nov 2013 20:08:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Mon, 11 Nov 2013 20:08:27 -0800 (PST)
In-Reply-To: <5281A053.2080500@linux.intel.com>
References: <1384161833-7231-1-git-send-email-raj.khem@gmail.com>
	<5281A053.2080500@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Nov 2013 20:08:27 -0800
Message-ID: <CAMKF1soNCTG2Q3bWOdVF1T8c+XVAJ-kFiDEzjvk6pObfyXoh7Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tcl: Install header into 8.6 instead of PN-PV in user/include
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
X-List-Received-Date: Tue, 12 Nov 2013 04:08:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 11, 2013 at 7:28 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/11/2013 01:23 AM, Khem Raj wrote:
>>
>> This helps in compiling other programs like expect which
>> depend on private headers but 8.5, 8.6 and so on is enough
>> granularity and currently we had 8.6.x and so on which
>> means that expect recipe will need to be touched whenever there
>> is minor update of tcl.
>>
>> Additionally the encode creating symlink to shared object in
>> patch and remove it from recipe
>>
>> Refresh patches after making changes to Configure.in we
>> propertly generate configure and not patch is directly as
>> was the case.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../tcltk/tcl/alter-includedir.patch               | 39 +++++++++++++
>>   .../tcl/fix_issue_with_old_distro_glibc.patch      | 12 ++--
>>   .../tcltk/tcl/fix_non_native_build_issue.patch     | 12 ++--
>>   meta/recipes-devtools/tcltk/tcl/no_packages.patch  | 16 +++---
>>   .../tcltk/tcl/tcl-add-soname.patch                 | 64
>> ++++++++++------------
>>   .../tcl/tcl-remove-hardcoded-install-path.patch    | 26 ++++++---
>>   meta/recipes-devtools/tcltk/tcl_8.6.1.bb           | 26 +++++----
>>   7 files changed, 120 insertions(+), 75 deletions(-)
>>   create mode 100644
>> meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
>>
>> diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
>> b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
>> new file mode 100644
>> index 0000000..32e63c0
>> --- /dev/null
>> +++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
>
>
> New patch needs header please.

sent a V2 just now

