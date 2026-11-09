Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.874.1794205552511090382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vx12um//;
 spf=pass (domain: konsulko.com, ip: 74.125.82.41, mailfrom: tim.orling@konsulko.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so1453086c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794205552; x=1794810352; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMVrTD2ESBqUmdkPCUF8UYMn1mZw8t1DiaWeW6khQZU=;
        b=Vx12um//3sjpZlIMsi//+O8nb2LiTOA62ErR2EguEJ3Qjq4b2qdvsBbFBS392INh7m
         pEu7qk6gU7Kt/uLuFSHs/caaiJoDpnT4y4lxrf+Lezk/5USXgOSj6tEZkfe4YS/1HGoj
         oj8yIExq8FDnCIsXyOk3+S3MdZj7PdxFGx0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205552; x=1794810352;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMVrTD2ESBqUmdkPCUF8UYMn1mZw8t1DiaWeW6khQZU=;
        b=p0JHhmDE61Z6t6H7P7laXhLBz5ltrflXmSbrOGcqzx9rLwylq8OL2kbZl/3xI/7JN5
         BVmxF0f3c/INZS7E/1BPxUevtyzdpTrhMPTB2PUayexD6WOubatOds4bkJL95L7fvv5/
         UN2JVv+QnjOZVqMdbbAvobVK4ca9FKydp+IZ5kFQGhS034mh3pT5GJgYyx1G2QCQHu8e
         zW5rIOjEzaMxiEmvVJ1htUXoqhcSawrTJGTxBJsY0p8hhmr7X7JTQPzi5ltSEsUlJVsB
         15kDBN9DHs4ZfXgIYAcvVjnvfCBPhV5+mZ5i/zcJQ3Ko+D4hMdf6gr/G0c2u24DIWeS3
         VYJQ==
X-Forwarded-Encrypted: i=1; AL+hErF96Yk/ZTFXHR+02RK7hysa4RT+l7H5wLpIU1rX32xtJpm1hoyHKAnT77QNC+Pszpx39THd7WP2phTNUMCmIFcDtA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9EzFJFyon7z5t0PzUaf5muFTTh2lLD+HlmpL8vufeho6wSxLFc
	qa0zH18UvqfwQQg6+Z5dH68mKhvXBL8+WhRUYoCw7enWkUw1Do6yCDJJBNrZWUV+RPNgwhv5o4h
	MaBe4/ro=
X-Gm-Gg: AYBFou3rHXm8b6syPA6L5jfprwZs/r6rKQ9ySWbWDt5yOkRy1ykKqv8RUFBeVJEnKeM
	g1/0eFDQ7g4TWnoE3BTxRDPzOhtyYQOH/65nZ6V0c7pizkYKZyB1fTftLEDZ97RWe0E5dBOCI52
	jxe94cxuK6JuMkedUvzdxdiUFYO8YIABeDvYPMI95VfMk7YFc5kBnjg04BJaFI5gNyNVOeYEazx
	ApfkltTik38S2wUwjjIUHGDmiYYJXh7AkdDodpqhUVz0+FnX7JRD27yTdvMMGcH7A7HQaPUj+tq
	xHC643zgarF4Vv3wORrEC3Op0EKAHZYRpHkm3jMcjHel5krPZnsJJU9atrkVovEfBxzFzV0c4zN
	JN/+YfoSKgdEOen/ATnzxClY5ef2JjpPFKNjInzAn3hZUEoXAISEjS+B4YHpuVX9Bp80EtTNNob
	J2cJrUn2bwbBxDIfksRNYS5oKpRZEPR1D8KtbNMXTf4qZ1ZAnjCGlGwUbtwy5ypzze1rOLKTAo3
	n/7kU/IMJLaYcdlNUastVH5/Jq8S86Cw978hZVAQeE82v9Kq1agk2uhSS6D5qGXxwpZhYYQnd6P
	nkMndYelN7mBpYTVfQ/5mIipD1YkJ8I4rExfGE4OVyd/YseGbwBOlU0PEjbbTor+/48W/++aBS/
	oNT/F8Jaom67vAb4v8PhbEhC7
X-Received: by 2002:a05:701a:ca09:b0:13b:2f26:6881 with SMTP id a92af1059eb24-1b39fe2f4f3mr5784724c88.4.1794205551652;
        Sun, 08 Nov 2026 22:25:51 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost ([12.169.103.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm9922473c88.13.2026.11.08.22.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:25:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:50 -0800
Message-Id: <DMQGSB08IKGW.1G17GNWTQKQC5@konsulko.com>
To: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>,
 <mathieu.dubois-briand@bootlin.com>, <tim.orling@konsulko.com>,
 <openembedded-core@lists.openembedded.org>
Cc: "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [OE-core] [PATCH 2/5] python3-uvloop: enable ptest
From: "Tim Orling" <tim.orling@konsulko.com>
X-Mailer: aerc 0.22.0
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261102011816.3710992-2-tim.orling@konsulko.com>
 <DMKSA11YDYBP.33D4G9KGENZHA@bootlin.com>
 <eacf0910-e3a1-4820-ae91-513e3644db5a@bootlin.com>
In-Reply-To: <eacf0910-e3a1-4820-ae91-513e3644db5a@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 06:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249795

On Thu Nov 5, 2026 at 8:54 AM PST, Joao Marcos Costa wrote:
> Hello, Tim and Mathieu
>
> On 11/2/26 3:10 PM, Mathieu Dubois-Briand via openembedded-core wrote:
> (...)
>>=20
>> I can see it tends to fail on riscv.
>>=20
>> First build:
>> Failed ptests:
>> {'python3-uvloop': ['tests/test_regr1.py:TestIssue39Regr.test_issue39_re=
gression',
>>                      'tests/test_tcp.py:Test_UV_TCPSSL.test_create_conne=
ction_ssl_1',
>>                      'tests/test_tcp.py:Test_UV_TCPSSL.test_create_serve=
r_ssl_over_ssl',
>>                      'tests/test_tcp.py:Test_UV_TCPSSL.test_renegotiatio=
n',
>>                      'tests/test_tcp.py:Test_AIO_TCPSSL.test_create_conn=
ection_ssl_1',
>>                      'tests/test_unix.py:Test_UV_UnixSSL.test_create_uni=
x_connection_ssl_1',
>>                      'tests/test_unix.py:Test_AIO_UnixSSL.test_create_un=
ix_connection_ssl_1',
>>                      'tests/test_unix.py:Test_AIO_UnixSSL.test_create_un=
ix_server_ssl_1']}
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2713
>>=20
>> Second build:
>> Failed ptests:
>> {'python3-uvloop': ['tests/test_regr1.py:TestIssue39Regr.test_issue39_re=
gression']}
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2714
>>=20
>> This is riscv, so emulation is slower than for other architectures.
>> Maybe we need to relax a bit some timings.
>>=20
>> Thanks,
>> Mathieu
>
> FYI, there was another failure on RISC-V related to another patch in=20
> this series:
>
> Failed ptests:
> {'python3-websockets':=20
> ['tests/asyncio/test_client.py:ClientTests.test_reconnect']}

Given the discussion with Ross about abandoning ptest for python3-websocket=
s, there is no
longer a reason to import python3-uvloop, so drop this entire series.

Thank you for the review and feedback.

--Tim
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2734/s=
teps/15/logs/stdio


