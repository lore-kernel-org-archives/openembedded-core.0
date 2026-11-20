Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1546.1795159996460080584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=H6yfxa/I;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso2879095e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795159994; x=1795764794; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lz3v2c08dFQue5DSyH73WFrtWeMSBdp8oqprUe7z9/4=;
        b=H6yfxa/IV7MATwugCM8xwUqS128ebYYcYIfR3sva0euDgg1OH2E6O0S34YP/1Rwlk6
         i0mCOX52ex0kqw7QPLp/9IpVaoFCUGomZz6JRwCtAWEA0+6lhyPSb1snSwC42wwhW1Ce
         LBUGyJ8BYmBjZl7LxZ0dWk1Kk7ooZye1cyg46OkbiT9hzm8A7wY/umU1a2hYvS32zrjI
         MRXYa5YliAsHZ9esHJ++5upt3wnjm9nLQ9YJVsUYtkJQGOYpjsdNngaYkG1jm3aJuQaT
         11+eLNrVQ8gvQKnR4ThxS2B4uXWpUNRnm1VDVAA6xXCPiIxU2CCoGVgD1T53M8OAna6q
         8agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795159994; x=1795764794;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lz3v2c08dFQue5DSyH73WFrtWeMSBdp8oqprUe7z9/4=;
        b=Ko4qXLOu6FBZXOo8Zf1ziMCeYHySUQCoGps5zauMzmSkVIwiSmjnOv088l6OzxfRN4
         cbxUyi2DDBDqA+avpJv6rzmJD9Uufpt6ejAPkQmNAQjB0zKIKncEPmLQ+XkIC2jiaWCR
         7vVUp1KQ1eODjelvdE+d82DRNBE0u2hzccWC6XpY14LHU+lIcD2topaRIsI2tduqICZf
         XzUXz/Z/fOi024ZSSBPxbFKXwu2tYHyLvquI0XsC2yW+T+GeWvi8LY8QqmniOD9GqrTG
         7UHgbwepSbQirNqFQM0DTXU9ZF+/WlVdLCGIhUGeA272uGsmmHD4x8xqq7gGsLUoZ6j4
         fBgg==
X-Forwarded-Encrypted: i=1; AL+hErE1qMWMxlUacHRpoNN10E4gdNrXtDm8vMmxfIDXJUCHhOyAT7obBDTM223YdIsr7EWNXfbV9dz+alV2HdgT+A281w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+1i8B6LSzUfc09PW6Mh5zyPPUrQMQydXw7yfxgJzezdQhg5B/i
	bHY6i6VOvYaDUoGDBIfgJqdjUdrTqg9krEQidusTG86UKa96aDTVi8VYmJoKh/hRkiw=
X-Gm-Gg: AYBFou0VIKX/2FK1YURtqU8/tJtmAq3NMSZH0nIiaJtR8rw9GOlEgRla5J/8cEWAmyr
	DYX+g02mHvueoo4S3jrxcaUMpkc0bT4C+0fsV2iIZ+7kEIWdzlGybRgq44YAqNEmKA/vAEttl5d
	l/ITEsdQV8xPkBP5BJQezRuKGQwrIY5BptvZM+GYFiOk1hZQ/ZNMvt9cY2eH7EEtHkjsgaheZ+2
	+RUXiB5Czz9V1LzEASIlDdsNcGjcUAXCcwxUET4sTGUJ13wCtfJULuwuw2NEK4tRRaD2qKsykXk
	i5yYGA12XzIO876IUWp07gA/8Sa9ZP6gjugmbkqfH2gp6vA7wr2c64fQg3smESZqzJLXPQXtGV8
	2jBVRfGtQEDFbycAw/blPPzo9ecmkUZrsUUNB34T+2l1piiT8c1zAWNMvRM88nYgu2AO/Vm0Tke
	MrLFjh2OK1aJgG2oBOrMDkMCgpt/3wFTjEh75A5gHyqmhuqlsGmqLXg/v/LaPYEPoIbdaGVYg++
	8rJS2ZByQgKsZCWjyGxqKR4rwrI0Y6ge56nFeYlwV5Is5VWvamI8Z0W6OvvEL2aNyip1Y91+LT5
	eno4exXMIqIWMmfPPsb8JLN3NzfNQOXEb1dtF0YGz/LvxrZBUTyVcGASYY9vWEKZlE0JmhK4Jwb
	tCVFp1Ac8bc7PxWae
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr44032585e9.15.1795159994369;
        Thu, 19 Nov 2026 23:33:14 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f64724sm27841225e9.3.2026.11.19.23.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:33:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 08:33:12 +0100
Message-Id: <DMZV3VHOJ2E4.13Q2IBH3IK94@smile.fr>
Subject: Re: [OE-core] [blacksail][PATCH] image_types: keep the rootfs
 mtimes in ext2/3/4 images
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <alex.kiernan@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
 <richard.purdie@linuxfoundation.org>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261120072149.2725461-1-hsimeliere.opensource@witekio.com>
 <20261120073019.2732783-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20261120073019.2732783-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250743

On Fri Nov 20, 2026 at 8:30 AM CET, Hugo Simeliere via openembedded-core wr=
ote:
> Please ignore, this was meant for wrynose. Resent as "[wrynose][PATCH v2]=
".

Noted. But
https://patchwork.yoctoproject.org/project/oe-core/patch/20261120072058.272=
4815-1-hsimeliere.opensource@witekio.com/
is indeed for blacksail, right?
--=20
Yoann Congal
Smile ECS

