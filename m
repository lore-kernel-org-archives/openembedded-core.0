Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZlYj-0003ZW-5S
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:15:41 +0200
Received: by eekd49 with SMTP id d49so1859224eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=78DEunZKTLbqN/3vGnaMlKsdtd15lDTPSLnIEy8zszs=;
	b=Dq6ADOCci74H9DdNzkgR4M5utCCPieeC4Rx6YNzKPl4YEPdUDpewdbbNih8VCTCZAv
	m16ckIUnA9JAlWRKPNR2hA177xQIuVtwRnl23rekKWwmaHjHOMtjg5PS5wDgAJw7KIGc
	0YyZXxZij519kYMuc2uGYSlarHrqv6BMcpxsKWRUVCCWBN+omy2LL3+CDpeOotQNMydd
	teB+uMl/ScLitonWC7taQz3ETC9T8q2Lxa3OvND14S2uiSZ3iQulYhhXUKVZcAYLX07A
	Qk35TBkj1hPHu+n/ZTSkutYChLEAUa99W5VWEDiwwmglfpEWEzGzXn1ACAafKNgNa6wP
	szXw==
Received: by 10.14.100.194 with SMTP id z42mr7355181eef.146.1338393922571;
	Wed, 30 May 2012 09:05:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 09:04:52 -0700 (PDT)
In-Reply-To: <FE4821DE-4305-4850-94FA-5248620FF105@gmail.com>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
	<CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
	<CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
	<559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
	<CAMKF1sqhA4UMK7xWwpGjF4SOvVBAwGST7uv1nwgu6aa1QCRuKg@mail.gmail.com>
	<FE4821DE-4305-4850-94FA-5248620FF105@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2012 09:04:52 -0700
Message-ID: <CAMKF1spQ2PKO7LhNd7fcjDNassmx5MDZ5kQHQpceTR8Bhe4rsA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Wed, 30 May 2012 16:15:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 30, 2012 at 8:34 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
>
> On May 30, 2012, at 5:00 PM, Khem Raj wrote:
>
>> On Wed, May 30, 2012 at 7:47 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>>>
>>> What does the -nf suffix do ?
>>>
>>
>> indicates no float
>
> What should I call the tune configuration file: tune-ppc440.inc or tune-ppc440-nf.inc ?

I dont have strong opinion on it but I think 440 with fpu are denoted
as ppc440fp or somesuch so I default 440 core is nofp
unline other powerpc cores.


