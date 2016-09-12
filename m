Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id D493E771A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:16:01 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id v189so5451452vkv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h5i4V9n7hsHZLgNzD6XBUB+VMfU7wgoA2TxRdWueIH8=;
	b=q3OLwgV9ZYShh2fa81FAKXkBvSbGtIXZrC0Z6RX1bL/UP9DwE7pMQl2s3oOF0k7hB0
	N7viEOOVgniedc1dI+drrmuDIok7t3Gy3tggv6ynDWp+W9Fmbme09DXz0Lp1IOiHX1Jo
	LV0JlGnCimnpFSs628FcwajP/fPT4YF5WuAk11Hp9/Sb2hP8N5cK4/0+xOIk3qtwgl7h
	O+T/2o1WMcFGZnFgmPDSz2jiWvWd8+uIXPKx4vlq/QNJes7VOrjCphA1buuMhpsBYSPA
	MS/DOr1EROoDcopJdQc6NzKzkv6wyi5t6WAZ94xuVHIZ54DrKEJPXv55kAPjQEC4r5ov
	tIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h5i4V9n7hsHZLgNzD6XBUB+VMfU7wgoA2TxRdWueIH8=;
	b=SmqzrxO7vX84ApGwvR+ibjJexNHwx3fq3gQq/PlLEJM+luhzq+GlOcwLExP7MRiFr6
	RGSnGbkBDJep+X6dVVGkAF28fv6Mt+Fv66R2vgabt2frRdFj4pj+B6eUSNq20q7h0sT8
	cpzoGHDr4b6UWRy81JlfIhe9N2uUQE7Fthvix8xseBQ9Pwj4lSZiS/z2ikfd5pUciCBV
	xPbBZAvK0cLsFjnMsKQ91ra11MwLAcOKHGZqbgrM4cWZ+4SWgliunp8z20cIAyo7g4nc
	5i10HKuiJuQuER2jUvPFEBF/zz+VNrs1ew1bkaq57F6OkuLyFQO39NHA1V4yPscUXu64
	zGDA==
X-Gm-Message-State: AE9vXwMhueT4UuRd9KJJmypVRXqKms5EmPcVn5dBxNyatnfpgp/gnrR8GSx671yyWM+kqHyxPDQXV/9h1gz4pA==
X-Received: by 10.31.199.67 with SMTP id x64mr10731056vkf.124.1473668161971;
	Mon, 12 Sep 2016 01:16:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Mon, 12 Sep 2016 01:16:01 -0700 (PDT)
In-Reply-To: <CAHiDW_F8fGAf3pxYC0HnR=kGo-X=KN1DwcE5sZaOCa7pXncXkA@mail.gmail.com>
References: <1473437997-26515-1-git-send-email-schnitzeltony@googlemail.com>
	<CAHiDW_F8fGAf3pxYC0HnR=kGo-X=KN1DwcE5sZaOCa7pXncXkA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 12 Sep 2016 10:16:01 +0200
Message-ID: <CALbNGRS9AWcfC1pTV6=fpZFSWnPMkxpfPLZgFmueT03p5SGQ8A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: update to 12.0.2
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
X-List-Received-Date: Mon, 12 Sep 2016 08:16:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2016 at 9:42 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 9 September 2016 at 19:19, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> * removed patch was applied mainline
>> * tested on RaspberryPi2 weston / lxqt / kde
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../mesa/files/clang-compile-PR89599.patch         | 116
>> ---------------------
>>  .../mesa/{mesa-gl_12.0.1.bb =3D> mesa-gl_12.0.2.bb}  |   0
>>  .../mesa/{mesa_12.0.1.bb =3D> mesa_12.0.2.bb}        |   5 +-
>
>
> 2.2 Milestone 3 is very close to release so this is unlikely to be accept=
ed
> before 2.2 release scheduled next month. If you have a specific bug fix y=
ou
> need I suggest backporting.
>
>   Jussi
>
>
As far as I read mailing lists there were many improvements made for
RaspberryPi VC4. I understand that this update does not fit into
release cycle so forget this patch - I'll keep it in my branches.

Andreas

