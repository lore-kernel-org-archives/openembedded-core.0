Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 06FD260AE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:07:07 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id c28so12137649qvb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=/4lN78cCvEs65vq9+ULglkkbqAmdMjnLFIHo1YwCRB4=;
	b=0X82IKAjFWxNSt+wOZQd2ofaXkYkgPwfUe0HwNiaQlixTgvNmCZ2FpFFvXMfYSN9bO
	i0q3E2x9YadNgXHypF2jxkuYXYsgW60lLrLRa8P6HtOkjEdpgfnywjRXBuKMGgyfmcfK
	an0ZRmKyQRV/3XnnrbBcvENKvrHNT2+vbuRXro4W8isGT4jJLnAq6Er8fRrgCGqHbQtE
	6vFU+7NEaGNBczMzySXE4/tZ2GuwkRZjsysfiqlhOgw0aivT/IbVQtzfyryRG44+U+1V
	MHKI4dCgGURp1dHjben1geCYg46WaQbTxBm1Mw9rBJgmT2WI6k0GMT8DzuqhUBOOS08Q
	RNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=/4lN78cCvEs65vq9+ULglkkbqAmdMjnLFIHo1YwCRB4=;
	b=b77gk6ANIBNRB0hw1FnicwvlLYF+hEFn62W8wQ18FA9WgA/5yKf4rIw68ILlKKQygE
	Hd967AgbP8RKqoN47EJPV9kAKUneT/XL8Po57bbA0NaY0YOrBp3EOSE7BC7Kr+QyNHY3
	5eYJUnvLRCnV9niJ2IxhBb9SN4UR2q5IvvTzMSBHCP39fYjWywWn9gQab30JaGVC1FXu
	KMp2Pxx56PaQ6sKXBUq7YeHhWR3pCQNzEwhStYYee07ckkzJunH++4DNFZtCEz6eh4dQ
	g2PB9gA9cYjqbR78XG/XBb01l6BiW0WaVplyCq5NT1Eyr2E4XSoGwP8fupc4eVQxv+32
	SxZw==
X-Gm-Message-State: ANhLgQ027C1rbCvUWYstkZ/HjCqfeEKuB9r+CMlQALpArf0QlssCjC5O
	mOIb2HV6JCD7n2J3h8pWrh2lyPb51bjRKw==
X-Google-Smtp-Source: ADFU+vuKqPGXwMkTG2LqkIeCnzcXXob3SRmWITdLPyjmogVaB061fZl9yLH5yPCOEYIYYou4nN8hLQ==
X-Received: by 2002:a0c:f905:: with SMTP id v5mr2167759qvn.174.1584500828724; 
	Tue, 17 Mar 2020 20:07:08 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
	[209.85.160.180]) by smtp.gmail.com with ESMTPSA id
	y41sm3729700qtc.72.2020.03.17.20.07.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:07:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f180.google.com with SMTP id t13so19488379qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:07:08 -0700 (PDT)
X-Received: by 2002:ac8:6f12:: with SMTP id g18mr2447942qtv.6.1584500827667;
	Tue, 17 Mar 2020 20:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-8-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-8-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:06:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo1k5Ld1k-pcXYeZMnKbuvGtph2Jmcbc=MxJkxKykAxjQ@mail.gmail.com>
Message-ID: <CAP9ODKo1k5Ld1k-pcXYeZMnKbuvGtph2Jmcbc=MxJkxKykAxjQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 07/11] oeqa/runtime/cases: Disable and stop systemd-timesyncd
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
X-List-Received-Date: Wed, 18 Mar 2020 03:07:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Stopping systemd-timesyncd doesn't prevent it being restarted by a
> different transaction within systemd. Disable the service instead during
> the date test to ensure it can't be restarted.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

