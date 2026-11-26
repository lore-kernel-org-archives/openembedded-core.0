Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15951.1795706478000706860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 07:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YR7U3+c/;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so73034795e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795706476; x=1796311276; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+6i1WLd55OpoCyShqNmNqeVFZUMMDT+AOwBLVNaUTo=;
        b=YR7U3+c/Y23LgeoTSw70pe1UR5pRPw+DsO05BzYyqNysOBJp0DEBuEx8XnQAmYR6Ev
         zo0kwlYS+mYhAcQVqWctamWWmVmrJPe5Brq+kGheWLPqFpMyYjsiTBhkBr0L9w+M6fkI
         BLJnN0wNbtA/o8s6UouPL8Vi+pKvl7LFPOd3Asecx/8wDLXayvXw/SMeaqZMtN+7CMiK
         biuLOAQLqQzsBm2htxKyTiYBbZ+9ISzNX6M2ymlUJAlA8qd9HUU2EKWrIwlYRzBnOv91
         vysByCKcQUg6wTsovAhrpNXb6ysfBQaEq42E0jIi9FVzpmD4Os8aZ8OxpkDlETF8emp7
         FHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706476; x=1796311276;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+6i1WLd55OpoCyShqNmNqeVFZUMMDT+AOwBLVNaUTo=;
        b=P5LOI4sdMnpr3uMYkKFgkuk4qbgNrkMrRE7YA2aW6nKLjQDfTEweR5dwN7YhbjoAHX
         7YEldR8KqnuS+AwVdiT2n2/8/lz46j9bP8aELlxEC1sb4trY3VYjWLXFeOzhAXsrW04w
         uclorcH/fpFxs7tAjD3Kdhb47BSBQPCY68llaCPnhDzWVw+/PzAA5W8fnzrGkM3Yi4fh
         NHOESl4XNNp10vIfvK+DTwsiSrBHbeJVf6YEUOBUBCDgIrU4XPFeeDvHKbCvu9pxwDqF
         ikk0hDsQ11zRq5I/cSPY0F1BBWSFsasR5wBaP565v1SGiO23irdujHMAn8uy5FV5Riym
         r+Aw==
X-Forwarded-Encrypted: i=1; AL+hErG8lTFTYCz/eXps21y0mWSMQbl5GOGvt1vt8rrydjsnGPDLtfvhluTBEKREY+g6QtJEc1tyyHmo9yExKE6QV/N/4w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+zKR0IFLibMQ6dluell7v/cYtckeJsXZv7XZsZocib5Yu9ZA0U
	6DBHOqXjQtYeMN4C0hXGFsi3ESKZmOluyqmfGYwKhcYAliFmG2io/imKqgn2mQijcVnuaqY5w83
	rt1DPOqw=
X-Gm-Gg: AZFdTZcXiuWdEcV824EaA9TK/U7JZQqKgopmh13HyrlSgovJi+M/JdtEOj4lS+btyYk
	D2jcX96ETrRhiaADDgCJsPGdQ7L/rz3kQGtflgp+kIMhxl7+mF3qheZ79OuVoOJXLBna9Yp2A5v
	STDmYcvgKirYHogT+e5kk2cghCbAKQPFwfGFv2YaDxPD4gwbd1v/oqiCVUah9d0vMaE5JyciMPC
	h05pWtmd+zdtabkDNHv/rEo3tzIuQvJ7/2yry5EmNp1O5Vx6/eXn4XdCcSa4Hu0G0y2r1UcjrdW
	0Wqy92IIusVTw8lblUrSLuQkiS+iHARj0REmaUqAg4tNigjmb5pr5Xu7RCzzSx1KleC5vHAHhim
	YKSdSjKlExpHOn+fjTFE9goz0voznTcR2O1rGiwRxz4QLMH53kOGomNMDZmOLi2a6YHEmgWhf+R
	3IGm9Lt1WYpiN2hLBhYcLJibdW/WrvDCfk5B33iu9gIuG7HmmA+cS1QBEoQay47NzLw3j8n3sQm
	lJOkvqoTO2AvDfBo59Cx7KNJTNToHq0ZNmsJbztFPzgzzF0eaDSYHZj+I0c6hEj1BqE8+TbDOfi
	qWuWxdk9Pq7tn8H/rN9KOpjZBOTNU5OAGu515xXyxiQL3K8FnA5HskET+MyY2EFFOMreuQhTrKh
	UI2bOZdiAKiruS7rUIg==
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr436702495e9.2.1795706476192;
        Thu, 26 Nov 2026 07:21:16 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa006c84c8cd12b797e5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:6c84:c8cd:12b7:97e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm563740215e9.12.2026.11.26.07.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:21:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 16:21:15 +0100
Message-Id: <DN58TIGNUHXY.1QUHLZI8RHD@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 2/2] cve-exclusions: qualify global
 assessments by product
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
 <20261120092309.4056817-3-peter.tatrai.ext@siemens.com>
In-Reply-To: <20261120092309.4056817-3-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251315

Hello,

On Fri Nov 20, 2026 at 10:23 AM CET, Peter via openembedded-core Tatrai wro=
te:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> Apply Wrynose product scopes without changing Scarthgap's assessment set
> or descriptions. Keep these exclusions out of reports for unrelated
> recipes.

How did you checked that this did not had unintended consequences like
re-opening a fixed CVE?

You can put what check you did and the result in your v2?

>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>  .../distro/include/cve-extra-exclusions.inc   | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Thanks!
--=20
Yoann Congal
Smile ECS

