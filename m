Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE2773113
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 18:51:25 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n37so1541092qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ZamJhW9j8kxG2NboVVwgA1Hig56GGmqBbX+C9m7UqQA=;
	b=XDtDkSJdLZEPxnRwFc4QQxs+euHcgq3ELwsGYLY8XIHqYkxYaWxtgTdbkO2/3ta7CD
	1kyWUf9V5vmAno+evpcdiuAlzoKj5AR9k9qA/HYVz8TJlOFZj027Vt+OgHcG/Y5+XeGp
	lEydRGh+fU1ik3XvTT/tOMRT40RSY4lPkQjhZoEzMhuN1tok/s8MkbtEJ3nFys0Gv9Fc
	020SCe5jHbmd0elxbZXkC4DD/7OzPOUFPTrPTAthEYYU65Oaw57PUghxgrj2SAG6WbVe
	2X868uu8NFnEKWLwGUZR7D/OXVxNS188lFNn5zEzH77hrixDaCHli1iYCrq6B5FNu1oH
	RjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=ZamJhW9j8kxG2NboVVwgA1Hig56GGmqBbX+C9m7UqQA=;
	b=naJzomA8f7bHhWtNRwJJMiwFzcTAOsoIPbestU0wnQ5uRhxpr7EihggxvOA0RN0Qtm
	95IzDpRVLkcBQyp0Xkt+dA11oq4ngfmoMkwx1JtxM3h/MVEFupsd0ZoeBvH9DuWu+MYD
	DFzXf4QiS8WXph80xST/PSK+fB4/JZ4WruvYGwLGDrIvH2rMI0A7iq0vmE4wBjWrT4KF
	MbkdY18rVovEojT6p1rLEK0dWjoXed4Wj4aXy+dEsyCtLQX+KW64MTCae9VQIzjmIOci
	qgCwfEt99aEtchjb8tiH7Wbfs1vsCun+nk4gk9DQPI7XxZP/EZAECC7WT+vtDIHeCYR1
	XNjg==
X-Gm-Message-State: AMke39m7Ogn4Vz9a1hn3WyHsYlPcxAMgIPOsZmAcfuh1r2HZscfUcViz/UjB0QNuNTiS7Q==
X-Received: by 10.237.59.213 with SMTP id s21mr30385095qte.146.1487789486833; 
	Wed, 22 Feb 2017 10:51:26 -0800 (PST)
Received: from [192.168.254.229] ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	r18sm1210642qke.26.2017.02.22.10.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 10:51:25 -0800 (PST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20170130162700.27969-1-fabio.berton@ossystems.com.br>
	<CAP9ODKrkFx4co_0gxTQpOj0HuG1H+O9DhL4GJFJ-8_e87QdNWQ@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <7be95a90-ca8f-c107-ec6a-537fe80720bc@ossystems.com.br>
Date: Wed, 22 Feb 2017 15:51:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrkFx4co_0gxTQpOj0HuG1H+O9DhL4GJFJ-8_e87QdNWQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: libbsd-overlay.pc: Set Cflags to use -I instead of -isystem
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
X-List-Received-Date: Wed, 22 Feb 2017 18:51:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

We need to backport this commit to morty.

On 01/30/2017 03:41 PM, Otavio Salvador wrote:
> On Mon, Jan 30, 2017 at 2:27 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>> pkg-config currently only handles -I and -L correctly, but misses
>> -isystem, so we need to do this workaround to fix this issue.
>>
>> There's a open bug in:
>> https://bugzilla.freedesktop.org/show_bug.cgi?id=99516
>>
>> This appears when building lldpd and shows error:
>>
>> ERROR: lldpd-0.9.6-r0 do_configure: This autoconf log indicates
>> errors, it looked at host include and/or library paths while
>> determining system capabilities.
>> Rerun configure task after fixing this.
>> ERROR: lldpd-0.9.6-r0 do_configure: Function failed: do_qa_configure
>>
>> Change-Id: I83255b5952e19bb2f516b1186276cd03eb67eed3
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Also, this  should be backported to morty as well.
>


