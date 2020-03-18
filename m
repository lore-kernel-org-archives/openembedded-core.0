Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 34A1360AE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:04:27 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z25so31552850qkj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=l9gyykJBxLopPlz5/d9vzFn1VxRXRIpSGLzhsKpd67U=;
	b=dsF7ensFa6DcFRb3ofqiGifUy86dcCxUQzpqBKa6dr60VzmyoyDD7W+mg5WzlR2/Iv
	m5i8XEx47XUSxxX4OgSxZW0uVtmllE6M1aIrwPs2hnAjJRYD1inEbK322LF2O6XbJdjj
	M0R8sZC9MaFipN2gIw9MWd/pixHYMIAZQpHQovONnih4a+/ZMiz3RH5TFF/HQNm7dt+O
	YKv68tMqj9tTxRQboIIIIeV1LgHZoOrzwAyG7VLhfL/qNeZyek3X3aoKas7+25t+EM/h
	IsRsFmd68EklJsvYaUgDO6MAGclYUYj0XDIpR7OlSEn4L17/39AJgpjlmtqChHfxzQqA
	+1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=l9gyykJBxLopPlz5/d9vzFn1VxRXRIpSGLzhsKpd67U=;
	b=M5fPuP0h7lcEP5yCg0IQSkFAfF+M91yJ+GcMRnpnQrN7/TN0z/pQZtf2GoLqyDJwmq
	fpPEPVmG57pUflQQmjyHzNUpgtbOUZNZTLVVoz8z2gfGGjuloJn6f0xm+1SSdd6KZyau
	5Dzkts5NeaYOCdDI9WCOddZCjL13MP/5z3E5rJZ+pmtZq7cJsutUdSjWh3lzHKQHXSg0
	tPWeJcqDd8a2BL7cGNkKOwO3wwJq52puaLBmyYLch3umtslCAPV9DMCgb8dtJJUeVIZ0
	FTTgp+oM7CWoVejlsihMgcsHo3fnxzr/Cl6NJbDZydMuH1NIaeG7FUIEfFlUAV/tJZMj
	B0Ng==
X-Gm-Message-State: ANhLgQ0ABkpnXK3+ok6OZkY8HYYd1sQLZxEPIrD//2QiR9J8IM3H9am/
	T0mCstAghHGXK3u4os+vsk3X+xI3TfeQpQ==
X-Google-Smtp-Source: ADFU+vud7rvuJV0B8AEwbkadtOcgSQesCKpDm0vU8yJF8IwZMXwoAXW/u9+poPWER+EIWByzyRntgA==
X-Received: by 2002:a37:a93:: with SMTP id 141mr2105427qkk.244.1584500667674; 
	Tue, 17 Mar 2020 20:04:27 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
	[209.85.222.181])
	by smtp.gmail.com with ESMTPSA id 82sm3158378qko.91.2020.03.17.20.04.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:04:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f181.google.com with SMTP id j4so19855572qkc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:04:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a90:: with SMTP id
	v16mr2030025qkg.46.1584500666325; 
	Tue, 17 Mar 2020 20:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-4-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-4-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:04:15 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrHhdywj47mG-w3gvsDKk6tySV1iJPBDgG5BsiRaP4GGA@mail.gmail.com>
Message-ID: <CAP9ODKrHhdywj47mG-w3gvsDKk6tySV1iJPBDgG5BsiRaP4GGA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 03/11] systemd: Add sch-fq-codel to RRECOMMENDS
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
X-List-Received-Date: Wed, 18 Mar 2020 03:04:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> systemd sets net.core.default_qdisc = fq_codel, include
> kernel-module-sch-fq-codel in RRECOMMENDS to satify this
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

