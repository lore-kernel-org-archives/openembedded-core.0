Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 093F171C42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:26:38 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id r143so17948436lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 06:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WwFB/+TUGbZP498k2OVPKIZVzqLM5b6yX8/DPLBVBJ0=;
	b=J8wluoGq4qEuEWSEmJWsz2ajMP0yxOaTRGRL49eSWYii8iE4CSnERtwyimirncTlN6
	ze6kzWNTNkC9Lhfmhog7Tx0pXYNyGlZHzHCkKac0a0OMQ0TdEUWPOzaiJQ8j7hnVq582
	Z9IovIDkagTFmyF6p+H6h/lSVDTC7MIY0oHLsSRywQR35+3TpHhL8/FE42iLg+O6WFrs
	usHASXAuDz4LE1QCcpWO5TjnibC/sfhA0Z0a1AlviOh9E65SLuAglvzXkYXoL+E6HS4S
	inppXeq3kENobSE/NyEIn5MolMDoW5H5GRrFUxhco+u/YKiWxB28bm+yA+CrWkeRF24n
	74SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WwFB/+TUGbZP498k2OVPKIZVzqLM5b6yX8/DPLBVBJ0=;
	b=PW9sUakEK9V8OZifZFSTNgpFlshpigFpY721NEYSEpsRqNVVIogjRNNVQtUvqy/hQJ
	LzZXXBCvMu0iyhvBsYD12gsjYnAuoH3RILmVntoUko8qcrH0i+63lLi2jbsPW+TPe4Ca
	q2UrVMnayJ00IamXDv3LO79FINfnvj4A464BS82vxouOYaSdqvORVpu3z3p9Xql9/uY3
	SkMdAMIfIj5POnT4/F90UnmVC5kji5U/EUR+T0a9uaQMpp5jfUDI+BsqyzLBQiliEzDc
	ApprrDAEcmAIaJP9iBPiloP7rscGWvtsqVdcS2Fe0EeCmZG1D7r4PnXFnVrtniHqKrE/
	7o9Q==
X-Gm-Message-State: AKGB3mKU+GXtcBBBtn0+AN9enYFpzazaulaEoEJBCEsR1q+0eDTw7hAZ
	SlfupwcRpxmbVpeiueLsaPJda8Y34tUtIRSMczIKau/m
X-Google-Smtp-Source: ACJfBotTTiJqcZcCkKsjkdbJ82fVefHBEnoXaOIIPrBH23iBblVE0p8Ui8Mi7qLVGR15v+40ZZ1B4jumzomkeLOWOVY=
X-Received: by 10.46.64.76 with SMTP id n73mr24139lja.33.1513607199639; Mon,
	18 Dec 2017 06:26:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.228.202 with HTTP; Mon, 18 Dec 2017 06:26:18 -0800 (PST)
In-Reply-To: <d718b91c-ae1e-0171-3eb1-527ceadff383@linux.intel.com>
References: <20171116174541.3081-1-ricardo.ribalda@gmail.com>
	<db49b730-240f-3d14-3fd0-31e109bd2ee2@linux.intel.com>
	<CAPybu_28ZvnJTjd1KiNx375+kfh1c+q=y65paJYDeHpJyd5qew@mail.gmail.com>
	<784b237e-8cad-d450-5d23-32adc961110a@linux.intel.com>
	<CAPybu_1+eRCMvWgCBX4wGMysv9OS7bvZTCF+H1p3cjkUQcmkpg@mail.gmail.com>
	<d718b91c-ae1e-0171-3eb1-527ceadff383@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 18 Dec 2017 15:26:18 +0100
Message-ID: <CAPybu_1oc+5yPRoXkG1QYqsvvf8NbQrCH0BHZW4kLi6BM-RKLQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Mon, 18 Dec 2017 14:26:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hello

On Fri, Dec 15, 2017 at 4:54 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 12/15/2017 05:50 PM, Ricardo Ribalda Delgado wrote:
>
>>> Unfortunately, the same patch needs to be ported again to 0.44.0, as the
>>> changes upstream made are non-trivial. Can you do that please?
>>
>>
>> Sure,
>>
>> can you wait til monday? I have all my test tools setup in the office
>
>
> Yes, sure. In a moment I'll publish a new patchset that introduces meson
> 0.44 and drops your previous 0.43-compatible version of the patch, and then
> you can rebase on top of that and send to the list.
Sent

Feel free to include it to your patchset if you need a v6

Regards!

>
> Going forward, maybe you should convince upstream to take it after all...

:), sure

>
> Alex



-- 
Ricardo Ribalda

