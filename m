Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1E09960102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 07:54:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o126so18230506pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=eDadpDzeROto1iu259Qa9ZqXYzy2UQzFLv+uqtUaRIM=;
	b=Y3gtdCkibynh4UkNKtBnulOGHRX9B5FE3vPB+fkzY9tX5HVgxPPM3L3XoLYm+OK4ay
	mA5QeJZ5tY+izKrO19E53z29zsVgfVgx2BVNnPo0YxKYAObModbJ8Jnr16a+C++eQiCv
	CwbcygdhdMYG0W0Cz9RZ3GH5daEoow0UGAslP9W0ADP0Py5dPx3yhzkbbBrDA+/3YVLl
	iv1WTRk/FsuL+IZTy0+OpH15KK9/+q5MvpHCgPgB1HO3Q9BPujaBD6sYZxF5WyPtibEC
	eHrY9speNBxou45efhNu5BHeT46CrqVEJkHP29gT500noGfya1sYGoSezGyUd/YLkxSC
	/4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eDadpDzeROto1iu259Qa9ZqXYzy2UQzFLv+uqtUaRIM=;
	b=oWgG70M/6QROd/8SiLUa8XbzpQoAnZswYA5QXla3Y38RdFuZPAPwLhSIN/1UjJ5LE2
	QfR6RTpU8WdNuxe5rP1JVCTmyxlwLPqER1ay9RAw/Hl1JwT3HB2OPo0B+ShPLLci7/3B
	2Mg/wyjbEtpyfGRkq7PVLBDvcsaV2knbRvfNWrfqWs0LqjoMLvAerPQOvzrmwGKYnMkT
	i4ewUdjsstcnXIrQVT1wughWK2rbQFMwNiPJyN9XzDiiJWgU+Ru8l3UgoQUuODgIrv9M
	xtkAUPhB/JCx+tFrgN/cDBz6yKUNv5yAJJSx9EC6VPYYuB1SjlUie5RRMbQgyq5d2/ry
	DZVQ==
X-Gm-Message-State: AMke39kzDb4Qm9Dc5AO1ISHsXgGF615XxlCd2WQKwQud6/QamradfE4tFvr7zZkvFJmErw==
X-Received: by 10.99.130.193 with SMTP id w184mr35085763pgd.226.1489391646122; 
	Mon, 13 Mar 2017 00:54:06 -0700 (PDT)
Received: from [10.161.103.40] ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	c28sm31541462pfj.77.2017.03.13.00.54.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 00:54:05 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1489391139.git.liezhi.yang@windriver.com>
	<4ae06894c190997f459b4d50aa09d5011b80fb7f.1489391139.git.liezhi.yang@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d0429cba-5b45-f21c-04a7-46da452a1a52@gmail.com>
Date: Mon, 13 Mar 2017 00:54:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <4ae06894c190997f459b4d50aa09d5011b80fb7f.1489391139.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/2] devshell.bbclass: add editors for devshell
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
X-List-Received-Date: Mon, 13 Mar 2017 07:54:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/13/2017 12:46 AM, Robert Yang wrote:
> * The vi, vim, emacs and nano can be used in devshell.

thanks
- armin
> * The groups, lesspipe and dircolors are required by /etc/skel/.bashrc on
>    Ubuntu 14.04, otherwise, there would be warnings when start devshell:
>      bash: groups: command not found
>      bash: lesspipe: command not found
>      bash: dircolors: command not found
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/devshell.bbclass | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 4de7ea6fce..055d21ba50 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -2,6 +2,12 @@ inherit terminal
>   
>   DEVSHELL = "${SHELL}"
>   
> +# Tools used in devshell
> +HOSTTOOLS_NONFATAL += "vi vim emacs nano"
> +
> +# Tools needed by bash
> +HOSTTOOLS_NONFATAL += "groups lesspipe dircolors"
> +
>   python do_devshell () {
>       if d.getVarFlag("do_devshell", "manualfakeroot"):
>          d.prependVar("DEVSHELL", "pseudo ")


