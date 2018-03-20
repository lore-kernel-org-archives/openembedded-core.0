Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4C43B78982
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 17:19:21 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id w3so1544421uae.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ayarOJzW7foIZ5YvhwkUIOYyBHCV8Jj6hqXLaso+3n8=;
	b=NZJlRp1B+tfO+tvYnbzUTPnwcmavllG6KrSLeaxAKXBh/G6thqVx4/MUguPzBTJEqO
	z4o/moneFRBVdKOx8FqdcyHpCQpyAk8LEy0G7xYMXylFj/rsxWuUK0wUw5kPn9Qrzw7Z
	C5c/FpufWbwbs+7UbAfd+yiYAWGrh7MPo1I7ZNfT9KtixMqmeZVevmM+pnAFTTaSBpsm
	OegwXDYFCKXGot5KjW5TbKJFk0TH+FDUqx5tDxN0O/oYN/t5ZjZbGNwAzggH5fBpTopq
	sgKBFuNDqKvKI4I2YK+s5wgkmeeuu86kbEnqPWgN/bErshELoawfBvEP3eCQp6cKkSIR
	KALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ayarOJzW7foIZ5YvhwkUIOYyBHCV8Jj6hqXLaso+3n8=;
	b=jTo718hz3UMwnFJDQ/bIYBvwVp0qa7yNHlv0ixGr+Xi4idD6H4vdwD6qFFbDCkZTpz
	c0vH3lRBoJf+oaTDXtR1jn2jLPE9ScovI0wUVKNM3zLJtdpByQyN4kI2YTKzsOEGMaa3
	PEfZRUkOp8XBc25R0mpluGV+UdPZLOM+FnCq6gOCIbS8qXPwniuwkQqgry2CHn/uf1I/
	fjclPtSapHZ6wM+EW1nZ3pEwc9J4SGw9GKgk9kfOHH9wO9gRZ4c65xRc/wKpJR5VQdg+
	tS97hOaUksEJ+AV6jsh59Ohr2Lu8e8oOCU+B5w+Sy8mA+A8ixTdhlkHq6fMRlNrp13/Z
	8KOA==
X-Gm-Message-State: AElRT7HEIZV/roNV2VtAGGV/7ROgfctKPtvNcpfDXAzUddTz6m8W43iT
	cBwiSeML83btJ4uVPN1E/kzucYbVToOi2Ta9o5k=
X-Google-Smtp-Source: AG47ELvQcCkr4mU0gdT8zUF6X7Mr/rLSa/jWjTmZaZckLnPWChR23gDsMZLu/330BWt99vwMPkLfLeW4fTSDA51jx6k=
X-Received: by 10.159.56.2 with SMTP id p2mr4192179uad.97.1521566363313; Tue,
	20 Mar 2018 10:19:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.74.219 with HTTP; Tue, 20 Mar 2018 10:19:22 -0700 (PDT)
In-Reply-To: <e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Mar 2018 17:19:22 +0000
Message-ID: <CAO5Uq5RBUztJ5uLdONZ0apJzCko_oXQ6L3D-9s-59Yvip9+BiQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Tue, 20 Mar 2018 17:19:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 12, 2018 at 8:38 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Upgrade systemd to 237.
>

...

> @@ -80,7 +78,7 @@ PACKAGECONFIG ??= " \
>      polkit \
>      quotacheck \
>      randomseed \
> -    resolved \
> +    resolve \

I guess this was deliberate, but does it need picking up in release
notes? Tripped up my builds off of master - clearly a trivial fix
though.

-- 
Alex Kiernan

