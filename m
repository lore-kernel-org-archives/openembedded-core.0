Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2261760746
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:55:59 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id l69so32178783lfg.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=mLQ767sY8/Oce5aFj1lmFcYV7ijm3L1TK8h2cfzSRb0=;
	b=XVilf1T0v4rSMJMHPCYaBusMKPnBVwR8ymGwebs+qrgYdpRIYgApBBBzYV7wFJghhV
	HkgcTlgN2m45kQ+uHxHEeSin67qb8aAQjMqO2W3GwNm2tW9Y/s8WtHSVpt3uKdcV0xzP
	G3pUnVyZtdI3dbbJtGEWE4AvdV0/xCbjDucTYZ8R+vmV+HpKyO7XodYiz2Z6GoalczR4
	mU6n3C69VV2PboU0Ot1EuCi1X8Oj9NV7vDnasLJO53NOCPLKHXWge2zJAdxlCLkEHyyy
	WZK7Fyf6wg3CIuakL6YaA/yFaFmXlZaix84LSR0sy3EU1x2C6FFHFMyJ6GIqatjJIxrW
	E8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mLQ767sY8/Oce5aFj1lmFcYV7ijm3L1TK8h2cfzSRb0=;
	b=Awv9Q/AGwwSY2d33l7Y12ZEFVC46UIcI5xmEwI1e6SZPyjyVlai0WllhD5uzdQjgdU
	pN9ZsTJDxz85rGz2ARn7IZqoUL2rWmwmz6eMkf8Hk1c4Sulxm45YIjlUiDPN6Tt+lTiA
	mZsioPEAGZQiCIX7L7YnOipmELmX1PIat60gUSYXnl3o32nslM1a/ul0psfTKCzvgzmY
	MeEbw2RpRPGReFmlQibgpapDhO0DutCinAgziY1rNm9UEIpg3g6tdKSlufBzXlIaKrHB
	SYJIxGISX+HEvVA5Mr3ABYCHLQeymGlypPjHBXoW+2k2qBu2Mc4b3XcWRf26VHLM8QwS
	ZZuw==
X-Gm-Message-State: ALyK8tLKPiUJp2wLO0LBvbOIIUIayoSdXm97ylA6dFjPtzE4qb+7mtO8UcLIVl6DzGkrMg==
X-Received: by 10.25.43.206 with SMTP id r197mr8499473lfr.80.1469001359639;
	Wed, 20 Jul 2016 00:55:59 -0700 (PDT)
Received: from [10.0.0.50] (cm-84.208.203.118.getinternet.no. [84.208.203.118])
	by smtp.googlemail.com with ESMTPSA id
	a15sm323946lfb.34.2016.07.20.00.55.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 00:55:58 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <578E10E8.9070003@mender.io>
	<CF96AE35-E069-4240-B2A6-D77EE3EF0919@gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <578F2E88.6030301@mender.io>
Date: Wed, 20 Jul 2016 09:55:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CF96AE35-E069-4240-B2A6-D77EE3EF0919@gmail.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: Patch: Krogoth systemd network service fails to start on boot
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
X-List-Received-Date: Wed, 20 Jul 2016 07:56:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 19/07/16 23:39, Khem Raj wrote:
> thats fine. Post the patches using git-format patch and have [krogoth] in the subject header

Thanks, reposted!

Regards
Kristian Amlie

