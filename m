Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3F59360770
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 17:05:10 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id v205so80751462vke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7WLfQVnQXcSTy/jJOp5icEURHW8yOYU2nHNSTn3i4t4=;
	b=n9fj5YyKf+1NwT9FRdDWFzlm2Lt41i39uECmwvA/5VjHr8CFWg63YjKQF3Xcq1Z/Tp
	oBZ1iZMWzi2vRWTx/hm18d4PBX613quiRr8ACPE27a919MEHi6VadKcHF6irsH3pLZDN
	X3sgTdPvFWGnbgl1eI9jw8VgsVeTZ5sqwyllL4LZTYtWduW7LlFCpzbNi6QFGx7+KM4v
	mZsHG+5W0Qf14GqAzpSruABPdIgHeTC6JouB8p2LOvbN0MGsYsIWVYwFNeiaRfqHNxDN
	tH+VnwIJDYtGhJ6eecPlAanIx9MM4m+xQT/4Ty/OuaEelWTICI9N+vKLpw7c3Yg2lEzN
	GQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7WLfQVnQXcSTy/jJOp5icEURHW8yOYU2nHNSTn3i4t4=;
	b=GcRWquofSRkkrXEQPT7adboAIO2vjH9UIKj4KOPltATGiVgtV9eychMbeWIGVZCQ/2
	YXDOH49AR/kuHD8hBLohfo6UbY9Wnh1GlHoBhgv3Z84z+fW1rOXA1KJ59OkewGI4S0E8
	Y3/PkCqgFtd0yPQYD/MISP6MetHFqW7GYO9Ho3FzN+SR5Sgm0uVHCHL9V8fRpcivJiI7
	89zeQ5vJlIQ7vxXB5HYKz6VhO9MwrjcISuCCnO6/qxHVNtfkPNM5JvfJAKylixt4SoJS
	9vM8fKgYntbVoQFMHFiI1se129VqxNMXHRhZI2swjaSZA+5hUmE9CM67L56KrQpplYa6
	gewg==
X-Gm-Message-State: AA6/9RnYI3n7fUF2xSISGe/m8D1TolZ/VRqUO2lCQq7On6bV3tlwG+tSXTNYVs6b4irZMvl37dYkkK8ikuA65w==
X-Received: by 10.31.244.9 with SMTP id s9mr1892254vkh.31.1475168708787; Thu,
	29 Sep 2016 10:05:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Thu, 29 Sep 2016 10:04:38 -0700 (PDT)
In-Reply-To: <CAG_Oc3aNNFhTVy_Rg1fmS-jXPoestjjBdZYnEhsoGQqd-qjXUg@mail.gmail.com>
References: <CAG_Oc3aNNFhTVy_Rg1fmS-jXPoestjjBdZYnEhsoGQqd-qjXUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Sep 2016 10:04:38 -0700
Message-ID: <CAMKF1srnd+jMQmZgoH9akxEcE5B+HZQKWB7dOdkn0=FYyp6Gfw@mail.gmail.com>
To: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gmock install fix for 64bit architectures
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
X-List-Received-Date: Thu, 29 Sep 2016 17:05:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 29, 2016 at 7:54 AM, Mateusz Nowakowski
<mateusz.cz.nowakowski@gmail.com> wrote:
> Hi i found some bug in gmock receipe when target architecture is 64bit. I
> attach simple fix
>
> How to deploy this fix to jethro/kroghot and master branches ??
>


Please send a patch as per
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

>
>
> --
> Pozdrawiam, Mateusz Nowakowski
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

