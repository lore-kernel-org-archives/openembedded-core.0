Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.904.1594231926149001205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 11:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JHZBechm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id z15so38678855wrl.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=T/5BeTlRGiW1oey3LV/vWUmv0ZTb2Ixae41Gk8R+Vmc=;
        b=JHZBechmHJWLwH8EKgc8HOHQ4dbzt1KieHoSe3UOM5uldMTO33LzTN8G8ye+o46Lor
         HSsBBIqDsjUDlBknwIicwhaUzSFzEoLxmjVbCd+Vvwa3OiWZ1ra19Nc/OPT+7CeX4MSw
         XXzQnyTVdPWG4bjfmGG/h+zKeNIJ5Z5q/ppiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T/5BeTlRGiW1oey3LV/vWUmv0ZTb2Ixae41Gk8R+Vmc=;
        b=MlkqX+fhldHBxuWEslNI8lUTPHsZtZwRMkRsznQJsf45wLU+TzImTpOrH7PzpAi9Mc
         bVtlzyq26QaXlxGqUdgJktbymUT09RtipQwE8V5ANt7vDkKcqcKEJAzUIvTawU7bKDjf
         CSrNBw5iV0n/u7X5BuDlNxQZhSgmsRObmQ/0SsFXm+W7gWJCyZ6Ojs1OksyRPOdpOAWP
         cjTD+Om89arrofsuDvMqYLCOW6k5lg9vJ/P4ekOZ5CZN6t55KCaEM03yQl28SMY49EqP
         ozHWlZseKGFTnyB66rE3EAEVmYVUSzhr0KxV14VmvYXA6umlbVAbdCnBI+VbqMZP3U0z
         eReg==
X-Gm-Message-State: AOAM5328zhpjXpXGSOXwmuWPRqSxEi5HPUkpXhq4U3GYmFr9xWDvsL+S
	2/x8udU9LxHQp1FmEIfJRvxHkg==
X-Google-Smtp-Source: ABdhPJzAdQU2FURcC5TQPmo9lvoRXo4OEdbHteuDqL5Ak21LuDkZXoxtVPwmsaHWpCG2hIffm0AzXA==
X-Received: by 2002:adf:80c7:: with SMTP id 65mr31361744wrl.246.1594231924635;
        Wed, 08 Jul 2020 11:12:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 33sm1290039wri.16.2020.07.08.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:12:04 -0700 (PDT)
Message-ID: <e1985bdd0b4be2ef216279a2af09e1d301aa97d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/1] classes: add workdir_save class
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 19:12:02 +0100
In-Reply-To: <8a17db382b6b7fde9d5dddebb0fc410dc35b5088.1594231229.git.paul.eggleton@linux.microsoft.com>
References: <cover.1594231229.git.paul.eggleton@linux.microsoft.com>
	 <8a17db382b6b7fde9d5dddebb0fc410dc35b5088.1594231229.git.paul.eggleton@linux.microsoft.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 11:02 -0700, Paul Eggleton wrote:
> If you are running your builds inside an environment where you don't
> have access to the build tree (e.g. an autobuilder where you can only
> download final artifacts such as images), then debugging build
> failures
> can be difficult - you can't examine log files, the source tree or
> output
> files. When enabled, this class triggers on task failure and saves a
> tarball of the work directory for the task's recipe and puts it in a
> configurable location, where it can be picked up by a separate
> process
> and made available as a downloadable artifact.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>

Seems like a useful idea. I think the name may need "failed" in the
name to make it clearer what it does. We also need a section for the
classes chapter in the manual.

As another data point, OEQA is using OEQA_DEBUGGING_SAVED_OUTPUT to
trigger saving information for reproducible builds...

Cheers,

Richard

