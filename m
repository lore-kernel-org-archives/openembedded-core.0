Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id CE4CC606BF;
	Sun,  9 Sep 2018 11:10:31 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id f62-v6so10832590qke.2;
	Sun, 09 Sep 2018 04:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=hiT2cEHEsi/qLnSvCSl4YQCn3FU6M+Nf0IiPgki/DuY=;
	b=WkUDdg24+XCKOhTfT572LWxEzOe/VYKdv4ahCh6kQV7IbO0ekZhK4Lyk8GMf9JjGjc
	C591WtQ5YI9rWkSeieFx1Dywz8TBe3QevSDovbyhHVfq7hL57cxelrB2JMLtb+0O1c5R
	0U8e/4QMVZ7FcXrwucCyN/M4zP0iakW4PCdMQKwxmZIkCSPKfDKaOiXcaiDjcBo6lgcG
	bQBX8k0ft64uA0+5ST+qsfIDCuQLL5wBRTtBYvE0pw4NQp069LTHr+jPgzB1AL1neP+j
	TSs02TUeb3kha1YxcoEvoVLUnLq/6E6IzvTROlFKjVYhK86eaCt3HM/Z0ODexemMEG+1
	Jziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=hiT2cEHEsi/qLnSvCSl4YQCn3FU6M+Nf0IiPgki/DuY=;
	b=pNHtbEOATcA5H/WDj4j/Fg67f/+z8hr/tEjAhTcdalVxrliJppROaLbC1xuwHXpeoo
	GtVU9L5WBhR1UzYCQZLtgK8J/11BVpVo2aJ01RaCowwUkTY6Wx4lb5zx399V3zzL+T9h
	O5VO6iMoLQPDh6pqR39Owu1OAFdl+YXO+evOMF9WGrNlzDOI9GOA/a+ycDWCzOKJLAN2
	i/Xfb7oYb3uAzXfQNTB7O/E1+bcQQ9mtxDrvruhgq1LKymK3p4a0nOHU+PP+rrNXYJmx
	GoM/Gyd6vUcKpg5BNyU9S4UjN7ZmDST+AGM4H9oyuwKg0+kb5UvltmnYgatt6BCWvU2r
	YF3A==
X-Gm-Message-State: APzg51AIlZyzVpn1PbhGaDW2RAsUXZChieYr8PydFFBJsNaHQyiO7Xf9
	QRaQK2FpKAfqe3ZgoQsG6Mv2IcxBCACltyxaSF47FA==
X-Google-Smtp-Source: ANB0VdaE+CSsrVBGsiwpg4jEOU+KKxV7SxduyCl/AvhSUyv9nQ9M+CTsJkkV8McJHYH168ccmDpUN+oqs2aegVDkmSM=
X-Received: by 2002:ae9:c008:: with SMTP id
	u8-v6mr9972638qkk.328.1536491432495; 
	Sun, 09 Sep 2018 04:10:32 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Sun, 9 Sep 2018 13:10:21 +0200
Message-ID: <CAGCTLNSbsH7Hto3CwpC+p0YFWQqnYRHYm2TwcbH6w5TzbtBP5A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][wayland][weston]: How to configure screen resolution
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
X-List-Received-Date: Sun, 09 Sep 2018 11:10:32 -0000
Content-Type: multipart/alternative; boundary="00000000000008cfe305756e4afa"

--00000000000008cfe305756e4afa
Content-Type: text/plain; charset="UTF-8"

Hello,

I want to know how to change the screen resolution using weston.ini file ?
How to generate this file and use it for my image?

Thanks,

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--00000000000008cfe305756e4afa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I want to know how to=
 change the screen resolution using weston.ini file ?<br></div><div>How to =
generate this file and use it for my image? <br></div><div><br></div><div>T=
hanks,<br></div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed =
Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--00000000000008cfe305756e4afa--
