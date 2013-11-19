Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 19ACD6D985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 11:48:57 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id d51so3215241eek.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 03:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=qMSeNVgOKLUzXpDUu4CCMH5MZmiv2B7PyYC53vyO1tk=;
	b=gopu+kjpVnue80X+gcQKTKWb5XqBCRyG4zoXcnYfFncIbK+uqA/fBULohYExIcNDqa
	DVg4EA+T4SqjeU8IUip8TjtIr4sdJxpToOdaluelPZu4F0Ze2KeurOhRAJFpsDstwUJ+
	InHSkyp1LFS8k5Vw/G0Z7Y/02MP7bZ2lcsMSWZmZH0AZeHAuNjX5K/sUgGfqFsOaooZB
	dYi2svXX9ZQ6s/d1VlzwDIB0iQ0k/BaF7DCbnA5dMBgg26pyD6PSrXcOdMhTX4t1MJim
	PV7BZOjcWHP21yGb2Dir6InixQOJ38lvOsZh8u2pdNolAjkACXEzSoN6g2G/un5oe3Ky
	dpfg==
X-Gm-Message-State: ALoCoQnjs4EO8o5KYwJqKkanSP23qVUDsiNurq4thLStBwLbwR747/vkONBGQERphsgjMLJAUeBn
X-Received: by 10.14.88.132 with SMTP id a4mr2487594eef.60.1384861739470;
	Tue, 19 Nov 2013 03:48:59 -0800 (PST)
Received: from [10.10.1.61] (ppp-82-135-80-30.dynamic.mnet-online.de.
	[82.135.80.30])
	by mx.google.com with ESMTPSA id w6sm47955087eeo.12.2013.11.19.03.48.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 03:48:58 -0800 (PST)
Message-ID: <528B5029.9060104@pelagicore.com>
Date: Tue, 19 Nov 2013 12:48:57 +0100
From: Dominik Holland <dominik.holland@pelagicore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1384445751-1226-1-git-send-email-dominik.holland@pelagicore.com>
In-Reply-To: <1384445751-1226-1-git-send-email-dominik.holland@pelagicore.com>
Subject: Re: [PATCH V2] dbus: Don't depend on dbus-ptest-ptest for the nativesdk-dbus package
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
X-List-Received-Date: Tue, 19 Nov 2013 11:48:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

can anyone comment on my patch or push it into the master branch ?

Dominik

On 11/14/2013 05:15 PM, Dominik Holland wrote:
> I also changed RDEPENDS_class-native to RDEPENDS_dbus_class-native now
>
> ---
>   meta/recipes-core/dbus/dbus.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 5864643..6612184 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,7 +10,8 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
>   DEPENDS_class-native = "expat-native virtual/libintl-native"
>   DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
>   RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
> -RDEPENDS_class-native = ""
> +RDEPENDS_dbus_class-native = ""
> +RDEPENDS_dbus_class-nativesdk = ""
>   
>   INC_PR = "r6"
>   


