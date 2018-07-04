Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 24F53789B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 12:53:29 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r16-v6so10546006oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KkoaBH67Zdc/0U0kVKGwTk9VNEOHbMLa9zmqjBup38w=;
	b=MfEr/CvgMbCnzs/7brZ10KdrtHx85o5HUUaujJDVCfZN9o+PQ8Bg/i1hoFtaB9H8Aa
	ek3nrDuaCjgWVTWCSomX9Cc2ZhK5OhyGNONwdOJA7CfW90n6QmEVmOWJZUqnvw/hj8xZ
	VtI9VlijLN3Ug0flXYSdmY1qt+IwgB49Kg/gntzulWU1XrBK3ZIOAcuQOUBlbjiiFTyT
	i8smjw3CN/HWbyLEQCR7z6QeaCLjX8wQdLGAPdSh18B2ujMgU0w5iRKOj3/TA4J4XnBs
	qfH0BDLU7wZRzGE/GkX5+bg72kF7gFTEH6RkTBtkupIWDZQ/V9Ra/uCJgeTZZ1m8yTjp
	2TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KkoaBH67Zdc/0U0kVKGwTk9VNEOHbMLa9zmqjBup38w=;
	b=I4sWi0q+v6QQ+PgcefK9QoWNDCP43BDqztdfEhpDftrJlztX/lSj/4b3eh1UAq038M
	T9fUiM2eNnzG83FBoP40HjflcyjseSvQwAAPpz0911H69j+Ec85oisoVG3QiXXC8L5by
	Zx1ofBBabiW+fznI250GnrR+aIP+eZRgE+ShTCxDN1xvypxQWi8J/d4NacysDRsCiQbQ
	inG5FfBN9Hvbifk5w0tSV5RePk371cjaiPSwnl3Mwv5stUpDDhJmmr8jrQtikQLozZlW
	zVM125y5TBxtglECve9YuXWbG0RsyqY+6cMiOx9aOQ5rv/xi/Q819IKUDm2Cg5YXpq4U
	ZpZg==
X-Gm-Message-State: APt69E2jDBV422Gpzwjjt1vzMGPswoU6vBa+sRyxYohhmlwcypQ14S+k
	E4K0VZCYTZDpkzV/pXOG7V1Wt/bYzY+bNYzc2SJqfQ==
X-Google-Smtp-Source: AAOMgpdo26mOKnwGXchXchUxn2XMdvBePIadHsAY428G1tOdUuNgqeeAMzDUlTdn7Iuj5vYOb0uFv34G5TQSUyRQr30=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr2223641oih.102.1530708810244; 
	Wed, 04 Jul 2018 05:53:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Wed, 4 Jul 2018 05:53:09 -0700 (PDT)
In-Reply-To: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jul 2018 13:53:09 +0100
Message-ID: <CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Jul 2018 12:53:29 -0000
Content-Type: text/plain; charset="UTF-8"

On 4 July 2018 at 01:55, Andre McCurdy <armccurdy@gmail.com> wrote:
>  DEPENDS += "${PYTHON_PN}"
> -DEPENDS_class-native += "${PYTHON_PN}-native"
> -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
> +DEPENDS_class-native = "${PYTHON_PN}-native"
> +DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"

Whilst there's nothing wrong with this patch, as the BBCLASSEXTEND
handles DEPENDS-munging isn't this a better fix:

  DEPENDS += "${PYTHON_PN}"
 -DEPENDS_class-native += "${PYTHON_PN}-native"
 -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"

Ross

