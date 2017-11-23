Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 996CD78706
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:34:37 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id o41so21858227lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 04:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PCXPNodL8THdk690T4zmIzEUrbics3Y1PSrgT/boc84=;
	b=QITLyr50BlfvrsrW4v6ENkqXAMs3vDgxoimCdhgOgnR8Ya905BotOJfUs6Z+5hcy7N
	j2m3yeHJAgEPMSLrIyfO30Wy//Nm07HhbPf+OgZJ2NP3k87+foc5W1N5uw6aR0Bv6Tyf
	kheUVIunpX6OFduHXG1ttumVii9b6QRTVtdcfGNDZDmnKUqzS8NKf1dswUk8Mmv3Cgok
	Cbs3pmA4jIIE8f1FbxJFsLzDp0V0Zf5qRjPQPKCYAJByAyUrXnaq5ZAfrxczipihoHiI
	wd//ygg10eltwu4j4mYA6gkFrdUad1UguDJRL/HdhXpONKSjnDtJzHk+MdxvsMQJEqf9
	7lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PCXPNodL8THdk690T4zmIzEUrbics3Y1PSrgT/boc84=;
	b=btJAaMYBI0Wh2DZwJHDbz/AwzSnT5lQE+KM/fVN8RJ+G9syPD5meLieKHaZe/lkTl5
	w07L80frRIyzrWL/mgS8l3reTp69toZ4lOlDbmRa8hZfzZvleBcq4+ipgHSB/Pp2KKJA
	FERVrZUit/sd5Ml9ZiEo/PHWIAKEyMof+8CzfX2g3xsvQ8qHBwL6i3a1o6EwjvJvcK3a
	XXwiUYww6bjvvqfG2POyukppG/XtosnUJGu17srhEyyJoWgWJOSiKJVLAvTg5Q/gPwJu
	OopB2YT/Zx2jnUOPQaAmmWc7+hc1WaWcbL7DVOrt9tzc9AWPFB9As3d95j+8XbpU77qp
	0A0g==
X-Gm-Message-State: AJaThX5WJk1vgXWbxclG3v079BWKNPeLH/kgSzuZ+sGZN9hcF+tzbbIR
	GtP8iHI8FPN8H7zHLvJe5f6Jtw==
X-Google-Smtp-Source: AGs4zMaSsz+HX52vAPI9gFc729KAs4Ca0DyzjCBysfXlnjWnxzacaZRJ1vveV0VlcNQH7fvTHA9Dag==
X-Received: by 10.25.78.214 with SMTP id u83mr7949130lfk.74.1511440478255;
	Thu, 23 Nov 2017 04:34:38 -0800 (PST)
Received: from [10.20.33.141] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	x27sm3300048lfb.23.2017.11.23.04.34.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Nov 2017 04:34:37 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1511357440-7368-1-git-send-email-kristian.amlie@northern.tech>
	<CAJTo0LZgkxiUxaz_jZ6wDwW2VumV_Jyd4e6r2Th6ZO9PCx=ZhA@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <a56ca7e9-fd80-615b-ae39-fde4dc360bcc@northern.tech>
Date: Thu, 23 Nov 2017 13:34:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZgkxiUxaz_jZ6wDwW2VumV_Jyd4e6r2Th6ZO9PCx=ZhA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] systemd: Avoid fsck because time is out of sync on first boot.
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
X-List-Received-Date: Thu, 23 Nov 2017 12:34:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23/11/17 13:13, Burton, Ross wrote:
> Doesn't sound like something we want to be always on.  Either keep this
> in your customisations, or add it as an optional PACKAGECONFIG that you
> can turn on.

I can of course do that, but maybe this should be the default? It feels
like a bug that all devices without an onboard clock will run fsck on
their first boot.

The build time isn't very reliable either, the sstate cache could cause
it to be very far in the past. At least with a zero epoch you know what
you're getting. Is there a reason for needing the epoch to be the build
time?

-- 
Kristian


> On 22 November 2017 at 13:30, Kristian Amlie
> <kristian.amlie@northern.tech <mailto:kristian.amlie@northern.tech>> wrote:
> 
>     By default, systemd uses its build time as the epoch. When systemd is
>     launched on a system without a real time clock, this time will be
>     detected as in the future and an fsck will be done.  Setting this to 0
>     results in an epoch of January 1, 1970 which is detected as an invalid
>     time and the fsck will be skipped.
> 
>     Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
>     ---
>      meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb> | 1 +
>      1 file changed, 1 insertion(+)
> 
>     diff --git a/meta/recipes-core/systemd/systemd_234.bb
>     <http://systemd_234.bb> b/meta/recipes-core/systemd/systemd_234.bb
>     <http://systemd_234.bb>
>     index 6b8745b..86c04fe 100644
>     --- a/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     +++ b/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     @@ -170,6 +170,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                       --without-python \
>                       --with-sysvrcnd-path=${sysconfdir} \
>                       --with-firmware-path=${nonarch_base_libdir}/firmware \
>     +                 --with-time-epoch=0 \
>                     "
>      # per the systemd README, define VALGRIND=1 to run under valgrind
>      CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', '
>     -DVALGRIND=1', '', d)}"
>     --
>     2.7.4
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


