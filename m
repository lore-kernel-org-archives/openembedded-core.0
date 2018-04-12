Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id B7CD8744CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 21:46:07 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id x9-v6so6605717oig.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hDLx2o5h94LiNVGI5dIoI+7LgQNKEByenbrrAwfcnXs=;
	b=f1+OuyfcUd/UmF2rtpN+DIr3jXrHwxvVNCZb2q3LoQ2Ay69cIOIpe0wEq1Os3Je2/S
	44nB7NU4yZ4BNMKWpJKAFTJ6wEpMgscqueCasTegMLVq3TxNYjIlxWvNvkpJCALCZgWm
	/Jw8IQ8hDUICjNZXLTkAbz+b5pWUKP57jcDHOfp+TFfcuyyiJo5bLr4rC/yQdceQ2j/Q
	IRRRNgGhDk9XRkWWxIagUBV9HoniqwEgzv74g25fCEDbu2kdOepCwniogMFfrXCl8GkO
	saB19V9nZpYrwpX6P5EXgbt2E1R8UZtFSSXzi5HCdnfQWQIlN5b2T+B7aGBjZPzkTBQ+
	WqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hDLx2o5h94LiNVGI5dIoI+7LgQNKEByenbrrAwfcnXs=;
	b=Gy1kaSTpWx0vgdjhZL4+lggtinNdF76us2GYD6liDXd2NAn8ey31V34o9+ylevk8F7
	Mxmf6uSfDR0i1Jjzi/v5WDbOw8bsaxSUEoY9dKoUiI3E4gHNjMq0ExkmK3ah0+obz1bR
	rFHf77ymyPW2rm15i5TzbKxLUGLmFJDAeybM+zaeUhtmNe3eccxUAczuBPv/zmnA25TJ
	6usG8UwFo5SvispxTko4MD+D4/tpEopGcElKLFkPcBJuQTa6iyLIbynp3CfFlcXNj4Aj
	+7hRyFAtMUv67BHKhpwLDvIbVNvaN5SNVNg9lLBtzKCEc8vB6EqCxLAaREGxq+8ZqTPz
	tQtg==
X-Gm-Message-State: ALQs6tDo8DX0HmKQc1F7YEdVv4TjiCkVZIaRafgw02PS4ZCHOBjlmXp7
	o79tzEBA7gwkehbltaA+doam1GwrmtwvOHz6PC8=
X-Google-Smtp-Source: AIpwx4+GYaklscMDH3dgX0ohmMmIJeAkkAklncwLzDh0M8ABgcS1R56RMVjM/D7LkY4OXy+UOjSj21A7E0CD+N30EdE=
X-Received: by 2002:aca:fcc5:: with SMTP id
	a188-v6mr7137358oii.4.1523569568390; 
	Thu, 12 Apr 2018 14:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 12 Apr 2018 14:46:07 -0700 (PDT)
In-Reply-To: <ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 12 Apr 2018 23:46:07 +0200
Message-ID: <CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Thu, 12 Apr 2018 21:46:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 12, 2018 at 11:38 PM, Cal Sullivan
<california.l.sullivan@intel.com> wrote:
> If you're using a non-linux-yocto kernel you likely need to apply this patch
> to your kernel as well:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kernel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch
Correct: RaspberryPi kernel
>
> (This is in all linux-yocto kernels, I'm only linking to meta-intel because
> I knew where it was off the top of my head)
>
> This was sent upstream but last I looked it didn't gain any traction. I
> think Bruce resent it recently but I can't be sure.
>
> Thanks,
> Cal
>
That looks very promising - will try and let you know - thanks in advance :)

Andreas

