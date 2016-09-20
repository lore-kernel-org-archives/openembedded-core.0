Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 557D2605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 11:57:08 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l132so204837071wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iEKO5rm0ZwdkP1Nc0Ujxhbc2hp/J3P2sDCnHAu0RE6Q=;
	b=HiI1tGM/AT7Oq1nPpkMK80EcUdQfz233l16X8DPFXrO1ErAZvHN9IC8N8R7cA+ol0X
	cM9OxVBn0hC9L9HFKalb4O23ktQrRL2JDJR44zzDR5HiO6hZYd9M4Nkl/+KmwQRV3JPs
	7XpLmx7s8rYbFdg6wI+TtUI/QuaGm5kHT1bII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iEKO5rm0ZwdkP1Nc0Ujxhbc2hp/J3P2sDCnHAu0RE6Q=;
	b=ZyM1CwN+b4FdkofUf9o60FSS1Jfut94IUqbjA9XUDgv3TbXiSzuC+7SMCcZht2/YYP
	RetHVAvaCB6GubvxdY97MPsSkcY8xKOYjq/b4Wwzmrxa16/vFl8s93n4fy53d+v1A9Nn
	n4dGdBQ/UPFKpWj00pOmw3WYe7Fp69K7QEB0Iu/nhNPOrhQSzIIjdqBjqasj1eDaLSSC
	617v+dohg9k4YO0HSvtaUluK/mV9ImMdmsBlNsNTY58vdYamkrZHzKWh8JVTz/ztKPDi
	S1bzw3cfeXekgNQSoSDHZt1w5t5Bwt9ww2nCLQ0lT8NSuDKh4i6GxP0d0N/WdKIQGkeW
	YLKQ==
X-Gm-Message-State: AE9vXwMrUM+VRnC5oiV6f10/++v51AK4bsi2UCc+pkBjWSdOiJe6Em6Ixx0aUGCSX8B9tLy5n8Hc6nKYLCsQImeD
X-Received: by 10.194.5.202 with SMTP id u10mr31898965wju.149.1474372629152;
	Tue, 20 Sep 2016 04:57:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.129.196 with HTTP; Tue, 20 Sep 2016 04:57:08 -0700 (PDT)
In-Reply-To: <57E09AFD.4040006@windriver.com>
References: <1411725589-20460-1-git-send-email-fathi.boudra@linaro.org>
	<57E09AFD.4040006@windriver.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 20 Sep 2016 14:57:08 +0300
Message-ID: <CAGNsrLDLQ0sJZyec8KwHxwuFGhMhP5mG+nFbFnR3816oD1MS-g@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libunwind: add aarch64 support
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
X-List-Received-Date: Tue, 20 Sep 2016 11:57:12 -0000
Content-Type: multipart/alternative; boundary=047d7b5d8861d41c38053cef20f1

--047d7b5d8861d41c38053cef20f1
Content-Type: text/plain; charset=UTF-8

Hi,

On 20 September 2016 at 05:12, ChenQi <Qi.Chen@windriver.com> wrote:
> On 09/26/2014 05:59 PM, Fathi Boudra wrote:
>>
>> * pass --enable-debug-frame on aarch64 architecture
>
>
> Hi Fathi,
>
> I'm now dealing with a problem related to libunwind support on aarch64.
> Could you please tell me why '--enable-debug-frame' is needed for aarch64?

libunwind needs to be configured with --enable-debug-frame to prevent a
linkage error.
Note: --enable-debug-frame is automatically selected on ARM32, not on ARM64.

> Best Regards,
> Chen Qi

Cheers,
Fathi

--047d7b5d8861d41c38053cef20f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>On 20 September 2016 at 05:12, ChenQi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br=
>&gt; On 09/26/2014 05:59 PM, Fathi Boudra wrote:<br>&gt;&gt;<br>&gt;&gt; *=
 pass --enable-debug-frame on aarch64 architecture<br>&gt;<br>&gt;<br>&gt; =
Hi Fathi,<br>&gt;<br>&gt; I&#39;m now dealing with a problem related to lib=
unwind support on aarch64.<br>&gt; Could you please tell me why &#39;--enab=
le-debug-frame&#39; is needed for aarch64?<br><br>libunwind needs to be con=
figured with --enable-debug-frame to prevent a linkage error.<div>Note: --e=
nable-debug-frame is automatically selected on ARM32, not on ARM64.<br><br>=
&gt; Best Regards,<br>&gt; Chen Qi<br><br></div><div>Cheers,</div><div>Fath=
i</div></div>

--047d7b5d8861d41c38053cef20f1--
