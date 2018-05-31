Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 733D374CEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 13:57:38 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id h79-v6so13068108oig.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ofVOzRE4eXUsjzCeh0PrRgWfOpE9lmLEagsczV3Cs8I=;
	b=k8baTzPI6bc6MNGy2Vms/7UPT6kRM9M82glqrkpgA2VLB4GsoVfK6FNBSb3v4xREsK
	dhoCjjfCm6LjQJUP8ebG0e9EAVUBZ8fLZYjdbEr3P67NYGwrlLfyRKzbQ/bfvYsQjB/n
	Rmgr/9sKNSBK0Q4+UUMXNo5BNAO57IvXLJkiwig85+fUWfjCfamhF/sLe57ctLOL6Qyu
	hBCONgBkc4mVs5R0IsbSX3EuhitObGJcM0nh5CYKxR9YxR+/1UE/4BTfCytDbOparSnQ
	k1GRLLm5hl9JwnLG1cuVa0HCKUG9E+iHOHRzTFbm3ghbt1+MGVC7SeCEqHk3a4tQC5gB
	b3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ofVOzRE4eXUsjzCeh0PrRgWfOpE9lmLEagsczV3Cs8I=;
	b=dm9GJNpMCXaFtxsJ251/up7BLc6SxVgOrCcNm5fS8NNts/kA2/FF/d1bv9a9uhJ/cS
	EH7a4pILFK3lO8gzoSDjxk8gz0B9+7AoEwzoBX9zo0ut4RPutGhYOW8nAaQRW0gS9+MM
	dAJ/GRtn0yWRyxeD4KOaym+FS1apqsLy3kwGd6QvD3rv+p188hM05tnFXATdCB0LXHh8
	ilsqMWKIPaQNW9k9ljypZUOly5LUvzsMxhvGD9lHmIDgzXV1kea6oigXZ+JvJBUKYp9U
	f9UK1IcYT6Rqo3EDpBf7yqNYExNgKZrbyuYUst8hmKSS0UarghXPoE07WHUO1835GoRh
	ijJA==
X-Gm-Message-State: ALKqPwcQNCvcSH1BTV4p9xInNr2S6QS9Z2nlY3iyDRvXQhR7zTbJLFhf
	RNLbUEqqxmml0SpcnpsbHuD5IfJCHlFmspbMA3Y=
X-Google-Smtp-Source: ADUXVKJ5Z8dK2MJ/Ib7AHRygnnk4PPizpZMMmcCAyfaoMw0Zts3sU+lPmyxnf8o7Z0RGDbkLXe/+pyjdQy6YBjuQD1M=
X-Received: by 2002:a54:4d02:: with SMTP id
	v2-v6mr3853306oix.190.1527775059362; 
	Thu, 31 May 2018 06:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:57:38
	-0700 (PDT)
In-Reply-To: <23d9ef25030216df5bcfeccfe6dcf12defc53648.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<23d9ef25030216df5bcfeccfe6dcf12defc53648.1527755434.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 May 2018 16:57:38 +0300
Message-ID: <CANNYZj_M2f=R+mro8oUnVV+dWuz42o8T9GpYjhBeujPF=ic=ow@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/14] oeqa/core/loader.py: support the 'auto' keyword
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
X-List-Received-Date: Thu, 31 May 2018 13:57:38 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-31 11:32 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
> In previous OEQA, having 'auto' in TEST_SUITES results in executing
> as many test cases as possible.
>
> This behaviour is broken for now. From the codes in core/loader.py,
> I can see that it tries to use another keyword 'all'. But in fact,
> it does not work.
>
> I've checked the current manual. The manual says using 'auto'.
> Below is the current information in manual.
>
>   """
>   Alternatively, you can provide the "auto" option to have all applicable
>   tests run against the image.
>
>   TEST_SUITES_append = " auto"
>   """
>
> So we should restore this behaviour. This patch does so.

Nice! Can we also try to simplify the setting of DEFAULT_TEST_SUITES
in testimage.bbclass using this keyword? Right now it's basically
manually created lists, which tend to go out of date.

Alex

