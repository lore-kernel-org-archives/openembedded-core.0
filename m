Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4233973163
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 09:22:54 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id d63so11731933ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=SxlSdB5wfVSxdX39bPE+GvvZUu5TnBoy1Oc2xnFc61o=;
	b=h/vPyPZxw8yOQU6bdJBAvaQzFzxVSPoZPW4aLtkWlIW8bHfqMRTa8AUVgNtnpC3s5Z
	nbZOLC/uE89stAR2ZjcPYvkz6DB93ohTwYDfN7N1caiMiwb68jIE6LgXeTLEev3mTlx3
	Kq3oz/7p3+48jc9Tu/7fRQjd60WlmgNQxYki0Tf8MYjPr9enS54rvR/2tUQZKB5VU5pi
	ZqlKc1KUnU2pweP3KjDVwX5OAWWF3gufTNkH8TspbN/Z5/bTdrUUBXXwBWcQQtTf3ot3
	IxHL4oHkeET7+iWUpw9ThDSWbSMuKJdoHb0WZUzXGy5PKnon1dKWCLYpbY0XCOdHcaGp
	lqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=SxlSdB5wfVSxdX39bPE+GvvZUu5TnBoy1Oc2xnFc61o=;
	b=k4mWangLkohkM2+LulPX5kjN2bGvT/EHekbj2PYH75tyH/DgosbIfu9MYISxw4UlnS
	CCVA6wWmke+3AdkGIYdlgRlaXCsYn1KN9jhydWADNr43cpYO5RJh7aaz52mUZ2ASKZHj
	YEbAXSBeBBF0jUKereCUTcdpscvVbbPq1r14IhNqmjh5Onb2RTeW5aDroDqvl0j4apbU
	269RiEHO8DIOozbX7Cx8lqBYNlub7ltsr1HhOyFa+UI/EUiEFjQlb23XYR+eRtAZoUDU
	R4pr2G/hEmuqNG+X3xWSM1UreaMCvPVEP5W4EefQYp6ugZ3ezICJVKOyTDaeblcfe+9+
	lY6A==
X-Gm-Message-State: AG10YOQ4kihqR3GVA7CyrrstvkqCm9B68CDakDMdeW5GT+aIYMBUX9iGaSmWm4RTcQNUkCam
X-Received: by 10.107.136.41 with SMTP id k41mr5859681iod.128.1455009775546;
	Tue, 09 Feb 2016 01:22:55 -0800 (PST)
Received: from pohly-mobl1 (p57A57CC2.dip0.t-ipconnect.de. [87.165.124.194])
	by smtp.gmail.com with ESMTPSA id
	o14sm6973174igi.21.2016.02.09.01.22.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 01:22:54 -0800 (PST)
Message-ID: <1455009772.17004.4.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org, "Joya Cruz, Alejandro"
	<alejandro.joya.cruz@intel.com>
Date: Tue, 09 Feb 2016 10:22:52 +0100
In-Reply-To: <1454944449-11435-1-git-send-email-patrick.ohly@intel.com>
References: <1454944449-11435-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] meta/conf/layer.conf: adapt to more flexible initramfs-framework RDEPENDS
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
X-List-Received-Date: Tue, 09 Feb 2016 09:22:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-08 at 16:14 +0100, Patrick Ohly wrote:
> initramfs-framework now RDEPENDS on ${VIRTUAL-RUNTIME_base-utils},
> which can be busybox or some alternative like toybox. Making the
> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS exception flexible, too, ensures that
> distros using toybox still pass the selftests.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 7100ed7..baa4fd4 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -46,7 +46,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    ppp-dialin->ppp \
>    resolvconf->bash \
>    docbook-xsl-stylesheets->perl \
> -  initramfs-framework->busybox \
> +  initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
>    initramfs-framework->systemd \
>    initramfs-framework->udev \
>    liberation-fonts->fontconfig \

Was VIRTUAL-RUNTIME_base-utils meant to be a single word?

I just noticed that toybox does not provide a /bin/sh out-of-the-box,
and even when enabled the resulting sh is not complete enough to execute
initramfs-framework scripts.

That means that VIRTUAL-RUNTIME_base-utils = "toybox" leads to an
unusable initramfs when replacing "busybox" with
${VIRTUAL-RUNTIME_base-utils} in initramfs-framwork.

This could be fixed by setting
  VIRTUAL-RUNTIME_base-utils = "toybox dash"
but then the patch above needs to be fixed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




