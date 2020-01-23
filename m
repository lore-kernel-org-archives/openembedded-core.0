Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2F57FDBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:37:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z3so3344982wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IlDy88eQ/hMXtYfS5A/fT/2rHFrPMEkLD6AVSJFblFQ=;
	b=O39LL+o4KoZ3GF77RhQKlo37q1O7yNfyWnDCl2NDS2lJRz6EbGc/UvM2QaLT196zi7
	XG0xjRGfaJE7j6/btWmJ2+PjANPLZKXs/Co8ru9tjg8Ty3pFC2FBA7uDcmlUzAvxkL7L
	esc4Y31MvF2ZXEjFWeHS6dXgF2MVyl8y7T5vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IlDy88eQ/hMXtYfS5A/fT/2rHFrPMEkLD6AVSJFblFQ=;
	b=UReHn2ncQ77W6fr5kfrtnt8cqklXXF0vNy91r5hFnWQUqDfpP2GnZF012YJJZ8yZyo
	USN7en3ksdp14egDc8o7U6Wiy53pxwyN9DrBHx/9lp7A5lAPOUjYjHdw6ykaz+41wfNG
	z90hgUjhrGQFelNlMtx6dQbMZqnyHlM5pjcCVmoc+yM7PHdpVXoQV4K/97oUuZRPbxZd
	4+TGmItudpG4F0nhA3zfqxjmfNPx6UGI72whng2dsCdmhx7Q+f0irEzO6Pex0oYUERkS
	2qpZ5M7YAnkxfqST3LFyG62Ide94cEZvBfCf0q7o++iqAJVwW8qkAufv8FMbyCQIcC/y
	5VAg==
X-Gm-Message-State: APjAAAXbs5GCaf7POX1yWrzUIRrUEsinCeFckmqWvsDS6A00zz7ghW9A
	Sf6gh5C2Fe/ukgo0B9fYbF+OE9GeTWQ=
X-Google-Smtp-Source: APXvYqzOsHzcAH0iJkmyEwdE6HACwbBd/fjPhuFjZFEByGig8vOb0IARPiQukEi9q2AnCMmYIAr6Cw==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr17181859wro.279.1579790231133; 
	Thu, 23 Jan 2020 06:37:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b67sm3059375wmc.38.2020.01.23.06.37.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 06:37:10 -0800 (PST)
Message-ID: <b1cbeea067af1e54e596425c87b55b36062bb49f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Date: Thu, 23 Jan 2020 14:37:08 +0000
In-Reply-To: <555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
	<555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 14:37:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-23 at 09:22 -0500, Jean-Marie LEMETAYER wrote:
> I understand the issue with blocked domains this is why I suggest the
> custom domain "connectivitycheck.openembedded.org".
> 
> But I dont know if it could be an option. Can OE have a sub-domain
> like that? maybe using some cdn to handle the load?

We can certainly setup domains but we can't easily get a cdn. I'd be
worried about OE's response time too.

> Another option will be to provide multiple URIs:
>     CONNECTIVITY_CHECK_URIS ?= " \
>         https://google.com \
>         https://www.bing.com \
>         https://www.baidu.com \
>     "

Looking at the code, I wonder if a CONNECTIVITY_CHECK_MIRRORS, injected
into MIRRORS internally with google as the default and baidu as the
mirror would work?

Cheers,

Richard


