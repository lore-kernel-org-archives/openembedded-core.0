Return-Path: <twoerner@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 56ED17F9F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:17:26 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id m15so3191082qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=5YFPjOG4l9UH7U9qFBP6lzTivQsjOcedARKYL/Cbhe0=;
	b=iyjl7GbucNQ9gJsHF8rmKRjdcATv1IMTg4qF5o+c3reD1bbHQW7R6kRQHFdFEQ+TVT
	J4edpJQmUjv/gPRpgoddKTbWrLS4jp9PWwIXRnbS7OHlG8lPf+fRxACcIbzInK++QFBC
	Tdty6QFKH/DzEKAfax1GF2481K5GYdYu1s4HRuHXqiGCufFA0fa4JhazvxxaQe2mtHmT
	eIsw/KHM1EcWQKMcFatv/1suQux58GjWtWmUAnvIFswwdcCfa8rtW0/N/tRG2GjrzXRH
	9YTpG6sJuHNB1w/jkvIZ6GjXo7PNGyhijZIuEax+/VJLHTXp/4v73qnMHR3aKLn+4S7M
	gxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=5YFPjOG4l9UH7U9qFBP6lzTivQsjOcedARKYL/Cbhe0=;
	b=WWxqETkGIPRZZT/ipEKM+iSnMQVQTy3A6l9TZqHwohlckWh3Dn2dTIf8IsS4Cll899
	1AcI4nz9CkckVEL37QY87vSTN+CA6LU032c63VzHpOHYCCqi7Fge3Q49Fn5QCvpUsCo2
	UsSO8WHQ67HEcRaSkZLRGKs1ODkoqco8P7I3fb00MZZnGOVdFZ3HrXmPsHbdG7OiQvDW
	uBm1SVgZMa7VJV5waLC0xnPDggqxDadiwRDyXo9iLhGs5v7kl4RT577c14fRZAJM26O8
	ZgyZn0k/vRLe8tZduLl3A2a1avbVflXU+rEgDyeHkF8kOq3JtZP4L0fMLIRA0+2lUPKF
	BKig==
X-Gm-Message-State: APjAAAWAav7hE/P9WND5xvkuuNV21/ZZfvYH0M1wjYl7FaidZ6znhyqJ
	9wnH7qX4+j4d72SasEwdJVA=
X-Google-Smtp-Source: APXvYqyUar7IMhX9UX3DBbPHnYAytWDvMqbhqIydbW3sl+52XsR9Bo7aubgkJu+ZRbrv/8nmnUK4SQ==
X-Received: by 2002:a0c:92e3:: with SMTP id c32mr3201969qvc.165.1572009446967; 
	Fri, 25 Oct 2019 06:17:26 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	z141sm1090913qka.126.2019.10.25.06.17.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 06:17:26 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:17:22 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20191025131722.GA19333@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
	<62d969ba-cf7f-8651-6dd9-e7e71b489c6e@gmail.com>
	<62ff460a-48d7-b82a-97c6-4c4d6d74a5fa@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <62ff460a-48d7-b82a-97c6-4c4d6d74a5fa@cn.fujitsu.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 13:17:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri 2019-10-25 @ 01:30:32 PM, zangrc wrote:
> hello！
> 
> We think this problem has something to do with the host environment. We
> tried to reproduce the error on ubuntu16.04 and fedora29, but they all
> compiled successfully. Can you tell us which distributions are having this
> problem?

openSUSE 15.1
(which is the current "latest" openSUSE release)

