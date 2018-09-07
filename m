Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3E086E660
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 16:15:47 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id y207-v6so28174355oie.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5jSZbpTaz7nkW5TJ3epK0eJuNS1cCZGbV7S8rBKfCds=;
	b=MfnLGGruHwvwB+fUrcc9OSumdckd0SkukTIYNz2RcDGx8sW9Kq4J49fVCJ79bSSK61
	NvuQhosD9hbVPaAeCf/ZMJA8NjAqUO/9h9EdEB7c/j2Qb/izsKBHpngrTwKPkr1euNPk
	3nggMFSut/IuAKz0bt/UDVWDrl0QMRCBgoVYuMlNgoAm7xgginCARI17p8n7EAt8XdHh
	mzMKmv9sw9Zv1dUY59mjTttSMqCyiOvVGANuz3KmiWiL6v6N49sTKP/EnH0nhw2TxD+3
	HI4jtiTi9epLA/GAfC6WAKBA0fiVBqmNYEL7G/UZXROhSFW0Wfqty2jGsIfH/F1C+tCl
	0sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5jSZbpTaz7nkW5TJ3epK0eJuNS1cCZGbV7S8rBKfCds=;
	b=DPOXj29L76Px8wGsEpTSlBMJusVt+fXmFAvv9mu//q2xFRtpOKAPiZvQimL9P5fv4Z
	C5zFiChID2tzzW4I954OKe9F7+5mlhkprFSIQWsmNmUqIRXNzYS/EnOes3rxr5neoXVQ
	HB6OOJRzEbaywwPjib4yP19YrDP3PLEqWNn4biYU2iwJNQ5sTnN05WJxTzzZUdEqM/tZ
	4sM2EqDJfiJfxNpbA8UEdwR2Ey2dsoh680a6c3Hdqqh//B7RiAZMfLD09VQNyNcZgqtm
	r3qEREmgX4FRCnOxLTz+5Edm/wTIPljGma1mfVEyEIueM4ZjAsH0i1k+u4ox4op2xhX2
	vEqg==
X-Gm-Message-State: APzg51DcGogEdr1lP1Fkye3KjKbLg54iQkFYLexPqlbP7Lebej9QFXXH
	zK5LjkpCi0MlU/H7IDVjtQh8DPJsTUrjiNs3DVQAcaD5
X-Google-Smtp-Source: ANB0VdZX+uQRWrV9Ai6sNbblSXnEdUtSZv0m8nbXSUlpRrfEMxUZXkCOZfV7XqvdC+6RsGWYFSCADAnxexJ/zWIGdog=
X-Received: by 2002:aca:6a48:: with SMTP id
	f69-v6mr8423055oic.279.1536336948852; 
	Fri, 07 Sep 2018 09:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:385d:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 09:15:28 -0700 (PDT)
In-Reply-To: <CAJTo0LZoUY=94dH_pwpOU8c+JQ4BJMXpgEmHcO8V-60Voxu71g@mail.gmail.com>
References: <cover.1536336171.git.raj.khem@gmail.com>
	<d0ae484bdd20a9c83a7f802447ab46f3c9fe6373.1536336171.git.raj.khem@gmail.com>
	<CAJTo0LZoUY=94dH_pwpOU8c+JQ4BJMXpgEmHcO8V-60Voxu71g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Sep 2018 17:15:28 +0100
Message-ID: <CAJTo0LYxvJLq30t30SZxj0TD+8qXO5KnsPUKT8ca3oRpjT6udA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: Fix build with clang
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
X-List-Received-Date: Fri, 07 Sep 2018 16:15:48 -0000
Content-Type: text/plain; charset="UTF-8"

Picked this to MUT and fixed up the status, no need to resend.

Ross

On 7 September 2018 at 17:14, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 September 2018 at 17:03, Khem Raj <raj.khem@gmail.com> wrote:
>> +Upstream-Status: Pending
>
> Make that Submitted: https://gitlab.gnome.org/GNOME/sysprof/merge_requests/6
>
> Ross

